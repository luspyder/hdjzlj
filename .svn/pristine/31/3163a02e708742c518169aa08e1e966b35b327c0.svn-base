package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.slkj.jzlj.dao.ModuleMapper;
import cn.slkj.jzlj.model.Module;
import cn.slkj.jzlj.service.ModuleService;

@Repository
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleMapper mapper;

	@Override
	public List<Module> getAll(HashMap<String, Object> map) {
		return mapper.getAll(map);
	}

	@Override
	public List<Module> getModuleByRoleId(HashMap<String, Object> map) {
		return mapper.getModuleByRoleId(map);
	}

	@Override
	public int saveRoleRes(HashMap<String, Object> map) {
		return mapper.saveRoleRes(map);
	}

	@Override
	public int deleteRoleRes(HashMap<String, Object> map) {
		return mapper.deleteRoleRes(map);
	}

}
