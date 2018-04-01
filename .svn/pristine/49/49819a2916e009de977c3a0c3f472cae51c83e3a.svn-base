package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.BasicDataMapper;
import cn.slkj.jzlj.model.Czcd;
import cn.slkj.jzlj.service.BasicDataService;

@Repository
public class BasicDataServiceImpl implements BasicDataService {
	@Autowired
	private BasicDataMapper mapper;

	@Override
	public List<Czcd> czcdList(HashMap<String, Object> hashMap) {
		return mapper.czcdList(hashMap);
	}

	@Override
	public int saveCzcd(Czcd czcd) {
		return mapper.saveCzcd(czcd);
	}

	@Override
	public List<Czcd> czcdListPage(HashMap<String, Object> hashMap,
			PageBounds pageBounds) {
		return mapper.czcdListPage(hashMap, pageBounds);
	}

	@Override
	public int edit(HashMap<String, Object> hashMap) {
		return mapper.edit(hashMap);
	}

}
