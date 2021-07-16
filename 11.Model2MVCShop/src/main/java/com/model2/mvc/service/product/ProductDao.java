package com.model2.mvc.service.product;

import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

// ��ǰ������ CRUD�� �߻�ȭ, ĸ��ȭ
// Dao Interface ����
public interface ProductDao {
	
	// 1. ��ǰ�߰�
	public void addProduct(Product product) throws Exception;
	
	// 2. ��ǰ��ȸ
	public Product getProduct(int prodNo) throws Exception;
	
	// 3. ��ǰ����Ʈ
	public List<Product> getProductList(Search search) throws Exception;
	
	// 4. ��ǰ����
	public void updateProduct(Product product) throws Exception;
	
	// 5. �Խ��� Page ó���� ���� ��üRow(totalCount) return
	public int getTotalCount(Search search) throws Exception;

}
