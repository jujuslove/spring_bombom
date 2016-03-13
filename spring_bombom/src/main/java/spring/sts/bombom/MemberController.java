package spring.sts.bombom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import spring.model.member.ZipcodeDTO;
import spring.utility.bombom.Paging;
import spring.utility.bombom.Utility;

import spring.model.member.MemberDAO;
import spring.model.member.MemberDAO_Mybatis;
import spring.model.member.MemberDTO;

@Controller
public class MemberController {
/*	@Autowired
	private MemberDAO dao;*/
	@Autowired
	private MemberDAO_Mybatis mdao;
	
	@RequestMapping(value="/member/delete",method=RequestMethod.GET)
	public String delete(){
		
		return "/member/delete";
	}
	
	@RequestMapping(value="/member/delete",method=RequestMethod.POST)
	public String delete(String id, String oldfile, HttpSession session
			,Model model){
		
		if(id==null){
			id = (String)session.getAttribute("id");
		}
		if(oldfile==null){
			oldfile = mdao.getFname(id);
		}
		
		model.addAttribute("id", id);
		model.addAttribute("oldfile", oldfile);
		
		return "/member/delete";
	}
	
	@RequestMapping(value="/member/updatePasswd",method=RequestMethod.GET)
	public String updatePasswd(){
		
		return "/member/updatePasswd";
	}
	
	@RequestMapping(value="/member/updatePasswd",method=RequestMethod.POST)
	public String updatePasswd(HttpServletRequest request){
		
		//1.model 사용
		String id = request.getParameter("id"); 
		String passwd = request.getParameter("passwd"); 
		 
		int cnt= mdao.updatePasswd(id, passwd); 

		if(cnt==1){ 
	        return "redirect:/"; 
	    }else{ 
	        return "/member/error"; 
	    }
	}

	@RequestMapping(value="/member/updateFile",method=RequestMethod.GET)
	public String updateFile(){	 
		
	    return "/member/updateFile";
	}
	
	@RequestMapping(value="/member/updateFile",method=RequestMethod.POST)
	public String updateFile(String id, String oldfile, MultipartFile fnameMF, HttpServletRequest request){	 
		
		String basePath =request.getRealPath("/storage"); 
		String fname = null;
	    //업로드 처리  
	    int size=(int) fnameMF.getSize();
		if(size>0){//변경할 사진이 업로드 됨
			fname = Utility.saveFileSpring30(fnameMF, basePath); 
		}	
		System.out.println("updateFile : before :: fname :"+fname);
		int cnt=mdao.updateFile(id, fname);
		System.out.println("updateFile : after :: cnt :"+cnt);
		
		if(cnt==1 && oldfile!=null && !oldfile.equals("member.jpg")){
		   Utility.deleteFile(basePath,oldfile);//웹서버에 존재하는 변경전 파일 삭제
		}

	    if(cnt==1){ 
	        return "redirect:/"; 
	    }else{ 
	        return "/member/error"; 
	    }
	}
	
	@RequestMapping("/member/logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value="/member/update",method=RequestMethod.GET)
	public String update(String id, HttpSession session, Model model){	 

	    if(id==null){
	        id = (String)session.getAttribute("id");
	    }

	    MemberDTO dto = mdao.read(id);	    
	    model.addAttribute("dto", dto);

	    return "/member/update";
	}
	
	@RequestMapping(value="/member/update",method=RequestMethod.POST)
	public String update(MemberDTO dto, HttpServletRequest request, Model model){	 
		
		int cnt = mdao.update(dto);

	    if(cnt==1){
	    	return "redirect:/";
	    }else{
	    	return "/member/error";
	    }
	}
	
	@RequestMapping("/member/read")
	public String read(String id, HttpSession session, Model model){	 

	    if(id==null){
	        id = (String)session.getAttribute("id");
	    }
	    
	    MemberDTO dto = mdao.read(id);	    
	    model.addAttribute("dto", dto);

	    return "/member/read";
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String login(HttpServletRequest request, 
			@RequestParam(value="bbsno",defaultValue="0")int bbsno,
			@RequestParam(value="nowPage",defaultValue="0")int nowPage, 
			@RequestParam(value="nPage",defaultValue="0")int nPage){
		
		/*----쿠키설정 내용시작----------------------------*/
		String c_id = "";     // ID 저장 여부를 저장하는 변수, Y
		String c_id_val = ""; // ID 값
		 
		Cookie[] cookies = request.getCookies(); 
		Cookie cookie=null; 
		 
		if (cookies != null){ 
		 for (int i = 0; i < cookies.length; i++) { 
		   cookie = cookies[i]; 
		 
		   if (cookie.getName().equals("c_id")){ 
		     c_id = cookie.getValue();     // Y 
		   }else if(cookie.getName().equals("c_id_val")){ 
		     c_id_val = cookie.getValue(); // user1... 
		   } 
		 } 
		} 
	  /*----쿠키설정 내용 끝----------------------------*/
		
		request.setAttribute("c_id", c_id);
		request.setAttribute("c_id_val", c_id_val);
		
		request.setAttribute("nowPage", nowPage);
		request.setAttribute("nPage", nPage);
		request.setAttribute("bbsno", bbsno);
		
		return "/member/login";
	}
	
	@RequestMapping(value="/member/login",method=RequestMethod.POST)
	public String login(String id, String passwd, String c_id, 
	int bbsno,int nowPage,int nPage,String col,String word,String flag,
	HttpServletResponse response, HttpSession session, Model model){
		
		int cnt = mdao.loginCheck(id, passwd);
		String grade = null;
		if(cnt==1){
		grade = mdao.getGrade(id);
		//쿠키에 id저장
		   if(c_id!=null){
		       Cookie cookie = new Cookie("c_id","Y");
		       cookie.setMaxAge(120);
		       response.addCookie(cookie);
		       
		       cookie = new Cookie("c_id_val",id);
		       cookie.setMaxAge(120);
		       response.addCookie(cookie);
		       
		   }else{
		       Cookie cookie = new Cookie("c_id","");
		       cookie.setMaxAge(0);
		       response.addCookie(cookie);
		       
		       cookie = new Cookie("c_id_val","");
		       cookie.setMaxAge(0);
		       response.addCookie(cookie);
		       
		   }
		   
		   session.setAttribute("id", id);
		   session.setAttribute("grade", grade);
		   
		}
		 
		String url = "./error/passwdError";
		if(cnt==1){
		url = "redirect:/";
		if(flag!=""){
		model.addAttribute("bbsno", bbsno);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("nPage", nPage);
		model.addAttribute("col", col);
		model.addAttribute("word", word);
		url = "redirect:"+flag;
		}
		}
		 
		return url;

	}
	
	@RequestMapping("/admin/list")
	public String list(MemberDTO dto, HttpServletRequest request, Model model){
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
	 
	    Map map = new HashMap(); 
	    map.put("col",col); 
	    map.put("word",word); 
	    map.put("sno",sno); 
	    map.put("eno",eno); 
	    //1. model사용 
	    List list = mdao.list(map);
	    int total = mdao.total(map);
	 
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
		
		return "/member/list";
	}
	
	@RequestMapping("/member/create")
	public String create(MemberDTO dto, HttpServletRequest request){
		String basePath = request.getRealPath("/storage");
		String fname = null;
		int size = (int)dto.getFnameMF().getSize();
			
		if(size>0){
		    fname = Utility.saveFileSpring30(dto.getFnameMF(), basePath);
		
		}else{
			fname = "member.jpg";
		}
		
		dto.setFname(fname);
		
		int cnt = mdao.create(dto);
		
		if(cnt==1){
			return "redirect:/";
		}else{
			return "/member/error";
		}
	}
	
	@RequestMapping("/member/createForm")
	public String createForm(){
		
		return "/member/create";
	}
	
	@RequestMapping("/member/agree")
	public String agreement(){
		//web-inf안에있으면 직접 jsp파일을 요청할수없다.top..header에 있음.
		
		return "/member/agree";
	}
	
	/*zip 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/zipForm")
	public String zipForm(){
		
		return "/popup/zip_form";
	}
	
	/*zip 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/zipCheck")
	public String zipCheck(String dongli, Model model){
		
		List<ZipcodeDTO> list = mdao.zipcodeList(dongli);
		
		model.addAttribute("list", list);
		
		return "/popup/zip_proc";
	}

	/*email 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/emailForm")
	public String emailForm(){
		
		return "/popup/email_form";
	}
	
	/*email 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/emailCheck")/*get,post 다 받는다.*/
	public String emailCheck(String email, Model model){
		
		int cnt=mdao.duplicateEmail(email);
		
		model.addAttribute("cnt", cnt);
		
		return "/popup/email_proc";
	}
	
	/*id 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/idForm")
	public String idForm(){
		
		return "/popup/id_form";
	}
	
	/*id 새창에서 보여지므로 tiles에 선언하지않아도 된다.*/
	@RequestMapping("/member/idCheck")/*get,post 다 받는다.*/
	public String idCheck(String id, Model model){
		
		int cnt=mdao.duplicateId(id);
		
		model.addAttribute("cnt", cnt);
		
		return "/popup/id_proc";
	}
}
