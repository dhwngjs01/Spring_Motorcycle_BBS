package com.itc.bbs.persistence;

import com.itc.bbs.domain.LoginVO;

public interface LoginDAO {
	public LoginVO loginValidCheck(LoginVO vo) throws Exception;
}
