package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.PeccancyMapper;
import cn.slkj.jzlj.model.PCompany;
import cn.slkj.jzlj.model.PPersonal;
import cn.slkj.jzlj.service.PeccancyService;

@Repository
public class PeccancyServiceImpl implements PeccancyService {
	@Autowired
	private PeccancyMapper mapper;

	@Override
	public List<PPersonal> getAllPP(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.getAllPP(map, pageBounds);
	}

	@Override
	public List<PCompany> getAllPC(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.getAllPC(map, pageBounds);
	}

	@Override
	public int savePPersonal(PPersonal pPersonal) {
		return mapper.savePPersonal(pPersonal);
	}

	@Override
	public int PPHandle(HashMap<String, Object> hashMap) {
		// TODO Auto-generated method stub
		return mapper.PPHandle(hashMap);
	}

}
