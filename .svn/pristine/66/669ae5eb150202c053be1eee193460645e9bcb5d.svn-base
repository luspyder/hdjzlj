package cn.slkj.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.slkj.util.javaUtil.FileUtil;

public class Upload {
	@RequestMapping(value = "firstUpload", method = RequestMethod.POST)
	@ResponseBody
	public Object firstUpload(HttpServletRequest request, UploadVo vo) {
		boolean flag = false;
		// errorMessage：上传失败，则是错误信息；上传成功，则提示成功以及显示文件上传后的地址
		String errorMessage = "";
		try {
			String realPath = "D:/sloaFile/prove" ;
			FileUtil.save(vo.getImgFile().getInputStream(), new File(realPath , vo.getImgFile().getOriginalFilename()));
		} catch (Exception e) {
			errorMessage = "新增文件失败!";
		}
		if (flag) {
			// 上传成功，返回到前台，调用uploadSucced()这个方法
			return "<script>window.parent.uploadSucced('" + errorMessage + "');</script>";
		}
		// 上传失败，返回到前台，调用uploadFailed()这个方法
		return "<script>window.parent.uploadFailed('" + errorMessage + "');</script>";
	}
}
