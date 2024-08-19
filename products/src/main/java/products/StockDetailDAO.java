package products;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import client.ClientVO;
import comm.Chaebun;


public class StockDetailDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public StockDetailDAO() {
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

	public int join(StockDetailVO stockDetail) {
		
		String SQL="INSERT INTO STOCKDETAIL VALUES (?,?,?,?,?,?)";
		try{
			
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, Chaebun.sdnoValue());
			pstmt.setString(2, stockDetail.getSdname());
			pstmt.setString(3, stockDetail.getSddescription());
			pstmt.setString(4, "Y");
			pstmt.setString(5, getDate());
			pstmt.setString(6, stockDetail.getSdphoto());
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return -1;//데이터베이스 	
	}
	public ArrayList<ProductVO> getList(int pageNumber){
		System.out.println("_________getList 함수 진입___________");
		String SQL="SELECT * FROM PRODUCT WHERE PDELETEYN ='Y' ORDER BY PNO DESC LIMIT ?,10";
		System.out.println("pageNumber>>"+pageNumber);
		ArrayList<ProductVO> list= new ArrayList<ProductVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, (pageNumber-1)*10);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO productVO=new ProductVO();
				productVO.setPno(rs.getString(1));
				productVO.setPproduct(rs.getString(2));
				productVO.setPsize(rs.getString(3));
				productVO.setPunit(rs.getString(4));
				productVO.setPquantity(rs.getString(5));
				productVO.setPsupply(rs.getString(6));
				productVO.setPtax(rs.getString(7));
				productVO.setPsum(rs.getString(8));
				productVO.setPdate(rs.getString(9));
				list.add(productVO);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<StockDetailVO> sdnamebtn(){
		System.out.println("_________sdnamebtn 함수 진입___________");
		String SQL="SELECT SDNAME FROM STOCKDETAIL WHERE SDDELETEYN ='Y'";
		ArrayList<StockDetailVO> list= new ArrayList<StockDetailVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				StockDetailVO stockDetailVO=new StockDetailVO();
				stockDetailVO.setSdname(rs.getString(1));

				list.add(stockDetailVO);
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public String sdDescription(String selectedIndex){
		System.out.println("_________sdDescription 함수 진입___________");
		String SQL="SELECT SDDESCRIPTION FROM STOCKDETAIL WHERE SDDELETEYN ='Y' AND SDNAME=?";
		System.out.println("_________sdDescription 3함수 진입___________");
		String sdd="";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,selectedIndex);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				sdd=rs.getString("SDDESCRIPTION");

			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return sdd;
	}
	
	public ArrayList<ClientVO> sdDate(String date, String category){
		System.out.println("_________sdDate 함수 진입___________");
		String SQL="SELECT SUBSTRING(cbuydate, 6, 2) AS sddate FROM client WHERE cproduct=? and cdeleteyn='Y' and SUBSTRING(cbuydate, 1, 4)=?";
		System.out.println("date>>"+date);
		System.out.println("category>>"+category);
		ArrayList<ClientVO> listsd= new ArrayList<ClientVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, category);
			pstmt.setString(2, date);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ClientVO clientVO=new ClientVO();
				clientVO.setCbuydate2(rs.getString(1));				
				listsd.add(clientVO);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listsd;
	}

	
}
