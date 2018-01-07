/**
 * 
 */
package ekapp;

/**
 * @author NAVNEET
 *
 */
public enum Post {
	
	PRESIDENT,
	V_PRESIDENT,
	SECRETARY,
	J_SECRETARY,
	NONE,
	TREASURER;
	
	public static Post parsePost(String post) throws Exception {
		
		if (post.equalsIgnoreCase( "PRESIDENT"))
				return Post.PRESIDENT;
		if (post.equalsIgnoreCase( "V_PRESIDENT"))
			return Post.V_PRESIDENT;
		if (post.equalsIgnoreCase( "SECRETARY"))
			return Post.SECRETARY;
		if (post.equalsIgnoreCase( "J_SECRETARY"))
			return Post.J_SECRETARY;
		if (post.equalsIgnoreCase( "TREASURER"))
			return Post.TREASURER;
		if (post.equalsIgnoreCase( "NONE"))
			return Post.NONE;
		throw new Exception("Invalid Post String!!!");
	
	}
	public  String getPostString() throws Exception{
		switch(this) {
		case PRESIDENT :
			return "PRESIDENT";
		case V_PRESIDENT:
			return "V_PRESIDENT";
		case SECRETARY:
			return "SECRETARY";
		case J_SECRETARY:
			return "J_SECRETARY";
		case TREASURER:
			return "TREASURER";
		case NONE:
			return "NONE";
		default:
			throw new Exception("Invalid Post Literal!!!");
		}
	}
}
