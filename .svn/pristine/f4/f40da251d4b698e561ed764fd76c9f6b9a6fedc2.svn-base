package cn.slkj.jzlj.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.Department;

/**
 * 
 * @ClassName: DepartmentMapper
 * @Description: 部门管理 dao
 * @author maxuhui
 *
 */
@Repository
public interface DepartmentMapper {

	/**
	 * 查询列表
	 * 
	 * @param map
	 * @return
	 */

	List<Department> queryList(HashMap<String, Object> map);

	List<Department> queryListPage(HashMap<String, Object> map, PageBounds pageBounds);

	/**
	 * 根据id查询
	 * 
	 * @param id
	 * @return
	 */
	Department queryOne(String id);

	/**
	 * 添加
	 * 
	 */
	int save(Department department);

	/**
	 * 编辑
	 * 
	 */
	int edit(Department department);

	/**
	 * 根据id删除记录
	 */

	int delete(String id);

}
