package spring.model.board; 
 
import java.sql.Connection; 
import java.util.List; 
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.utility.bombom.DBClose;
import spring.utility.bombom.DBOpen; 
 
@Service
public class BoardMgr { 

@Autowired
private BoardDAO dao;

/** 
 * 글쓰기 
 * @param dto 
 * @return 
 */ 
public boolean create(BoardDTO dto){ 
boolean flag = false; 
Connection con=null; 
try{ 
con=DBOpen.getConnection(); 
flag = dao.create(dto, con); 
 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
 
return flag; 
} 
 
/** 
* 전체 레코드 갯수 
* @return 
*/ 
public int getTotal(Map map){ 
int total=0; 
Connection con = null; 
try{ 
con = DBOpen.getConnection();
   total = dao.getTotal(map, con); 
 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return total; 
} 
/** 
* 글 목록 
* @param searchColumn 검색컬럼 
* @param searchWord   검색어 
* @param beginPerPage 시작레코드번호 
* @param numPerPage   한페이지당보여줄 레코드 갯수(10) 
* @return 페이지에 보여줄 글의목록들 
*/ 
public List<BoardDTO> getList(Map map){ 
    
List<BoardDTO> v = null; 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
v = dao.getList(map, con); 
 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
 
return v; 
} 
 
/** 
* 조회수 증가 
* @param num 
*/ 
public void upCount(int num){ 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
dao.upCount(num, con); 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
} 
/** 
* 특정게시판 내용보기 
* @param num 
* @return 
*/ 
public BoardDTO read(int num){ 
BoardDTO dto = null; 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
dto = dao.read(num, con); 
 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return dto; 
} 
/** 
* 답변용 내용보기 
* @param num 
* @return 
*/ 
public BoardDTO readReply(int num){ 
BoardDTO dto = null; 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
dto = dao.readReply(num, con); 
 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return dto; 
} 
/** 
* 비빌번호 확인 
* @param num 
* @param passwd 
* @return 
*/ 
public boolean passwdCheck(int num, String passwd){ 
boolean flag = false; 
Connection con = null; 
try{ 
con = DBOpen.getConnection();
flag = dao.passwdCheck(num,passwd, con); 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return flag; 
} 
/** 
* 게시판 글수정 
* @param dto 
* @return 
*/ 
public boolean update(BoardDTO dto){ 
boolean flag = false; 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
flag = dao.update(dto, con); 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return flag; 
} 
/** 
* 답변처리  
* 1.부모의 또다른 답변의 순서(ansnum)를  
*   1증가 시켜줌(UPDATE) 
* 2.새로운 답변글을 인서트 함(INSERT) 
* @param dto 
* @return 
*/ 
public boolean reply(BoardDTO dto){ 
boolean flag = false; 
Connection con = null; 
try{ 
	con = DBOpen.getConnection();
	con.setAutoCommit(false); 
	//ansnum의 순서를 재정렬 
	dao.upAnsnum(dto.getRef(),dto.getAnsnum(), con); 
	//답변글을 등록(ref는부모글의 ref와 같아야하고,indent, ansnum 
	//부모글보다 1증가한 값으로 등록) 
	flag = dao.insertReply(dto, con); 
	//실제로 DB에 적용하라... 
	con.commit(); 
}catch(Exception e){ 
	System.out.print(e); 
	try{ 
		//지금까지의 문장을 취소처리하라.. 
		con.rollback(); 
	}catch(Exception ex){} 
}finally{ 
	try{ 
		con.setAutoCommit(true); 
	}catch(Exception ex){} 
	 
	DBClose.close(con); 
} 
return flag; 
} 
/** 
* 부모글인지 확인 
* @param num 
* @return 
*/ 
public boolean checkRefnum(int num){ 
boolean flag = false; 
Connection con = null; 
try{ 
con = DBOpen.getConnection();
flag = dao.checkRefnum(num,con); 
}catch(Exception e){ 
System.out.print(e); 
}finally{ 
DBClose.close(con); 
} 
return flag; 
} 
 
/** 
* 게시판 글 삭제 
* @param num 
* @return 
*/ 
public boolean delete(int num){ 
boolean flag = false; 
Connection con = null; 
try{ 
con = DBOpen.getConnection(); 
flag = dao.delete(num, con); 
 
}catch(Exception e){ 
System.out.print(e); 
 
}finally{ 
 
DBClose.close(con); 
} 
return flag; 
} 
 
} 
 