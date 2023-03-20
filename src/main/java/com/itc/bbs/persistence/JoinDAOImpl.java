package com.itc.bbs.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itc.bbs.domain.JoinVO;

@Repository
public class JoinDAOImpl implements JoinDAO {
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "bbs.mapper.joinMapper";
	
	@Override
	public int overlapIdCheck(String userId) throws Exception {
		return sql.selectOne(namespace + ".overlapIdCheck", userId);
	}
	
	@Override
	public int addMember(JoinVO vo) throws Exception {
		return sql.insert(namespace + ".addMember", vo);
	}
}
