package cn.slkj.jzlj.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.slkj.util.javaUtil.StringUtil;
import cn.slkj.util.javaUtil.date.DateStyle;
import cn.slkj.util.javaUtil.date.DateUtil;

@Controller
@RequestMapping("/download")
public class Download {
	// 设置图片访问路径
	private String provePicUrl = "D:\\fileupload\\";

	// 这个path就是gcdjList中的showImg方法中的data.photo（即图片名）
	@RequestMapping("/qyzsgy/{path}")
	public void provePicToJSP(@PathVariable String path,
			HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		if (StringUtil.isEmpty(path)) {
			return;
		}
		String newpath = new String(path.getBytes("iso-8859-1"), "utf-8");
		FileInputStream in;
		response.setContentType("application/octet-stream;charset=UTF-8");
		// 解决中文乱码问题
		response.setHeader("Content-Disposition", "attachment; newpath="
				+ java.net.URLEncoder.encode(newpath, "UTF-8"));
		try {
			// 拼接图片读取路径，图片路径+图片名+图片后缀
			// 读取图片名字只能为英文和数字，不能是汉字，要不然就会乱码，系统会读取不到
			in = new FileInputStream(provePicUrl + newpath + ".jpg");
			int i = in.available();
			byte[] data = new byte[i];
			in.read(data);
			in.close();
			// 以流的形式将图片写入到http中
			OutputStream outputStream = new BufferedOutputStream(
					response.getOutputStream());
			outputStream.write(data);
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}

	}

	@RequestMapping(value = "/export", method = RequestMethod.GET)
	public ResponseEntity<byte[]> download(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String text = "内容neirong123";
		String date = DateUtil.DateToString(new Date(),
				DateStyle.YYYY_MM_DD_HH_MM);
		String fileName = date + ".xls";
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentDispositionFormData("attachment",
				new String(fileName.getBytes("gb2312"), "iso8859-1"));
		return new ResponseEntity<byte[]>(text.getBytes(), headers,
				HttpStatus.CREATED);
	}

	private File getDictionaryFile(String imgPath) {
		return new File(imgPath);
	}
}
