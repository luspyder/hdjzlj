package cn.slkj.jzlj.controller;

import cn.slkj.jzlj.model.Group;
import cn.slkj.jzlj.service.GroupService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
@Controller
@RequestMapping(value = "/group")
public class GroupController {
	@Resource
	private GroupService groupService;

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@RequestMapping(value = "/list")
	public @ResponseBody List<Group> getAllUsers(HttpServletRequest request) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		return groupService.getAll(hashMap);
	}
}
