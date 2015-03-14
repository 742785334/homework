package edu.homework.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;



@Entity
@Table(name = "tb_role")
public class Role {
   
	private String roleId;
	private String roleName;
	private String userName;
	private String banLoginFlag;
	private String auxiliaryRole;
	private User user;

	@Id 
	@GeneratedValue(generator = "paymentableGenerator")    
	@GenericGenerator(name = "paymentableGenerator", strategy = "guid")   
	@Column(name="role_id")
    public String getRoldId() {
		return roleId;
	}

	public void setRoldId(String roleId) {
		this.roleId = roleId;
	}

	@Column(name="user_name",insertable=false,updatable=false)
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "role_name")
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

    @Column(name="ban_login_flag")
	public String getBanLoginFlag() {
		return banLoginFlag;
	}

	public void setBanLoginFlag(String banLoginFlag) {
		this.banLoginFlag = banLoginFlag;
	}
	@ManyToOne
	@JoinColumn(name="user_name")
    public User getUser() {
			return user;
		
   }
	    
	public void setUser(User user) {
		this.user = user;
	}

	@Column(name="auxiliary_role",nullable=true)
	public String getAuxiliaryRole() {
		return auxiliaryRole;
	}

	public void setAuxiliaryRole(String auxiliaryRole) {
		this.auxiliaryRole = auxiliaryRole;
	}
     

}
