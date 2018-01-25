package ekaurapp;

import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;

import com.sun.javafx.runtime.SystemProperties;

/**
 * @author the_professor
 *
 */
public final class Appointment {

	static final short APPOINTMENT_DURATION = 15; //duration in minutes
	
	/**
	 * Retrieves an object of Appointment from the database.
	 * @param id id of the appointment to be retrieved from the database
	 * @return An object of Appointment class after querying the database for the provided id
	 * @return null if the id is not found in the database.
	 * @throws AppointmentNotFoundException 
	 */
	
	public static final ArrayList<Appointment> getTodaysAppointmentsFromDb(String department){
		ArrayList<Appointment> appointments = new ArrayList<Appointment>();
		
		try {
			String	sql = "SELECT id from Appointment WHERE dttm >= curdate() AND dttm < DATE_ADD(curdate(), INTERVAL 1 DAY) AND department = '"+department+"' AND isPending = 1 ORDER BY dttm ASC";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			
			while(rs.next()) {
				appointments.add(Appointment.getAppointmentFromDb(rs.getString(1)));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return appointments;
	}
	
	public static final Appointment getAppointmentFromDb(String id) throws Exception{
		Appointment appointment = new Appointment();
		appointment.setId(id);
	
		String	sql = "SELECT * from Appointment where id = '"+id+"'";
		ResultSet rs = ExecuteQuery.executeSQL(sql);
		if(rs.next()){
			appointment.setPatientEmailId(rs.getString(2));
			appointment.setDoctorEmailId(rs.getString(3));
			appointment.setDepartment(Department.parseDepartment(rs.getString(4)));
			appointment.setDateString(rs.getString(5));
			appointment.isPending = rs.getBoolean(6);
			ExecuteQuery.closeConnection();
		}
		else {
			throw new Exception("AppointmentNotFoundException");
		}
		return appointment;
	}
	
	/**
	 * Checks if the doctor is available for this appointment at this time
	 * @return true if doctor is available
	 */
	public final Boolean isDoctorAvailable() {
		Boolean b = true;
		SimpleDateFormat sdf = new SimpleDateFormat(Values.DB_DATE_FORMAT_STRING);
		
		Date minDtAfter = this.getDateTime();
		minDtAfter.setTime(minDtAfter.getTime() + (APPOINTMENT_DURATION * Values.MS_IN_MINUTE));
		
		Date maxDtBefore = this.getDateTime();
		maxDtBefore.setTime(maxDtBefore.getTime() - (APPOINTMENT_DURATION * Values.MS_IN_MINUTE));
		
		String sql = null;
		try {
			sql = "Select MAX(dttm) from appointment WHERE department = '"+ this.getDepartment().getDepartmentString() +"' AND dttm <= '" + sdf.format(this.getDateTime()) + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			if(rs.next()) {
				Date dt = sdf.parse(rs.getString(1)); 
				if ((dt.after(maxDtBefore)) || dt.equals(maxDtBefore)) {
					b= false;
					System.out.println("Not enough time for previous appointment");
					return b;
				};
			}
			ExecuteQuery.closeConnection();
		} catch (Exception e) {
			System.out.println("ExecuteSQL for previous dttm");
			e.printStackTrace();
		}
		
		
		try {
			sql = "Select MIN(dttm) from appointment WHERE department = '"+ this.getDepartment().getDepartmentString() +"' AND dttm > '" + sdf.format(this.getDateTime()) + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			
			if(rs.next()) {
				if (sdf.parse(rs.getString(1)).before(minDtAfter)) {
					b= false;
					System.out.println("Not enough time for this appointment");
					return b;
				};
			}
			ExecuteQuery.closeConnection();
		} catch (Exception e) {
			System.out.println("ExecuteSQL for next dttm");
			e.printStackTrace();
		}
		return b;
	}
	
	/**
	 * Tries to create a new Appointment and put the same into the database subject to doctor availability.
	 * @param request The request object containing the form data
	 * @return true if successfully creates and puts the Appointment.  
	 */
	public static final boolean makeAppointment(HttpServletRequest request) {
		boolean success = false;
		Appointment appointment = new Appointment();
		
		// /*set date
		Date d = null;
		String dtString = request.getParameter(Attributes.DATE) + " " + request.getParameter(Attributes.TIME);
		SimpleDateFormat sdf = null;
		try {
			sdf = new SimpleDateFormat(Values.FORM_INPUT_DATE_FORMAT_STRING_1);
			d = sdf.parse(dtString);
		} catch (ParseException pe) {
			sdf = new SimpleDateFormat(Values.FORM_INPUT_DATE_FORMAT_STRING_2);
			try {
				d = sdf.parse(dtString);
			} catch (ParseException e) {
				System.out.println("Exception occurred while parsing appointment date");
				e.printStackTrace();
			}
		}
		// set date */
		
		
		try {
			appointment.generateId();
			appointment.setDepartment(Department.parseDepartment(request.getParameter(Attributes.DEPARTMENT)));
			appointment.setDateTime(d);
			appointment.setIsPending(true);
			appointment.setPatientEmailId(request.getParameter(Attributes.PATIENT_ID));
			appointment.setDoctorEmailId(request.getParameter(Attributes.DOCTOR_ID));
			
		} catch (Exception e) {
			System.out.println("Exception occurred while initialising appointment");
			e.printStackTrace();
		}
			
		if(Patient.isExists(appointment.patientEmailId)) {
			if(appointment.isDoctorAvailable()) {
				success = appointment.putAppointmentIntoDb();
			} else { 
				request.setAttribute(Attributes.ERROR_INFO, request.getAttribute(Attributes.ERROR_INFO)
						+ "Doctor not available for the selected duration.\n");
			}
		} else {
			request.setAttribute(Attributes.ERROR_INFO, request.getAttribute(Attributes.ERROR_INFO)
					+ "No records for patient id :\t"+appointment.patientEmailId );
		}
		
		return success; 
	}
	
	/**
	 * Writes an object of Appointment into the database.
	 * Is used by the makeAppointment method only
	 * @param appointment The appointment to be saved into the database
	 * @return true: if writing is successful
	 * @return false: if writing isn't successful
	 */
	private final boolean putAppointmentIntoDb(){
		boolean success = false;
		try {
			
			
			String	sql = "INSERT into appointment values("
								+ "'"+ this.getId()+"', "
								+ "'"+ this.getPatientEmailId()+"', "
								+ "'"+ this.getDoctorEmailId()+"', "
								+ "'"+ this.getDepartment().getDepartmentString()+"', "
								+ "'"+ this.getDateString() +"', "
								+ "'"+ this.getSqlIsPending()+"'"
							+ ")";
			ExecuteQuery.executeInsert(sql);
			
			sql = "UPDATE patient SET appointmentId = '"+this.getId()+"' WHERE email = '"+this.getPatientEmailId()+"'";
			ExecuteQuery.executeInsert(sql);
			
			ExecuteQuery.closeConnection();
			success = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return success;
	}

	public Byte getSqlIsPending() {
		Byte pending =  0;
		if(this.getIsPending()) {
			pending = 1;
		}
		return pending;
	}

	Date dateTime;
	Department department;
	String doctorEmailId;
	String id = null;
	Boolean isPending = null;
	String patientEmailId;
	
	public static void main(String[] args) throws Exception {
		ArrayList<Appointment> a = getTodaysAppointmentsFromDb("CARDIOLOGY");
		for(Appointment x : a) {
			System.out.println(x.getId() +" "+x.getPatientEmailId());
		}
//		Appointment a = new Appointment();
//		a.setDateString("2017-10-22 21:56:05");
//		ResultSet rs;
//		String sql = "INSERT into dttm values ('"+a.getDateString()+"')";
//		System.out.println(a.getDateString());
//		try {
//			ExecuteQuery.executeInsert(sql);
//			rs = ExecuteQuery.executeSQL("Select * from dttm");
//			rs.next();
//			rs.next();
//			rs.next();
//			a.setDateString(rs.getString(1));
//			System.out.println("OUTPUT: "+a.getDateString());
//			ExecuteQuery.conn.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		Appointment a = new Appointment();
//		a.generateId();
//		a.setDateString("2017-10-28 17:35:00");		
//		a.setDepartment(Department.Cardiology);
//		a.setDoctorEmailId("m@ex.com");
//		a.setPatientEmailId("p@ex.com");
//		a.setIsPending(true);
//		boolean bf = a.isDoctorAvailable();
//		System.out.println("pehle:\t" + bf);
//		
//		if(bf) {
//			a.putAppointmentIntoDb();
//			System.out.println("ghus gaya successfully");
//		}
//		
//		System.out.println("baad mein:\t"+a.isDoctorAvailable());
//		
	}
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 * @throws Exception 
	 */
	public void setId(String id) throws Exception {
		if (null == this.id)
			this.id = id;
		else
			throw new Exception("EXCEPTION WHILE ASSIGNING ID. CANNOT ASSIGN ID TO NON NULL FIELD");
	}
	/**
	 * @return the dateTime
	 */
	public Date getDateTime() {
		return dateTime;
	}
	public String getDateString() {
		SimpleDateFormat sdf = new SimpleDateFormat(Values.DB_DATE_FORMAT_STRING);
		return sdf.format(dateTime);
	}
	
	public String getFormTimeString() {
		SimpleDateFormat sdf = new SimpleDateFormat(Values.FORM_VIEW_TIME_FORMAT);
		return sdf.format(dateTime);
	}
	
	/**
	 * @param dateTime the dateTime to set
	 */
	public void setDateTime(Date dateTime) {
		this.dateTime = dateTime;
	}
	
	/**
	 * @param dateTime yyyy-MM-dd HH:mm:ss
	 */
	public void setDateString(String dateTime) {
		SimpleDateFormat sdf = new SimpleDateFormat(Values.DB_DATE_FORMAT_STRING);
		try {
			this.dateTime = sdf.parse(dateTime);
		} catch (ParseException e) {
			System.out.println("EXCEPTION OCCURRED WHILE PARSING DATE");
			e.printStackTrace();
		}
	}
	/**
	 * @return the department
	 */
	public Department getDepartment() {
		return department;
	}
	/**
	 * @param department the department to set

	 */
	public void setDepartment(Department department) {
		this.department = department;
	}
	/**
	 * @return the doctorEmailId
	 */
	public String getDoctorEmailId() {
		return doctorEmailId;
	}
	/**
	 * @param doctorEmailId the doctorEmailId to set
	 */
	public void setDoctorEmailId(String doctorEmailId) {
		this.doctorEmailId = doctorEmailId;
	}
	/**
	 * @return the patientEmailId
	 */
	public String getPatientEmailId() {
		return patientEmailId;
	}
	/**
	 * @param patientEmailId the patientEmailId to set
	 */
	public void setPatientEmailId(String patientEmailId) {
		this.patientEmailId = patientEmailId;
	}
	/**
	 * @return the isPending
	 */
	public Boolean getIsPending() {
		return isPending;
	}
	public void setIsPending(Boolean isPending) {
		if(null==this.isPending)
			this.isPending = isPending;
	}
	/**
	 * Closes the appointment
	 */
	public void close() throws Exception  {
		if(this.isPending)
			this.isPending=false;
		String sql = "UPDATE appointment set isPending = 0 where id = '"+this.id+"'";
		ExecuteQuery.executeInsert(sql);
		System.out.println("Exception during closing the appointment.");
		ExecuteQuery.closeConnection();
	}
	/**
	 * Assigns a unique random id to the ID field.
	 * @throws IdNotNullException Cannot assign ID to non NULL field. Id is already assigned.
	 */
	public void generateId() throws Exception {
		if (null == this.id)
			this.id = UUID.randomUUID().toString();
		else
			throw new Exception("EXCEPTION WHILE ASSIGNING ID. CANNOT ASSIGN ID TO NON NULL FIELD");
	}
}
