package cn.slkj.jzlj.controller;
/*
 *获取进度 
 */
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

public class FileUploadListener implements ProgressListener {  
	  
    final HttpSession hs;  
  
    public FileUploadListener(HttpSession hs) {  
        this.hs = hs;  
    }  
  
    @Override  
    public void update(long pBytesRead, long pContentLength, int pItems) {  
        //pBytesRead 已经上传多少字节  
        //pContentLength 一共多少字节  
        //pItems 正在上传第几个文件  
        ProcessInfo pri = new ProcessInfo();  
        pri.itemNum = pItems;  
        pri.readSize = pBytesRead;  
        pri.totalSize = pContentLength;  
        pri.show = Math.round(new Float(pBytesRead) / new Float(pContentLength)*100)+" %";  
        pri.rate = Math.round(new Float(pBytesRead) / new Float(pContentLength)*100);  
        hs.setAttribute("proInfo", pri);  
    }  
  
    public class ProcessInfo{  
        public long totalSize = 1;  
        public long readSize = 0;  
        public String show = "";  
        public int itemNum = 0;  
        public int rate = 0;  
    }  
  
}  
