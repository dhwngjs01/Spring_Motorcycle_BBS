<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<% pageContext.setAttribute("replaceChar", "\n"); %>

	<jsp:include page="/WEB-INF/views/header.jsp" />

 	<!-- 로그인 상태 검증 -->
	<c:if test="${NoHaveSession}">
		<script>alert("로그인 후 이용할 수 있습니다.");</script>
	</c:if>

	
	<div id="boardList">
		<c:choose>
			<c:when test="${not empty boardList}">
				<c:forEach items="${boardList}" var="board">
					<div class="card mb-5">
						<div class="card-header bg-primary p-3">
							<div class="boardTitle d-inline-block fs-24 text-white">[${board.boardCategory}] ${board.boardTitle}</div>
							<div class="d-inline-block fs-18 float-right btn btn-sm btn-light text-primary font-weight-bold">
								<fmt:formatNumber value="${board.boardPrice}" type="number" /> 원
							</div>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-4">
									<div class="w-100 h-100 border d-flex justify-content-center align-items-center">
										<img src="/resources/uploadFiles/${board.fileName}" alt="${board.fileRealName}" title="${board.fileRealName}" style="max-width:100%; height:auto; max-height:250px;" />
									</div>
								</div>
								<div class="boardContent col-md-6">
									${fn:replace(board.boardContent, replaceChar, "<br/>")}
								</div>
								<div class="col-md-2 d-flex align-items-center justify-content-center">
									<c:choose>
										<c:when test="${board.boardSellStatus eq '판매중'}">
											<span class="btn btn-primary py-2 px-3 fs-16">${board.boardSellStatus}</span>
										</c:when>
										<c:otherwise>
											<span class="btn btn-secondary py-2 px-3 fs-16">${board.boardSellStatus}</span>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="card-footer text-muted" style="line-height:38px;">
							<span class="boardWdate">
								<fmt:formatDate value="${board.boardWdate}" pattern="yyyy-MM-dd HH:mm"/>
							</span>
							
							<span class="boardCommentCount fs-12 pl-3">
								댓글수 <span class="badge badge-dark ml-1" style="background-color:#999;">${board.boardCommentCount}</span>
							</span>
							
							<div class="float-right">
								<c:if test="${sessionScope.userNo == board.userNo}">
									<button type="button" class="btn btn-primary" onclick="link('/board/modify?boardNo=${board.boardNo}')">수정</button>
									<button type="button" class="btn btn-danger" onclick="removeBoard(${board.boardNo})">삭제</button>
								</c:if>
								<c:if test="${sessionScope.userLv == 'admin'}">
									<button type="button" class="btn btn-danger" onclick="removeBoard(${board.boardNo})">삭제</button>									
								</c:if>
								<button type="button" class="btn btn-primary" onclick="link('/board/view?boardNo=${board.boardNo}')">더보기</button>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="card py-3">
					<div class="card-body">
						<div class="text-center">
							<c:choose>
								<c:when test="${boardRowCount == 0}">
									<p class="fs-26">앗, 이런!</p>
									<p class="fs-18">지금까지 등록된 게시글이 없네요..</p>
									<p class="fs-18">가장 먼저 게시글을 등록해보세요!</p>
								</c:when>
								<c:otherwise>
									<p class="fs-26">앗, 이런!</p>
									<p class="fs-18">검색하신 제목을 가진 게시글이 없네요..</p>
									<p class="fs-18">다른 제목으로 검색해보세요!</p>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<jsp:include page="/WEB-INF/views/script.jsp" />
	
	<script>
		var flag = true;		// 게시글 중복 덧붙이기 방지
		var startBoardNo = 5;	// 처음 스크롤이 맨 아래에 닿으면 5번 게시글부터 시작

		
		// 브라우저 스크롤 이벤트
		$(window).scroll(function(e){
			var scrollTop = $(window).scrollTop();	// 현재 브라우저의 스크롤 맨 위 좌표
			var scrollEnd = $(document).height() - $(window).height() - 50; // 브라우저의 스크롤 맨 아래 좌표

			// 현재 스크롤 위치가 브라우저 맨 아래에 닿았을 때
			if(scrollTop >= scrollEnd && flag){
				flag = false;
				
				var searchKey = "${search.searchKey}";			// 검색 키워드
				var boardCategory = "${search.boardCategory}";	// 검색 카테고리
				var sessionUserNo = "${sessionScope.userNo}";	// 현재 로그인 사용자 넘버
				var sessionUserLv = "${sessionScope.userLv}";	// 현재 로그인 사용자 레벨

				// Ajax 통신
				$.ajax({
					type : "POST",
					url : "/getBoardList",
					data : { searchKey : searchKey, boardCategory : boardCategory, startBoardNo : startBoardNo },
					cache : false,
					success : function(response){
						// Ajax 통신이 끝나면 시작 게시글 번호를 늘림
						startBoardNo += 5;

						// 응답으로 받아온 startBoardNo 이후의 추가 게시글 하나씩 덧붙이기
						$.each(response.boardList, function(key, board){
							var html = "";

							html = '<div class="card mb-5">\
								<div class="card-header bg-primary p-3">\
									<div class="d-inline-block fs-24 text-white">[' + board.boardCategory + '] ' + board.boardTitle + '</div>\
									<div class="d-inline-block fs-18 float-right btn btn-sm btn-light text-primary font-weight-bold">' + numberWithCommas(board.boardPrice) + ' 원</div>\
								</div>\
								<div class="card-body">\
									<div class="row">\
										<div class="col-md-4">\
											<div class="w-100 h-100 border d-flex justify-content-center align-items-center">\
												<img src="/resources/uploadFiles/' + board.fileName + '" alt="' + board.fileRealName + '" title="' + board.fileRealName + '" style="max-width:100%; height:auto; max-height:250px;" />\
											</div>\
										</div>\
										<div class="col-md-6 boardContent">\
											' + (board.boardContent).replaceAll("\n", "<br />") + '\
										</div>\
										<div class="col-md-2 d-flex align-items-center justify-content-center">';
										
											if(board.boardSellStatus == "판매중"){
												html += '<span class="btn btn-primary py-2 px-3 fs-16">' + board.boardSellStatus + '</span>';												
											} else {
												html += '<span class="btn btn-secondary py-2 px-3 fs-16">' + board.boardSellStatus + '</span>';
											}

								html += '\
										</div>\
									</div>\
								</div>\
								<div class="card-footer text-muted" style="line-height:38px;">\
									<span class="boardWdate">' + $.format.date(board.boardWdate, "yyyy-MM-dd HH:mm") + '</span>\
									<span class="boardCommentCount fs-12 pl-3">\
										댓글수 <span class="badge badge-dark ml-1" style="background-color:#999;">' + board.boardCommentCount + '</span>\
									</span>\
									<div class="float-right">';
									
									if(sessionUserNo == board.userNo){
										html += '<button type="button" class="btn btn-primary" onclick="link(\'/board/modify?boardNo=' + board.boardNo + '\')">수정</button>';
										html += ' <button type="button" class="btn btn-danger" onclick="removeBoard(' + board.boardNo + ')">삭제</button>';
									} else if(sessionUserLv == "admin"){
										html += ' <button type="button" class="btn btn-danger" onclick="removeBoard(' + board.boardNo + ')">삭제</button>';									
									}
									
										html += ' <button type="button" class="btn btn-primary" onclick="link(\'/board/view?boardNo=' + board.boardNo + '\')">더보기</button>\
									</div>\
								</div>\
							</div>';

							$("#boardList").append(html);
						});

						flag = true;
					}
				});
				
			}
		});
		
	
	
		// 게시글 삭제
		function removeBoard(boardNo){
			if(confirm("게시글을 정말 삭제하시곘습니까?")){
				$.ajax({
					type : "POST",
					url : "/board/delete",
					data : { boardNo : boardNo },
					success : function(response){
						if(response.NotBoardOwner){
							alert("작성한 게시글만 삭제할 수 있습니다.");
							return false;
						}
	
						if(response.NoHaveSession){
							alert("로그인 후 이용할 수 있습니다.");
							link("/");
						}
	
						alert("게시글이 삭제되었습니다.");
						link("/");
					},
					error : function(error){
						console.log(error);
					}
				});
			}
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />