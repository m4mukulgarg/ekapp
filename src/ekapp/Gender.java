/**
 * 
 */
package ekapp;
import java.text.ParseException;

/**
 * 
 *
 */
public enum Gender {
	FEMALE,
	MALE,
	OTHERS;

	public static Gender parseGender(String category) throws ParseException {
		if(category.equalsIgnoreCase("FEMALE"))
			return FEMALE;
		if(category.equalsIgnoreCase("MALE"))
			return MALE;
		if(category.equalsIgnoreCase("OTHERS"))
			return OTHERS;
		throw new ParseException("Invalid Gender String",0);
	}
	
	public  String toString(){
		switch(this) {
		case FEMALE :
			return "FEMALE";
		case MALE:
			return "MALE";
		case OTHERS:
			return "OTHERS";
		default:
			return	null;
		}
	}
	
}
