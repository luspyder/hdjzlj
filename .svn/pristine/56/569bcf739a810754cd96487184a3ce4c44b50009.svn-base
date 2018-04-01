package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.DepartmentMapper;
import cn.slkj.jzlj.model.Department;
import cn.slkj.jzlj.service.DepartmentService;

@Repository
public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	private DepartmentMapper mapper;

	@Override
	public List<Department> queryList(HashMap<String, Object> map) {
		return mapper.queryList(map);
	}

	@Override
	public List<Department> queryListPage(HashMap<String, Object> map, PageBounds pageBounds) {
		return mapper.queryListPage(map, pageBounds);
	}

	@Override
	public int save(Department department) {
		return mapper.save(department);
	}

	@Override
	public int edit(Department department) {
		return mapper.edit(department);
	}

	@Override
	public int delete(String id) {
		return mapper.delete(id);
	}

	@Override
	public Department queryOne(String id) {
		return mapper.queryOne(id);
	}

}
