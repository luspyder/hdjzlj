package cn.slkj.jzlj.dao;

import java.util.HashMap;
import java.util.List;

import cn.slkj.jzlj.model.User;
import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;


@Repository
public interface UserMapper {

	public User login(HashMap<String, Object> map);

	public List<User> getAllUsers(HashMap<String, Object> hashMap, PageBounds pageBounds);

	public User queryOne(HashMap<String, Object> map);

	public int save(User user);

	public int edit(User user);

	public int delete(String id);

	public int resetPwd(String[] ids);

	public int valid(HashMap<String, Object> hashMap);

}
