package spring.model.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
 
@Service 
public class BbsService {
       @Autowired
       // private BbsDAO dao; 
          private BbsDAO_Mybatis dao;
       @Autowired
        private ReplyDAO rdao;
 
      public void delete(int bbsno) throws Exception{
 
             rdao.bdelete(bbsno);/** 하나의 글의 댓글들 삭제 */
             dao.delete(bbsno);
      }
}
