package supplier;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comm.Chaebun;


public class SupplierDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public SupplierDAO() {
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
		String SQL="SELECT FLOOR(count(sno)/10)*10 FROM SUPPLIER";
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

	public int join(SupplierVO supplier) {
		System.out.println("________supplier join  함수 진입___________");
		String SQL="INSERT INTO SUPPLIER VALUES (?,?,?,?,?,?,?,?)";
		try{
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, Chaebun.snoValue());
			pstmt.setString(2, supplier.getSclient());
			pstmt.setString(3, supplier.getSphonenumber());
			pstmt.setString(4, supplier.getSaddress());
			pstmt.setString(5, supplier.getSnote());
			pstmt.setString(6, getDate());
			pstmt.setString(7, getDate());
			pstmt.setString(8, "Y");
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 	
	}
	public ArrayList<SupplierVO> getList(int pageNumbers){
		System.out.println("_________supplier  getList 함수 진입___________");
		String SQL="SELECT * FROM SUPPLIER WHERE SDELETEYN ='Y' ORDER BY SNO DESC LIMIT ?,10";
		System.out.println("pageNumbers>>"+pageNumbers);
		ArrayList<SupplierVO> lists= new ArrayList<SupplierVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumbers-1)*10);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SupplierVO supplierVO=new SupplierVO();
				supplierVO.setSno(rs.getString(1));
				supplierVO.setSclient(rs.getString(2));
				supplierVO.setSphonenumber(rs.getString(3));
				supplierVO.setSaddress(rs.getString(4));
				supplierVO.setSnote(rs.getString(5));
				supplierVO.setSinsertdate(rs.getString(6));
				supplierVO.setSupdatedate(rs.getString(7));		
				lists.add(supplierVO);				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	int page=0;
	public int pageMax() {
		String SQL="SELECT * FROM SUPPLIER WHERE SDELETEYN ='Y'";
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
