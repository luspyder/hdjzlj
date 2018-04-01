package cn.slkj.jzlj.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.Department;

public interface DepartmentService {

	List<Department> queryList(HashMap<String, Object> map);

	List<Department> queryListPage(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 添加
	 */
	public int save(Department department);

	/**
	 * 编辑
	 */
	public int edit(Department department);

	/**
	 * 根据id 批量记录
	 */
	public int delete(String id);

	/**
	 * 根据id查询
	 * 
	 * @param id
	 * @return
	 */
	public Department queryOne(String id);

}
