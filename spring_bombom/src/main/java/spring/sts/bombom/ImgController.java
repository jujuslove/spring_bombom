package spring.sts.bombom;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import spring.model.img.ImgDAO;
import spring.model.img.ImgDTO;
import spring.utility.bombom.Paging;
import spring.utility.bombom.Utility;

@Controller
public class ImgController {
	@Autowired
	private ImgDAO dao;
	
	@RequestMapping(value="/img/reply",method=RequestMethod.GET)
	public String reply(int imgno, Model model){
		
		ImgDTO dto=dao.read(imgno);
		model.addAttribute("dto", dto);
		
		return "/img/reply";
	}
	
	@RequestMapping(value="/img/reply",method=RequestMethod.POST)
	public String reply(int imgno, String passwd, HttpServletRequest request, Model model){
		
		
			String nowPage=request.getParameter("nowPage");
			String basePath =request.getRealPath("/storage"); 
			String fname = null;
			ImgDTO dto=dao.read(imgno);
			int cnt=dao.delete(imgno);
			
			if(cnt==1){
				Utility.deleteFile(basePath, dto.getFilename());
				model.addAttribute("nowPage", nowPage);
				return "redirect:list";
			}else{
				return "/img/error";
			}
	}
	
	@RequestMapping(value="/img/delete",method=RequestMethod.GET)
	public String delete(int imgno, Model model){
		
		ImgDTO dto=dao.read(imgno);
		model.addAttribute("dto", dto);
		
		return "/img/delete";
	}
	
	@RequestMapping(value="/img/delete",method=RequestMethod.POST)
	public String delete(int imgno, String passwd, HttpServletRequest request, Model model){
		int pcnt=dao.passwdCheck(imgno, passwd);
		if(pcnt==1){
			String nowPage=request.getParameter("nowPage");
			String basePath =request.getRealPath("/storage"); 
			String fname = null;
			ImgDTO dto=dao.read(imgno);
			int cnt=dao.delete(imgno);
			
			if(cnt==1){
				Utility.deleteFile(basePath, dto.getFilename());
				model.addAttribute("nowPage", nowPage);
				return "redirect:list";
			}else{
				return "/img/error";
			}
		}else{
			return "/img/passwdError";
		}
	}
	
	@RequestMapping(value="/img/update",method=RequestMethod.GET)
	public String update(int imgno, Model model){
		
		ImgDTO dto=dao.read(imgno);
		model.addAttribute("dto", dto);
		
		return "/img/update";
	}
	
	@RequestMapping(value="/img/update",method=RequestMethod.POST)
	public String update(ImgDTO dto, HttpServletRequest request, Model model){
		
		int pcnt=dao.passwdCheck(dto.getImgno(), dto.getPasswd());
		if(pcnt==1){
			String basePath =request.getRealPath("/storage"); 
			String fname = null;
			String oldfile=request.getParameter("oldfile");
		    //업로드 처리  
		    int size=(int)dto.getFilenameMF().getSize();
			if(size>0){//변경할 사진이 업로드 됨
				fname = Utility.saveFileSpring30(dto.getFilenameMF(), basePath); 
				dto.setFilename(fname);
			}else{
				dto.setFilename(oldfile);
			}
			
			int cnt=dao.update(dto);
			
			if(cnt==1 && oldfile!=null && !oldfile.equals("member.jpg")){
			   Utility.deleteFile(basePath,oldfile);//웹서버에 존재하는 변경전 파일 삭제
			   model.addAttribute("imgno", dto.getImgno());
			}
			
			if(cnt==1){
				return "redirect:list";
			}else{
				return "/img/error";
			}
		}else{
			return "/img/passwdError";
		}
		
	}
	
	@RequestMapping(value="/img/create",method=RequestMethod.GET)
	public String create(){
		
		return "/img/create";
	}
	
	@RequestMapping(value="/img/create",method=RequestMethod.POST)
	public String create(ImgDTO dto, HttpServletRequest request){
		System.out.println("img :: create");
		String basePath=request.getRealPath("/storage");
		String fname=null;
		int filesize=(int)dto.getFilenameMF().getSize();
		
		if(filesize>0){
			fname=Utility.saveFileSpring30(dto.getFilenameMF(), basePath);
		}
		dto.setFilename(fname);
		
		int cnt=dao.create(dto);
		
		if(cnt==1){
			return "redirect:list";/*redirect는 갱신을 해줌..server에게 재요청함 포워드는 갱신을 안함*/
		}else{
			return "/img/error";
		}
	}
	
	@RequestMapping("/img/read")
	public String read(int imgno, HttpServletRequest request){		
		dao.addViewcnt(imgno);

		ImgDTO dto = dao.read(imgno);
		
		String content = dto.getContent();
		content = content.replaceAll("\r\n", "<BR>"); 
		dto.setContent(content);
		
		List list = dao.getImgList(imgno);
		
		request.setAttribute("dto", dto);
		request.setAttribute("list", list);
		
		return "/img/read";
	}
	
	@RequestMapping("/img/list")
	public String list(HttpServletRequest request){
		String col = Utility.checkNull(request.getParameter("col"));
		String word = Utility.checkNull(request.getParameter("word"));
	 
		if(col.equals("total"))word="";
	   
	   //paging 관련
	    int nowPage =1; //현재페이지
	    int recordPerPage = 5; //한페이지당 보여줄 레코드 갯수
	    if(Utility.checkNull(request.getParameter("nowPage"))!=""){
	  	  nowPage = Integer.parseInt(request.getParameter("nowPage"));
	    }
	   
	    int sno = ((nowPage -1) * recordPerPage) +1;    
	    int eno =  nowPage * recordPerPage;
	
	    int total = dao.total(col, word);
	    List<ImgDTO> list = dao.list(col, word, sno, eno);
	   
	    String paging = new Paging().paging3(total, nowPage, recordPerPage, col, word);
		   		
	    request.setAttribute("list", list);
	    request.setAttribute("paging", paging);
	    request.setAttribute("col", col);
	    request.setAttribute("word", word);
		return "/img/list";
	}
	
}
