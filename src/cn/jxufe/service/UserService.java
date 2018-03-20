package cn.jxufe.service;

import cn.jxufe.domain.User;

public interface UserService {

	int register(User user);

	int checkUser(User user);

	int checkUser_name(String user_name);

	User getUser(String user_name);

	User getUser(int user_id);

	int alterUser(User user);

	int alterUserPassword(String newPassword, User user);

	int checkoldPassword(int user_id, String oldPassword);

}
