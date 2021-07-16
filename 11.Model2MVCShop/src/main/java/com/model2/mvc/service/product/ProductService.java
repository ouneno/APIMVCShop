package com.model2.mvc.service.product;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

// ��ǰ���� ���� �� ����
// Product Service Interface ����
public interface ProductService {
	
	// 1. ��ǰ�߰�
	public void addProduct(Product product) throws Exception;
	
	// 2. ��ǰ��ȸ
	public Product getProduct(int prodNo) throws Exception;
	
	// 3. ��ǰ����Ʈ
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	// 4. ��ǰ����
	public void updateProduct(Product product) throws Exception;

}
