package cn.slkj.jzlj.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.jzlj.model.Department;
import cn.slkj.jzlj.service.DepartmentService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;

/**
 * 部门管理 控制层
 * 
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/dep")
public class DepartmentController {
	@Resource
	private DepartmentService departmentService;
	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/queryListPage")
	public  EPager<Department> queryListPage(String type,String name, @RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
				String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("d_type", type);
		hashMap.put("d_name", name);
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Department> list = departmentService.queryListPage(hashMap,pageBounds);
		PageList<Department> pageList = (PageList<Department>) list;
		return new EPager<Department>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/queryList")
	public List<Department> queryList(String name, String type) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("d_type", type);
		hashMap.put("d_name", name);
		return departmentService.queryList(hashMap);
	}
	// 获取实体
	@ResponseBody
	@RequestMapping(value = "/queryOneDep")
	public Department queryOne(String id) {
		return departmentService.queryOne(id);
	}

	// / 保存
	@ResponseBody
	@RequestMapping(value = "/saveDep", method = { RequestMethod.POST })
	public JsonResult saveDep(Department department) throws Exception {
		try {
			int i = departmentService.save(department);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "保存失败！");
	}

	// 编辑
	@ResponseBody
	@RequestMapping(value = "/editDep")
	public JsonResult editDep(Department department) throws Exception {
		try {
			int i = departmentService.edit(department);
			if (i != -1) {
				return new JsonResult(true, "");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new JsonResult(false, "编辑失败！");
	}

	// 删除
	@ResponseBody
	@RequestMapping(value = "/delDep")
	public JsonResult delDep(String id) {
		int i = departmentService.delete(id);
		if (i > 0) {
			return new JsonResult(true, "");
		}
		return new JsonResult(false, "删除失败！");
	}
}
