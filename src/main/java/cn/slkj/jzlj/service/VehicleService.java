package cn.slkj.jzlj.service;

import cn.slkj.jzlj.model.Vehicle;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import java.util.HashMap;
import java.util.List;

/**
 * 车辆信息
 *
 * @author maxh
 */
public interface VehicleService {

    List<Vehicle> getAll(HashMap<String, Object> map);

    List<Vehicle> getAllTree();

    int carToDB(Vehicle vehicle);
    
    Vehicle queryOne(HashMap<String, Object> map);

    List<Vehicle> getList(HashMap<String, Object> hashMap, PageBounds pageBounds);
}
