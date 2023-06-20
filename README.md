# 🏍 바이크 판매 장터

Spring을 이용한 바이크 판매 장터 사이트

## 📖 프로젝트 소개

<a href="https://cafe.naver.com/bikecargogo" title="네이버 카페로 이동하기" target="_blank">네이버 카페</a>, <a href="http://passo.co.kr/" title="파쏘로 이동하기" target="_blank">파쏘(Passo)</a>를 참고하여 만든 바이크 판매 장터 사이트입니다.

## ⏰ 개발 기간

- 19.09.11일 - 19.10.29일

## ⚙ 개발 환경

- **Java** : `1.8.0`
- **IDE** : `Spring Tool Suite 4.4.3.2`
- **Framework** : `Spring Framework 4.3.3`
- **Database** : `MariaDB 10.11.2`
- **ORM** : `Mybatis`

## 📋 시스템 구성도

<p align="center">
    <img src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/463ad889-fe19-4ca7-a52c-4bfe3abb7b07" width="80%">
</p>

## ⌨ E-R 다이어그램

<p align="center">
  <img src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/b0c70628-b782-4388-aae7-56073d906d47" width="80%">
</p>

## 🔍 기능 설명

#### 메인 페이지

- 카테고리, 키워드 검색
- 무한 스크롤 게시글 목록 추가 로딩 (Ajax)

#### 로그인

- 아이디 검증
- 로그인 시 쿠키(Cookie) 및 세션(Session) 생성

#### 회원가입

- 이메일 중복 검증
- 필수 입력 항목 검증

#### 글쓰기

- 이미지 업로드 (4개 이상 필수 선택)
- 업로드 이미지 미리보기
- 카테고리 선택 (지역)
- 제목, 본문, 가격 입력

#### 글수정

- 이미지 선택 삭제
- 이미지 추가 업로드 (4개 이상 필수 선택)
- 카테고리 수정 (지역)
- 제목, 본문 가격 수정
- 판매여부 선택

#### 댓글

- 댓글 작성, 수정, 삭제 (Ajax)

## 🖥 스크린샷

### 메인페이지

<img alt="메인페이지" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/19897ae5-2624-4b7d-ac3a-cf601ce63964">

<hr>

### 회원가입

<img alt="회원가입" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/9fc1eec1-d033-4f53-a92d-14ff9d17270f">

<hr>

### 게시글 검색

<img alt="게시글 검색" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/1d13e457-7e93-46f2-839d-714f144b980c">

<hr>

### 글쓰기

<img alt="글쓰기" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/d57eca6d-97b5-49bc-bdff-87b32faec0f9">

<hr>

### 글쓰기 결과

<img alt="글쓰기 결과" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/b2d5001c-5bdc-42b3-9bb6-a2cf119a6090">

<hr>

### 글수정

<img alt="글수정" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/14cd2243-d42c-4005-a996-886051534940">

<hr>

### 글보기

<img alt="글보기" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/e8ef56b9-e804-45ac-9cde-f4c66dd3c989">

<hr>

### 댓글

<img alt="댓글" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/51c9210f-5a12-4b3a-bacd-f0e8aedfe06d">
<img alt="댓글 수정" src="https://github.com/dhwngjs01/Spring_Motorcycle_BBS/assets/38345593/f0cf00ab-2fd1-49c2-8550-c18ef95a507f">
