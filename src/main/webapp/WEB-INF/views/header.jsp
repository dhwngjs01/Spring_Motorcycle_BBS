<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>바이크 판매 장터</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.css" />
	<!-- Glyphicon Font-Awesome -->
	<link rel="stylesheet" href="/resources/font-awesome/css/all.css" />
	<!-- jQuery UI -->
	<link rel="stylesheet" href="/resources/jquery/jquery-ui/jquery-ui.css" />
	<!-- Bootstrap Select Picker -->
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap-select.css" />
	<!-- Custom Style -->
	<link rel="stylesheet" href="/resources/custom/css/style.css" />
	
	<!-- Script  -->
    <!-- jQuery -->
    <script src="/resources/jquery/jquery.js"></script>
    <!-- jQuery UI -->
    <script src="/resources/jquery/jquery-ui/jquery-ui.js"></script>
	<!-- Custom Script -->
    <script src="/resources/custom/js/script.js"></script>
</head>
<body>
	<!-- Bootstrap Container -->
	<div class="container pb-5">
		<div class="jumbotron">
  			<h1 class="text-center">
  				<a href="/" style="font-size:50px !important; font-weight:bold;">바이크 판매 장터</a>
  			</h1>
  			
  			<p class="text-center pb-4 fs-20">누구나 무료로 등록할 수 있습니다 !</p>
  			<div class="d-inline-block col-md-6 justify-content-center">
				<form action="/" method="GET" class="d-flex" role="search">
					<div class="d-inline-block col-md-4">
						<select id="searchCategory" class="form-control selectpicker" name="boardCategory" data-live-search="true">
							<option value="" selected>전체보기</option>
							<c:forEach items="${categoryList}" var="category">
								<option value="${category}" <c:if test="${search.boardCategory eq category}">selected</c:if>>${category}</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="d-inline-block col-md-6 p-0">
						<input type="text" class="form-control" placeholder="검색" name="searchKey" id="search" value="${search.searchKey}" autofocus>
					</div>
					
					<div class="d-inline-block col-md-2">
						<button type="submit" class="btn btn-light">
							<i class="fas fa-search"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 position-relative" style="margin-bottom:3rem;">
				<c:choose>
					<c:when test="${not empty sessionScope.userNo}">
						<div class="position-absolute" style="left:50%; top:50%; transform:translate(-50%, -50%);">
							<button type="button" class="btn btn-primary fs-20" onclick="link('/board/write')" style="padding:0.7rem 4rem;">글쓰기</button>
						</div>
						<div class="d-inline-block float-right">
							<span style="padding-right:1.5rem;"><kbd>${sessionScope.userName}</kbd> 님 환영합니다.</span>
							<button type="button" class="btn btn-primary" onclick="link('/logout')">로그아웃</button>
						</div>
					</c:when>
					<c:otherwise>
						<div class="d-inline-block float-right">
							<form id="loginForm" class="form-inline" method="post" onsubmit="return loginFormSubmit(this)">
								<div class="form-group mx-2">
									<input type="text" class="form-control input-sm" name="userId" placeholder="아이디" autofocus required>
								</div>
								<div class="form-group mx-2">
									<input type="password" class="form-control input-sm" name="userPw" placeholder="비밀번호" required>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-outline-secondary mr-2">로그인</button>
									<button type="button" class="btn btn-primary" onclick="link('/join')">회원가입</button>
								</div>
							</form>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>