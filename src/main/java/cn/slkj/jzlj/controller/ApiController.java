package cn.slkj.jzlj.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.jzlj.model.Transport;
import cn.slkj.jzlj.service.TransportService;

/**
 * api
 * 
 * @author maxh
 *
 */
@Controller
@RequestMapping(value = "/api")
public class ApiController {
	@Resource
	private TransportService transportService;

	@RequestMapping("/exlive/getListByCar")
	@ResponseBody
	public List<Transport> getList(String carId) {
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("carId", carId);
		return transportService.getListByCar(hashMap);
	}

}
