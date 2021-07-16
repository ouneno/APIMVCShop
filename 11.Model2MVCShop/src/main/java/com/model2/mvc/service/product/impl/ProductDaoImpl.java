package com.model2.mvc.service.product.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductDao;

// ProductDao CRUD ����
@Repository("productDaoImpl")
public class ProductDaoImpl implements ProductDao{
	
	// Field
	@Autowired // IoC �����̳� �ȿ� �ִ� Bean�� �ڵ����� ���Խ����ش�
	@Qualifier("sqlSessionTemplate") // commonservice.xml�� sqlSessionTemplate�� ����, DB���� �� SQL����)
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// Constructor
	public ProductDaoImpl() {
		System.out.println("ProductDaoImpl : " +this.getClass());
	}
	
	// Method
	// 1. ��ǰ�߰�
	public void addProduct(Product product) throws Exception {
		sqlSession.insert("ProductMapper.addProduct", product);	
	}
	
	// 2. ��ǰã��
	public Product getProduct(int prodNo) throws Exception {
		return sqlSession.selectOne("ProductMapper.getProduct", prodNo);
	}
	
	
	// 3. ��ǰ����Ʈ��ȸ
	public List<Product> getProductList(Search search) throws Exception {
		return sqlSession.selectList("ProductMapper.getProductList", search);
	}
	
	
	// 4. ��ǰ����
	public void updateProduct(Product product) throws Exception {
		System.out.println("����Ȯ���غ���@@@@@ ProductDaoImpl : "+product);
		sqlSession.insert("ProductMapper.updateProduct", product);		
	}

	// 5. �Խ��� Page ó���� ���� ��üRow(totalCount)  return 
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ProductMapper.getTotalCount", search);
	}
	
}
