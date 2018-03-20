package cn.jxufe.dao;

import cn.jxufe.domain.User;

public interface UserDao {

	int addUser(User user);

	int alteruser(User user);

	int alterpassword(String newPassword, User user);

	User queryUser(String user_name);

	int checkUser(User user);



	int checkUser_name(String user_name);

	User queryUser(int user_id);

	int checkoldPassword(int user_id, String oldPassword);

}
