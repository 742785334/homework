package edu.homework.model;

import java.io.Serializable;

public class RoleKey implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String roleName;
	private String userName;

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
 
	public RoleKey(){
		
		
	}
	
	public int hashCode(){
		
		return this.roleName.hashCode()*this.userName.hashCode();
	}
	
	public boolean equals(Object obj){
		
		 if(this==obj)
			 return true;
		 
		 if(!(obj instanceof RoleKey))
			 return false;
		 
		 RoleKey roleKey=(RoleKey)obj;
		 
		 if(this.roleName.equals(roleKey.getRoleName())&&this.userName.equals(roleKey.getUserName()))
			 return true;
		 
		 return false;
				 
		
		
	}
	
	
	
}
