package ekapp;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class Party implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -301281984936109571L;

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

	private Long party_id;
	private String name;
	private String agenda_short;
	private String agenda;

	private String email;
	private static HashMap<Post, Users> candidates = new HashMap<Post, Users>();

	public static void main(String[] party_id) throws IOException {
		System.out.println("start");
		Party p1 = getPartyFromDB("6418");
		System.out.println(p1);
	}

	public static Party getPartyFromDB(Long party_id) {
		return getPartyFromDB(party_id.toString());
	}

	/**
	 * 
	 * @param count: No. of party objects to retrieve, 0 for all
	 * @return 
	 */
	public static ArrayList<Party> getPartiesFromDB(int count) {
		ArrayList<Party> parties = new ArrayList<Party>();

		try {
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			if (count == 0)
				sql = "SELECT party_id from party";
			else
				sql = "SELECT party_id from party ORDER BY RAND() LIMIT " + count;
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				parties.add(getPartyFromDB(rs.getString(1)));
			}
		} catch (SQLException sqle) {
			System.out.println("SQLException");
			sqle.printStackTrace();
		} catch (ClassNotFoundException clnfe) {
			System.out.println("ClassNotFound");
			clnfe.printStackTrace();
		} catch (Exception e) {
			System.out.println("OtherException");
			e.printStackTrace();
		}

		return parties;
	}

	public HashMap<Post, Users> getCandidates() {
		Users queryResult = new Users();
		try {
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT email FROM USERS WHERE party_id ='" + this.party_id + "'";
			ResultSet rs = stmt.executeQuery(sql);
			rs.absolute(0);
			while (rs.next()) {
				queryResult = Users.getUserFromDB(rs.getString(1));
				candidates.put(queryResult.getPostApplied(), queryResult);
			}
			conn.close();
		} catch (SQLException sqle) {
			System.out.println("SQLException");
			sqle.printStackTrace();
		} catch (ClassNotFoundException clnfe) {
			System.out.println("ClassNotFound");
			clnfe.printStackTrace();
		} catch (Exception e) {
			System.out.println("OtherException");
			e.printStackTrace();
		}
		// return queryResult;

		return candidates;
	}

	public static Party getPartyFromDB(String party_id) {
		Party partyQueryResult = new Party();
		try {
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "SELECT * FROM PARTY WHERE party_id='" + party_id + "'";
			ResultSet rs = stmt.executeQuery(sql);
			rs.absolute(0);
			if (rs.next()) {
				partyQueryResult.setParty_id(rs.getLong(1));
				partyQueryResult.setName(rs.getString(2));
				partyQueryResult.setAgenda_short(rs.getString(3));
				partyQueryResult.setAgenda(rs.getString(4));
				partyQueryResult.setEmail(rs.getString(5));
				// String o = rs.getString(6);
				// if (null != o) {
				// System.out.println(o);
				// // partyQueryResult.setCandidates( (HashMap) o);
				// }
			}
			conn.close();
		} catch (SQLException sqle) {
			System.out.println("SQLException");
			sqle.printStackTrace();
		} catch (ClassNotFoundException clnfe) {
			System.out.println("ClassNotFound");
			clnfe.printStackTrace();
		} catch (Exception e) {
			System.out.println("OtherException");
			e.printStackTrace();
		}
		return partyQueryResult;
	}

	public static Boolean removeParty(Long party_id) throws Exception {
		Boolean success = false;

		// Register JDBC driver
		Class.forName("com.mysql.jdbc.Driver").newInstance();

		// Open a connection
		Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

		// Execute SQL query
		Statement stmt = conn.createStatement();
		String sql;
		sql = "DELETE FROM PARTY WHERE party_id='" + party_id + "'";
		stmt.execute(sql);
		success = true;
		conn.close();

		return success;
	}

	public Boolean addParty() throws Exception {
		Boolean success = false;
		try {
			// Register JDBC driver
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			// Open a connection
			Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// Execute SQL query
			Statement stmt = conn.createStatement();
			String sql;
			sql = "INSERT INTO PARTY (party_id,name,agenda_short,agenda) VALUES(" + this.party_id + "," + " '" + this.name + "', 'blab', 'alasdfkjhk')";

			stmt.execute(sql);
			success = true;
			conn.close();
		} catch (Exception e) {
			throw e;
		}

		return success;
	}

	public void setCandidates(HashMap<Post, Users> object) {
		// TODO Auto-generated method stub
		Party.candidates = object;
	}

	/**
	 * @return the party_id
	 */
	public Long getParty_id() {
		return party_id;
	}

	/**
	 * @param party_id
	 *            the party_id to set
	 */
	public void setParty_id(long party_id) {
		this.party_id = party_id;
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
		this.name = name;
	}

	/**
	 * @return the agenda
	 */
	public String getAgenda() {
		return agenda;
	}

	/**
	 * @param agenda
	 *            the agenda to set
	 */
	public void setAgenda(String agenda) {
		this.agenda = agenda;
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
		this.email = email;
	}

	public String getAgenda_short() {
		return agenda_short;
	}

	public void setAgenda_short(String agenda_short) {
		this.agenda_short = agenda_short;
	}

	@Override
	public String toString() {
		return "Party [party_id= " + party_id + ", name= " + name + ", agenda_short= " + agenda_short + ", agenda= "
				+ agenda + ", email= " + email + ", dummy= " + candidates + "]";
	}

	public static String getJdbcDriver() {
		return JDBC_DRIVER;
	}

}