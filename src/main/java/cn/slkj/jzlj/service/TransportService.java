package cn.slkj.jzlj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import javax.servlet.ServletOutputStream;
import cn.slkj.jzlj.model.Loan;
import cn.slkj.jzlj.model.Transport;

public interface TransportService {
    List<Transport> getAll(HashMap<String, Object> map, PageBounds pageBounds);

    List<Transport> getList(HashMap<String, Object> map);

    int save(HashMap<String, Object> map);

    int approved(HashMap<String, Object> hashMap);

    int approveds(HashMap<String, Object> hashMap);

    List<Loan> getAllLoan(HashMap<String, Object> map, PageBounds pageBounds);

    int saveLoan(HashMap<String, Object> map);

    public void exportExcel(HashMap<String, Object> map, String[] titles, ServletOutputStream outputStream);
    
    List<Map<String, String>> getCountZZ();
}
