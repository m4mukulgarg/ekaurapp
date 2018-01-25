package ekaurapp;

import java.sql.ResultSet;


public final class Doctor extends User{
	public static final Doctor getDrFromDb(String email) {
		Doctor d = null;
		try {
			String sql = "SELECT * from doctor where email = '" + email + "'";
			ResultSet rs = ExecuteQuery.executeSQL(sql);
			if (rs.next()) {
				d=new Doctor();
				d.email = rs.getString(1);
				d.password = rs.getString(2);
				d.name = rs.getString(3);
				d.department = Department.parseDepartment(rs.getString(4));
				ExecuteQuery.closeConnection();
			} else {
				System.out.println("No doctor exist with email: " + email);
			}

		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	/**
	 * 
	 * @param dr The object to be written into the database
	 * @return true if the operation was successful
	 */
	public final boolean putDrIntoDb() {
		boolean d = false;
		try {
			String sql = "INSERT into doctor values("
								+ "'" + this.getEmail() + "', "
								+ "'" + this.getPassword() + "', "
								+ "'" + this.getName()+ "',"
								+ "'" + this.getDepartment().getDepartmentString() + "'"
							+ ")";
			ExecuteQuery.executeInsert(sql);
			d = true;
			ExecuteQuery.closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return d;
	}
	Department department;


	/**
	 * @return the department
	 */
	public Department getDepartment() {
		return department;
	}
	/**
	 * @param department
	 *            the department to set
	 */
	public void setDepartment(Department department) {
		this.department = department;
	}


}