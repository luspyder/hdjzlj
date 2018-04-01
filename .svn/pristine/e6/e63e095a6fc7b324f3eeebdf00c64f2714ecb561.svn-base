package cn.slkj.jzlj.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.jzlj.model.Role;
import cn.slkj.jzlj.service.RoleService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;

/**
 * 
 * @ClassName: RoleController
 * @Description: 角色管理控制类
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {
	private static Logger log = LoggerFactory.getLogger(RoleController.class);
	@Resource
	private RoleService service;

	@RequestMapping("/list")
	@ResponseBody
	public EPager<Role> getAll(HttpServletRequest request) throws Exception {
		Map<String, Object> pageMap = new HashMap<String, Object>();
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBounds pageBounds = new PageBounds(page, rows);
		List<Role> list = service.getAllPage(pageMap, pageBounds);
		PageList pageList = (PageList) list;
		return new EPager<Role>(pageList.getPaginator().getTotalCount(), list);
	}

	@RequestMapping("/queryAll")
	@ResponseBody
	public List<Role> queryAll(HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> list = service.getAll(map);
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/queryOne")
	public Role queryOne(String id) {
		return service.getByid(id);
	}

	@RequestMapping(value = "/save", method = { RequestMethod.POST })
	public  @ResponseBody JsonResult save(Role role) throws Exception {
		try {
			int i = service.save(role);
			if (i != -1) {
				return new JsonResult(true, "创建成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，户创建失败！");
		}
		return new JsonResult(false, "创建失败！");
	}

	@ResponseBody
	@RequestMapping(value = "/edit")
	public boolean edit(Role role) throws Exception {
		try {
			int i = service.edit(role);
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@ResponseBody
	@RequestMapping(value = "/delete")
	public boolean deletes(String id) {
		int i = service.delete(id);
		try {
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}
