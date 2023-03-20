package com.itc.bbs.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itc.bbs.domain.LoginVO;

@Repository
public class LoginDAOImpl implements LoginDAO {
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "bbs.mapper.loginMapper";
	
	@Override
	public LoginVO loginValidCheck(LoginVO vo) throws Exception {
		return sql.selectOne(namespace+".loginValidCheck", vo);
	}
}
