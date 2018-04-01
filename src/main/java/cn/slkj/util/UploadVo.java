package cn.slkj.util;

import org.springframework.web.multipart.MultipartFile;

public class UploadVo {

	private MultipartFile	imgFile;	// 文件
	private String			imgName;	// 文件名称
	private String			imgPath;	// 文件路径

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	@Override
	public String toString() {
		return "UploadDemoVo [imgFile=" + imgFile + "]";
	}

	public boolean validateFile() {
		String fileType = this.getImgFile().getContentType();
		boolean flag = false;
//		switch (fileType) {
//		case "jpeg":
//			flag = true;
//			break;
//
//		case "png":
//			flag = true;
//			break;
//		}
		
		if("jpeg".equals(fileType)){
			flag = true;
		}else if("png".equals(fileType)){
			flag = true;
		}
		return flag;
	}

}
