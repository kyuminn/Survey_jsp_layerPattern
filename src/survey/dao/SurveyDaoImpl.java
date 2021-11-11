package survey.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import survey.common.ConnectionPool;
import survey.vo.SurveyVo;

public class SurveyDaoImpl implements SurveyDao {
	
	private ConnectionPool connectionPool;
	
	public SurveyDaoImpl() {
		connectionPool = ConnectionPool.getInstance();
	}

	@Override
	public boolean vote(String country) {
		String sql="update survey set count=count+1 where country=?";
		int result=-1;
		try(Connection conn= connectionPool.getConnection();
			PreparedStatement pstmt= conn.prepareStatement(sql)	){
				pstmt.setString(1, country);
				result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result==1?true:false;
	}

	@Override
	public List<SurveyVo> selectAll() {
		String sql="select country,count from survey";
		List<SurveyVo> ls = new ArrayList<SurveyVo>();
		try(Connection conn= connectionPool.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			while(rs.next()) {
				SurveyVo vo = new SurveyVo();
				vo.setCountry(rs.getString(1));
				vo.setCount(rs.getInt(2));
				ls.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public void initializeNewItem(String country) {
		String sql="insert into survey values (survey_seq.nextval,?,1)";
		int result=-1;
		try(Connection conn= connectionPool.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);){
			pstmt.setString(1, country);
			result= pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<String> selectCountry() {
		String sql="select country from survey";
		List<String> ls = new ArrayList<String>();
		try(Connection conn= connectionPool.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();){
			while(rs.next()) {
				ls.add(rs.getString(1));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}

	@Override
	public void revoke(String country) {
		String sql="update survey set count=count-1 where country=? ";
		int result=-1;
		try(Connection conn= connectionPool.getConnection();
				PreparedStatement pstmt= conn.prepareStatement(sql);){
			pstmt.setString(1, country);
			result= pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	

}
