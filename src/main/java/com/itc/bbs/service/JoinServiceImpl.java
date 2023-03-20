package com.itc.bbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itc.bbs.domain.JoinVO;
import com.itc.bbs.persistence.JoinDAO;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	JoinDAO dao;
	
	@Override
	public int overlapIdCheck(String userId) throws Exception {
		return dao.overlapIdCheck(userId);
	}
	
	@Override
	public int addMember(JoinVO vo) throws Exception {
		return dao.addMember(vo);
	}
}
