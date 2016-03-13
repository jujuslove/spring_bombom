package spring.model.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ResultHandler;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

//@Component
@Repository
public class MemberDAO_Mybatis {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int total(Map map) {
		return sqlSessionTemplate.selectOne("member.total", map);
	}

	public List<MemberDTO> list(Map map) {
		return sqlSessionTemplate.selectList("member.list", map);
	}

	public MemberDTO read(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.read", id);
	}
	
	public List<ZipcodeDTO> zipcodeList(String dongli) {
		return sqlSessionTemplate.selectList("member.zipcode", dongli);
	}
	
	public int duplicateId(String id) {
		return sqlSessionTemplate.selectOne("member.checkId", id);
	}


	public int duplicateEmail(String email) {
		return sqlSessionTemplate.selectOne("member.checkEmail", email);
	}
	
	public int create(MemberDTO dto) {
		return sqlSessionTemplate.update("member.create", dto);
	}

	public int delete(String id) {
		return sqlSessionTemplate.delete("member.delete", id);
	}

	public int updatePasswd(String id, String passwd) {
		Map map=new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		return sqlSessionTemplate.update("member.updatePasswd", map);
	}

	public int updateFile(String id, String fname) {
		Map map=new HashMap();
		map.put("id", id);
		map.put("fname", fname);
		return sqlSessionTemplate.update("member.updateFile", map);
	}

	public int update(MemberDTO dto) {
		return sqlSessionTemplate.update("member.update", dto);
	}

	public String getGrade(String id) {
		return sqlSessionTemplate.selectOne("member.getGrade", id);
	}

	public int loginCheck(String id, String passwd) {
		Map map=new HashMap();
		map.put("id", id);
		map.put("passwd", passwd);
		return sqlSessionTemplate.selectOne("member.loginCheck", map);
	}

	public String getFname(String id) {
		return sqlSessionTemplate.selectOne("member.getFname", id);
	}
	

}
