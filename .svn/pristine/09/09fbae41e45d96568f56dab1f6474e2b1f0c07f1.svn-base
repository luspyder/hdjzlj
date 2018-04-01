package cn.slkj.jzlj.util;

import java.util.List;

import cn.slkj.jzlj.model.FlowNum;

public class FlowHelper {

	/**
	 * 获取流水号
	 * 
	 * @return
	 */
	public String getFileCodeNum(String fileCodeNum) {
		String lastFileCode = "";
		int totalLength = 4;
		int fileCodeLength = fileCodeNum.length();
		for (int i = 0; i < totalLength - fileCodeLength; i++) {
			lastFileCode += "0";
		}
		return lastFileCode + fileCodeNum;
	}

	public static void main(String[] args) throws Exception {
		FlowHelper zbwtCreateFileBarCode = new FlowHelper();
//		String test = zbwtCreateFileBarCode.getFileCodeNum("101");
//		System.out.println(test);

		List<FlowNum> excelName = zbwtCreateFileBarCode.getMaxFlowNum("2016","");
	}

	/**
	 * 根据要求获取流水号 最大的流水号
	 * 
	 * @param year
	 * @param fileType
	 * @return
	 */
	public List<FlowNum> getMaxFlowNum(String year, String fileType) {
		List<FlowNum> flowNums = null;
		return flowNums;

	}

	/**
	 * 如果表中不存在，插入对应的流水号对应值
	 * 
	 * @param flow
	 * @return
	 */
	public boolean addFlowNum(FlowNum flow) {
		boolean flag = false;

		return flag;

	}

	/**
	 * 每次都更新最大流水号最大值
	 * 
	 * @param flow
	 * @return
	 */
	public boolean updateMaxFlowNum(FlowNum flow) {
		boolean flag = false;

		return flag;

	}

}
