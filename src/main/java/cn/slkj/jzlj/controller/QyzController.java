package cn.slkj.jzlj.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.slkj.jzlj.model.Qyz;
import cn.slkj.jzlj.service.QyzService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;
import cn.slkj.util.javaUtil.date.DateStyle;
import cn.slkj.util.javaUtil.date.DateUtil;

import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

@Controller
@RequestMapping(value = "/qyz")
public class QyzController {
	@Resource
	private QyzService sfdjService;

	/**
	 * 查询列表，返回easyUI数据格式
	 */
	@RequestMapping(value = "/list")
	@ResponseBody
	public EPager<Qyz> getAlls(String groupName, String apEntryTime, String apEntryTime1, String zNumber, String jsUnit, String gcName, String feeEntryTime, String feeEntryTime1, String approved, String handle, String state, String regNumber, @RequestParam(required = false, defaultValue = "1") Integer page, @RequestParam(required = false, defaultValue = "20") Integer rows, @RequestParam(required = false) String sort, @RequestParam(required = false) String order) {
		// String sortString = "";
		// sortString = "entryTime.desc";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("state", state);
		hashMap.put("handle", handle);
		hashMap.put("regNumber", regNumber);
		hashMap.put("approved", approved);

		hashMap.put("groupName", groupName);
		hashMap.put("apEntryTime", apEntryTime);
		hashMap.put("apEntryTime1", apEntryTime1);

		hashMap.put("gcName", gcName);
		hashMap.put("feeEntryTime", feeEntryTime);
		hashMap.put("feeEntryTime1", feeEntryTime1);
		hashMap.put("jsUnit", jsUnit);
		hashMap.put("zNumber", zNumber);
		PageBounds pageBounds = new PageBounds(page, rows, Order.create(sort, order));
		List<Qyz> list = sfdjService.getAll(hashMap, pageBounds);
		PageList<Qyz> pageList = (PageList<Qyz>) list;
		return new EPager<Qyz>(pageList.getPaginator().getTotalCount(), list);
	}

	@RequestMapping(value = "/selectOne", method = { RequestMethod.POST })
	@ResponseBody
	public Qyz selectOne(String id) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("id", id);
		return sfdjService.selectOne(hashMap);
	}

	/**
	 * 保存信息
	 *
	 * @return
	 */
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public @ResponseBody JsonResult save(HttpServletRequest request, HttpServletResponse response, @RequestParam("myfiles") MultipartFile[] files, Qyz sfdj) {
		try {
			// 判断files数组不能为空并且长度大于0
			if (files != null && files.length > 0) {
				// 循环获取file数组中得文件
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					System.out.println("开始");
					String path = "D:/fileupload/";
					String fileName = file.getOriginalFilename();
					// 解决中文乱码问题
					response.setHeader("Content-Disposition", "attachment; filename=" + java.net.URLEncoder.encode(fileName, "UTF-8"));
					File targetFile = new File(path, fileName);
					if (!targetFile.exists()) {
						targetFile.mkdirs();
					}
					// 保存
					file.transferTo(targetFile);
					// 将前台传来的上传文件的文件名保存到数据库中
					sfdj.setPhoto(fileName);
				}
			}

			float p = sfdj.getFee() * sfdj.getFeeType() * sfdj.getTonnage();
			sfdj.setPrice(p);
			String regNumber = DateUtil.DateToString(new Date(), DateStyle.YYMMDDHHMMSS);
			sfdj.setRegNumber(regNumber);
			int i = sfdjService.save(sfdj);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，操作失败！");
		}
		return new JsonResult(false, "操作失败！");
	}

	/**
	 * 收费审核
	 *
	 * @param id
	 * @param state
	 * @param feeManager
	 * @param feeEntryTime
	 * @return
	 */
	@RequestMapping(value = "/feeOK", method = RequestMethod.POST)
	public @ResponseBody JsonResult feeOK(String id, String state, String feeManager, String feeEntryTime) {
		try {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("state", state);
			hashMap.put("id", id);
			hashMap.put("feeManager", feeManager);
			hashMap.put("feeEntryTime", feeEntryTime);
			int i = sfdjService.feeOK(hashMap);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，操作失败！");
		}
		return new JsonResult(false, "操作失败！");
	}

	/**
	 * 准运证办理
	 *
	 * @param id
	 * @param handle
	 * @param hdManager
	 * @param hdEntryTime
	 * @return
	 */
	@RequestMapping(value = "/handle", method = RequestMethod.POST)
	public @ResponseBody JsonResult handle(String id, String handle, String hdManager, String hdEntryTime, String czArea, String jsContact, String jsTelephone, String sgContact, String sgTelephone) {
		try {
			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("handle", handle);
			hashMap.put("id", id);
			hashMap.put("yearNo", DateUtil.getYear(new Date()));
			hashMap.put("theNo", id);
			hashMap.put("hdManager", hdManager);
			hashMap.put("hdEntryTime", hdEntryTime);

			hashMap.put("czArea", czArea);
			hashMap.put("jsContact", jsContact);
			hashMap.put("jsTelephone", jsTelephone);
			hashMap.put("sgContact", sgContact);
			hashMap.put("sgTelephone", sgTelephone);
			int i = sfdjService.handle(hashMap);
			if (i != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，操作失败！");
		}
		return new JsonResult(false, "操作失败！");
	}

	/**
	 * 准运证核准
	 *
	 * @param files
	 * @param request
	 * @param response
	 * @param pid
	 * @param approved
	 * @param apManager
	 * @param groupId
	 * @param promiseValue
	 * @param polluteValue
	 * @param roadValue
	 * @param gcName
	 * @return
	 */
	@RequestMapping(value = "/zyzhz", method = RequestMethod.POST)
	public @ResponseBody JsonResult zyzhz(@RequestParam("myfiles") MultipartFile[] files, HttpServletRequest request, HttpServletResponse response, String pid, String approved, String apManager, String groupId, String promiseValue, String polluteValue, String roadValue, String gcName) {
		try {
			String promiseFileName = null;
			String polluteFileName = null;
			String roadFileName = null;
			// 判断files数组不能为空并且长度大于0
			if (files != null && files.length > 0) {
				// 循环获取file数组中得文件
				for (int i = 0; i < files.length; i++) {
					MultipartFile file = files[i];
					System.out.println("开始");
					System.out.println("files.length " + i + " = " + files.length);
					// 上传文件时加上文件id
					String path = "D:/fileupload/" + pid;
					String fileName = file.getOriginalFilename();
					File targetFile = new File(path, fileName);
					if (!targetFile.exists()) {
						targetFile.mkdirs();
					}
					// 保存
					file.transferTo(targetFile);
					switch (i) {
					case 0:
						promiseFileName = fileName;
						break;
					case 1:
						polluteFileName = fileName;
						break;
					case 2:
						roadFileName = fileName;
						break;
					}
				}
			}

			HashMap<String, Object> hashMap = new HashMap<String, Object>();
			hashMap.put("id", pid);
			hashMap.put("approved", approved);
			hashMap.put("apManager", apManager);
			hashMap.put("groupId", groupId);
			hashMap.put("apEntryTime", DateUtil.DateToString(new Date(), DateStyle.YYYY_MM_DD_HH_MM));
			hashMap.put("promiseValue", promiseValue);
			hashMap.put("polluteValue", polluteValue);
			hashMap.put("roadValue", roadValue);
			hashMap.put("promiseFileName", promiseFileName);
			hashMap.put("polluteFileName", polluteFileName);
			hashMap.put("roadFileName", roadFileName);
			int j = sfdjService.zyzhz(hashMap);
			if (j != -1) {
				return new JsonResult(true, "操作成功。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new JsonResult(false, "系统异常，操作失败！");
		}
		return new JsonResult(false, "操作失败！");
	}

	public String updateThumb(@RequestParam("promise") MultipartFile file, HttpServletRequest request, String pid) throws Exception {
		if (!file.isEmpty()) {
			// 保存文件
			String promiseFileName = null;
			String path = "D:/fileupload/" + pid;
			String fileName = file.getOriginalFilename();
			File targetFile = new File(path, fileName);
			if (!targetFile.exists()) {
				targetFile.mkdirs();
			}
			// 保存
			file.transferTo(targetFile);
			promiseFileName = fileName;
//			System.out.println("保存文件[" + file.getOriginalFilename() + "]完成...");
			return "success";
		} else {
			return "fail";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/getCountType", method = RequestMethod.GET)
	public List<Map<String, String>> getCountType() {
		return sfdjService.getCountType();
	}

}
