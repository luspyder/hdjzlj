package cn.slkj.util;

public enum PrimaryGenerater {
	DEFAULT {
		private static final String SERIAL_NUMBER = "%04d";

		public synchronized String generaterNextNumber(String sno) {
			int prevNo = 1;
			if (null != sno && sno.length() == 4) {
				if (sno.matches("^\\d+$")) {
					prevNo = Integer.valueOf(sno.substring(0, 4)) + 1;
				} else {
					throw new IllegalArgumentException(String.format("非法参数:%s", sno));
				}
			}
			return String.format("%s" + SERIAL_NUMBER, "", prevNo);
		}
	};

	/**
	 * 生成下一个编号
	 */
	public String generaterNextNumber(String sno) {
		throw new AbstractMethodError();
	}

	public static void main(String[] args) {
		String no = null;
		for (int i = 0; i < 10; i++) {
			no = PrimaryGenerater.DEFAULT.generaterNextNumber(no);
			System.out.println(no);
		}
	}
}