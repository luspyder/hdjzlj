package cn.slkj.jzlj.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import cn.slkj.jzlj.model.PCompany;
import cn.slkj.jzlj.model.PPersonal;

@Repository
public interface PeccancyMapper {
	List<PPersonal> getAllPP(HashMap<String, Object> map, PageBounds pageBounds);

	List<PCompany> getAllPC(HashMap<String, Object> map, PageBounds pageBounds);

	int savePPersonal(PPersonal pPersonal);

	int PPHandle(HashMap<String, Object> hashMap);
}
