package cn.slkj.jzlj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.slkj.jzlj.util.ExportUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import javax.servlet.ServletOutputStream;

import com.github.miemiedev.mybatis.paginator.domain.PageBounds;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import cn.slkj.jzlj.dao.TransportMapper;
import cn.slkj.jzlj.model.Loan;
import cn.slkj.jzlj.model.Transport;
import cn.slkj.jzlj.service.TransportService;
import java.io.IOException;


@Repository
public class TransportServiceImpl implements TransportService {
    @Autowired
    private TransportMapper mapper;

    @Override
    public List<Transport> getAll(HashMap<String, Object> map, PageBounds pageBounds) {
        return mapper.getAll(map, pageBounds);
    }

    @Override
    public List<Transport> getList(HashMap<String, Object> map) {
        return mapper.getList(map);
    }

    @Override
    public int save(HashMap<String, Object> map) {
        return mapper.save(map);
    }

    @Override
    public int approved(HashMap<String, Object> hashMap) {
        return mapper.approved(hashMap);
    }

    @Override
    public int approveds(HashMap<String, Object> hashMap) {
        return mapper.approveds(hashMap);
    }

    @Override
    public List<Loan> getAllLoan(HashMap<String, Object> map, PageBounds pageBounds) {
        return mapper.getAllLoan(map, pageBounds);
    }

    @Override
    public int saveLoan(HashMap<String, Object> map) {
        return mapper.saveLoan(map);
    }

    public void exportExcel(HashMap<String, Object> map, String[] titles, ServletOutputStream outputStream) {
        List<Transport> list = mapper.getList(map);
        // 创建一个workbook 对应一个excel应用文件
        XSSFWorkbook workBook = new XSSFWorkbook();
        // 在workbook中添加一个sheet,对应Excel文件中的sheet
        XSSFSheet sheet = workBook.createSheet("清运证审核汇总");
        ExportUtil exportUtil = new ExportUtil(workBook, sheet);
        XSSFCellStyle headStyle = exportUtil.getHeadStyle();
        XSSFCellStyle bodyStyle = exportUtil.getBodyStyle();
        // 构建表头
        XSSFRow headRow = sheet.createRow(0);
        XSSFCell cell = null;
        for (int i = 0; i < titles.length; i++) {
            cell = headRow.createCell(i);
            cell.setCellStyle(headStyle);
            cell.setCellValue(titles[i]);
        }
        // 构建表体数据
        if (list != null && list.size() > 0) {
            for (int j = 0; j < list.size(); j++) {
                XSSFRow bodyRow = sheet.createRow(j + 1);
                Transport transport = list.get(j);
                //车牌号
                cell = bodyRow.createCell(0);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getCarNumber());

                // 所属单位
                cell = bodyRow.createCell(1);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getGroupName());
                // 工程名称
                cell = bodyRow.createCell(2);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getGcName());
                // 建设单位
                cell = bodyRow.createCell(3);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getJsUnit());
                // 施工地点
                cell = bodyRow.createCell(4);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getSite());
                // 路线
                cell = bodyRow.createCell(5);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getLine());
                // 有效期始
                cell = bodyRow.createCell(6);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getVdTimeStart());
                // 有效期至
                cell = bodyRow.createCell(7);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getVdTimeEend());
                // 办理人
                cell = bodyRow.createCell(8);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getManagers());
                // 办理时间
                cell = bodyRow.createCell(9);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getEntryTime());
                // 审核时间
                cell = bodyRow.createCell(10);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getAvTime());
                // 处置场地
                cell = bodyRow.createCell(11);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getCzArea());
                // 借调车辆ID
                cell = bodyRow.createCell(12);
                cell.setCellStyle(bodyStyle);
                cell.setCellValue(transport.getJdGroupId());
            }
        }
        try {
            workBook.write(outputStream);
            outputStream.flush();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

	@Override
	public List<Map<String, String>> getCountZZ() {
		// TODO Auto-generated method stub
		return mapper.getCountZZ();
	}

}

