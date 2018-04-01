package cn.slkj.jzlj.dao;

import cn.slkj.jzlj.model.Role;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 
 * @ClassName: RoleMapper
 * @Description: 角色mapper接口
 * @author maxh
 *
 */
@Repository
public interface RoleMapper {

	Role getByid(String id);

	int edit(Role role);

	int save(Role role);

	int delete(String id);

	List<Role> getAllPage(Map<String, Object> map, PageBounds pageBounds);

	List<Role> getAll(Map<String, Object> map);
}
