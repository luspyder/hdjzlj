package cn.slkj.jzlj.dao;

import cn.slkj.jzlj.model.Loan;
import cn.slkj.jzlj.model.Transport;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public interface TransportMapper {
    List<Transport> getAll(HashMap<String, Object> map, PageBounds pageBounds);

    List<Transport> getList(HashMap<String, Object> map);

    int save(HashMap<String, Object> map);

    int approved(HashMap<String, Object> hashMap);

    int approveds(HashMap<String, Object> hashMap);

    List<Loan> getAllLoan(HashMap<String, Object> map, PageBounds pageBounds);

    int saveLoan(HashMap<String, Object> map);
    List<Map<String, String>> getCountZZ();
    
    List<Transport> getListByCar(HashMap<String, Object> map);
}
