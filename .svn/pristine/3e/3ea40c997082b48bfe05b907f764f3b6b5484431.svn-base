package cn.slkj.jzlj.dao;

import cn.slkj.jzlj.model.Qyz;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Repository
public interface QyzMapper {
	List<Qyz> getAll(HashMap<String, Object> map, PageBounds pageBounds);

	int save(Qyz sfdj);

	int feeOK(HashMap<String, Object> hashMap);

	int handle(HashMap<String, Object> hashMap);

	int zyzhz(HashMap<String, Object> hashMap);

	Qyz selectOne(HashMap<String, Object> hashMap);

	int upload(MultipartFile file, ModelMap model);

	int filesUpload(MultipartFile[] files, ModelMap model);

	int process(HttpServletRequest request, HttpServletResponse response);
	List<Map<String, String>> getCountType();
}
