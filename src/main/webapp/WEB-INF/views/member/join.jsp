<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<div class="row">

		<div class="col-md-8 mx-auto">

			<div class="card">
				<div class="card-header bg-primary pt-3">
					<h3 class="text-white font-weight-bold">회원가입</h3>
				</div>
				<div class="card-body">
						<form id="joinForm" class="form-horizontal" method="post">
							<div class="col-md-10 mx-auto">
								<div class="form-group">
									<label for="userId" class="control-label">아이디</label>
									<input type="text" class="form-control" name="userId" id="userId" placeholder="아이디" required>
								</div>
								<div class="form-group">
									<div class="row">
										<div class="col-md-6">
											<label for="userPw" class="control-label">비밀번호</label>
											<input type="password" class="form-control" name="userPw" id="userPw" placeholder="비밀번호" required>
										</div>
										<div class="col-md-6">
											<label for="pw2" class="control-label">비밀번호 확인</label>
											<input type="password" class="form-control" name="userPw2" id="userPw2" placeholder="비밀번호 확인" required>
										</div>
									</div>
								</div>															
								<div class="form-group">
									<label for="userName" class="control-label">이름</label>
									<input type="text" class="form-control" name="userName" id="userName" placeholder="이름" required>
								</div>									
								<div class="form-group">
									<label for="userEmail" class="control-label">이메일</label>
									<input type="email" class="form-control" name="userEmail" id="userEmail" placeholder="이메일" required>
								</div>
								<div class="form-group">
									<button type="submit" class="btn btn-lg btn-primary float-right">회원가입</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
	<jsp:include page="/WEB-INF/views/script.jsp" />
	
    <script>
	 	// Ajax Form 전송
	    $("#joinForm").submit(function(){		    
	    	// 비밀번호 동일한지 확인
			var userPw = $(this).find("#userPw").val();
			var userPw2 = $(this).find("#userPw2").val();

			if(userPw != userPw2){
				alert("비밀번호를 다시 확인해주세요.");
				return false;
			}

		    // Ajax 통신
	        $.ajax({
	            type : "POST",
	            url : "/join",
	            data : $("#joinForm").serialize(),
	            cache : false,
	            success : function(response){
	                if(response.overlapIdCheck){
	                    alert("이미 존재하는 아이디입니다. \n다른 아이디를 사용해주세요.");
	                    return false;
	                 }
	
	                 if(response.validPwCheck){
	                    alert("비밀번호를 다시 확인해주세요.");
	                    return false;
	                 }
	
	                alert("회원가입이 완료되었습니다.");
	                 link("/");
	             }
	         });
	
	         return false;
	    });
	</script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />