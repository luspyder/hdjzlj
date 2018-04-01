package cn.slkj.jzlj.service;

import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.Role;

public interface RoleService {
	Role getByid(String id);

	int edit(Role role);

	int save(Role role);

	int delete(String id);

	List<Role> getAllPage(Map<String, Object> pageMap, PageBounds pageBounds);

	List<Role> getAll(Map<String, Object> map);
}
