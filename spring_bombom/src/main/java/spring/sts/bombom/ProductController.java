package spring.sts.bombom;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.model.bbs.BbsDTO;
import spring.model.bbs.ReplyDTO;
import spring.model.product.ProductDAO;
import spring.model.product.ProductDAO_Mybatis;
import spring.model.product.ProductDTO;
import spring.model.product.ProductDetailDTO;
import spring.utility.bombom.Utility;
@Controller
public class ProductController {
	/*	@Autowired
	private MemberDAO dao;*/
	@Autowired
	private ProductDAO_Mybatis mdao;
	/*
	 * public String read(int nowPage, String col, String word,
			int product_no, Model model, HttpServletRequest request){
	 */
	@RequestMapping("/product/read")
	public String read(int product_no, Model model, HttpServletRequest request){
		//1.model 사용
		//mdao.increaseViewcnt(bbsno);
		ProductDTO dto = mdao.read(product_no);

		//2.request 저장
		model.addAttribute("dto", dto);
		//request.setAttribute("dto", dto);
		/* 댓글목록 관련  시작 */
/*		String url = "read";paging 눌렀을때 요청할 url
		int nPage= 1; //시작 페이지 번호는 1부터 
		 
		if (request.getParameter("nPage") != null) { 
		nPage= Integer.parseInt(request.getParameter("nPage"));  
		}
		int recordPerPage = 3; // 한페이지당 출력할 레코드 갯수
		 
		int sno = ((nPage-1) * recordPerPage) + 1; // 
		int eno = nPage * recordPerPage;
		 */
		
		Map map = new HashMap(); 
	    map.put("product_no",product_no); 
		List<ProductDetailDTO> dto_detail = mdao.read_detail(map);
		 
		//String paging = Utility.paging(total, nPage, recordPerPage, url,product_no,nowPage, col,word);
		 
		//model.addAttribute("rlist",list);
		//model.addAttribute("paging",paging);
/*		model.addAttribute("nPage",nPage);*/
		model.addAttribute("dto_detail",dto_detail);
		 
		/* 댓글 관련 끝 */ 
		//3.view 리턴
		return "/product/product_read";
	}
}

