package user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comm.Chaebun;



public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public UserDAO() {
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url,id,pass);
			System.out.println("conn>>"+conn);
		}catch(ClassNotFoundException e) {
			System.out.println("diver err"+e);
		}
		catch (SQLException ex) {
			System.out.println("SQLException" + ex);
		}
	}
	public int login(String username,String userpassword ) {
		System.out.println("---------login関数------");
		String SQL= "SELECT userpassword From User WHERE username=?";
	
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, username);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userpassword))
					
					return 1;//로그인 성공				
				else 
					return 0;// 비밀번호 틀림
					
			}
			return -1;//아이디가 없음
		}catch(Exception e) {
			System.out.println("SELECT DBERR"+e);
		}
		return -2;//데이터베이스 오류
	}
	public int join(UserVO user) {
		System.out.println("---------join関数------");
		String SQL="INSERT INTO USER VALUES (?,?,?,?,?,?)";
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, Chaebun.unoValue());
			pstmt.setString(2, user.getUsername());
			pstmt.setInt(3, user.getUsergrade());
			pstmt.setString(4, user.getUserpassword());
			pstmt.setString(5, user.getUserphonenumber());
			pstmt.setString(6,"Y");
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 	
	}
	public ArrayList<UserVO> getList(int pageNumberus){
		System.out.println("_________user  getList 함수 진입___________");
		String SQL="SELECT * FROM USER WHERE USERDELETEYN ='Y' ORDER BY USERNO DESC LIMIT ?,10";
		System.out.println("pageNumberus>>"+pageNumberus);
		ArrayList<UserVO> listus= new ArrayList<UserVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumberus-1)*10);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				UserVO userVO=new UserVO();
				userVO.setUserno(rs.getString(1));
				userVO.setUsername(rs.getString(2));
				userVO.setUsergrade(rs.getInt(3));
				userVO.setUserphonenumber(rs.getString(4));
					
				listus.add(userVO);				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listus;
	}
	int page=0;
	public int pageMax() {
		System.out.println("_________user  pageMax 함수 진입___________");
		String SQL="SELECT * FROM USER WHERE USERDELETEYN ='Y'";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			
			rs=pstmt.executeQuery();
			
			System.out.println("rs>>"+rs);
			while(rs.next()) {
				page=page+1;
				
			}
			System.out.println("page>>"+page);
			return page;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int Delete(UserVO user) {
		System.out.println("---------Delete関数------");
		String SQL="UPDATE USER SET USERDELETEYN='N' WHERE USERNO=?";
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserno());

			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 	
	}
}