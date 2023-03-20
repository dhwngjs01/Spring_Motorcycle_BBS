<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session = "true" %>

	<jsp:include page="/WEB-INF/views/header.jsp" />

	<c:if test="${empty sessionScope.userNo}">
		<script>
			alert("로그인 후 이용할 수 있는 서비스입니다.");
			link("/");
		</script>
	</c:if>

	<div class="row">
		<div class="col-md-10 mx-auto">
			<!-- 글쓰기 영역 -->
			<div class="card">
				<div class="card-header bg-primary pt-3">
					<h3 class="text-white font-weight-bold">글쓰기</h3>
				</div>
				
				<div class="card-body">
					<div class="col-md-11 mx-auto">
						<!-- 글쓰기 폼 -->
						<form id="writeForm" action="/board/write" method="post" class="form-horizontal" enctype="multipart/form-data">
							<input type="hidden" name="userNo" value="${sessionScope.userNo}"/>
						
							<div class="row form-group justify-content-between">
								<div class="col-md-4">
									<label for="username" class="control-label">작성자</label>
									<input type="text" class="form-control" value="${sessionScope.userName}" readonly required>
								</div>
								<div class="col-md-4">
									<label for="category" class="control-label">지역선택</label>
									<select id="boardCategory" class="selectpicker form-control" name="boardCategory" data-live-search="true" required>
										<option value="" disabled selected>카테고리</option>
										<!-- category 테이블에서 이름 가져와서 넣을 것 -->
										<c:forEach items="${categoryList}" var="category">
											<option value="${category}">${category}</option>
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
											<div class="fileList row"></div>
										</div>
									</div>
									
									<input type="file" id="file" class="file d-none" name="file[]" multiple />
									
								</div>
							</div>
							
							<div class="form-group pb-3">
								<label for="title" class="control-label">제목</label>
								<input type="text" class="form-control" name="boardTitle" id="title" placeholder="제목은 최대 30자 까지만 쓸 수 있습니다." required>
							</div>
							
							<div class="form-group pb-3">
								<label for="content" class="control-label">본문</label>
								<textarea class="form-control" name="boardContent" id="content" rows="10" required style="resize:none;"></textarea>
							</div>
						
							<div class="form-group pb-3">
								<label for="price" class="control-label">가격</label>
								<div class="form-row align-items-center px-1">
									<input type="text" class="form-control text-right col-md-3" name="boardPrice" id="price" placeholder="가격" value="10,000" required onkeydown="return onlyNumber(event)" onkeyup="return removeChar(event)">&nbsp;원
								</div>
							</div>
			
							<div class="form-group float-right">
								<button type="submit" class="btn btn-lg btn-primary">글쓰기</button>
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
		<div class="spinner-border text-primary" role="status" style="width:5rem; height:5rem; position:absolute; left:50%; top:50%; tranform:translate(-50%, -50%)">
			<span class="sr-only">Wait...</span>
		</div>
	</div>
	
	<jsp:include page="/WEB-INF/views/script.jsp" />
	
	<script>
		$(function(){
			$(".full-screen").hide();
		});

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

		// 금액 입력 영역 키 입력 이벤트
		$("#price").keyup(function(){
			var priceStr = $(this).val();
			var priceComma = numberWithCommas(priceStr.replaceAll(",", ""));

			$(this).val(priceComma);
		});


		// 썸네일 이미지가 보여졌는지 확인하는 플래그
		// true = 파일 등록 가능 (파일 썸네일이 보여지고 기능이 완벽하게 종료되면 true)
		// false = 파일 등록 불가 (파일을 등록중 일때 false)
		var flag = true;

		// 파일 선택 클릭 이벤트
		$("#dropzone").click(function(e){
			if(flag){
				$("#file").click();
			}
		});

		// 파일 필드의 값이 변경됬을 때 이벤트
		$("#file").change(function(e){
			var fileList = e.target.files;

			// 파일을 선택하지 않았을 경우 레이아웃 복구
			if(fileList.length == 0){
				resetDropzone();

				return false;
			}

			if(flag){
				$(".fileList").empty();
				imageThumbnail(fileList);
				flag = true;
			}
		});

		$("#writeForm").ajaxForm({
			type : "POST",
			url : "/board/write",
			dataType : "json",
			processData : false,
			contentType : false,
			beforeSubmit : function(data, form, option){
				// 이미지 개수 저장 변수
				var stillNotUploadImageLength = $("#file")[0].files.length; // 업로드 할 이미지 개수

				// 이미지 최소 개수 제한
				if(stillNotUploadImageLength < 4){
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

				// 파일이 업로드 되지 않았을 때
				if(response.NoHaveFiles){
					alert("파일이 전송되지 않았습니다.");
					return false;
				}

				// 글 작성이 성공됬을 때
				if(response.WriteSuccess){
					alert("게시글 작성이 완료되었습니다.");
					link("/");
				}
			},
			error : function(jqXHR){
				console.log(jqXHR.responseText);
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
		
		// 이미지 썸네일
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
						var html = "";
						var imgHtml = '\
							<div class="col-md-4 pb-3">\
								<div class="card">\
									<div class="card-image overflow-hidden" style="height:124px; position:relative;">\
										<img src="'+ src +'" alt="' + fileName + '" title="' + fileName +'" style="max-width:100%; height:auto; position:absolute; left:50%; top:50%; transform:translate(-50%, -50%)" />\
									</div>\
									<div class="card-body text-center p-0 py-2 border-top">\
										<div class="card-title fs-12 mb-1">'+ fileName +'</div>\
										<div class="card-text fs-12">' + fileSizeTxt + '</div>\
									</div>\
								</div>\
							</div>';
						
						html += imgHtml;
						$(".fileList").append(html);
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
					var fileNameArr = fileName.split(".");
					var ext = fileNameArr[fileNameArr.length - 1];
					
					flag = false;
					
					alert("jpg, jpe, jpeg, png, bmp 파일만 업로드할 수 있습니다.\n\n현재 업로드하신 확장자 '" + ext + "' 는 업로드할 수 없습니다.");
					return false;
				}
			});
		}
	</script>
	
	<jsp:include page="/WEB-INF/views/footer.jsp" />