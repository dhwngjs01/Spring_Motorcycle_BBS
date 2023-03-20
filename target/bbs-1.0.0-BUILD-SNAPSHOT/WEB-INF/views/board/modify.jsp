<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<c:choose>
		<c:when test="${empty sessionScope.userNo}">
			<script>
				alert("로그인 후 이용할 수 있는 서비스입니다.");
				link("/");
			</script>
		</c:when>
		<c:when test="${sessionScope.userNo != board.userNo}">
			<script>
				alert("이 글을 작성한 사용자만 수정할 수 있습니다.");
				link("/");
			</script>
		</c:when>
	</c:choose>

	<div class="row">
		<div class="col-md-10 mx-auto">
			<!-- 글쓰기 영역 -->
			<div class="card">
				<div class="card-header bg-primary pt-3">
					<h3 class="text-white font-weight-bold">글수정</h3>
				</div>
				
				<div class="card-body">
					<div class="col-md-11 mx-auto">
						<!-- 글수정 폼 -->
						<form id="modifyForm" action="/board/write" method="post" class="form-horizontal" enctype="multipart/form-data">
							<input type="hidden" name="boardNo" value="${board.boardNo}"/>
						
							<div class="row form-group">
								<div class="col-md-4">
									<label for="username" class="control-label">작성자</label>
									<input type="text" class="form-control" value="${sessionScope.userName}" readonly required>
								</div>
								<div class="col-md-4">
									<label for="sellStatus">판매상태</label>
									<select id="sellStatus" class="form-control" name="boardSellStatus" required>
										<option value="판매중" <c:if test="${board.boardSellStatus eq '판매중'}">selected</c:if>>판매중</option>
										<option value="판매완료" <c:if test="${board.boardSellStatus eq '판매완료'}">selected</c:if>>판매완료</option>
									</select>
								</div>
								<div class="col-md-4">
									<label for="category" class="control-label">지역선택</label>
									<select id="boardCategory" class="selectpicker form-control" name="boardCategory" data-live-search="true" required>
										<option value="" disabled selected>카테고리</option>
										<!-- category 테이블에서 이름 가져와서 넣을 것 -->
										<c:forEach items="${categoryList}" var="category">
											<option value="${category}" <c:if test="${category eq board.boardCategory}">selected</c:if>>${category}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="row form-group py-4">
								<div class="col-md-12">
									<label for="file" class="control-label">이미지 업로드 (4개 이상 필수 선택)</label>
									
									<div class="card dropzone" id="dropzone" style="padding:5rem 0;">
										<div class="card-body text-center">
											<div class="dropzone-text">파일을 선택하려면 클릭하세요.</div>
											<div class="spinner spinner-border text-primary" role="status" style="display:none;"></div>
											<div class="fileList row">
												<c:if test="${not empty fileList}">
													<c:forEach items="${fileList}" var="file">
														<div class="col-md-4 pb-3">
															<div class="card position-relative">
																<i class="removeImageBtn fas fa-times position-absolute text-danger" style="right:0; top:0; transform:translate(50%, -50%); z-index:999; font-size:40px; cursor:pointer;" data-fileno="${file.fileNo}"></i>
																<div class="card-image overflow-hidden" style="height:124px; position:relative;">
																	<img src="/resources/uploadFiles/${file.fileName}" alt="${file.fileRealName}" title="${file.fileRealName}" style="max-width:100%; height:auto; position:absolute; left:50%; top:50%; transform:translate(-50%, -50%)" />
																</div>
																<div class="card-body text-center p-0 py-2 border-top">
																	<div class="card-title fs-12 mb-1">${file.fileRealName}</div>
																	<div class="card-text fs-12">
																		<script>
																			var fileSizeList = { "B" : ${file.fileSize}, "KB" : ${file.fileSize} / 1024, "MB" : ${file.fileSize} / 1024 / 1024 };
																			
																			$.each(fileSizeList, function(sizeType, sizeValue){
																				if(sizeValue < 1000){
																					document.write(sizeValue.toFixed(2) + " " + sizeType);
																					return false;
																				}
																			});
																		</script>
																	</div>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:if>
												<div class="afterInsertImage d-none"></div>
											</div>
										</div>
									</div>
									
									<input type="file" id="file" class="file d-none" name="file[]" multiple />
									
								</div>
							</div>
							
							<div class="form-group pb-3">
								<label for="title" class="control-label">제목</label>
								<input type="text" class="form-control" name="boardTitle" id="title" placeholder="제목은 최대 30자 까지만 쓸 수 있습니다." value="${board.boardTitle}" required>
							</div>
							
							<div class="form-group pb-3">
								<label for="content" class="control-label">본문</label>
								<textarea class="form-control" rows="8" name="boardContent" id="content" required style="resize:none;">${board.boardContent}</textarea>
							</div>					
						
							<div class="form-group pb-3">
								<label for="price" class="control-label">가격</label>
								<div class="form-row align-items-center px-1">
									<input type="text" class="form-control text-right col-md-3" name="boardPrice" id="price" placeholder="가격" value="${board.boardPrice}" required onkeydown="return onlyNumber(event)" onkeyup="return removeChar(event)">&nbsp;원
								</div>
							</div>
			
							<div class="form-group float-right">
								<button type="submit" class="btn btn-lg btn-primary">수정</button>
								<button type="button" class="btn btn-lg btn-outline-dark" onclick="link('/')">취소</button>
							</div>
						</form>
						<!-- // 글쓰기 폼 -->
					</div>
				</div>
			</div>
			<!-- // 글쓰기 영역 -->
		</div>
	</div>
	
	<div class="full-screen" style="position:fixed; left:0; top:0; width:100%; height:100%; background-color:rgba(0, 0, 0, 0.3); display:none;">
		<div class="spinner-border text-primary" role="status" style="width:5rem; height:5rem; position:absolute; left:50%; top:50%; transform:translate(-50%, -50%)">
			<span class="sr-only">Wait...</span>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/script.jsp" />
	
	<script>
	
		$(function(){
			$(".full-screen").hide();
			
			var boardPrice = numberWithCommas($("input[name=boardPrice]").val());
			$("input[name=boardPrice]").val(boardPrice);
			
			resetDropzone();
		});
	
		// 숫자 ',' 치환 함수
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		// 숫자만 입력할 수 있게 설정하는 함수
		function onlyNumber(event){
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;

		    // 허용하는 키
		    // 위 숫자키 0 ~ 9, 넘버패드 숫자키 0 ~ 9, Backspace, Delete, 왼쪽 방향키, 오른쪽 방향키 
		    if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		        return;
		    else
		        return false;
		}

		// 숫자 이외의 문자가 입력될 때 문자 제거 함수
		function removeChar(event) {
		    event = event || window.event;
		    var keyID = (event.which) ? event.which : event.keyCode;

		    // 허용하는 키
		    // Backspace, Delete, 왼쪽 방향키, 오른쪽 방향키 
		    if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		        return;
		    else
			    // 허용하지 않는 키를 입력하면 문자를 숫자 이외의 문자를 빈 값으로 치환하여 다시 값을 설정
			    // 결론은 숫자만 남게 됨
		        event.target.value = event.target.value.replace(/[^0-9]/g, "");
		}


		// 셀렉트 박스 검색 기능 함수
		$("#boardCategory").selectpicker({
			noneResultsText : "찾을 수 없는 단어 : {0}",
			size : 5
		});

		$("button[data-id=boardCategory]").addClass("border bg-white");

		// 금액 입력 영역 키 입력 이벤트
		$(document).on("keyup", "#price", function(e){
			var priceStr = $(this).val();
			var priceComma = numberWithCommas(priceStr.replaceAll(",", ""));

			$(this).val(priceComma);
		});

		// 썸네일 이미지가 보여졌는지 확인하는 플래그
		// true = 파일 등록 가능 (파일 썸네일이 보여지고 기능이 완벽하게 종료되면 true)
		// false = 파일 등록 불가 (파일을 등록중 일때 false)
		var flag = true;
		
		// 썸네일 영역 클릭 이벤트
		$(document).on("click", "#dropzone", function(e){
			// 파일 입력 클릭 이벤트 바인딩
			if(flag){
				$("#file").click();
			}
		});

		// 파일 필드의 값이 변경됬을 때 이벤트
		$(document).on("change", "#file", function(e){
			// 선택한 파일리스트
			var fileList = e.target.files;

			// 파일을 선택하지 않았을 경우 레이아웃 복구
			if(fileList.length == 0){
				$(".afterInsertImage").nextAll().remove();
				resetDropzone();
				
				return false;
			}

			if(flag){
				$(".afterInsertImage").nextAll().remove();
				imageThumbnail(fileList);
			}
		});

		// 썸네일 영역 리셋
		function resetDropzone(){
			// 썸네일 영역에 이미지 개수
			var fileList = $(".fileList").children().find("img").length;

			// 썸네일 영역에 이미지가 하나라도 있으면 안내 문구 제거
			if(fileList > 0){
				$(".dropzone-text").hide();
				$("#dropzone").css({ "padding" : "0" });
			} else {
				$(".dropzone-text").show();
				$("#dropzone").css({ "padding" : "5rem 0" });
			}
		}

		// 썸네일 이미지
		function imageThumbnail(fileList){
			flag = false;

			var fileListLength = fileList.length;
			
			$(fileList).each(function(key, file){
				var fileName = file.name;
				var fileType = file.type;
				var fileSizeList = { "B" : file.size, "KB" : file.size / 1024, "MB" : file.size / 1024 / 1024 };
				var fileSizeTxt = "";
				
				$.each(fileSizeList, function(sizeType, sizeValue){
					if(sizeValue < 1000){
						fileSizeTxt = sizeValue.toFixed(2) + " " + sizeType;
						return false;
					}
				});
				
				if(fileType == "image/jpeg" || fileType == "image/png" || fileType == "image/bmp"){
					var reader = new FileReader();

					// 이미지를 base64로 인코딩하여 문자화 시킴
					reader.readAsDataURL(file);

					// 선택한 이미지가 보여질때까지 로딩 아이콘 보여짐
					reader.onloadstart = function(e){
						flag = false;
						
						$(".spinner").show();
					}

					// 이미지를 base64 인코딩이 끝나면 썸네일 이미지 보여짐
					reader.onload = function(e){
						// base64로 인코딩 된 데이터
						src = e.target.result;

						// 썸네일 이미지 생성
						var html = '\
							<div class="col-md-4 pb-3">\
								<div class="card position-relative">\
									<div class="selectedImageCaption position-absolute bg-primary text-white fs-16 w-100 py-1" style="left:50%; top:0; transform:translateX(-50%); z-index:999;" >업로드할 이미지</div>\
									<div class="card-image overflow-hidden" style="height:124px; position:relative;">\
										<img src="'+ src +'" alt="' + fileName + '" title="' + fileName +'" style="max-width:100%; height:auto; position:absolute; left:50%; top:50%; transform:translate(-50%, -50%)" />\
									</div>\
									<div class="card-body text-center p-0 py-2 border-top">\
										<div class="card-title fs-12 mb-1">'+ fileName +'</div>\
										<div class="card-text fs-12">' + fileSizeTxt + '</div>\
									</div>\
								</div>\
							</div>';
						
						$(".afterInsertImage").after(html);
					}

					// 썸네일 이미지가 다 보여지면 로딩 아이콘 숨김
					reader.onloadend = function(e){
						resetDropzone();
						
						// 이미지 로딩 끝나면 아이콘 제거
						if(fileListLength == key + 1){
							$(".spinner").hide();
						}

						flag = true;
					}

					reader.error = function(e){
						console.log(e);
					}
				} else {
					// 파일 확장자 분리
					var fileNameArr = fileName.split(".");
					var ext = fileNameArr[fileNameArr.length - 1];

					flag = false;
					
					alert("jpg, jpe, jpeg, png, bmp 파일만 업로드할 수 있습니다.\n\n현재 업로드하신 확장자 '" + ext + "' 는 업로드할 수 없습니다.");
					return false;
				}
			});
		}

		// 이미지 삭제 버튼 클릭
		$(document).on("click", ".removeImageBtn", function(e){
			e.stopPropagation();

			// 삭제할 파일 번호 폼에 추가
			var fileNo = $(this).data("fileno");
			var inputHidden = '<input type="hidden" name="removeFileList" value="' + fileNo + '" />';
			
			$("#modifyForm").prepend(inputHidden);

			// 썸네일 이미지 제거
			$(this).parent().parent().remove();

			// 썸네일 영역 초기화
			resetDropzone();
		});
		
		// Ajax 폼 전송
		$("#modifyForm").ajaxForm({
			type : "POST",
			url : "/board/modify",
			dataType : "json",
			processData : false,
			contentType : false,
			beforeSubmit : function(data, form, option){
				// 이미 업로드된 이미지 개수
				var imageLength = $(".fileList").children().find("img").length; 
				
				// 이미지 최소 개수 제한
				if(imageLength < 4){
					alert("이미지는 4개 이상 무조건 등록해야합니다.");
					return false;
				}

				// 제목 글자 수 제한
				var boardTitleValue = $(form).find("input[name=boardTitle]").val();
				if(boardTitleValue.length > 30){
					alert("제목은 최대 30자 까지만 쓸 수 있습니다.\n현재 글자 수 : " + boardTitleValue.length + "자");
					return false;
				}

				// 가격 초과 확인하는 플래그 변수
				var flag = false;
				
				// 콤마 처리된 문자열 데이터 정수 형식으로 치환
				$.each(data, function(key, val){
					if(val.name == "boardPrice"){
						val.value = val.value.replaceAll(",", "");

						// 가격이 1억이 넘으면 플래그 값 변경
						if(val.value > 100000000){
							flag = true;
						}

						return false;
					}
				});

				// 가격이 1억이 넘으면 경고창
				if(flag){
					alert("가격은 1억을 넘길 수 없습니다.");
					return false;
				}

				// 로딩 화면 출력 설정
				$("body").css({ "overflow-y" : "hidden" });
				$(".full-screen").show();
				
			},
			success : function(response, statusText){
				// 로그인하지 않았을 때
				if(response.NoHaveSession){
					alert("로그인 후 이용할 수 있는 서비스입니다.");
					link("/");
				}

				// 현재 수정하려는 사용자의 계정이 글의 소유자가 아닐 때
				if(response.NotBoardOwner) {
					alert("작성한 게시글만 수정할 수 있습니다.");
					link("/");
				}

				// 수정이 성공됬을 때
				if(response.ModifySuccess){
					alert("게시글 수정이 완료되었습니다.");
					link("/board/view?boardNo=${board.boardNo}");
				}
			},
			error : function(e){
				console.log(e);
			}
		});
	</script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />