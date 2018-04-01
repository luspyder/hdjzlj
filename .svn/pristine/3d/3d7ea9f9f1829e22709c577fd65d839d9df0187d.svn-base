package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.slkj.jzlj.dao.VehicleMapper;
import cn.slkj.jzlj.model.Vehicle;
import cn.slkj.jzlj.service.VehicleService;

@Repository
public class VehicleServiceImpl implements VehicleService {
    @Autowired
    private VehicleMapper mapper;

    @Override
    public List<Vehicle> getAll(HashMap<String, Object> map) {
        return mapper.getAll(map);
    }

    @Override
    public List<Vehicle> getAllTree() {
        return mapper.getAllTree();
    }


    @Override
    public int carToDB(Vehicle vehicle) {
        return mapper.carToDB(vehicle);
    }

	@Override
	public Vehicle queryOne(HashMap<String, Object> map) {
		return mapper.queryOne(map);
	}

    public List<Vehicle> getList(HashMap<String, Object> hashMap, PageBounds pageBounds) {
        return mapper.getList(hashMap,pageBounds);
    }

}
