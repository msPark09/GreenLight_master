package com.gl.master.model.login;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.gl.master.model.MasterDao;

public class LoginDao {
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}


	public HashMap selectOne(LoginVo bean) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("login.selectOne", bean);
	}


}
