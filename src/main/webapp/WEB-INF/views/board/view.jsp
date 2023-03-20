<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session = "true" %>

<% pageContext.setAttribute("replaceChar", "\n"); %>

	<jsp:include page="/WEB-INF/views/header.jsp"  />

	<div class="row">
		<div class="col-md-11 mx-auto">
			<!-- 글보기 Card -->
			<div class="card">
				<div class="card-header bg-primary p-3">
					<div class="d-inline-block fs-24 text-white">[${board.boardCategory}] ${board.boardTitle}</div>
					<div class="d-inline-block fs-18 float-right btn btn-sm btn-light text-primary font-weight-bold">
						<fmt:formatNumber value="${board.boardPrice}" type="number" /> 원
					</div>
				</div>
				<div class="card-body">
					<div class="fileList text-center">
						<c:forEach items="${fileList}" var="file" varStatus="status">
							<img src="/resources/uploadFiles/${file.fileName}" alt="${file.fileRealName}" title="${file.fileRealName}" class="img-fluid py-2" />
						</c:forEach>
					</div>
					
					<div class="textArea py-4">
						${fn:replace(board.boardContent, replaceChar, "<br/>")}
					</div>
				</div>
				<div class="card-footer text-muted">
					<div class="boardWdate d-inline-block" style="line-height:38px;">
						<fmt:formatDate value="${board.boardWdate}" pattern="yyyy-MM-dd HH:mm"/>
					</div>
					
					<div class="d-inline-block fs-12 pl-3" style="line-height:38px;">
						댓글수 <span class="boardCommentCount badge badge-dark" style="background-color:#999;">${boardCommentCount}</span>
					</div>
					
					<span class="boardWriter fs-12 pl-3">
						작성자 : ${board.userName}
					</span>
					
					<span class="float-right">
						<c:if test="${sessionScope.userNo == board.userNo}">
							<button type="button" class="btn btn-primary" onclick="link('/board/modify?boardNo=${board.boardNo}')">수정</button>
							<button type="button" class="btn btn-danger" onclick="removeBoard(${board.boardNo})">삭제</button>
						</c:if>
						<c:if test="${sessionScope.userLv == 'admin'}">
							<button type="button" class="btn btn-danger" onclick="removeBoard(${board.boardNo})">삭제</button>									
						</c:if>
						<button type="button" class="btn btn-primary" onclick="link('/')">목록으로</button>
					</span>
				</div>
			</div>
			<!-- // 글보기 Card -->
			
			<!-- 댓글 영역 -->
			<div class="row mt-3">
				<div class="col-md-12">
					<div class="card">
						<div class="card-body bg-light">
							<!-- 댓글 리스트 -->
							<div id="commentList" class="row mx-2">
								<!-- 댓글 리스트 Ajax -->
							</div>
							<!-- // 댓글 리스트 -->
							<!-- 댓글 작성 폼 -->
							<div class="w-100 mx-2">
								<form id="commentForm" method="POST" onsubmit="return writeComment()">
									<input type="hidden" name="boardNo" value="${board.boardNo}" />
									<div class="d-flex">
										<c:choose>
											<c:when test="${not empty sessionScope.userNo}">
												<!-- 회원 상태 댓글 영역 -->
												<div class="col-md-10 px-0">
													<textarea name="commentContent" id="commentContent" rows="3" class="w-100 border fs-13 p-2" style="height:100%; resize:none;" required></textarea>
												</div>
												<div class="col-md-2 px-0 pl-3">
													<button type="submit" class="btn bg-white text-dark border w-100" style="height:100%;">등록</button>
												</div>
												<!-- // 회원 상태 댓글 영역 -->
											</c:when>
											<c:otherwise>
												<!--  비회원 상태 댓글 영역 -->
												<div class="col-md-10 px-0">
													<textarea name="commentContent" id="commentContent" rows="3" class="w-100 border fs-13 p-2" style="height:100%; resize:none;" placeholder="로그인 후 이용할 수 있습니다." disabled></textarea>
												</div>
												<div class="col-md-2 px-0 pl-3">
													<button type="submit" class="btn bg-white text-dark border w-100" style="height:100%;" disabled>등록</button>
												</div>
												<!-- // 비회원 상태 댓글 영역 -->
											</c:otherwise>
										</c:choose>
									</div>
								</form>
							</div>
							<!-- // 댓글 작성 폼 -->
						</div>
					</div>
				</div>
			</div>
			<!-- // 댓글 영역 -->
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/script.jsp" />
	
	<script>
		$(function(){
			getCommentList();
		});
		
		// 댓글 리스트 
		function getCommentList(){
			$.ajax({
				type : "POST",
				url : "/board/comment",
				data : { boardNo : ${board.boardNo} },
				success : function(response){
					if(response.boardCommentCount != null){
						$(".boardCommentCount").text(response.boardCommentCount);
					}
					
					if(response.commentList != null){
						$("#commentList").empty();
						
						$.each(response.commentList, function(key, comment){
							var date = new Date(comment.commentWdate);
	
							var year = date.getFullYear();
							var month = date.getMonth() + 1;
							var day = date.getDate();
							var hour = date.getHours();
							var minute = date.getMinutes();
	
							if(month < 10) month = "0" + date.getMonth();
							if(day < 10) day = "0" + date.getDate();
							if(hour < 10) hour = "0" + date.getHours();
							if(minute < 10) minute = "0" + date.getMinutes();
							
							var commentWdate = year + "-" + month + "-" + day + " " + hour + ":" + minute; 

							
							// 세션 값 체크
							var currentUserNo = "${sessionScope.userNo}";
							var currentUserLv = "${sessionScope.userLv}";

							if(currentUserNo == ""){
								currentUserNo = 0;
							}

							// 댓글
							var html = "";
							html += '<div class="comment d-block w-100 border-bottom pb-3 mb-3">';
								html += '<div class="d-block">';
									html += '<span class="commentUserName d-inline fs-13 mr-2">' + comment.userName +'</span>';
									html += '<span class="commentWdate d-inline fs-12">' + commentWdate +'</span>';

								if(currentUserNo == comment.userNo){
									html += '<div class="commentBtns d-inline-block float-right fs-12" style="color:#666;">';
										html += '<span class="border-right pr-1 mr-1" style="cursor:pointer;" onclick="modifyComment(this, '+ comment.commentNo +')">수정</span>';
										html += '<span style="cursor:pointer;" onclick="removeComment(' + comment.commentNo + ')">삭제</span>';
									html += '</div>';
								} else if(currentUserLv == "admin"){
									html += '<div class="commentBtns d-inline-block float-right fs-12" style="color:#666;">';
										html += '<span style="cursor:pointer;" onclick="removeComment(' + comment.commentNo + ')">삭제</span>';
									html += '</div>';
								}
								
								html += '</div>';
								html += '<div class="d-block mt-2 commentContent">' + comment.commentContent.replaceAll("\n", "<br />") + '</div>';
							html += '</div>';
	
							$("#commentList").append(html);
						});
					}
					
				},
				error : function(error){
					console.log(error);
				}
			});
			
			
		}

		
		// 댓글 수정
		function modifyComment(self, commentNo){
			var comment = $(self).parent().parent().parent();
			
			var commentUserName = $(comment).find(".commentUserName").text();
			var commentWdate = $(comment).find(".commentWdate").text();
			var commentContent = $(comment).find(".commentContent").html();

			commentContent = commentContent.replaceAll("<br>", "\n");

			// 댓글 수정 폼
			var html = "";
				html += '<div class="commentModify d-block w-100 border-bottom pb-3 mb-3">';
					html += '<div class="d-block">';
						html += '<span class="d-inline fs-13 mr-2">' + commentUserName +'</span>';
						html += '<span class="d-inline fs-12">' + commentWdate 	+'</span>';
						html += '<div class="d-inline-block float-right fs-12" style="color:#666;">';
							html += '<span style="cursor:pointer;" onclick="modifyCommentCancel(this)">수정취소</span>';
						html += '</div>';
					html += '</div>';
					html += '<div class="d-flex mt-2">';
						html += '<div class="col-md-10 px-0">';
							html += '<textarea name="commentContent" id="modifyCommentContent" rows="3" class="w-100 border fs-13 p-2" style="height:100%; resize:none;">';
								html += commentContent;
							html += '</textarea>';
						html += '</div>';
						html += '<div class="col-md-2 px-0 pl-3">';
							html += '<button type="button" class="btn bg-white text-dark border w-100" style="height:100%;" onclick="modifyCommentApply(this, ' + commentNo +')">수정</button>';
						html += '</div>';
					html += '</div>';
				html += '</div>';

			// 댓글 전체 초기화
			$(".comment").removeClass("d-none").addClass("d-block");
			$(".commentModify").remove();

			// 댓글 수정 영역 생성
			$(comment).before(html);
			$(comment).removeClass("d-block").addClass("d-none");
		}

		function modifyCommentCancel(self){
			// 댓글 전체 초기화
			$(".comment").removeClass("d-none").addClass("d-block");
			$(".commentModify").remove();
		}

		function modifyCommentApply(self, commentNo){
			var modifyComment = $(self).parent().parent().find("textarea");
			var commentContent = $(modifyComment).val();
			
			$.ajax({
				type : "POST",
				url : "/board/comment/modify",
				data : { commentNo : commentNo, commentContent : commentContent },
				success : function(response){
					if(response.NoHaveSession){
						alert("로그인 후 이용할 수 있습니다.");
						link("/");
					}

					if(response.NotCommentOwner){
						alert("작성한 댓글만 수정할 수 있습니다.");
						return false;
					}

					getCommentList();
				},
				error : function(error){
					console.log(error);
				}
			});
			
		}

		// 댓글 삭제
		function removeComment(commentNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				$.ajax({
					type : "POST",
					url : "/board/comment/delete",
					data : { commentNo : commentNo },
					success : function(response){
						if(response.NoHaveSession){
							alert("로그인 후 이용할 수 있습니다.");
							link("/");
						}
	
						if(response.NotCommentOwner){
							alert("작성한 댓글만 삭제할 수 있습니다.");
							return false;
						}

						getCommentList();
					},
					error : function(error){
						console.log(error);
					}
				});
			}
				
		}

		// 댓글 작성 폼 전송
		function writeComment(){
			$.ajax({
				type : "POST",
				url : "/board/comment/write",
				data : $("#commentForm").serialize(),
				success : function(response){
					if(response.NotLoginStatus){
						alert("로그인 후 이용할 수 있습니다.");
						link("/");
						return false;
					}

					if(response.UnknownError){
						alert("알 수 없는 오류입니다.");
						return false;
					}

					// 댓글 입력 값 초기화
					$("#commentContent").val("");
					
					getCommentList();
				},
				error : function(error){
					console.log(error);
				}
			});
			
			return false;
		}

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
