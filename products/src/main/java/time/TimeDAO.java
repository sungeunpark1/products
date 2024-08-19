package time;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class TimeDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public static String driver="com.mysql.cj.jdbc.Driver";
	public static String url="jdbc:mysql://localhost:3306/product";
	public static String id="root";
	public static String pass="p@ssw0rd";
	
	public TimeDAO() {
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
	
	
	
		public int join(TimeVO time) {
			System.out.println("________Time join  함수 진입___________");
			String SQL="INSERT INTO TIME VALUES (?,?,?,?,?,?,?,?,?,?)";
			
						
			try{
				pstmt= conn.prepareStatement(SQL);
				pstmt.setString(1, time.getTname());
				pstmt.setString(2, time.getTdate());
				pstmt.setString(3, time.getTmon());
				pstmt.setString(4, time.getTtue());
				pstmt.setString(5, time.getTwed());
				pstmt.setString(6, time.getTthu());
				pstmt.setString(7, time.getTfri());
				pstmt.setString(8, time.getTsat());
				pstmt.setString(9, time.getTsun());
				pstmt.setString(10, "Y");
				return pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -1;//데이터베이스 	
		}
	public ArrayList<TimeVO> getList(String date){
		System.out.println("_________time  getList 함수 진입___________");
		String SQL="SELECT * FROM TIME WHERE TDELETEYN='Y' AND TDATE=? ORDER BY TNAME DESC";
		System.out.println("date>>"+date);
		ArrayList<TimeVO> listd= new ArrayList<TimeVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, date);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TimeVO timeVO=new TimeVO();
				timeVO.setTname(rs.getString(1));
				timeVO.setTmon(rs.getString(3));
				timeVO.setTtue(rs.getString(4));
				timeVO.setTwed(rs.getString(5));
				timeVO.setTthu(rs.getString(6));
				timeVO.setTfri(rs.getString(7));
				timeVO.setTsat(rs.getString(8));
				timeVO.setTsun(rs.getString(9));
				listd.add(timeVO);				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listd;
	}
	
	public ArrayList<TimeVO> getList(){
		System.out.println("_________time  getList 함수 진입___________");
		String SQL="SELECT * FROM TIME WHERE TDELETEYN='Y' AND TDATE=(SELECT SUBSTR(sysdate(),1,7)) ORDER BY TNAME DESC  ";
		ArrayList<TimeVO> listd= new ArrayList<TimeVO>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				TimeVO timeVO=new TimeVO();
				timeVO.setTname(rs.getString(1));
				timeVO.setTmon(rs.getString(3));
				timeVO.setTtue(rs.getString(4));
				timeVO.setTwed(rs.getString(5));
				timeVO.setTthu(rs.getString(6));
				timeVO.setTfri(rs.getString(7));
				timeVO.setTsat(rs.getString(8));
				timeVO.setTsun(rs.getString(9));
				listd.add(timeVO);				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return listd;
	}
	public int delete(String datec){
		System.out.println("_________time  delete 함수 진입___________");
		String SQL="UPDATE TIME SET TDELETEYN='N' WHERE TDELETEYN='Y' AND TDATE=?;";
		System.out.println("datec>>"+datec);
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, datec);
			int rse=pstmt.executeUpdate();
			
			return 1;		
						
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
}
