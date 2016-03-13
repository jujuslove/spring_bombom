package spring.model.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.model.member.MemberDTO;

//@Component
@Repository
public class ProductDAO_Mybatis {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public ProductDTO read(int product_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("product.readProduct", product_no);
	}
	
	public List<ProductDetailDTO> read_detail(Map map) {
		return sqlSessionTemplate.selectList("product.readProductDetail", map);
	}
}
