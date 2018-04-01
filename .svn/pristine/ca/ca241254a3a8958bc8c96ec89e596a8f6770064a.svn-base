package cn.slkj.jzlj.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import cn.slkj.jzlj.model.PCompany;
import cn.slkj.jzlj.model.PPersonal;
import cn.slkj.jzlj.service.PeccancyService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;

@Controller
@RequestMapping(value = "/peccancy")
public class PeccancyController {
	@Resource
	private PeccancyService service;

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@RequestMapping(value = "/getAllPP", method = { RequestMethod.POST })
	public @ResponseBody EPager<PPersonal> getAllPP(@RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows, @RequestParam(required = false) String sort, @RequestParam(required = false) String order, String carNumber, String pecTimeStart, String pecTimeEend, String state) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("carNumber", carNumber);
		hashMap.put("pecTimeStart", pecTimeStart);
		hashMap.put("pecTimeEend", pecTimeEend);
		hashMap.put("state", state);
		PageBounds pageBounds = new PageBounds(page, rows, Order.create(sort, order));
		List<PPersonal> list = service.getAllPP(hashMap, pageBounds);
		PageList<PPersonal> pageList = (PageList<PPersonal>) list;
		return new EPager<PPersonal>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/savePPersonal", method = RequestMethod.POST)
	public JsonResult savePPersonal(PPersonal pPersonal) {

		try {
			int i = service.savePPersonal(pPersonal);
			if (i != -1) {
				return new JsonResult(true, "创建成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，创建失败！");
		}
		return new JsonResult(false, "创建失败！");
	}

	@ResponseBody
	@RequestMapping(value = "/PPHandle")
	public JsonResult PPHandle(String id, String state) {

		try {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", id);
			hashMap.put("state", state);
			int i = service.PPHandle(hashMap);
			if (i != -1) {
				return new JsonResult(true, "创建成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，创建失败！");
		}
		return new JsonResult(false, "创建失败！");
	}

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@RequestMapping(value = "/getAllPC", method = { RequestMethod.POST })
	public @ResponseBody EPager<PCompany> getAllPC(String zNumber, String jsUnit, String gcName, String feeEntryTime, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows, @RequestParam(required = false) String sort, @RequestParam(required = false) String order) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		// hashMap.put("gcName", gcName);
		PageBounds pageBounds = new PageBounds(page, rows, Order.create(sort, order));
		List<PCompany> list = service.getAllPC(hashMap, pageBounds);
		PageList<PCompany> pageList = (PageList<PCompany>) list;
		return new EPager<PCompany>(pageList.getPaginator().getTotalCount(), list);
	}
}
