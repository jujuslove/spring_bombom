package spring.model.memo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import spring.utility.bombom.DBOpen;
import spring.utility.bombom.DBClose;
 
/**
 * db와 매우 근접하게 있으면서
 * db와 소통(sql) 한다.
 * @author soldesk
 *
 */
//@Component 엣 레퍼지터리@Repository
@Repository
public class MemoDAO {
	/**
	   * 메모를 변경합니다.
	   * @param vo 저장할 데이터가 있는 객체
	   * @return 저장된 레코드 갯수
	   */
	  public int update(MemoVO vo){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE memo");
	    sql.append(" SET title=?, content=?");
	    sql.append(" WHERE memono = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, vo.getTitle());
	      pstmt.setString(2, vo.getContent());
	      pstmt.setInt(3, vo.getMemono());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	  
	public MemoVO read(int memono){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    MemoVO vo = null;        // 하나의 글에 해당
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT memono, title, content, wdate, viewcnt");
	    sql.append(" FROM memo");
	    sql.append(" WHERE memono = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, memono);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        // int memono = rs.getInt("memono"); // 컬럼 -> 변수로 변환, DBMS -> JAVA
	        String title = rs.getString("title");
	        String content = rs.getString("content");
	        String wdate = rs.getString("wdate");
	        int viewcnt = rs.getInt("viewcnt");
	        
	        vo = new MemoVO();         // 하나의 레코드를 하나의 객체로 변환
	        vo.setMemono(memono);
	        vo.setTitle(title);
	        vo.setContent(content);
	        vo.setWdate(wdate);
	        vo.setViewcnt(viewcnt);
	      
	      }
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
	    return vo;
	  }
	 
	  public void increaseViewcnt(int memono){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    
	    sql = new StringBuffer();
	    sql.append(" UPDATE memo");
	    sql.append(" SET viewcnt = viewcnt + 1");
	    sql.append(" WHERE memono = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, memono);
	      
	      pstmt.executeUpdate();
	      
	    }catch(Exception e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	  }
	
	/**
	   * 메모를 등록합니다.
	   * @param vo 저장할 데이터가 있는 객체
	   * @return 저장된 레코드 갯수
	   */
	  public int create(MemoVO vo){
	    Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" INSERT INTO memo(memono, title, content, wdate)  ");
	    sql.append(" VALUES(memo_seq.nextval, ?, ?, sysdate)");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, vo.getTitle());
	      pstmt.setString(2, vo.getContent());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
	  }
	
  /**
   * 메모 여러개를 가져온다.
 * @param word 
 * @param col 
 * @param eno 
 * @param sno 
   * @return List<MemoVO>
   */
  public List<MemoVO> list(int sno, int eno, String col, String word){
    Connection con = DBOpen.getConnection();
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
    List<MemoVO> list = null;
    
    sql = new StringBuffer();
    sql.append(" SELECT memono, title, wdate, viewcnt, r");
    sql.append(" FROM(");
    sql.append("	SELECT memono, title, wdate, viewcnt, rownum r");
    sql.append("	FROM(");
    sql.append("		SELECT memono, title, wdate, viewcnt ");
    sql.append("		FROM memo                      ");
    
	   if(word.trim().length()>0) 
		   sql.append(" WHERE "+col+" Like '%'|| ? ||'%' ");
	   
    sql.append("		ORDER BY memono DESC             ");
    sql.append("	)");
    sql.append(" )WHERE r>=? and r<=?");
   
    try{
      int i =0;
      pstmt = con.prepareStatement(sql.toString());
	  if(word.trim().length()>0) 
		  pstmt.setString(++i, word);
	  
	  pstmt.setInt(++i, sno);
	  pstmt.setInt(++i, eno);
	  
      rs = pstmt.executeQuery();
      list = new ArrayList<MemoVO>();
      
      while(rs.next() == true){
        int memono = rs.getInt("memono"); // 컬럼 -> 변수로 변환, DBMS -> JAVA
        String title = rs.getString("title");
        String wdate = rs.getString("wdate");
        int viewcnt = rs.getInt("viewcnt");
        
        MemoVO vo = new MemoVO();         // 하나의 레코드를 하나의 객체로 변환
        vo.setMemono(memono);
        vo.setTitle(title);
        vo.setWdate(wdate);
        vo.setViewcnt(viewcnt);
      
        list.add(vo);                     // 저장소에 하나의 객체를 저장
        
      }
    }catch(Exception e){
       System.out.println(e);
    }finally{

       DBClose.close(con, pstmt, rs);

   }
    
    return list;
  }

public int total(String col, String word) {
	
	 int total=0;
     Connection con=null;
     PreparedStatement pstmt=null;
     ResultSet rs = null;
     StringBuffer sql = new StringBuffer();
     sql.append(" SELECT count(*) FROM memo ");
     
     if(word.trim().length()>0)
      sql.append(" WHERE "+col+" Like '%'|| ? ||'%'");
     
     try {
         con = DBOpen.getConnection();
         pstmt = con.prepareStatement(sql.toString());
         
         if(word.trim().length()>0)  
            pstmt.setString(1, word);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()){
           total = rs.getInt(1);
         }
         
     } catch (Exception e) {
         e.printStackTrace();
     } finally{
         DBClose.close(con, pstmt, rs);
     }
     
     
     return total;
	
}

public int delete(int memono) {
	 Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" DELETE FROM memo ");
	    sql.append(" WHERE memono = ? ");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, memono);
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(Exception e){
	      System.out.println(e.toString());
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
}
  
}