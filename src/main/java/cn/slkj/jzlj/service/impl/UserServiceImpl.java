package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.dao.UserMapper;
import cn.slkj.jzlj.model.User;
import cn.slkj.jzlj.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public User login(HashMap<String, Object> map) {
		return userMapper.login(map);
	}

	@Override
	public List<User> getAllUsers(HashMap<String, Object> hashMap, PageBounds pageBounds) {
		return userMapper.getAllUsers(hashMap, pageBounds);
	}

	@Override
	public User queryOne(HashMap<String, Object> hashMap) {
		return userMapper.queryOne(hashMap);
	}

	@Override
	public int save(User user) {
		return userMapper.save(user);
	}

	@Override
	public int edit(User user) {
		return userMapper.edit(user);
	}

	@Override
	public int delete(String id) {
		return userMapper.delete(id);
	}

	@Override
	public int resetPwd(String[] ids) {
		return userMapper.resetPwd(ids);
	}

	@Override
	public int valid(HashMap<String, Object> hashMap) {
		return userMapper.valid(hashMap);
	}

}
