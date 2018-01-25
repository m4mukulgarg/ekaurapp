package ekaurapp;

public enum Department {
	
	// Department Literals
	Cardiology,
	Ophthalmology,
	Neurology,
	Psychology,
	Dermatology;
	
	
	
	//Department equivalent strings
	public static final String CARDIO = "CARDIOLOGY";
	public static final String OPHTHAL = "OPHTHALMOLOGY";
	public static final String NEURO = "NEUROLOGY";
	public static final String PSYCHO = "PSYCHOLOGY";
	public static final String DERMAT = "DERMATOLOGY";


	
	public static Department parseDepartment(String d) throws Exception {
		if (CARDIO.equalsIgnoreCase(d))
				return Department.Cardiology;
		if (OPHTHAL.equalsIgnoreCase(d))
				return Ophthalmology;
		if (NEURO.equalsIgnoreCase(d))
				return Neurology;
		if (PSYCHO.equalsIgnoreCase(d))
				return Department.Psychology;
		if (DERMAT.equalsIgnoreCase(d))
				return Dermatology;
		throw new Exception("Invalid Department String!!!");
		
	}
	public  String getDepartmentString() throws Exception{
		switch(this) {
		case Cardiology :
			return CARDIO;
		case Ophthalmology:
			return OPHTHAL;
		case Neurology:
			return NEURO;
		case Psychology:
			return PSYCHO;
		case Dermatology:
			return DERMAT;
		default:
			throw new Exception("Invalid Department Literal!!!");
		}
	}
}
