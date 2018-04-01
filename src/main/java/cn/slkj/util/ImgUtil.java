package cn.slkj.util;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.slkj.util.javaUtil.StringUtil;

@Controller
@RequestMapping("/showPicture")
public class ImgUtil {
	private String	picUrl	= "D:\\carimg\\";

	// 根据请求的路径中的参数id,从本地磁盘中读取图片，picUrl是从配置文件中读取出来的
	@RequestMapping("/tofindPic/{carNumber}/{photoName}")
	public void picToJSP(@PathVariable String carNumber, @PathVariable String photoName,
			HttpServletRequest request, HttpServletResponse response) {


		if(StringUtil.isEmpty(photoName)){
			return;
		}
		FileInputStream in;
		response.setContentType("application/octet-stream;charset=UTF-8");
		try {
			// 图片读取路径
			in = new FileInputStream(picUrl + carNumber + "\\" + photoName + ".png");
			int i = in.available();
			byte[] data = new byte[i];
			in.read(data);
			in.close();

			// 写图片
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(data);
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
