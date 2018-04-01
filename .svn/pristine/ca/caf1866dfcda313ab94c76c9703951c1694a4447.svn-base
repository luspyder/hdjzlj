package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.QyzMapper;
import cn.slkj.jzlj.model.Qyz;
import cn.slkj.jzlj.service.QyzService;

@Repository
public class QyzServiceImpl implements QyzService {

	@Autowired
	private QyzMapper mapper;

	@Override
	public int save(Qyz sfdj) {

		return mapper.save(sfdj);
	}

	@Override
	public List<Qyz> getAll(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.getAll(map, pageBounds);
	}

	@Override
	public int feeOK(HashMap<String, Object> hashMap) {
		return mapper.feeOK(hashMap);
	}

	@Override
	public int handle(HashMap<String, Object> hashMap) {
		return mapper.handle(hashMap);
	}

	@Override
	public int zyzhz(HashMap<String, Object> hashMap) {
		return mapper.zyzhz(hashMap);
	}

	@Override
	public Qyz selectOne(HashMap<String, Object> hashMap) {
		return mapper.selectOne(hashMap);
	}

	@Override
	public List<Map<String, String>> getCountType() {
		return  mapper.getCountType();
	}
}
