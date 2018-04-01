package cn.slkj.jzlj.model;

import java.io.Serializable;

/**
 * 
 * @ClassName: User
 * @Description: 用户信息
 * @author maxuhui
 * @date 2015年6月14日 下午4:40:24
 *
 */
public class User implements Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private Integer roleId;// 角色id
	private String username;// 登录账号
	private String password;// 登录密码
	private String status = "enabled";// 使用状态
	private String email;// 邮箱
	private String realname;// 真实姓名
	private String sex;// 性别
	private String phone;// 联系电话
	private String address;// 联系地址
	private String create_time;// 创建时间
	private String remark;// 备注
	private String lastTime;// 最后登录时间

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getLastTime() {
		return lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", roleId=" + roleId + ", username=" + username + ", password=" + password + ", status=" + status + ", email=" + email + ", realname=" + realname + ", sex=" + sex + ", phone=" + phone + ", address=" + address + ", create_time=" + create_time + ", remark=" + remark + ", lastTime=" + lastTime + "]";
	}

}
