package spring.sts.bombom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.memo.MemoDAO;
import spring.model.memo.MemoVO;
import spring.utility.bombom.Paging;

@Controller
public class MemoController {
	@Autowired
	private MemoDAO dao;
	
	/* GET 방식으로 이런 요청URL이 왔을때 호출된다.*/
	@RequestMapping(value="/memo/create",method=RequestMethod.GET)
	public String create(){
		return "/memo/create";
	}
	    
	@RequestMapping(value="/memo/create",method=RequestMethod.POST)
	public String create(MemoVO dto, HttpServletRequest request, Model model){
		//1.모델사용
		int cnt=dao.create(dto);

		if(cnt>0){
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			return "redirect:list";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("/memo/list")
	public String list(MemoVO dto, HttpServletRequest request, Model model){
		//page관련 변수 
	    int nowPage = 1;   //현재페이지 , 페이지 시작 번호 0 ->1page  
	    int numPerPage =5;  //페이지당 레코드 수 5
	    int recNo=1;          //게시판 목록에 출력될 글 번호  
	 
	    //검색관련 변수 
	    String col = ""; 
	    if(request.getParameter("col")!=null){ //검색컬럼(이름,제목,내용,제목+내용) 
	        col = request.getParameter("col"); 
	        System.out.println("검색컬럼:"+col); 
	    } 
	 
	    String word = ""; 
	    if(request.getParameter("word")!=null){ 
	        word = request.getParameter("word");  
	        System.out.println("검색어:"+word); 
	    } 
	    
	    if(col!=null && col.equals("total")){
	    	word = "";
	    }
	    //검색관련 변수 끝 
	 
	    //현재 페이지의 정보를 가져옵니다. 
	    if(request.getParameter("nowPage")!=null){ 
	        nowPage = Integer.parseInt(request.getParameter("nowPage")); 
	    } 
	 
	    int sno = ((nowPage-1) * numPerPage) + 1; // (0 * 10) + 1 = 1, 11, 21 
	    int eno = nowPage * numPerPage;  
	 
/*	    Map map = new HashMap(); 
	    map.put("col",col); 
	    map.put("word",word); 
	    map.put("sno",sno); 
	    map.put("eno",eno);*/ 
	    //1. model사용 
	    List list = dao.list(sno, eno, col, word);
	    int total = dao.total(col, word);
	 
	    String paging = new Paging().paging3(total, nowPage, numPerPage, col, word);
	 
	    recNo = total - (nowPage-1) * numPerPage; 
	 
	    //2. model사용후 결과값을 request영역에 저장 
	    request.setAttribute("list", list); 
	    request.setAttribute("paging", paging); 
	    request.setAttribute("recNo", recNo+1); 
	    request.setAttribute("nowPage",nowPage); 
	    request.setAttribute("col", col); 
	    request.setAttribute("word", word); 
	    //3. 결과값을 보여줄 view리턴 
		
		return "/memo/list";
	}
}
