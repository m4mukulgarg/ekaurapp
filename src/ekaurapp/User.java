package ekaurapp;

public abstract class User {
	String email = "";
	String name = "";
	String password = "";
	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}
	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the pass
	 */
	public String getPassword() {
		return password;
	}
	/**
	 * @param pass the pass to set
	 */
	public void setPass(String password) {
		this.password = password;
	}
}
