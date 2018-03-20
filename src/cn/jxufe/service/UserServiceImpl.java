package cn.jxufe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.jxufe.dao.UserDao;
import cn.jxufe.domain.User;
@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	public UserDao userDao;
	
	@Override
	public int register(User user){

		return userDao.addUser(user);
	}
	@Override
	public int checkUser(User user){
		return userDao.checkUser(user);
	}
	@Override
	public int checkUser_name(String user_name){
		return userDao.checkUser_name(user_name);
	}
	@Override
	public int checkoldPassword(int user_id,String oldPassword){
	
		return userDao.checkoldPassword(user_id, oldPassword);
	}
	@Override
	public User getUser(String user_name){
		return userDao.queryUser(user_name);
	}
	@Override
	public User getUser(int  user_id){
		return userDao.queryUser(user_id);
	}
	@Override
	public int alterUser(User user){
		return userDao.alteruser(user);
	}
	@Override
	public int alterUserPassword(String newPassword,User user){
		return userDao.alterpassword(newPassword, user);
	}
}
