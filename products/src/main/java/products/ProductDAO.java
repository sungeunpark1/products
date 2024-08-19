package products;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import comm.Chaebun;


public class ProductDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public ProductDAO() {
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
		String SQL="SELECT FLOOR(count(pno)/10)*10 FROM PRODUCT";
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
	public int join(ProductVO product) {
		
		String SQL="INSERT INTO PRODUCT VALUES (?,?,?,?,?,?,?,?,?,?)";
		try{
			int psupply = Integer.parseInt(product.getPsupply());
			int pquantity = Integer.parseInt(product.getPquantity());
			String psum = String.valueOf(psupply * pquantity);
			System.out.println("psum>>"+psum);
			pstmt= conn.prepareStatement(SQL);
			pstmt.setString(1, Chaebun.pnoValue());
			pstmt.setString(2, product.getPproduct());
			pstmt.setString(3, product.getPsize());
			pstmt.setString(4, product.getPunit());
			pstmt.setString(5, product.getPquantity());
			pstmt.setString(6, product.getPsupply());
			pstmt.setString(7, product.getPtax());
			pstmt.setString(8, psum);
			pstmt.setString(9, getDate());
			pstmt.setString(10, "Y");
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
	
	int page=0;
	public int pageMax() {
		String SQL="SELECT * FROM PRODUCT WHERE PDELETEYN ='Y'";
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