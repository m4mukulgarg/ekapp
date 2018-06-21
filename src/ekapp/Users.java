/**
 * 
 */
package ekapp;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * @author WantedChamp
 *
 */
public class Users implements Serializable {
	/**
	 * @throws Exception
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 * 
	 */
	/**
	 * JDBC driver name and database URL
	 */
	private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static final String DB_URL = "jdbc:mysql://us-cdbr-iron-east-04.cleardb.net:3306/heroku_054a489f4baf972?reconnect=true";

	/**
	 * Database credentials
	 */
	private static final String USER = "bc9962ebbc83a4";
	private static final String PASS = "b63defda";

	public static ArrayList<Users> getPendingUsers() throws Exception {
		ArrayList<Users> pendingUsers = new ArrayList<Users>();

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "select email from users where approved = 'false'";

		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			Users u = getUserFromDB(rs.getString(1));
			pendingUsers.add(u);
		}

		return pendingUsers;
	}

	public static HashMap<Post, Users> getWinners() throws ClassNotFoundException, SQLException, Exception {
		HashMap<Post, Users> winners = new HashMap<Post, Users>();

		winners.put(Post.PRESIDENT, Users.getWinnersByPost(Post.PRESIDENT));
		winners.put(Post.V_PRESIDENT, Users.getWinnersByPost(Post.V_PRESIDENT));
		winners.put(Post.SECRETARY, Users.getWinnersByPost(Post.SECRETARY));
		winners.put(Post.J_SECRETARY, Users.getWinnersByPost(Post.J_SECRETARY));
		winners.put(Post.TREASURER, Users.getWinnersByPost(Post.TREASURER));

		return winners;
	}

	public static Users getWinnersByPost(Post p) throws SQLException, ClassNotFoundException, Exception {

		Users winner = null;

		// Register JDBC driver
		Class.forName(JDBC_DRIVER).newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "select email, vote_count from users where post_applied='" + p.getPostString()
				+ "'  ORDER BY vote_count DESC Limit 1";
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		winner = Users.getUserFromDB(rs.getString(1));
		conn.close();
		return winner;
	}

	public static void main(String[] args) throws ClassNotFoundException, SQLException, ParseException, Exception {
		 Users user = getUserFromDB("admin1010@localohost");
		 System.out.println(user.toString());
//		 UserCategory u = UserCategory.ADMIN;
//		 Users us = getWinnersByPost(Post.V_PRESIDENT);
//		 System.out.println(us);
//		try {
//			// Register JDBC driver
//			Class.forName("com.mysql.jdbc.Driver").newInstance();
//
//			// Open a connection
//			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
//
//			// Execute SQL query
//			Statement stmt = conn.createStatement();
//			String sql;
//			Post p = null;
//			sql = "SELECT email FROM USERS WHERE post_applied ='" + p.getPostString() + "'";
//			ResultSet rs = stmt.executeQuery(sql);
//			rs.absolute(0);
//			while (rs.next()) {
//				// queryResult = Users.getUserFromDB(rs.getString(1));
//				// candidates.add(queryResult);
//			}
//			conn.close();
//		} catch (Exception e) {
//
//			e.printStackTrace();
//		}

	}

	@Override
	public String toString() {
		return "Users [name: " + name + ", password: ********" + ", email: " + email + ", category: " + category
				+ ", postApplied: " + postApplied + ", hasVoted: " + hasVoted + "]";
	}

	private static final long serialVersionUID = -4753441270350376322L;
	/**
	 * 
	 */

	private String name = "";
	private String password;
	private String email = "";
	private UserCategory category;
	private Post postApplied;
	private long party_id;
	private boolean hasVoted = false;
	private long vote_count;
	private Gender gender;
	private String address;
	private String about;
	private String quote;

	private Boolean approved = false;

	public static ArrayList<Users> getUsersByPost(Post p) throws Exception {
		ArrayList<Users> candidates = new ArrayList<Users>();
		Users queryResult = new Users();

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT email FROM USERS WHERE post_applied ='" + p.getPostString() + "'";
		ResultSet rs = stmt.executeQuery(sql);
		rs.absolute(0);
		while (rs.next()) {
			queryResult = Users.getUserFromDB(rs.getString(1));
			candidates.add(queryResult);
		}
		conn.close();

		// return queryResult;

		return candidates;

	}

	/**
	 * @return the vote_count
	 */
	public long getVote_count() {
		return vote_count;
	}

	/**
	 * @param vote_count
	 *            the vote_count to set
	 */
	public void setVote_count(long vote_count) {
		this.vote_count = vote_count;
	}

	/**
	 * @return the party_id
	 */
	public long getParty_id() {
		return party_id;
	}

	/**
	 * @param party_id
	 *            the party_id to set
	 */
	public void setParty_id(long party_id) {
		this.party_id = party_id;
	}

	public boolean changeVote()
			throws SQLException, InstantiationException, IllegalAccessException, ClassNotFoundException {
		if (!this.hasVoted) {
			this.hasVoted = true;

			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "UPDATE USERS SET hasVoted='true' WHERE email ='" + this.email + "'";
			stmt.executeUpdate(sql);
			conn.close();

			return true;
		}

		return false;
	}

	public boolean setVote(Boolean hasVoted) {
		if (this.hasVoted) {
			return false;
		}
		this.hasVoted = hasVoted;
		return true;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name
	 *            the name to set
	 */
	public void setName(String name) {
		this.name = new String(name);
	}

	/**
	 * @return check if the password supplied is same as the password stored
	 */
	public boolean equalsPassword(String password) {
		if (this.password.equals(password))
			return true;
		else
			return false;
	}

	public String getP() {
		return password;
	}

	public void setP(String pass) {
		if (null == this.password) {
			this.password = new String(pass);
		}
	}

	/**
	 * @param oldPassword
	 *            the current password for authentication
	 * @param newPassword
	 *            the new changed password
	 * @return true if successful
	 * @return false if failed
	 */

	public boolean changePassword(String oldPassword, String newPassword) {
		if (this.equalsPassword(oldPassword)) {
			this.password = new String(newPassword);
			return true;
		}
		return false;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = new String(email);
	}

	/**
	 * @return the category
	 */
	public UserCategory getCategory() {
		return category;
	}

	public static void voteFor(ArrayList<String> vc)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
		for (String s : vc) {
			Users.addVote(s);
		}

	}

	public static void addVote(String uid)
			throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "UPDATE USERS SET vote_count=vote_count+1 WHERE email ='" + uid + "'";
		stmt.executeUpdate(sql);
		conn.close();
	}

	/**
	 * @param category
	 *            the UserCategory to set
	 */
	public void setCategory(UserCategory category) {
		this.category = category;
	}

	/**
	 * Sets the category property from a String
	 * 
	 * @param category
	 *            the category string to set
	 */
	public void setCategory(String category) throws Exception {
		this.category = UserCategory.parseCategory(category);
	}

	/**
	 * @return the postApplied
	 */
	public Post getPostApplied() {
		return postApplied;
	}

	/**
	 * @param postApplied
	 *            the postApplied to set
	 */
	public void setPostApplied(Post postApplied) {
		this.postApplied = postApplied;
	}

	public static Users getUserFromDB(String email)
			throws SQLException, ClassNotFoundException, ParseException, Exception {
		Users userQueryResult = new Users();

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT * FROM USERS WHERE email='" + email + "'";
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()) {

			userQueryResult.setName(rs.getString(1));
			userQueryResult.setP(rs.getString(2));
			userQueryResult.setEmail(rs.getString(3));
			userQueryResult.setCategory(UserCategory.parseCategory(rs.getString(4)));
			userQueryResult.setParty_id(rs.getLong(5));
			if (rs.getString(6).equalsIgnoreCase("true"))
				userQueryResult.setVote(true);
			else
				userQueryResult.setVote(false);
			userQueryResult.setVote_count(rs.getLong(7));

			userQueryResult.setPostApplied(Post.parsePost(rs.getString(8)));

			userQueryResult.setGender(Gender.parseGender(rs.getString(9)));
			userQueryResult.setAddress(rs.getString(10));
			userQueryResult.setApproved(rs.getBoolean(11));
			userQueryResult.setQuote(rs.getString(12));
			userQueryResult.setAbout(rs.getString(13));

		}
		conn.close();

		return userQueryResult;
	}

	public void updateUser() throws Exception {
		String sql;
		sql = "DELETE FROM users WHERE email ='" + this.getEmail() + "'";
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		stmt.execute(sql);
		this.putUserIntoDb();
	}

	public final boolean putUserIntoDb() throws SQLException, Exception {
		boolean sucess = false;
		String hasVoted = "false";
		if (this.hasVoted) {
			hasVoted = "true";
		}

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql = "INSERT into users values(" + "'" + this.getName() + "', " + "'" + this.getP() + "', " + "'"
				+ this.getEmail() + "', " + "'" + this.getCategory().getCategoryString() + "', " + "'"
				+ this.getParty_id() + "', " + "'" + hasVoted + "', " + "'" + this.getVote_count() + "', " + "'"
				+ this.getPostApplied().getPostString() + "', " + "'" + this.getGender().toString() + "', " + "'"
				+ this.getAddress() + "', " + "'" + this.isApproved().toString() + "'" + ")";
		stmt.execute(sql);
		stmt.close();
		conn.close();
		sucess = true;
		return sucess;
	}

	/**
	 * @return the hasVoted
	 */
	public boolean hasVoted() {
		return hasVoted;
	}

	/**
	 * @param hasVoted
	 *            the hasVoted to set
	 */
	public void setHasVoted(boolean hasVoted) {
		this.hasVoted = hasVoted;
	}

	/**
	 * @return the gender
	 */
	public Gender getGender() {
		return gender;
	}

	/**
	 * @param gender
	 *            the gender to set
	 */
	public void setGender(Gender gender) {
		this.gender = gender;
	}

	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	public Boolean isApproved() {
		return approved;
	}

	public void setApproved(Boolean approved) {
		this.approved = approved;
	}

	public boolean approveUser() {
		if (!approved) {
			approved = !approved;
		}
		return approved;
	}

	/**
	 * @return the about
	 */
	public String getAbout() {
		return about;
	}

	/**
	 * @param about
	 *            the about to set
	 */
	public void setAbout(String about) {
		this.about = about;
	}

	/**
	 * @return the quote
	 */
	public String getQuote() {
		return quote;
	}

	/**
	 * @param quote
	 *            the quote to set
	 */
	public void setQuote(String quote) {
		this.quote = quote;
	}
}
