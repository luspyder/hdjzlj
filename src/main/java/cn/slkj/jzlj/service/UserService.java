package cn.slkj.jzlj.service;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.User;

public interface UserService {
	User login(HashMap<String, Object> map);

	List<User> getAllUsers(HashMap<String, Object> hashMap, PageBounds pageBounds);

	User queryOne(HashMap<String, Object> hashMap);

	int save(User user);

	int edit(User user);

	int delete(String id);

	int resetPwd(String[] ids);

	int valid(HashMap<String, Object> hashMap);

}
