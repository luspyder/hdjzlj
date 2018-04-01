package cn.slkj.jzlj.controller;

import cn.slkj.jzlj.interceptor.SystemConstants;
import cn.slkj.jzlj.model.User;
import cn.slkj.jzlj.service.UserService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;
import cn.slkj.util.javaUtil.date.DateStyle;
import cn.slkj.util.javaUtil.date.DateUtil;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * 
 * @ClassName: UserController
 * @Description: 用户信息
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/user")
@SessionAttributes("userSession")
public class UserController {
	@SuppressWarnings("unused")
	private static Logger log = LoggerFactory.getLogger(UserController.class);
	@Resource
	private UserService userService;

	@RequestMapping(value = "/loginPage")
	public String loginPage() {

		return "redirect:/login.jsp";
	}

	/**
	 * 统一登陆接口
	 */
	@RequestMapping(value = "/login")
	public @ResponseBody JsonResult login(User user, HttpSession session, ModelMap modelMap, HttpServletRequest request) {

		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("username", user.getUsername());
			map.put("password", user.getPassword());
			// 未禁用的
			map.put("status", "enabled");

			User m_user = userService.login(map);
			if (m_user != null) {
				modelMap.addAttribute(SystemConstants.SESSION_USER, m_user);
				return new JsonResult(true, "登录成功");
			}
			return new JsonResult(false, "用户账户信息错误，请重新输入。");
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "登录异常");
		}
	}

	/**
	 * 根据条件查询单条记录
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/queryOne")
	public @ResponseBody User queryOne(String id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", id);
		return userService.queryOne(hashMap);
	}

	/**
	 * 查询用户列表，返回easyUI数据格式
	 */
	@RequestMapping(value = "/list", method = { RequestMethod.POST })
	public @ResponseBody EPager<User> getAllUsers(HttpServletRequest request, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		String status = request.getParameter("status");
		String username = request.getParameter("username");
		String realname = request.getParameter("realname");
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("status", status);
		hashMap.put("username", username);
		hashMap.put("realname", realname);
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<User> list = userService.getAllUsers(hashMap, pageBounds);
		PageList<User> pageList = (PageList<User>) list;
		return new EPager<User>(pageList.getPaginator().getTotalCount(), list);
	}

	/**
	 * 保存用户信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody JsonResult save(User user) {
		try {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("username", user.getUsername().trim());
			User u = userService.queryOne(hashMap);
			int i = -1;
			if (u != null) {
				return new JsonResult(false, "用户已经存在，请重新填写。");
			} else {
				user.setCreate_time(DateUtil.DateToString(new Date(), DateStyle.YYYY_MM_DD));
				i = userService.save(user);
			}
			if (i != -1) {
				return new JsonResult(true, "用户创建成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，用户创建失败！");
		}
		return new JsonResult(false, "创建失败！");
	}

	/**
	 * 
	 * @Title: editUser @Description: 编辑用户信息 @param user @return
	 *         JsonResult @throws
	 */
	@RequestMapping(value = "/editUser", method = RequestMethod.POST)
	public @ResponseBody JsonResult editUser(User user) {
		try {
			int i = -1;
			i = userService.edit(user);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "操作异常！");
		}
		return new JsonResult(false, "操作失败！");
	}

	/**
	 * 重置密码
	 * 
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/resetPwd", method = RequestMethod.POST)
	public JsonResult resetPwd(@RequestParam(value = "ids[]") String[] ids) {
		try {
			int i = userService.resetPwd(ids);
			if (i != -1) {
				return new JsonResult(true, "重置密码成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "重置异常。");
		}
		return new JsonResult(false, "重置失败！");
	}

	/**
	 * 禁止/启动操作
	 * 
	 * @param ids
	 * @param status
	 * @return
	 */

	@ResponseBody
	@RequestMapping(value = "/valid", method = RequestMethod.POST)
	public JsonResult valid(@RequestParam(value = "ids[]") String[] ids, String status) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ids", ids);
		map.put("status", status);
		try {
			int i = userService.valid(map);
			if (i != -1) {
				return new JsonResult(true, "重置密码成功。");
			} else {
				return new JsonResult(false, "操作失败。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "操作异常。");
		}
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/delete")
	public JsonResult deletes(String id) {
		int i = userService.delete(id);
		try {
			if (i > 0) {
				return new JsonResult(true, "删除成功。");
			} else {
				return new JsonResult(false, "删除失败。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "操作异常。");
		}
	}

	/**
	 * 
	 * @Title: listByRole @Description:查询该角色下所有用户列表 @param request @param
	 *         page @param rows @return EPager<User> @throws
	 */
	@RequestMapping("/listByRole")
	@ResponseBody
	public EPager<User> listByRole(HttpServletRequest request, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		HashMap<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("roleId", request.getParameter("id"));
		PageBounds pageBounds = new PageBounds(page, rows);
		List<User> list = userService.getAllUsers(pageMap, pageBounds);
		PageList<User> pageList = (PageList<User>) list;
		return new EPager<User>(pageList.getPaginator().getTotalCount(), list);
	}
}
