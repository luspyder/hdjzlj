package cn.slkj.util;

/**
 * 
 * @ClassName: LocationUtil
 * @Description: 处理行政区划编码
 * @author maxh
 * @date 2014年8月5日 上午10:50:48
 *
 */
public class LocationUtil {
	/**
	 * 
	 * @Title: toLocation
	 * @Description: 处理行政区划编码
	 * @param @param location
	 * @param @return 设定文件
	 * @return String 返回类型
	 * @throws
	 */
	public static String toLocation(String location) {
		if (location.indexOf("0000") > 0) {
			return location.replaceAll("0000", "____");
		}
		if (location.indexOf("00") > 0) {
			return location.replaceAll("00", "__");
		}
		return location;
	}

	public static String getPLocation(String location) {
		String l2 = location.substring(location.length() - 2, location.length());
		String l4 = location.substring(location.length() - 4, location.length());
//		System.out.println("l2--" + l2);
//		System.out.println("l4--" + l4);
		if (l2.equals("00")) {
			if (l4.equals("0000")) {
				location =  "0";
			}else{
				location = location.replaceAll(l4, "0000");
			}
			return location;
		} else {
			location = location.replaceAll(l2, "00");
		}
		return location;
	}

	public static void main(String[] args) {
		String s = "130406";
		System.out.println(getPLocation(s));
	}
}
