package client;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comm.Chaebun;


public class ClientDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public ClientDAO() {
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
	public String getDate() {
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public int getNext() {
		String SQL="SELECT FLOOR(count(cno)/10)*10 FROM CLIENT";
		try {
			PreparedStatement pstmt= conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public int join(ClientVO client) {
		System.out.println("________client join  함수 진입___________");
		String SQL="INSERT INTO CLIENT VALUES (?,?,?,?,?,?,?,?)";
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, Chaebun.cnoValue());
			pstmt.setString(2, client.getCproduct());
			pstmt.setString(3, client.getCname());
			pstmt.setString(4, client.getCphonenumber());
			pstmt.setString(5, getDate());
			pstmt.setString(6, client.getCasdate());
			pstmt.setString(7, client.getCnote());
			pstmt.setString(8, "Y");
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 	
	}
	public ArrayList<ClientVO> getList(int pageNumberc){
		System.out.println("_________client  getList 함수 진입___________");
		String SQL="SELECT * FROM CLIENT WHERE CDELETEYN ='Y' ORDER BY CNO DESC LIMIT ?,10";
		System.out.println("pageNumberc>>"+pageNumberc);
		ArrayList<ClientVO> listc= new ArrayList<ClientVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumberc-1)*10);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ClientVO clientVO=new ClientVO();
				clientVO.setCno(rs.getString(1));
				clientVO.setCproduct(rs.getString(2));
				clientVO.setCname(rs.getString(3));
				clientVO.setCphonenumber(rs.getString(4));
				clientVO.setCbuydate(rs.getString(5));
				clientVO.setCasdate(rs.getString(6));
				clientVO.setCnote(rs.getString(7));		
				listc.add(clientVO);				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listc;
	}
	
	int page=0;
	public int pageMax() {
		String SQL="SELECT * FROM CLIENT WHERE CDELETEYN ='Y'";
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
}