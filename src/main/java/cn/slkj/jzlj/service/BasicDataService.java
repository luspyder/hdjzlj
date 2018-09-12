package cn.slkj.jzlj.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.Czcd;

public interface BasicDataService {

	/**
	 * 查询处置场地数据列表
	 * 
	 * @param hashMap
	 * @return
	 */
	List<Czcd> czcdList(HashMap<String, Object> hashMap);

	/**
	 * 保存处置场地
	 * 
	 * @return
	 */
	int saveCzcd(Czcd czcd);

	List<Czcd> czcdListPage(HashMap<String, Object> hashMap, PageBounds pageBounds);

	int edit(HashMap<String, Object> hashMap);

	int save(HashMap<String, Object> hashMap);

	int delete(String id);
}
