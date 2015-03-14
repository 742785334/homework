package edu.homework.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homework.common.PageConstants;
import edu.homework.common.vo.PageRequest;
import edu.homework.common.vo.PageResult;
import edu.homework.dao.RoleDao;
import edu.homework.dao.UserDao;
import edu.homework.model.Role;
import edu.homework.model.User;

@Service
public class UserService {

	@Autowired 
    private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private PageConstants pageConstants;
	
	public PageResult<User> pageResult(User search,int currentPage){
		
		if(search==null)
			search=new User();
		
		if(currentPage==0)
			currentPage=1;
		
		PageRequest<User> request=new PageRequest<User>(search,currentPage,pageConstants.getPageMax());
		List<User> list=userDao.find(request.getHql(), request.getOffset(),request.getMax());
		int allPage=userDao.getCount(request.getHql());
		PageResult<User> result=new PageResult<User>(list,allPage,currentPage,request.getMax());
		
		return result;
		
		
	}
	
	public void update(User user){
		
		userDao.update(user);
		
	}
	
	public void add(User user){
		
		 userDao.save(user);
		 
		 Role role=new Role();
		 role.setUser(user);
		 role.setRoleName(user.getUserMainRole());
		 if(user.getUserAuxiliaryRole()!=null&&user.getUserAuxiliaryRole()!="")
			 role.setAuxiliaryRole(user.getUserAuxiliaryRole());
			 
		 roleDao.save(role);
		 
	}
	
	public void delete(User user){
		
		userDao.delete(user);
		
	}
	
	public User load(String userName){
		
	  return	userDao.load(userName);
	}
	
	public User get(String userName){
		
		return userDao.get(userName);
		
	}
	
}
