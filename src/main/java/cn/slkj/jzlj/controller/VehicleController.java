package cn.slkj.jzlj.controller;

import cn.slkj.jzlj.exlive.ExliveAPI;
import cn.slkj.jzlj.model.Group;
import cn.slkj.jzlj.model.Vehicle;
import cn.slkj.jzlj.service.GroupService;
import cn.slkj.jzlj.service.VehicleService;
import cn.slkj.util.easyuiUtil.EPager;
import cn.slkj.util.easyuiUtil.JsonResult;
import cn.slkj.util.httpUtil.HttpClientUtil;
import cn.slkj.util.javaUtil.StringUtil;
import cn.slkj.util.javaUtil.date.DateStyle;
import cn.slkj.util.javaUtil.date.DateUtil;
import com.github.miemiedev.mybatis.paginator.domain.Order;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/vehicle")
public class VehicleController {

	@Autowired
	public VehicleService vehicleService;
	@Autowired
	private GroupService groupService;

	@ResponseBody
	@RequestMapping("/getList")
	public EPager<Vehicle> getList(String groupId, String carNumber, @RequestParam(required = false, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer rows) {

		String sortString = "";
		sortString = "selfNumber.asc";
		HashMap<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("gid", groupId);
		hashMap.put("carName", carNumber);
		PageBounds pageBounds = new PageBounds(page, rows, Order.formString(sortString));
		List<Vehicle> list = vehicleService.getList(hashMap, pageBounds);
		PageList<Vehicle> pageList = (PageList<Vehicle>) list;
		return new EPager<Vehicle>(pageList.getPaginator().getTotalCount(), list);
	}

	@ResponseBody
	@RequestMapping("/getAll")
	public List<Vehicle> getAllVehicle(String cid) {
		HashMap map = new HashMap();
		// map.put("gid", "3229636");
		map.put("gid", cid);

		List<Vehicle> list = vehicleService.getAll(map);
		return list;
	}

	@ResponseBody
	@RequestMapping("/carGps")
	public String carGps(String carName) {
		HashMap map = new HashMap();
		map.put("carName", carName);
		Vehicle ve = vehicleService.queryOne(map);
		Vehicle vehicle = new Vehicle();
		// boolean flag = true;
		if (ve == null) {
			return "{ \"carId\": \"\", \"success\":" + false + "}";

		} else {
			vehicle = getVehicleInfo(ve.getId(), ve.getvKey());
			// 第一步、根据gps时间和服务器时间是否相同，判断是 在线 还是 离线。
			// 第二步、判断是否有速度，没有速度显示静止

			// if
			// (verifyCarTime(vehicle.getRecvtime(),vehicle.getGpstime(),vehicle.getVhcofflinemin()))
			// {
			// if (vehicle.getSpeed() > 0) {
			// flag = true;
			// }
			// } else {
			// flag = false;
			// }
			return "{ \"carId\": \"" + ve.getId() + "\", \"success\":" + true + ",\"flag\":" + vehicle.isState2() + "}";
		}

	}

	public boolean verifyCarTime(Long recvtime, Long gpstime, int vhcofflinemin) {
		int vff = vhcofflinemin * 60 * 1000;
		// int rtime = Integer.valueOf(recvtime);
		// int vtime = Integer.valueOf(gpstime);
		Long ct = System.currentTimeMillis();
		int cha1 = ct.intValue() - recvtime.intValue();
		if (Math.abs(cha1) < vff) {
			int cha = recvtime.intValue() - gpstime.intValue();
			if (Math.abs(cha) < vff) {
				return true;
			}
		}

		return false;
	}

	@ResponseBody
	@RequestMapping("/getAllGps")
	public List<Vehicle> getAllGps(String cid) {
		List<Vehicle> listGps = new ArrayList<Vehicle>();
		HashMap map = new HashMap();
		// map.put("gid", "3229636");
		map.put("gid", cid);
		List<Vehicle> list = vehicleService.getAll(map);
		for (Vehicle vehicle : list) {
			if (vehicle.getvKey().isEmpty()) {
				Vehicle vehicleInfo  =new Vehicle();
				// 判断服务器时间和GPS时间，得出是否在线
				vehicle.setAv(vehicleInfo.getAv());
				vehicle.setRecvtime1("");
				vehicle.setGpstime1("");
				vehicle.setVhcofflinemin(0);
//				vehicle.setState(0.0);
//				vehicle.setSpeed(0);
//				vehicle.setState2(0);
			} else {
				Vehicle vehicleInfo = getVehicleInfo(vehicle.getId(), vehicle.getvKey());
				// 判断服务器时间和GPS时间，得出是否在线
				vehicle.setAv(vehicleInfo.getAv());
				Date date = new Date(vehicleInfo.getRecvtime());
				String recvtime = DateUtil.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM);
				Date date1 = new Date(vehicleInfo.getGpstime());
				String gpstime = DateUtil.DateToString(date1, DateStyle.YYYY_MM_DD_HH_MM);
				vehicle.setRecvtime1(recvtime);
				vehicle.setGpstime1(gpstime);
				vehicle.setVhcofflinemin(vehicleInfo.getVhcofflinemin());
				vehicle.setState(vehicleInfo.getState());
				vehicle.setSpeed(vehicleInfo.getSpeed());
				vehicle.setState2(vehicleInfo.isState2());
			}
			listGps.add(vehicle);
		}
		return list;
	}

	private Vehicle getVehicleInfo(int vid, String vKey) {
		// 调用查车平台接口返回单位车辆信息
		Vehicle vehicle = new Vehicle();
		try {

			String url = "http://219.148.86.147:89/gpsonline/GPSAPI?version=1&method=loadLocation&vid=" + vid + "&vKey=" + vKey;
			System.out.println(url);
			HttpClientUtil httpClientUtil = new HttpClientUtil();
			String httpOrgCreateTestRtn = httpClientUtil.httpGetRequest(url);
			// 解析返回结构，保存数据
			JSONObject object = JSONObject.fromObject(httpOrgCreateTestRtn);
			String json = object.getString("locs");
			JSONArray myJsonArray = JSONArray.fromObject(json);
			// for (int i = 0; i < myJsonArray.size(); i++) {
			// 获取每一个JsonObject对象
			JSONObject myjObject = myJsonArray.getJSONObject(0);
			// 获取数组中对象的对象
			// Long time = myjObject.getLong("recvtime");
			// Date date = new Date(time);
			// String recvtime = DateUtil.DateToString(date, DateStyle.YYYY_MM_DD_HH_MM);
			// Long time1 = myjObject.getLong("gpstime");
			// Date date1 = new Date(time1);
			// String gpstime = DateUtil.DateToString(date1, DateStyle.YYYY_MM_DD_HH_MM);
			int av = 0;
			String sav = myjObject.getString("av");
			if (sav.trim().length() > 0) {
				av = Integer.parseInt(sav);
			}
			vehicle.setAv(av);
			vehicle.setRecvtime(myjObject.getLong("recvtime"));
			vehicle.setGpstime(myjObject.getLong("gpstime"));
			vehicle.setState(myjObject.getString("state"));
			vehicle.setVhcofflinemin(myjObject.getInt("vhcofflinemin"));
			vehicle.setSpeed(myjObject.getDouble("speed"));

			vehicle.setState2(verifyCarTime(vehicle.getRecvtime(), vehicle.getGpstime(), vehicle.getVhcofflinemin()));

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return vehicle;
	}

	@ResponseBody
	@RequestMapping(value = "/syncDW")
	public JsonResult syncDW() {
		// boolean groupDB = getClient2db();
		// boolean vehicelDB = getVehicle2db("");
		// http://hbslkj.com:89/gpsonline/GPSAPI?version=1&method=loginSystem&name=hdjzljtb&pwd=123456
		// String uid = "2328128";
		// String uKey = "e9a6e08b51a301def130cdfb12169642";
		/// 147服务器
		String uid = "2340611";
		String uKey = "e389b5ca2b76e587a7f3d2c0180c0e63";
		boolean bel = getVehicle2Exlive(uid, uKey);

		return new JsonResult(bel, "");
	}

	@ResponseBody
	@RequestMapping(value = "/editVeh")
	public JsonResult editVeh() {

		return new JsonResult(false, "");
	}

	private boolean getClient2db() {
		// 调用接口获取企业平台数据，用户登录初始化，获取exkey
		ExliveAPI exliveAPI = new ExliveAPI("hdjianzhu", "123456");

		// 返回客户数据
		String clientString = exliveAPI.getClient();
		// 解析返回数据
		JSONObject object = JSONObject.fromObject(clientString);
		String json = object.getString("data");
		JSONArray myJsonArray = JSONArray.fromObject(json);
		for (int i = 0; i < myJsonArray.size(); i++) {
			// 获取每一个JsonObject对象
			JSONObject myjObject = myJsonArray.getJSONObject(i);
			// 获取数组中对象的对象
			int id = myjObject.getInt("id");
			String name = myjObject.getString("compyname");
			Group group = new Group();
			group.setId(id);
			group.setName(name);
			groupService.save(group);

		}
		return false;
	}

	private boolean getVehicle2db(String ClientId) {
		// 调用接口获取企业平台数据，用户登录初始化，获取exkey
		ExliveAPI exliveAPI = new ExliveAPI("hdjianzhu", "123456");

		// 返回车辆数据字符串
		String url = "";
		// String url ="";
		String clientString = exliveAPI.getVehicle(url);

		// 解析返回数据
		try {
			JSONObject object = JSONObject.fromObject(clientString);
			String json = object.getString("data");
			JSONArray myJsonArray = JSONArray.fromObject(json);
			for (int i = 0; i < myJsonArray.size(); i++) {
				// 获取每一个JsonObject对象
				JSONObject myjObject = myJsonArray.getJSONObject(i);
				// 获取数组中对象的对象
				Vehicle vehicle = new Vehicle();
				vehicle.setId(myjObject.getInt("id"));
				vehicle.setCarName(myjObject.getString("carName"));
				// vehicle.setOverduetime(myjObject.getString("overduetime"));
				vehicle.setSim(myjObject.getString("sim"));
				vehicle.setVedio(myjObject.getString("vedio"));
				vehicle.setNumber(myjObject.getString("number"));
				vehicle.setGprs(myjObject.getString("gprs"));
				vehicle.setColorId(myjObject.getInt("colorId"));
				vehicle.setCpys(myjObject.getInt("cpys"));
				vehicle.setSccj(myjObject.getString("sccj"));
				vehicle.setMobileId(myjObject.getInt("mobileId"));
				vehicle.setVehicleTypeId(myjObject.getInt("vehicleTypeId"));
				vehicle.setAv(myjObject.getInt("av"));

				vehicle.setClientID(myjObject.getInt("clientID"));
				// System.out.println("---------------" + vehicle.toString());
				vehicleService.carToDB(vehicle);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// long类型转换为String类型
	// currentTime要转换的long类型的时间
	// formatType要转换的string类型的时间格式
	public static String longToString(long currentTime, String formatType) throws ParseException {
		Date date = longToDate(currentTime, formatType); // long类型转成Date类型
		String strTime = dateToString(date, formatType); // date类型转成String
		return strTime;

	}

	// string类型转换为date类型
	// strTime要转换的string类型的时间，formatType要转换的格式yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日
	// HH时mm分ss秒，
	// strTime的时间格式必须要与formatType的时间格式相同
	public static Date stringToDate(String strTime, String formatType) throws ParseException {
		SimpleDateFormat formatter = new SimpleDateFormat(formatType);
		Date date = null;
		date = formatter.parse(strTime);
		return date;
	}

	// date类型转换为String类型
	// formatType格式为yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日 HH时mm分ss秒
	// data Date类型的时间
	public static String dateToString(Date data, String formatType) {
		return new SimpleDateFormat(formatType).format(data);
	}

	// long转换为Date类型
	// currentTime要转换的long类型的时间
	// formatType要转换的时间格式yyyy-MM-dd HH:mm:ss//yyyy年MM月dd日 HH时mm分ss秒
	public static Date longToDate(long currentTime, String formatType) throws ParseException {
		Date dateOld = new Date(currentTime); // 根据long类型的毫秒数生命一个date类型的时间
		String sDateTime = dateToString(dateOld, formatType); // 把date类型的时间转换为string
		Date date = stringToDate(sDateTime, formatType); // 把String类型转换为Date类型
		return date;
	}

	/**
	 * exlive平台动态数据接口 获取分组车辆数据
	 */
	public boolean getVehicle2Exlive(String uid, String uKey) {
		// 调用查车平台接口返回单位车辆信息
		try {

			String url = "http://219.148.86.147:89/gpsonline/GPSAPI?version=1&method=loadVehicles&uid=" + uid + "&uKey=" + uKey;
			HttpClientUtil httpClientUtil = new HttpClientUtil();
			String httpOrgCreateTestRtn = httpClientUtil.httpGetRequest(url);
			// 解析返回结构，保存数据
			JSONObject object = JSONObject.fromObject(httpOrgCreateTestRtn);
			String json = object.getString("groups");
			JSONArray myJsonArray = JSONArray.fromObject(json);
			for (int i = 0; i < myJsonArray.size(); i++) {
				// 获取每一个JsonObject对象
				JSONObject myjObject = myJsonArray.getJSONObject(i);
				// 获取数组中对象的对象
				int id = myjObject.getInt("id");
				String name = myjObject.getString("name");
				Group group = new Group();
				group.setId(id);
				group.setName(name);
				groupService.save(group);
				String json1 = myjObject.getString("vehicles");
				JSONArray myJsonArray1 = JSONArray.fromObject(json1);
				for (int j = 0; j < myJsonArray1.size(); j++) {
					JSONObject myjObject1 = myJsonArray1.getJSONObject(j);
					// 获取数组中对象的对象

					Vehicle vehicle = new Vehicle();
					vehicle.setGroup_id(Integer.valueOf(id));
					vehicle.setId(myjObject1.getInt("id"));
					vehicle.setvKey(myjObject1.getString("vKey"));
					vehicle.setGroup_id(group.getId());

					// vehicle.setCarName(myjObject1.getString("name").trim());

					// 保存数据
					// vehicle2DB(vehicle);
					String names = myjObject1.getString("name").trim();
					String carNames = "";
					String selfNumber = "";
					if (names.indexOf("冀") != -1) {
						carNames = names.substring(names.length() - 7, names.length());
						selfNumber = names.replace(carNames, "");
					} else {
						carNames = names;
						selfNumber = names;
					}
					vehicle.setCarName(carNames);
					vehicle.setSelfNumber(selfNumber);
					vehicle.setGprs(myjObject1.getString("gprs"));
					vehicleService.carToDB(vehicle);
				}
			}
			return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}

	}

	public static void main(String[] args) {
		String names = "清运车铲车01";
		String carName = names.substring(names.length() - 7, names.length());
		String selfNumber = names.replace(carName, "");
		// System.out.println(selfNumber+"==="+carName);
		if (names.indexOf("冀") != -1) {
			carName = names.substring(names.length() - 7, names.length());
			selfNumber = names.replace(carName, "");
			System.out.println(selfNumber + "=2222==" + carName);
		} else {
			carName = names;
			selfNumber = names;
			System.out.println(selfNumber + "==333=" + carName);
		}
	}

	private void vehicle2DB(Vehicle vehicle) {

		ExliveAPI exliveAPI = new ExliveAPI("hdjianzhu", "123456");
		// 返回车辆数据字符串
		String url = "";
		String carName = vehicle.getCarName();
		if (carName.length() < 6) {
			return;
		}
		String clientString = exliveAPI.getVehicle("&vehicle.carName=" + carName.substring(carName.length() - 6, carName.length()));
		if (clientString.equals("")) {
			return;
		}
		// 解析返回数据
		JSONObject object = JSONObject.fromObject(clientString);
		String json = object.getString("data");
		JSONArray myJsonArray = JSONArray.fromObject(json);
		// 获取每一个JsonObject对象
		if (myJsonArray.size() <= 0) {
			return;
		}
		JSONObject myjObject = myJsonArray.getJSONObject(0);
		// 获取数组中对象的对象
		// vehicle.setId(myjObject.getInt("id"));
		// vehicle.setOverduetime(myjObject.getString("overduetime"));
		String names = myjObject.getString("carName").trim();
		String carNames = "";
		String selfNumber = "";
		if (names.indexOf("冀") != -1) {
			carNames = names.substring(names.length() - 7, names.length());
			selfNumber = names.replace(carNames, "");
		} else {
			carNames = names;
			selfNumber = names;
		}
		vehicle.setCarName(carNames);
		vehicle.setSelfNumber(selfNumber);
		vehicle.setSim(myjObject.getString("sim"));
		vehicle.setVedio(myjObject.getString("vedio"));
		vehicle.setNumber(myjObject.getString("number"));
		vehicle.setGprs(myjObject.getString("gprs"));
		vehicle.setColorId(myjObject.getInt("colorId"));
		vehicle.setCpys(myjObject.getInt("cpys"));
		vehicle.setSccj(myjObject.getString("sccj"));
		vehicle.setMobileId(myjObject.getInt("mobileId"));
		vehicle.setVehicleTypeId(myjObject.getInt("vehicleTypeId"));
		vehicle.setClientID(myjObject.getInt("clientID"));
		vehicle.setRemark(myjObject.getString("remark"));

		// vehicle.setAv(myjObject.getInt("av"));
		//
		// Long time = Long.valueOf(myjObject.getInt("recvtime"));
		// Date date = new Date(time);
		// String recvtime=
		// DateUtil.DateToString(date,DateStyle.YYYY_MM_DD_HH_MM);
		// vehicle.setRecvtime(recvtime);
		//
		// Long time1 = Long.valueOf(myjObject.getInt("gpstime"));
		// Date date1 = new Date(time1);
		// String gpstime=
		// DateUtil.DateToString(date1,DateStyle.YYYY_MM_DD_HH_MM);
		// vehicle.setGpstime(gpstime);
		vehicleService.carToDB(vehicle);
	}
}
