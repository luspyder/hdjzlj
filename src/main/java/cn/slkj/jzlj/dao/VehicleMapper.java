package cn.slkj.jzlj.dao;

import cn.slkj.jzlj.model.Vehicle;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public interface VehicleMapper {
    List<Vehicle> getAll(HashMap<String, Object> map);

    List<Vehicle> getAllTree();

    int carToDB(Vehicle vehicle);

	Vehicle queryOne(HashMap<String, Object> map);

    List<Vehicle> getList(HashMap<String, Object> hashMap, PageBounds pageBounds);
}
