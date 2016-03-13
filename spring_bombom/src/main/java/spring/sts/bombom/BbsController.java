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

import spring.model.bbs.BbsDAO;
import spring.model.bbs.BbsDAO_Mybatis;
import spring.model.bbs.BbsDTO;
import spring.model.bbs.BbsService;
import spring.model.bbs.ReplyDAO;
import spring.model.bbs.ReplyDTO;
import spring.utility.bombom.Paging;
import spring.utility.bombom.Utility;

@Controller
public class BbsController {
/*	@Autowired
	private BbsDAO dao;Autowired DI*/
	@Autowired
	private BbsDAO_Mybatis mdao;
	
	@Autowired
	private ReplyDAO rdao;
	
	@Autowired
	private BbsService service; //추가
	
	 
	@RequestMapping("/bbs/rdelete")
	public String rdelete(int rnum,int bbsno, int nowPage,int nPage, String col, String word,Model model){ 
	 
	int total = rdao.total(bbsno);//댓글전체레코드값을 가져와서
	int totalPage = (int)(Math.ceil((double)total/3)); // 전체 페이지  
	if(rdao.delete(rnum)){
	if(nPage!=1&&nPage==totalPage&&total%3==1){//마지막페이지의 마지막레코드이면(3은 한페이지당보여줄 레코드 갯수)
	nPage=nPage-1;  //현재의 페이지값에서 1을 빼자 
	}
	model.addAttribute("bbsno", bbsno);
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	 
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	 
	@RequestMapping("/bbs/rupdate")
	public String rupdate(ReplyDTO dto,int nowPage,int nPage, String col, String word,Model model){
	if(rdao.update(dto)){
	model.addAttribute("bbsno", dto.getBbsno());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("nPage", nPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	
	@RequestMapping("/bbs/rcreate")
	public String rcreate(ReplyDTO dto,int nowPage,String col, String word,Model model){
	 
	if(rdao.create(dto)){
	model.addAttribute("bbsno", dto.getBbsno());
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("col", col);
	model.addAttribute("word", word);
	}else{
	return "error/error";
	}
	 
	return "redirect:./read";
	}
	 	
	
	@RequestMapping(value="/bbs/reply",method=RequestMethod.GET)
	public String reply(int bbsno, Model model){
		BbsDTO dto=mdao.readReply(bbsno);
		
		model.addAttribute("dto", dto);
		
		return "/bbs/reply";
	}
	
	@RequestMapping(value="/bbs/reply",method=RequestMethod.POST)
	public String reply(BbsDTO dto, HttpServletRequest request, Model model){
		mdao.addAnsnum(dto.getGrpno(), dto.getAnsnum());
		
		int cnt=mdao.reply(dto);
		
		if(cnt>0){
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			return "redirect:list";
		}else{
			return "error";
		}
	}
	
	@RequestMapping(value="/bbs/delete",method=RequestMethod.GET)
	public String delete(int bbsno, Model model){
		mdao.increaseViewcnt(bbsno);
		BbsDTO dto = mdao.read(bbsno);
		
		model.addAttribute("dto",dto);
		
		return "/bbs/delete";
	}
	
	@RequestMapping(value="/bbs/delete",method=RequestMethod.POST)
	public String delete(BbsDTO dto, HttpServletRequest request, Model model){
		
		int pcnt = mdao.checkPasswd(dto.getBbsno(), dto.getPasswd());
		String url="redirect:list";
		if(pcnt==1){
			
			try{
	             //   rdao.bdelete(bbsno);//게시판글의 댓글들 삭제
	             //   dao.delete(bbsno);//게시판글 삭제
                  service.delete(dto.getBbsno());
                  model.addAttribute("nowPage", request.getParameter("nowPage"));
                  model.addAttribute("word", request.getParameter("word"));
                  model.addAttribute("col", request.getParameter("col"));
                  url = "redirect:./list";
	            }catch(Exception e){
                 e.printStackTrace();
                 url = "./error/error";
	           }
		}
		
		
		
		return url;
	}
	
	@RequestMapping(value="/bbs/update",method=RequestMethod.GET)
	public String update(int bbsno, Model model){
		BbsDTO dto = mdao.read(bbsno);
		
		model.addAttribute("dto",dto);
		
		return "/bbs/update";
	}

	@RequestMapping(value="/bbs/update",method=RequestMethod.POST)
	public String update(BbsDTO dto, HttpServletRequest request, Model model){
		int pcnt = mdao.checkPasswd(dto.getBbsno(), dto.getPasswd());
		int cnt=0;
		String url="redirect:list";
		if(pcnt==1){
			cnt=mdao.update(dto);
			if(cnt==0){
				return "/bbs/error";
			}
		}else{
			return "/bbs/passwdError";
		}
		
		model.addAttribute("nowPage", request.getParameter("nowPage"));
		model.addAttribute("col", request.getParameter("col"));
		model.addAttribute("word", request.getParameter("word"));
		
		return url;
	}
	
	/* GET 방식으로 이런 요청URL이 왔을때 호출된다.*/
	@RequestMapping(value="/bbs/create",method=RequestMethod.GET)
	public String create(){
		return "/bbs/create";
	}
	    
	@RequestMapping(value="/bbs/create",method=RequestMethod.POST)
	public String create(BbsDTO dto, HttpServletRequest request, Model model){
		//1.모델사용
		int cnt=mdao.create(dto);

		if(cnt>0){
			model.addAttribute("nowPage", request.getParameter("nowPage"));
			model.addAttribute("col", request.getParameter("col"));
			model.addAttribute("word", request.getParameter("word"));
			return "redirect:list";
		}else{
			return "error";
		}
	}
	
	@RequestMapping("/bbs/read")
	public String read(int nowPage, String col, String word,
			int bbsno, Model model, HttpServletRequest request){
//	public String read(int bbsno, HttpServletRequest request){
		//1.model 사용
		mdao.increaseViewcnt(bbsno);
		BbsDTO dto = mdao.read(bbsno);
		String content = dto.getContent();
		dto.setContent(content.replace("\r\n", "<BR>"));
		//2.request 저장
		model.addAttribute("dto", dto);
		//request.setAttribute("dto", dto);
		/* 댓글목록 관련  시작 */
		String url = "read";/*paging 눌렀을때 요청할 url*/
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 
		Map map = new HashMap();
		map.put("sno", sno);
		map.put("eno", eno);
		map.put("bbsno", bbsno);
		 
		List<ReplyDTO> list = rdao.list(map);
		 
		int total = rdao.total(bbsno);
		 
		String paging = Utility.paging(total, nPage, recordPerPage, url,bbsno,nowPage, col,word);
		 
		model.addAttribute("rlist",list);
		model.addAttribute("paging",paging);
		model.addAttribute("nPage",nPage);
		 
		/* 댓글 관련 끝 */ 
		//3.view 리턴
		return "/bbs/read";
	}
	
	@RequestMapping("/bbs/list")
	public String list(HttpServletRequest request){
		//1.model 사용
		//검색어 추출, null --> "" 
		String col = Utility.checkNull(request.getParameter("col")); 
		String word = Utility.checkNull(request.getParameter("word")); 
		System.out.println("word: " + word);
		
		if (col.equals("total")){
		  word = "";
		}
	
		//-------------------------------------------------------------------- 
		//페이징 관련 부분 
		//-------------------------------------------------------------------- 
		int nowPage= 1; //시작 페이지 번호는 1부터 
	
		if (request.getParameter("nowPage") != null) { 
		nowPage= Integer.parseInt(request.getParameter("nowPage"));  
		} 
		int recordPerPage = 5; // 한페이지당 출력할 레코드 갯수 
		//***** db에서 가져올 순번
		int sno = ((nowPage-1) * recordPerPage) + 1;//
		int eno = nowPage * recordPerPage;//
		//***** 가져올순번 end
		
//		List<BbsDTO> list = dao.list(col,word,sno,eno);
		Map map=new HashMap();
		map.put("col",col);
		map.put("word",word);
		map.put("sno",sno);
		map.put("eno",eno);
		List<BbsDTO> list = mdao.list(map);
		  int total = mdao.total(col, word);
		  String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		//2.request 저장
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
		request.setAttribute("col", col);
		request.setAttribute("word", word);
		request.setAttribute("nowPage", nowPage);
		
		// list.jsp에서 댓글 갯수 가져올 <util:rcount(bbsno,rdao)>에서 사용할  
	    // rdao(ReplyDAO)의 값을 request 객체에 담는다.
	    request.setAttribute("rdao", rdao); 

		//3.view 페이지 리턴
		return "/bbs/list";
	}
}
