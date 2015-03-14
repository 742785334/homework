package edu.homework.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homework.dao.RoleDao;
import edu.homework.model.Role;

@Service
public class RoleService {

	@Autowired
	private RoleDao roleDao;
	
	public List<Map<String,Object>> getRoleRelaNumber(){
		String sql="select role_name,count(user_name) user_number,count(auxiliary_role) auxiliary_role_number,count(ban_login_flag) ban_login_number from tb_role group by role_name";
		List<Map<String,Object>> listMap=roleDao.getListForGroupBy(sql);
		Iterator<Map<String,Object>> iterator=listMap.iterator();
		
		while(iterator.hasNext()){
			Map<String,Object> m=iterator.next();
			m.put("user_number",String.format("%03d",Integer.valueOf(String.valueOf(m.get("user_number")))));
			m.put("auxiliary_role_number", String.format("%03d",Integer.valueOf(String.valueOf(m.get("auxiliary_role_number")))));
			m.put("ban_login_number",String.format("%03d",Integer.valueOf(String.valueOf(m.get("ban_login_number")))));
				
		}
		
		
		return listMap;
		
	}
	
   public void add(Role role){
	   
	   roleDao.save(role);
	   
   }

   public Role find(String  roleName){
	   
	   List<Role> roles=roleDao.loadAll();
	   if(roles==null)
		   return null;
	   for(Role role:roles)
		   if(roleName.equals(role.getRoleName()))
			  return role; 
	   
	   return null;
	   
   }	
   
}
