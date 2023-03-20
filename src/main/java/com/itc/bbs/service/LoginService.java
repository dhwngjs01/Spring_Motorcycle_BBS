package com.itc.bbs.service;

import com.itc.bbs.domain.LoginVO;

public interface LoginService {
	public LoginVO loginValidCheck(LoginVO vo) throws Exception;
}
