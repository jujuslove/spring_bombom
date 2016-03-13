package spring.model.img;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import spring.utility.bombom.DBClose;
import spring.utility.bombom.DBOpen;

@Component
public class ImgDAO {
	
	public List getImgList(int imgno) {
		List v = new ArrayList();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();

		sql.append(" SELECT * FROM ");
		sql.append(" ( ");
		sql.append("    select imgno, filename,  ");
		sql.append("            lag(imgno,2)     over (order by imgno) pre_imgno2,     "); //이전
		sql.append("            lag(filename,2)  over (order by imgno) pre_file2,      "); 
		sql.append("            lag(imgno,1)     over (order by imgno ) pre_imgno1,     ");//이전전
		sql.append("            lag(filename,1)  over (order by imgno ) pre_file1,     "); 
		sql.append("            lead(imgno,1)    over (order by imgno) nex_imgno1,     "); //다음
		sql.append("            lead(filename,1) over (order by imgno) nex_file1,   ");  
		sql.append("            lead(imgno,2)    over (order by imgno) nex_imgno2,     "); //다음다음
		sql.append("            lead(filename,2) over (order by imgno) nex_file2    "); 
		sql.append("            from ( ");
		sql.append("                  SELECT imgno, filename  ");
		sql.append("                  FROM img");
		sql.append("                  ORDER BY imgno DESC ");
		sql.append("             ) ");
		sql.append("    ) ");
		sql.append(" WHERE imgno = ? ");

		 
		try {
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, imgno);

		rs = pstmt.executeQuery();
		if(rs.next()){
			String[] filename = { rs.getString("pre_file2"),rs.getString("pre_file1"),
			              rs.getString("filename"),rs.getString("nex_file1"),rs.getString("nex_file2")};
			int[] numArr = {rs.getInt("pre_imgno2"),rs.getInt("pre_imgno1"),rs.getInt("imgno"),rs.getInt("nex_imgno1"),rs.getInt("nex_imgno2")};
			v.add(filename);
			v.add(numArr);
			}
		} catch (Exception e) {
		e.printStackTrace();
		} finally{

		DBClose.close(con, pstmt, rs);
		}


		return v;
		}
	
	
	/**
	 * 한건의 이미지와 관련있는 이미지 5개가져오기
	 * @param imgno
	 * @return
	 */
	public ImgDTO read(int imgno){
		ImgDTO dto = null;
		Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    
	    sql = new StringBuffer();
	    sql.append(" SELECT imgno, wname, title, content, viewcnt, wdate,filename");
	    sql.append(" FROM img");
	    sql.append(" WHERE imgno = ?");
	   
	    try{
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, imgno);
	      
	      rs = pstmt.executeQuery();
	      
	      if(rs.next() == true){
	        String title = rs.getString("title");
	        String content = rs.getString("content");
	        String wname = rs.getString("wname");
	        int viewcnt = rs.getInt("viewcnt");
	        String wdate = rs.getString("wdate");
	        String filename = rs.getString("filename");
	        
	        dto = new ImgDTO();         // 하나의 레코드를 하나의 객체로 변환
	        dto.setImgno(imgno);
	        dto.setWname(wname);
	        dto.setTitle(title);
	        dto.setContent(content);
	        dto.setViewcnt(viewcnt);
	        dto.setWdate(wdate);
	        dto.setFilename(filename);

	      }
	    }catch(SQLException e){
	      e.printStackTrace();
	    }finally{
	      DBClose.close(con, pstmt, rs);
	    }
	    
		return dto;
	}	

	/**
	 * 이미지 생성
	 * @param dto
	 * @return
	 */
	public int create(ImgDTO dto){
		
	 	Connection con = null;
	    PreparedStatement pstmt = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    sql = new StringBuffer();
	    sql.append(" INSERT INTO img(imgno, wname, title, content, passwd, wdate, grpno, filename)");
	    sql.append(" VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), ?, ?, ?, ?, sysdate, ");
	    sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM img),?)");
	    
	    try{
	      con = DBOpen.getConnection();
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setString(1, dto.getWname());
	      pstmt.setString(2, dto.getTitle());
	      pstmt.setString(3, dto.getContent());
	      pstmt.setString(4, dto.getPasswd());
	      pstmt.setString(5, dto.getFilename());
	      
	      cnt = pstmt.executeUpdate(); // 0 or 1
	    }catch(SQLException e){
	      e.getStackTrace();
	    }finally{
	      DBClose.close(con, pstmt);
	    }
	    
	    return cnt;
}
	
	/**
	 * 이미지게시물 수정
	 * 
	 */
	public int update(ImgDTO dto){
		Connection con = DBOpen.getConnection();
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
	    int cnt = 0;             // return 할 레코드 갯수
	    
	    System.out.println("img :: update");
	    System.out.println("img :: dto.getWname() :: "+dto.getWname());
	    System.out.println("img :: dto.getTitle() :: "+dto.getTitle());
	    System.out.println("img :: dto.getContent() :: "+dto.getContent());
	    System.out.println("img :: dto.getFilename() :: "+dto.getFilename());
	    System.out.println("img :: dto.getImgno() :: "+dto.getImgno());
	    sql = new StringBuffer();
	    sql.append(" UPDATE img");
	    sql.append(" SET wname=?, title=?, content=?, filename=?");
	    sql.append(" WHERE imgno = ?");
		
	    System.out.println("sql :: "+sql);
		
	    try{
		      pstmt = con.prepareStatement(sql.toString());
		      pstmt.setString(1, dto.getWname());
		      pstmt.setString(2, dto.getTitle());
		      pstmt.setString(3, dto.getContent());
		      pstmt.setString(4, dto.getFilename());
		      pstmt.setInt(5, dto.getImgno());
		      
		      cnt = pstmt.executeUpdate(); // 0 or 1
		    }catch(SQLException e){
		      System.out.println(e.toString());
		    }finally{
		      DBClose.close(con, pstmt);
		    }
	    System.out.println("img :: cnt :: "+cnt);
		    return cnt;
		  }

	
	public int delete(int imgno){
	    Connection con = DBOpen.getConnection(); 
	    PreparedStatement pstmt = null; 
	    StringBuffer sql = new StringBuffer(); 
	    int cnt = 0; 
	     
	    try{
	      sql.append(" DELETE FROM img");  
	      sql.append(" WHERE imgno=?"); 
	      
	      pstmt = con.prepareStatement(sql.toString());
	      pstmt.setInt(1, imgno);
	      
	      cnt = pstmt.executeUpdate(); 
	       
	    }catch(SQLException e){ 
	      e.getStackTrace(); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	    return cnt; 
	  } 
	
	
	/**
	 * 이미지 게시물 목록 가져오기
	 * @param map - col, word, sno, eno
	 * @return
	 */
	public List<ImgDTO> list(String col, String word, int sno, int eno){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ImgDTO> list = null;
		StringBuffer sql = null;
				
	      sql = new StringBuffer();
	      sql.append(" SELECT imgno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, filename, r ");
	      sql.append(" FROM( ");
	      sql.append("       SELECT imgno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, filename, rownum as r  ");
	      sql.append("       FROM( ");
	      sql.append("              SELECT imgno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, filename  ");
	      sql.append("              FROM img ");
	      
	      if(word.trim().length()>0){
	                  sql.append("  WHERE "+col+" LIKE '%' || ? || '%' ");     
	      }
	      
	      sql.append("             ORDER BY grpno DESC, ansnum ASC");
	      sql.append("      )");
	      sql.append(" )where r >= ? and r <=?");
	      
	      
	      sql.append(" ORDER BY grpno DESC, ansnum ASC");
	      
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			int i=0;
			
			if(word.trim().length()>0){
				pstmt.setString(++i, word);
			}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);
			
			rs = pstmt.executeQuery();
			
			list = new ArrayList<ImgDTO>();

			while(rs.next()){
				ImgDTO dto = new ImgDTO();
				
				dto.setImgno(rs.getInt("imgno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));
				dto.setFilename(rs.getString("filename"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			DBClose.close(con, pstmt, rs);
		}
		System.out.println("list : " + list.size());
		return list;
	}
	
	/**
	 * 레코드갯수 가져오기
	 * @param map - col, word
	 * @return
	 */
	public int total(String col, String word){
	       int total=0;
	       Connection con=null;
	       PreparedStatement pstmt=null;
	       ResultSet rs = null;
	       StringBuffer sql = new StringBuffer();
	       sql.append(" SELECT count(*) FROM img ");
	       
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

	
	/**
	 * 패스워드 검증
	 * @param imgno
	 * @param passwd
	 * @return
	 */
	public int passwdCheck(int imgno, String passwd){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		int cnt = 0; // 레코드 갯수

		sql = new StringBuffer();
		sql.append(" SELECT COUNT(imgno) as cnt");
		sql.append(" FROM img");
		sql.append(" WHERE imgno= ? AND passwd= ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();

			if (rs.next() == true) {
				cnt = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt, rs);
		}

		return cnt;
	}
	
	/**
	 * 답변쓰기에서 부모의 정보 가져오기
	 * @param imgno
	 * @return ImgDTO - imgno, grpno, indent, ansnum, title
	 */
	public ImgDTO readReply(int imgno){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		ImgDTO dto = null;
		
		sql = new StringBuffer();
		   sql.append(" SELECT imgno, title, grpno, indent, ansnum ");
		   sql.append(" FROM img");
		   sql.append(" WHERE imgno = ?");
		  
		   try{
		     pstmt = con.prepareStatement(sql.toString());
		     pstmt.setInt(1, imgno);
		     
		     rs = pstmt.executeQuery();
		     
		     if(rs.next() == true){
		       String title = rs.getString("title"); 
		       int grpno = rs.getInt("grpno");
		       int indent = rs.getInt("indent");
		       int ansnum = rs.getInt("ansnum");
	
		       
		       dto = new ImgDTO();         // 하나의 레코드를 하나의 객체로 변환
		       dto.setImgno(imgno);
		       dto.setTitle(title);
		       dto.setGrpno(grpno);
		       dto.setIndent(indent);
		       dto.setAnsnum(ansnum);
	
		     
		     }
		   }catch(SQLException e){
		     e.printStackTrace();
		   }finally{
		     DBClose.close(con, pstmt, rs);
		   }
		return dto;
	}
	
	/**
	 * 답변쓰기에서 답변순서 정하기
	 * @param prgno
	 * @param ansnum
	 */
	public void addAnsnum(int grpno, int ansnum){
	 	Connection con = DBOpen.getConnection();  // DBMS 연결 
	    PreparedStatement pstmt = null; 
	     
	    try{ 
	      StringBuffer sql = new StringBuffer(); 
	      sql.append(" UPDATE img"); 
	      sql.append(" SET ansnum = ansnum + 1"); 
	      sql.append(" WHERE grpno=? AND ansnum > ?"); 

	      pstmt = con.prepareStatement(sql.toString()); 
	      pstmt.setInt(1, grpno); 
	      pstmt.setInt(2, ansnum); 

	      pstmt.executeUpdate(); 
	    }catch(SQLException e){ 
	      e.getStackTrace(); 
	    }finally{ 
	      DBClose.close(con, pstmt); 
	    } 
	}
	
	/**
	 * 답변쓰기
	 * @param dto
	 * @return
	 */
	public int reply(ImgDTO dto){
		Connection con = DBOpen.getConnection(); // DBMS 연결 
	    PreparedStatement pstmt = null; 
		int cnt = 0;
		try { 
		      StringBuffer sql = new StringBuffer(); 
		      sql.append(" INSERT INTO img(imgno, wname, title, content, passwd, viewcnt, wdate, grpno, indent, ansnum, filename)"); 
		      sql.append(" VALUES((SELECT NVL(MAX(imgno), 0) + 1 as imgno FROM img), ?, ?, ?, ?, 0, sysdate, ?, ?, ?, ?)"); 

		      pstmt = con.prepareStatement(sql.toString()); 
		      pstmt.setString(1, dto.getWname()); 
		      pstmt.setString(2, dto.getTitle()); 
		      pstmt.setString(3, dto.getContent()); 
		      pstmt.setString(4, dto.getPasswd()); 
		      pstmt.setInt(5, dto.getGrpno()); // 부모의그룹번호 
		      pstmt.setInt(6, dto.getIndent()+1); 
		      pstmt.setInt(7, dto.getAnsnum()+1); 
		      pstmt.setString(8, dto.getFilename()); 

		      cnt = pstmt.executeUpdate(); 
		    } catch (Exception e) { 
		      e.getStackTrace(); 
		    } finally { 
		      DBClose.close(con, pstmt); 
		    } 
		
		return cnt;
	}
	
	
	/**
	 * 조회수 증가(viewcnt 에 1증가)
	 * @param imgno
	 */
	public void addViewcnt(int imgno){
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.

		sql = new StringBuffer();
		sql.append(" UPDATE img");
		sql.append(" SET viewcnt = viewcnt + 1");
		sql.append(" WHERE imgno = ?");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, imgno);

			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBClose.close(con, pstmt);
		}

	}


	public int checkPasswd(int imgno, String passwd) {
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = null; // String 보다 처리 속도가 수만배 빠름.
		int cnt = 0;             // 레코드 갯수
		
		sql = new StringBuffer();
		sql.append(" SELECT COUNT(imgno) as cnt");
		sql.append(" FROM img");
		sql.append(" WHERE imgno=? AND passwd=?");
		
		try{
		  pstmt = con.prepareStatement(sql.toString());
		  pstmt.setInt(1, imgno);
		  pstmt.setString(2, passwd);
		  
		  rs = pstmt.executeQuery();
		  
		  if(rs.next() == true){
		    cnt = rs.getInt(1);
		  }
		}catch(SQLException e){
		  e.printStackTrace();
		}finally{
		  DBClose.close(con, pstmt, rs);
		}
		
		return cnt;
	}
	
}
