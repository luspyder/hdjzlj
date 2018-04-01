package cn.slkj.jzlj.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.RoleMapper;
import cn.slkj.jzlj.model.Role;
import cn.slkj.jzlj.service.RoleService;

@Repository
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleMapper	mapper;
	@Override
	public Role getByid(String id) {
		return mapper.getByid(id);
	}

	@Override
	public int edit(Role role) {
		return mapper.edit(role);
	}

	@Override
	public int save(Role role) {
		return mapper.save(role);
	}

	@Override
	public int delete(String id) {
		return mapper.delete(id);
	}

	@Override
	public List<Role> getAllPage(Map<String, Object> pageMap, PageBounds pageBounds) {
		return mapper.getAllPage(pageMap,pageBounds);
	}

	@Override
	public List<Role> getAll(Map<String, Object> map) {
		return mapper.getAll(map);
	}

}
