package cn.slkj.jzlj.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.jzlj.interceptor.SystemConstants;
import cn.slkj.jzlj.model.Module;
import cn.slkj.jzlj.model.User;
import cn.slkj.jzlj.service.ModuleService;
import cn.slkj.util.easyuiUtil.JsonResult;
import cn.slkj.util.easyuiUtil.Tree;

@Controller
@RequestMapping("/module")
public class ModuleController {
	@Autowired
	private ModuleService moduleService;

	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public List<Module> list() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<Module> list = moduleService.getAll(map);
		return makeTree(list);
	}

	@RequestMapping(value = "/getModuleByRoleId")
	@ResponseBody
	public List<Module> getModuleByRoleId(HttpServletRequest request) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		User user = (User) request.getSession().getAttribute(SystemConstants.SESSION_USER);
		Integer roleId = user.getRoleId();
		map.put("roleid", roleId);
		map.put("priority", 3);
		List<Module> list = moduleService.getModuleByRoleId(map);
		return makeTree(list);
	}

	@RequestMapping(value = "/role2Module")
	@ResponseBody
	public List<Tree> role2Module(String roleId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("roleid", roleId);
		List<Module> allList = moduleService.getAll(map);
		List<Module> checkList = moduleService.getModuleByRoleId(map);
		return initCheckBoxTree(allList, 0, checkList);
	}

	/**
	 * 保存角色和资源之间的关系
	 * 
	 * @param member
	 * @return
	 */
	@RequestMapping(value = "/saveRoleRes", method = RequestMethod.POST)
	private @ResponseBody JsonResult saveRoleRes(String roleid, @RequestParam(value = "ids[]") String[] ids) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("roleid", roleid);
		if (StringUtils.isNotBlank(roleid)) {
			moduleService.deleteRoleRes(map);
			int i = moduleService.saveRoleRes(map);
			if (i != -1) {
				return new JsonResult(true, "操作成功");
			}
		}
		return new JsonResult(false, "操作失败");
	}

	/**
	 * 组装树形列表 treegrid
	 * 
	 * @param list
	 * @return
	 */
	private List<Module> makeTree(List<Module> list) {
		List<Module> parent = new ArrayList<Module>();
		for (Module e : list) {
			if (e.getP_id() == 0) {
				e.setChildren(new ArrayList<Module>(0));
				parent.add(e);
			}
		}
		list.removeAll(parent);
		makeChildren(parent, list);
		return parent;
	}

	private void makeChildren(List<Module> parent, List<Module> children) {
		if (children.isEmpty()) {
			return;
		}
		List<Module> tmp = new ArrayList<Module>();
		for (Module c1 : parent) {
			for (Module c2 : children) {
				c2.setChildren(new ArrayList<Module>(0));
				// if (c1.getId().equals(c2.getP_id())) {
				// c1.getChildren().add(c2);
				// tmp.add(c2);
				// }
				if (c1.getId().equals(c2.getP_id())) {
					c1.getChildren().add(c2);
					if (!c1.getP_id().equals("0")) {
						c1.setState("closed");
					}
					tmp.add(c2);
				}
			}
		}
		children.removeAll(tmp);
		makeChildren(tmp, children);
	}

	// 将list转换为需要的json格式
	private List<Tree> initCheckBoxTree(List<Module> list, Integer id, List<Module> list1) {
		List<Tree> trees = new ArrayList<Tree>();
		for (Module menus : list) {
			Tree node = new Tree();
			node.setId(menus.getId() + "");
			node.setText(menus.getName());
			// node.setIconCls(menus.getRes_icon());
			if (list1 != null) {
				// 循环判断该角色拥有的资源，如果拥有的话，设置为选择中
				for (int i = 0; i < list1.size(); i++) {
					Integer oid = list1.get(i).getId();
					Integer nid = menus.getId();
					if (oid == nid) {
						node.setChecked(true);
					}
				}
			}
			if (id.equals(menus.getP_id())) {
				node.setChildren(initCheckBoxTree(list, Integer.parseInt(node.getId()), list1));
				if (!node.getChildren().isEmpty()) {
					node.setChecked(false);
				}

				trees.add(node);
			}
		}
		return trees;
	}

}
