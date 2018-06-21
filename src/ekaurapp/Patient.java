package ekaurapp;

import java.sql.ResultSet;

public class Patient extends User {
	// public static void main(String[] args) {
	// Patient p = new Patient();
	// p.setEmail("1000@localhost");
	// System.out.println(p.isExists());
	// p.setEmail("m@localhost");
	// System.out.println(p.isExists());
	// p.putUserInDB();
	// System.out.println(p.isExists());
	// }
	String address = "";
	Integer age;
	String allergies = "";
	String appointmentId = "";
	BloodGroup bloodGroup;
	String bloodPressure = "";
	String currentMedications = "";

	/**
	 * height is in cm
	 */
	Integer height;

	String pastDiseases = "";
	/**
	 * weight is in kg
	 */
	Integer weight;

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @return the age
	 */
	public Integer getAge() {
		return age;
	}

	/**
	 * @return the allergies
	 */
	public String getAllergies() {
		return allergies;
	}

	/**
	 * @return the appointmentId
	 */
	public String getAppointmentId() {
		return appointmentId;
	}

	/**
	 * @return the bloodGroup
	 */
	public BloodGroup getBloodGroup() {
		return bloodGroup;
	}

	/**
	 * 
	 * /**
	 * 
	 * @return the bloodPressure
	 */
	public String getBloodPressure() {
		return bloodPressure;
	}

	/**
	 * @return the currentMedications
	 */
	public String getCurrentMedications() {
		return currentMedications;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @return the height
	 */
	public Integer getHeight() {
		return height;
	}

	/**
	 * @return the pastDiseases
	 */
	public String getPastDiseases() {
		return pastDiseases;
	}

	/**
	 * @return the weight
	 */
	public Integer getWeight() {
		return weight;
	}

	public boolean isExists() {
		boolean r = false;
		try {
			String sql;
			sql = "Select * from patient where email = '" + this.getEmail() + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			r = rs.next();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}

	public static boolean isExists(String patientId) {
		boolean r = false;
		try {
			String sql;
			sql = "Select * from patient where email = '" + patientId + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			r = rs.next();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return r;
	}

	/**
	 * Put this object in database
	 * 
	 * @throws Exception
	 */
	public void putPatientInDB() throws Exception {
		String sql;
		sql = "INSERT into Patient Values (" + "'" + this.getEmail() + "'," + "'" + this.getPassword() + "'," + "'"
				+ this.getName() + "'," + "'" + this.getAddress() + "'," + "'" + this.getAge() + "'," + "'"
				+ this.getAllergies() + "'," + "'" + this.getAppointmentId() + "'," + "'"
				+ this.getBloodGroup().getBloodGroupString() + "'," + "'" + this.getBloodPressure() + "'," + "'"
				+ this.getCurrentMedications() + "'," + "'" + this.getHeight() + "'," + "'" + this.getPastDiseases()
				+ "'," + "'" + this.getWeight() + "'" + ")";
		ExecuteQuery.executeInsert(sql);
	}

	public void updatePatient() throws Exception {
		String sql;
		sql = "DELETE FROM Patient WHERE email ='" + this.getEmail() + "'";
		ExecuteQuery.executeInsert(sql);
		this.putPatientInDB();
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 	
	 */

	public static final Patient getPatientFromDb(String email) {
		Patient p = null;
		try {
			String sql = "SELECT * from patient where email = '" + email + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			if (rs.next()) {
				p = new Patient();
				p.email = rs.getString(1);
				p.password = rs.getString(2);
				p.name = rs.getString(3);
				p.address = rs.getString(4);
				p.age = rs.getInt(5);
				p.allergies = rs.getString(6);
				p.appointmentId = rs.getString(7);
				p.bloodGroup = BloodGroup.parseBloodGroup(rs.getString(8));
				p.bloodPressure = rs.getString(9);
				p.currentMedications = rs.getString(10);
				p.height = rs.getInt(11);
				p.pastDiseases = rs.getString(12);
				p.weight = rs.getInt(13);
				ExecuteQuery.closeConnection();
			} else {
				System.out.println("No patient exist with email: " + email);
			}

		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}

	/**
	 * @param age
	 *            the age to set
	 */
	public void setAge(Integer age) {
		this.age = age;
	}

	/**
	 * @param allergies
	 *            the allergies to set
	 */
	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	/**
	 * @param appointmentId
	 *            the appointmentId to set
	 */
	public void setAppointmentId(String appointmentId) {
		this.appointmentId = appointmentId;
	}

	/**
	 * @param bloodGroup
	 *            the bloodGroup to set
	 */
	public void setBloodGroup(BloodGroup bloodGroup) {
		this.bloodGroup = bloodGroup;
	}

	/**
	 * @param bloodPressure
	 *            the bloodPressure to set
	 */
	public void setBloodPressure(String bloodPressure) {
		this.bloodPressure = bloodPressure;
	}

	/**
	 * @param currentMedications
	 *            the currentMedications to set
	 */
	public void setCurrentMedications(String currentMedications) {
		this.currentMedications = currentMedications;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @param height
	 *            the height to set
	 */
	public void setHeight(Integer height) {
		this.height = height;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @param pass
	 *            the pass to set
	 */
	public void setPass(String password) {
		this.password = password;
	}

	/**
	 * @param pastDiseases
	 *            the pastDiseases to set
	 */
	public void setPastDiseases(String pastDiseases) {
		this.pastDiseases = pastDiseases;
	}

	/**
	 * @param weight
	 *            the weight to set
	 */
	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}
