

package com.amc.service.user.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.amc.common.Search;
import com.amc.service.domain.User;
import com.amc.service.user.UserDAO;

//==> ȸ������ DAO CRUD ����
@Repository("userDAOImpl")
public class UserDAOImpl implements UserDAO {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	///Constructor
	public UserDAOImpl() {
		System.out.println(this.getClass());
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	///Method
	@Override
	public User getId(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("::::getId �� user ::"+user);
		return sqlSession.selectOne("UserMapper.getId",  user);
	}

	@Override
	public String getPhone(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("����� UserDAOImpl �� getPhone �޼���"+user);
		return sqlSession.selectOne("UserMapper.getPhone",  user);
	}

	@Override
	public void addUser(User user) throws Exception {
		System.out.println("addUser DAOImpl �� :" + user);
		/*if(user.getPassword() == null ){
			sqlSession.insert("UserMapper.snsAddUser", user);
		}else{
			sqlSession.insert("UserMapper.addUser", user);
		}*/
		sqlSession.insert("UserMapper.addUser", user);
	}

	@Override
	public User getUser(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}

	@Override
	public List<User> getUserList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("UserMapper.getUserList", search);
	}

	@Override
	public void updateUser(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(":::::: user"+user);
		sqlSession.update("UserMapper.updateUser", user);
	}

	@Override
	public void deleteUser(User user) throws Exception {
		System.out.println("Ż�� �սô� deleteUser daoimpl "+user);
		if(user.getPassword() != null){
			sqlSession.update("UserMapper.deleteUser", user);
		}else{
			sqlSession.update("UserMapper.snsDeleteUser", user);
		}
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}

	@Override
	public User deleteCheck(User user) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(":::::deleteCheck �� user"+user);
		return sqlSession.selectOne("UserMapper.deleteCheck", user);
	}

	@Override
	public int updateUuid(User user) {
		return sqlSession.update("UserMapper.updateUuid",user);
	}

}
