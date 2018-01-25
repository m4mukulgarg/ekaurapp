package ekaurapp;

public enum BloodGroup {
	//BllodGroup Literals
	A_POSITIVE,
	A_NEGATIVE,
	B_POSITIVE,
	B_NEGATIVE,
	O_POSITIVE,
	O_NEGATIVE;
	
	//Department equivalent strings
	public static final String A_MINUS = "A-";
	public static final String A_PLUS = "A+";
	public static final String B_MINUS = "B-";
	public static final String B_PLUS = "B+";
	public static final String O_MINUS = "O-";
	public static final String O_PLUS = "O+";
	
	public static BloodGroup parseBloodGroup(String bg) throws Exception {
		if(bg.equalsIgnoreCase(A_MINUS))
			return BloodGroup.A_NEGATIVE;
		if(bg.equalsIgnoreCase(A_PLUS))
			return BloodGroup.A_POSITIVE;
		if(bg.equalsIgnoreCase(B_MINUS))
			return B_NEGATIVE;
		if(bg.equalsIgnoreCase(O_MINUS))
			return O_NEGATIVE;
		if(bg.equalsIgnoreCase(B_PLUS))
			return BloodGroup.B_POSITIVE;
		if(bg.equalsIgnoreCase(O_PLUS))
			return BloodGroup.O_POSITIVE;
		
		throw new Exception("Invalid BloodGroup String!!!");
	}
	
	
	public String getBloodGroupString() throws Exception{
		switch(this) {
		case A_POSITIVE :
			return A_PLUS;
		case A_NEGATIVE:
			return A_MINUS;
		case B_NEGATIVE:
			return B_MINUS;
		case B_POSITIVE:
			return B_PLUS;
		case O_NEGATIVE:
			return O_MINUS;
		case O_POSITIVE:
			return O_PLUS;
		default:
			throw new Exception("Invalid BloodGroup Literal!!!");
		}
	}
}