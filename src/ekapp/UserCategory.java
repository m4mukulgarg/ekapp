/**
 * 
 */
package ekapp;

/**
 * @author NAVNEET
 *
 */
public enum UserCategory {
	ADMIN,	
	STAFF,		
	STUDENT,	
	CANDIDATE,
	MANAGEMENT;

	public static UserCategory parseCategory(String category) throws Exception {
		if(category.equalsIgnoreCase("ADMIN"))
			return ADMIN;
		if(category.equalsIgnoreCase("STAFF"))
			return STAFF;
		if(category.equalsIgnoreCase("STUDENT"))
			return STUDENT;
		if(category.equalsIgnoreCase("CANDIDATE"))
			return CANDIDATE;
		if(category.equalsIgnoreCase("MANAGEMENT"))
			return MANAGEMENT;
		
		throw new Exception("Invalid Category String");
	}
	
	public  String getCategoryString() throws Exception{
		switch(this) {
		case ADMIN :
			return "ADMIN";
		case CANDIDATE:
			return "CANDIDATE";
		case STAFF:
			return "STAFF";
		case STUDENT:
			return "STUDENT";
		case MANAGEMENT:
			return "MANAGEMENT";
		default:
			throw new Exception("Invalid Category Literal!!!");
		}
	}
	
}
