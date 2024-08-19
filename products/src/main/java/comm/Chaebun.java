package comm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class Chaebun {

	public static final String USER="U";
	public static final String PRODUCT="P";
	public static final String SUPPLIER="S";
	public static final String CLIENT="C";
	public static final String STOCKDETAIL="D";
			
	public static String commDate() {
		String commDate="";
		Calendar cal=Calendar.getInstance();
		int year_=cal.get(Calendar.YEAR);
		int month_=cal.get(Calendar.MONTH)+1;
		int day_=cal.get(Calendar.DAY_OF_MONTH);
		
		String year=String.valueOf(year_);
		String month=String.valueOf(month_);
		String day=String.valueOf(day_);
		
		if(month.length()==1) {
			month="0"+month;
		}
		if(day.length()==1) {
			day="0"+day;
		}
		System.out.println("date>>"+year+month+day);
		commDate=year+month+day;
		System.out.println("commDate>>"+commDate);
		return commDate;
		
	}
	public static String commNO() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int res=0;
		
		String DRIVER="com.mysql.cj.jdbc.Driver";
		String URL ="jdbc:mysql://localhost:3306/product";
		String USER="root";
		String PASS="p@ssw0rd";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASS);
			
			String query="Select ifnull(max(substr(userno,10,3)),0)+1 as "
					+"MAXNO from user where "
					+"substr(USERNO,2,8)=date_format(sysdate(),'%Y%m%d')";
			
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					res=rs.getInt("MAXNO");
				}
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버오류>>"+e);
		}catch(SQLException e) {
			System.out.println("DB오류>>"+e);
		}
		String maxno=String.valueOf(res);
			
			if(maxno.length()==1) {
				maxno="00"+maxno;
			}
			else if(maxno.length()==2) {
				maxno="0"+maxno;
			}
			return maxno;
		
	}
	public static String pcommNO() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int res=0;
		
		String DRIVER="com.mysql.cj.jdbc.Driver";
		String URL ="jdbc:mysql://localhost:3306/product";
		String USER="root";
		String PASS="p@ssw0rd";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASS);
			
			String query="Select ifnull(max(substr(pno,10,3)),0)+1 as "
					+"MAXNO from product where "
					+"substr(PNO,2,8)=date_format(sysdate(),'%Y%m%d')";
			
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					res=rs.getInt("MAXNO");
				}
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버오류>>"+e);
		}catch(SQLException e) {
			System.out.println("DB오류>>"+e);
		}
		String maxno=String.valueOf(res);
			
			if(maxno.length()==1) {
				maxno="00"+maxno;
			}
			else if(maxno.length()==2) {
				maxno="0"+maxno;
			}
			return maxno;
		
	}
	public static String scommNO() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int res=0;
		
		String DRIVER="com.mysql.cj.jdbc.Driver";
		String URL ="jdbc:mysql://localhost:3306/product";
		String USER="root";
		String PASS="p@ssw0rd";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASS);
			
			String query="Select ifnull(max(substr(sno,10,3)),0)+1 as "
					+"MAXNO from supplier where "
					+"substr(SNO,2,8)=date_format(sysdate(),'%Y%m%d')";
			
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					res=rs.getInt("MAXNO");
				}
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버오류>>"+e);
		}catch(SQLException e) {
			System.out.println("DB오류>>"+e);
		}
		String maxno=String.valueOf(res);
			
			if(maxno.length()==1) {
				maxno="00"+maxno;
			}
			else if(maxno.length()==2) {
				maxno="0"+maxno;
			}
			return maxno;
		
	}
	public static String ccommNO() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int res=0;
		
		String DRIVER="com.mysql.cj.jdbc.Driver";
		String URL ="jdbc:mysql://localhost:3306/product";
		String USER="root";
		String PASS="p@ssw0rd";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASS);
			
			String query="Select ifnull(max(substr(cno,10,3)),0)+1 as "
					+"MAXNO from client where "
					+"substr(CNO,2,8)=date_format(sysdate(),'%Y%m%d')";
			
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					res=rs.getInt("MAXNO");
				}
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버오류>>"+e);
		}catch(SQLException e) {
			System.out.println("DB오류>>"+e);
		}
		String maxno=String.valueOf(res);
			
			if(maxno.length()==1) {
				maxno="00"+maxno;
			}
			else if(maxno.length()==2) {
				maxno="0"+maxno;
			}
			return maxno;
		
	}
	public static String sdcommNO() {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int res=0;
		
		String DRIVER="com.mysql.cj.jdbc.Driver";
		String URL ="jdbc:mysql://localhost:3306/product";
		String USER="root";
		String PASS="p@ssw0rd";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASS);
			
			String query="Select ifnull(max(substr(sdno,10,3)),0)+1 as "
					+"MAXNO from stockdetail where "
					+"substr(SDNO,2,8)=date_format(sysdate(),'%Y%m%d')";
			
			pstmt=conn.prepareStatement(query);
			rs=pstmt.executeQuery();
			
			if(rs!=null) {
				while(rs.next()) {
					res=rs.getInt("MAXNO");
				}
			}
		}catch(ClassNotFoundException e) {
			System.out.println("드라이버오류>>"+e);
		}catch(SQLException e) {
			System.out.println("DB오류>>"+e);
		}
		String maxno=String.valueOf(res);
			
			if(maxno.length()==1) {
				maxno="00"+maxno;
			}
			else if(maxno.length()==2) {
				maxno="0"+maxno;
			}
			return maxno;
		
	}
	
	public static String unoValue() {
		String chaebun=Chaebun.USER+Chaebun.commDate()+Chaebun.commNO();
		return chaebun;
	}
	public static String pnoValue() {
		String chaebun=Chaebun.PRODUCT+Chaebun.commDate()+Chaebun.pcommNO();
		return chaebun;
	}
	public static String snoValue() {
		String chaebun=Chaebun.SUPPLIER+Chaebun.commDate()+Chaebun.scommNO();
		return chaebun;
	}
	public static String cnoValue() {
		String chaebun=Chaebun.CLIENT+Chaebun.commDate()+Chaebun.ccommNO();
		return chaebun;
	}
	public static String sdnoValue() {
		String chaebun=Chaebun.STOCKDETAIL+Chaebun.commDate()+Chaebun.sdcommNO();
		return chaebun;
	}
	public static void main(String args[]) {
		String commDate=Chaebun.commDate();
		String commNo=Chaebun.commNO();
		System.out.println("채번>>"+commDate+commNo);
		
	}
}
