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

import cn.slkj.jzlj.model.Czcd;
import cn.slkj.jzlj.service.BasicDataService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;

@Controller
@RequestMapping(value = "/basicData")
public class BasicDataController {
	@Resource
	private BasicDataService basicDataService;

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@ResponseBody
	@RequestMapping(value = "/czcdListPage")
	public EPager<Czcd> czcdListPage(String cdName,
			@RequestParam(required = false, defaultValue = "1") Integer page, // 第几页
			@RequestParam(required = false, defaultValue = "20") Integer rows) {
		String sortString = "";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("cdName", cdName);
		PageBounds pageBounds = new PageBounds(page, rows,
				Order.formString(sortString));
		List<Czcd> list = basicDataService.czcdListPage(hashMap, pageBounds);
		PageList<Czcd> pageList = (PageList<Czcd>) list;
		return new EPager<Czcd>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping(value = "/czcdList")
	public List<Czcd> czcdList(String cdName) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("cdName", cdName);
		return basicDataService.czcdList(hashMap);
	}

	@ResponseBody
	@RequestMapping(value = "/saveCzcd", method = RequestMethod.POST)
	public JsonResult save(Czcd czcd) {

		try {
			int i = basicDataService.saveCzcd(czcd);
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
	 * 编辑
	 * 
	 * @param id
	 * @param selfNumber
	 * @param carName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/editVeh", method = { RequestMethod.POST })
	public JsonResult edit( String id,
			String selfNumber, String carName) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", id);
		hashMap.put("selfNumber", selfNumber);
		hashMap.put("carName", carName);
		try {
			int i = basicDataService.edit(hashMap);
			if (i != -1) {
				return new JsonResult(true, "修改成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，修改失败！");
		}
		return new JsonResult(false, "修改失败！");
	}
}
