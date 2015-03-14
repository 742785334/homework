package edu.homework.model;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tb_user")
public class User implements Serializable {

	private String userName;
	private String userPassword;
	private String userRealName;
	private String userDepartment;
	private String userArrangeClass;
	private String userMainRole;
	private String userAuxiliaryRole;
	private String userManageScope;
	private String userOnlineTimeLength;
	private String userFreeTime;
	private String userOrderNumber;
	private String userIpAddress;
	private String userAccessControl;
	private String userInsideMailCapacity;
	private String userPersonFileCapacity;
	private String userBroadcastAuthority;
    private Set<Role> roles;
    
    @OneToMany(mappedBy="user",cascade=CascadeType.ALL)    
	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public void setUserName(String userName) {

		this.userName = userName;

	}

	@Id
	@Column(name = "user_name", length = 20, nullable = false)
	public String getUserName() {

		return userName;
	}

	@Column(name = "user_real_name", length = 50, nullable = true)
	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	@Column(name = "user_department", length = 50, nullable = true)
	public String getUserDepartment() {
		return userDepartment;
	}

	public void setUserDepartment(String userDepartment) {
		this.userDepartment = userDepartment;
	}

	@Column(name = "user_arrange_class", length = 20, nullable = true)
	public String getUserArrangeClass() {
		return userArrangeClass;
	}

	public void setUserArrangeClass(String userArrangeClass) {
		this.userArrangeClass = userArrangeClass;
	}

	@Column(name = "user_main_role", length = 20, nullable = true)
	public String getUserMainRole() {
		return userMainRole;
	}

	public void setUserMainRole(String userMainRole) {
		this.userMainRole = userMainRole;
	}

	@Column(name = "user_manage_scope", length = 20, nullable = true)
	public String getUserManageScope() {
		return userManageScope;
	}

	public void setUserManageScope(String userManageScope) {
		this.userManageScope = userManageScope;
	}

	@Column(name = "user_online_time_length", length = 30, nullable = true)
	public String getUserOnlineTimeLength() {
		return userOnlineTimeLength;
	}

	public void setUserOnlineTimeLength(String userOnlineTimeLength) {
		this.userOnlineTimeLength = userOnlineTimeLength;
	}

	@Column(name = "user_free_time", length = 30, nullable = true)
	public String getUserFreeTime() {
		return userFreeTime;
	}

	public void setUserFreeTime(String userFreeTime) {
		this.userFreeTime = userFreeTime;
	}

	@Column(name = "user_password", length = 20, nullable = true)
	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "user_auxiliary_role")
	public String getUserAuxiliaryRole() {
		return userAuxiliaryRole;
	}

	public void setUserAuxiliaryRole(String userAuxiliaryRole) {
		this.userAuxiliaryRole = userAuxiliaryRole;
	}
  
	@Column(name="user_order_number")
	public String getUserOrderNumber() {
		return userOrderNumber;
	}
   
	public void setUserOrderNumber(String userOrderNumber) {
		this.userOrderNumber = userOrderNumber;
	}
     
	@Column(name="user_ip_address")
	public String getUserIpAddress() {
		return userIpAddress;
	}

	public void setUserIpAddress(String userIpAddress) {
		this.userIpAddress = userIpAddress;
	}

	@Column(name="user_access_control")
	public String getUserAccessControl() {
		return userAccessControl;
	}

	public void setUserAccessControl(String userAccessControl) {
		this.userAccessControl = userAccessControl;
	}
 
	@Column(name="user_inside_mail_capacity")
	String getUserInsideMailCapacity() {
		return userInsideMailCapacity;
	}

	public void setUserInsideMailCapacity(String userInsideMailCapacity) {
		this.userInsideMailCapacity = userInsideMailCapacity;
	}
    
	@Column(name="user_broadcast_authority")
	public String getUserBroadcastAuthority() {
		return userBroadcastAuthority;
	}

	public void setUserBroadcastAuthority(String userBroadcastAuthority) {
		this.userBroadcastAuthority = userBroadcastAuthority;
	}

	@Column(name="user_person_file_capacity")
	public String getUserPersonFileCapacity() {
		return userPersonFileCapacity;
	}

	public void setUserPersonFileCapacity(String userPersonFileCapacity) {
		this.userPersonFileCapacity = userPersonFileCapacity;
	}

}
