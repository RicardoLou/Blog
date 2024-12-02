package blog.daoImpl;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.*;

import org.apache.commons.beanutils.BeanUtils;

import blog.dao.TagDao;
import blog.dao.UserDao;
import blog.db.C3P0Connection;
import blog.model.User;
import blog.utils.DBUtils;

/**
 * 用户服务的具体实现类
 *
 */
public class UserDaoImpl implements UserDao {

	private Connection conn;

	public UserDaoImpl() {
		conn = C3P0Connection.getInstance().getConnection();
	}

	private static UserDao instance;

	public static final UserDao getInstance() {
		if (instance == null) {
			try {
				instance = new UserDaoImpl();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return instance;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.UserDao#register(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean register(String username, String password) {
		// todo
		return false;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see blog.daoImpl.UserDao#login(java.lang.String, java.lang.String)
	 */
	@Override
	public User login(String username, String password) {
		User user = null;
		String sql = "select * from t_user where user_name=? and user_password=? ";
		try (PreparedStatement ps = conn.prepareStatement(sql)) {
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_name(rs.getString("user_name"));
				user.setUser_password(rs.getString("user_password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
}
