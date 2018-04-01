package cn.slkj.jzlj.dao;

import cn.slkj.jzlj.model.Module;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface ModuleMapper {

	public List<Module> getAll(HashMap<String, Object> map);

	public List<Module> getModuleByRoleId(HashMap<String, Object> map);

	public int saveRoleRes(HashMap<String, Object> map);

	public int deleteRoleRes(HashMap<String, Object> map);

}
