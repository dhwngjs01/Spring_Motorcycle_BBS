package com.itc.bbs.persistence;

import com.itc.bbs.domain.JoinVO;

public interface JoinDAO {
	public int overlapIdCheck(String userId) throws Exception;
	public int addMember(JoinVO vo) throws Exception;
}
