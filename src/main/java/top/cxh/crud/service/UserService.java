package top.cxh.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.cxh.crud.bean.User;
import top.cxh.crud.bean.UserExample;
import top.cxh.crud.bean.UserExample.Criteria;
import top.cxh.crud.dao.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
	//添加用户
	public void add_user(User user) {
		userMapper.insertSelective(user);
	}
	
	//检查账号是否存在
	public boolean check_user_id(String user_id) {
		UserExample ex = new UserExample();
		Criteria cr = ex.createCriteria();
		cr.andUserIdEqualTo(user_id);
		long count = userMapper.countByExample(ex);
		return count != 0;
	}
	
	//检查密码是否正确
	public List<User> check_password(String user_id,String password) {
		UserExample ex = new UserExample();
		Criteria cr = ex.createCriteria();
		cr.andUserIdEqualTo(user_id);
		cr.andPasswordEqualTo(password);
		return userMapper.selectByExample(ex);
	}
	
}
