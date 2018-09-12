package cn.slkj.jzlj.controller;

import cn.slkj.jzlj.model.Group;
import cn.slkj.jzlj.service.GroupService;
import cn.slkj.jzlj.util.GuidUtil;
import cn.slkj.util.easyuiUtil.JsonResult;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

	@ResponseBody
	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public JsonResult save(String id, String name) {
		Group group = new Group();
		group.setId((int)((Math.random()*9+1)*100000));	
		group.setName(name);
		try {
			int i = groupService.save(group);
			if (i != -1) {
				return new JsonResult(true, "添加成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，修改失败！");
		}
		return new JsonResult(false, "添加失败！");
	}

	@ResponseBody
	@RequestMapping(value = "/edit", method = { RequestMethod.POST })
	public JsonResult edit(String id, String name) {
		Group group = new Group();
		group.setId(Integer.valueOf(id));	
		group.setName(name);
		try {
			int i = groupService.edit(group);
			if (i != -1) {
				return new JsonResult(true, "修改成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，修改失败！");
		}
		return new JsonResult(false, "修改失败！");
	}
	@ResponseBody
	@RequestMapping(value = "/delete", method = { RequestMethod.POST })
	public JsonResult delete(String id) {
		try {
			int i = groupService.delete(id);
			if (i != -1) {
				return new JsonResult(true, "删除成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，修改失败！");
		}
		return new JsonResult(false, "删除失败！");
	}
}
