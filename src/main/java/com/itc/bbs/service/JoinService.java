package com.itc.bbs.service;

import com.itc.bbs.domain.JoinVO;

public interface JoinService {
	public int overlapIdCheck(String userId) throws Exception;
	public int addMember(JoinVO vo) throws Exception;
}
