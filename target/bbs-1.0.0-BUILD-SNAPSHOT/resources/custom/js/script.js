// 모두 치환
String.prototype.replaceAll = function(org, dest) {
    return this.split(org).join(dest);
}

//숫자 ',' 치환 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

// jQuery로 GET 파라미터 가져오기
$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results == null){
       return null;
    }
    else{
       return results[1] || null;
    }
}

// URL 이동
function link(url){
	document.location.href = url;
}

// Ajax 로그인
function loginFormSubmit(form){
	$.ajax({
		type : "POST",
		url : "/login",
		data : $(form).serialize(),
		cache : false,
		success : function(response){
			if(response.loginValidCheck == false){
				alert("아이디와 비밀번호를 확인해주세요.");
				return false;
			}

			link("/");
		}
	});
	
	return false;
};

$(function(){
	// 셀렉트 박스 검색 기능 함수
	$("#searchCategory").selectpicker({
		noneResultsText : "찾을 수 없는 단어 : {0}",
		size : 5
	});
});