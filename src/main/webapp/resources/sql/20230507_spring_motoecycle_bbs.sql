-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.2-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.4.0.6670
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- spring_motorcycle_bbs 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `spring_motorcycle_bbs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `spring_motorcycle_bbs`;

-- 테이블 spring_motorcycle_bbs.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `board_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` int(11) NOT NULL,
  `board_category` varchar(10) NOT NULL,
  `board_title` varchar(100) NOT NULL,
  `board_content` text NOT NULL,
  `board_price` bigint(20) NOT NULL,
  `board_sell_status` varchar(10) NOT NULL,
  `board_wdate` datetime NOT NULL,
  PRIMARY KEY (`board_no`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.board:~14 rows (대략적) 내보내기
DELETE FROM `board`;
INSERT INTO `board` (`board_no`, `user_no`, `board_category`, `board_title`, `board_content`, `board_price`, `board_sell_status`, `board_wdate`) VALUES
	(1, 1, '서울', '2016년식 R6 판매합니다.', '3만키로 탔습니다.\n\n수리할곳 없습니다.', 13000000, '판매중', '2019-10-29 23:34:10'),
	(2, 1, '대전', '알쓰리 2019년식 판매합니다.', '길들이기 FM대로 끝났구요.\n\n입문용으로 최고입니다.', 5100000, '판매중', '2019-10-29 23:37:01'),
	(3, 1, '광주', '2015년식 CB300R 판매합니다.', '역시 혼다라 고장 안나구요.\n단기통이라 빠따 쥑입니다.', 4000000, '판매중', '2019-10-29 23:38:03'),
	(4, 1, '전남', '크로스플레인 엔진올라간 빅뱅 알원 팝니다.', '토치 머플러 들어가있구요\n\n구조변경 완료했습니다.\n\n32,126km 탔습니다.', 14000000, '판매중', '2019-10-29 23:39:50'),
	(5, 1, '대전', '혼다 MSX125 튜닝 많이 된 15년식 오토바이 급매', '[경남진주] 혼다 MSX125 튜닝 많이 된 15년식 오토바이 급매 합니다.\n15년식 9800키로 주행 한 오토바이구요\n차도그렇고 오토바이도 그렇고 년식보다\n키로수가 제일 중요하다고 알고있구요\n지하 주차장에 주차 했구요. 출발시 시동좀 켜놓은상태에서\n예열필수로 했었고 도착시에도 후열?인가 해서 시동 조금 켜놓은상태에서\n시동 끄고 했었네요. 번거롭지만 그렇게 관리했어요\n상태는 사진으로 보여드리는방법외에는 제가 좋다고 해도\n직접 보셔야 알수있으니 구매 의향 있으시면 오셔서\n디테일하게 판단하시면 될 것 같네요 절충도 오셔서 하세요\n그리고 뒤에 탑박스는 가져있으니 제거 하셔서 타셔도 되고\n장착하시고 타셔도 됩니다 현재는 제거해놓은 상태입니다 \n그리고 배기음도 저는 엄청 시끄러운거 싫어하고 묵직한소리로\n고급스럽게 나는걸 좋아해서 딱 제 스타일입니다.\n영상으로 첨부하였으니 들어보시면 될것같구요\n다른부분은 문제 생긴적 단 한번도 없었습니다\n튜닝만 해서 130만원 이상 금액 들어갔구요\n판매 금액은 250만원 생각하고 있습니다.\n바이크는 진짜 마음에 드시는데 거리가 많이 멀다 싶으신분은\n버스를 타고 오시던 어떻게 바이크부터 직접 보러 오셔서도\n마음에 드시면 제가 포터로 거리가 멀어도 직접 가져다 드릴마음도\n있습니다 급매라서 그렇구요 오토바이 마음에 드시면 연락주세요~\n\n-튜닝내역-\n스윙암 \n체인\n리어쇼바\n뒷타이어\n레버교체\n알리발 머플러\n탑박스\n브레이크시 LED파박이\n지천헤드라이트\nS1000RR 사이드카울\n아로리스거치대\n빽스텝\n머드가드\n텐덤바\n도미노그립\n핸들밸런스\n안개등\n\nMSX 오토바이 튜닝 필요한건 다한거구요 더이상 손볼것도\n튜닝할것도 없이 타시기만 하면 될것 같습니다 ~\n관심 있으신분은 공일공-팔331-육육구9로 연락주세요!\n', 2500000, '판매중', '2019-10-30 00:36:56'),
	(6, 1, '서울', 'cbr125 2011년식 익실구변된 센터판 판매중', '화물x 서울 7호선 중곡역 에서 직접 다 확인하시고 판매합니다@\n\n튜닝내역\n익실정품 머플러 구변완료(소음기 장착중) 소리 좋습니다\n1단,2단 on off 조절가능 열선그립\n뒤에 led\n레바튜닝\n발판튜닝\nusb 포트 스마트폰 충천가능 스마트폰 거치대\n20만원 상당 탑박스 (쉽게 탈부착가능)\n\n센터에서 바이크 구입했습니다 하자 일체 없고 소모품도 갈것 없습니다 직접 보고 타보고 결정하시는것을 추천합니다\n사진에는 잘 못담는데 실물 실제로 보시는게 훨신 더 깨끗합니다\n키로수 12600km 증가하지 않습니다\n폐지후 운행 안하고있습니다 판매 사유는 pcx 타고싶어서 판매합니다\n(참고 125cc 구변된거 찾기어려움)\n010-8807-8652 연락주세요', 2000000, '판매중', '2019-10-30 00:40:25'),
	(7, 1, '세종', '로드윈 VJF-i(펄아이) 125cc 15년식 팝니다.', '15년식 로드윈 vjf-i 125 입니다\n\n1대 차주님께 12500에 넘겨받앗고 전주분이 워낙 관리를 잘해주셔서 \n\n(주유구쪽 스크레치는 아쉬운부분 ;ㅡ;) \n\n꿍 및 슬립 사고 전혀없이(운이좋앗던건가?..) 입문용으로 너무 잘 타왔고 \n\n이제는 적응이되버려서인지 욕심이생겨 기변을 하고싶어졌습니다\n\n \n\n엔진소리도 상당히좋고 평지에서 121 내리막길 143 까지 찍어봣네요 \n\n생각보다 잘나가서 놀랐습니다. 초반 출력은 쬐금 약한데 후반에 나름 잘치고 나가더라구요 \n\n \n\n바이크상태는 3개월정도밖에안타서 전주인분에게 넘겨받았던 그상태 그대로 깔끔한 상태입니다.\n\n직거래를 추천할만큼 좋은 상태입니다 보고 가져가셨으면 좋겟다고 생각하거든요.\n\n체인,캘리퍼,브레이크패드 교환 ,오일은 1500km더타고 14000km에 갈았습니다\n\n앞바퀴 정도만 곧갈아야할꺼같고 나머지는 이상없이 타셔도 무방합니다.\n\n \n\n이시국에 Cbr은 쫌;;;이라고 생각하시는 분들은 국산 레플리카 메뉴얼 바이크로 입문에는 \n\n로드윈도 굉장히 좋다라고 추천 드리고 싶습니다.\n\n \n\n현재 주차장에 커버 씌운상태로 쿨쿨자고있습니다.Zzzzz \n\n얼른 깨어서 데려가주세요~', 1400000, '판매중', '2019-10-30 00:43:24'),
	(8, 1, '서울', '04년 정 vf125 커스텀차량 판매합니다', '안녕하세요.\n04년 누적 12000키로 된 vf125 커스텀차량을 판매합니다.\n독립문에 위치한 크라시x게러지에서 커스텀된 차량 출고하였고\n폴리스바이크로 사용되던 바이크를 7000키로에 가지고와서\n커스텀후에 5000키로를 주행하였습니다.\n엔진과 포크 프론트프레임을 제외하면\n풀커스텀됐다고 보시면 되구요.\n배터리리스킷과 오픈필터 작업되어있고 셀버튼없이 킥시동입니다.\n이것저것 많이 타봤지만,\n125cc중에서는 빠따감이 참 좋은놈이라고 생각합니다.\n\n하자내역이라면 현재 미터기의 바늘이 부러졌습니다.\n누적키로수를 그대로 올라가고 있으니 추후에 교체하시면 될듯합니다.(구매시 미터기교체비용 네고)\n\n\n서울 서대문구입니다.\n010-2123-624칠 로 연락주세요.\nㅂ', 3000000, '판매중', '2019-10-30 00:45:23'),
	(9, 1, '전남', '목포 pcx 125 19년형 팝니다. 280만원', 'pcx 125 19년형 (18년식) 팝니다.\n\n\n\n＊거래는 전남 목포 (남악)에서 가능합니다.\n\n＊폐지완료, km는 위 사진과 같고 배터리 충전용으로 증가할 수 있습니다.\n\n＊10,000km에 100% 합성유 교환, 미션 오일 교환, 벨트 유격 조정 , 앞 브레이크 패드 교환 \n\n＊스마트키 2개, 메뉴얼 증정 \n\n＊하자 내역 1. 제꿍 사진 참조\n\n＊하자 내역 2. 머플러 가드 금 역시 사진 참조 \n\n\n★pcx 매물 보는 팁 알려드리자면 AGV.연비를 보시면 차주의 운전 습관을 볼 수 있습니다.\n\n급출발 급가속 급정거 자주 하는 습관이면 연비도 낮고 차에 스트레스 많이 받습니다.\n\n30KM  / 35KM ~40KM 보통 / 40KM  / 평균 연비 보면 바로 알 수 있습니다.\n\n45KM 면 얌전하게 조심해서 탄 편이라고 생각합니다.\n\n\n \n\n☆가격 280만원 \n\n\n☆찔러보기\n상식 밖 문의 \n절충 네고 문의 \n기본적인 예의 지키지 않는 문의 차단합니다.\n\n☆꼭 사실 분만 연락 바랍니다.\n\n\n\nolo-8o73-22l3 ', 2800000, '판매중', '2019-10-30 00:47:43'),
	(10, 1, '경기북부', 'CB400 vtech 99년식 270만원', '2019년 4월경 보령 판매자분께 일부 추가금을 지불하고 MSX125신형과 교환해 왔습니다.\n\n그당시 3.5만 정도 되었습니다...\n\n외관은 연식이 있는지라,,, 패스.... 엔진만 믿고 사라는 판매자 말씀에, 신뢰가 가서 의심 안하고 구매 했습니다.\n\n센터 확인결과,, 괜찮다고 했습니다... 큰 문제가 없기에 하나하나,,, 볼트를 조이고 닦고...닦아줬습니다...\n\n3.6만km 정도에 엔진오일, 타야(미쉐린) 잘은 모르지만 조은 타야라 하네요... 교환 하였습니다.\n\n타야 쫀득합니다......바이크 씨비감성에 주말에 가끔식 라이딩을 즐겼습니다...\n\ncb는 배기음이 좋습니다... 반스 배기음 은근히 기분이 좋아 지네요....\n\n취미가 너무 많아... 당분간 바이크는 못 탈듯 합니다.....\n\n주말은 가정에 평화를 위해,.. 가족과 지내려고요....\n\nmsx125정도는 동네바리 정도는 협의 봤습니다...\n\n화석이니 엄청난 퀄리티 원하시는 분은 패스 바랍니다...\n\n옛 감서과 향수에 타는 바이크이고 간혹 세월에 흔적이 있습니다...\n\n전차주분 슬립이 있었던거 같습니다... 하지만 발란스는 괜찮습니다..180km까지만 땡겨 봤습니다..\n\n전 무서워서 못 땡기겠습니다.... 140~160까지는 문제 없네요 ㅎ\n\n여기저기 외관은 세월의 흔적 있으니 고민하시고,,,,, 구매나 대차 의향 있으시면.... 동두천쪽으로 한번 놀러 오세요 ㅎㅎㅎ 뒤에 윙커는 누군가 부셔서 새로 주문 했습니다... 드릴꼐요 ㅎㅎㅎ', 2700000, '판매완료', '2019-10-30 00:49:29'),
	(11, 1, '부산', '두카티 파니갈레899 대차합니다', '4기통타다 2기통이너무 궁금해서 넘어왔습니다\n\n탄지는 2달정도됬는데 제 성향이랑 너무안맞내요\n\n그래서 바접아님 다시 4기통으로 갈려고판매합니다\n\n \n\n떼르미뇨슬립온 (구변완) 라이테크 빽스텝\n\n두카티 퍼포먼스 시트,캐노피,그립\n\n클러치브레이크 레바 램마운트 거치대 usb충전포트\n\n등등 아는건 이거구요\n\n\n\n소모품 교체내역은 15500쯤 엔진오일 모튤7100 및 필터 브레이크액 타이어 슈퍼코르사(80퍼정도남음)교체 완료\n\n\n\n제꿍 슬립 없습니다 \n\n외관 엔진 상태다좋습니다 시간되시면 보시는걸 추천드리고싶내요  전화는 잘못받으니 위에번호로  문자부탁드립니다  ', 12900000, '판매완료', '2019-10-30 00:50:59'),
	(12, 1, '경기남부', 'cbr600rr 가격 내립니다.', '블랙박스 2채널 되어있습니다. (와이파이로 핸드폰연결하여 시청가능)\n프론트디스크 순정 보유, 클러치앗세이 중고품 보유, 케이블신품보유,리어시트,캐노피 있으며, 앞타야 50%가량 뒷타야 30%가량, 앞뒤패드 및 대소기어체인 교체시기 한참 멀었어요, 완벽한 정비이력은 아니지만 근 2만키로가량 정비기록 가지고있습니다. 현 3000km 마다 쉘오일로 관리중입니다. 연식이 있는만큼 완벽할순 없겟지만 가져가셔서 즐기시는데에 스트레스줄만한 바이크는 절대로 아니니 걱정덜고 연락주셔서 직접 매물 확인해보시기 바래요. 카울은 깨지거나 파손된곳은 없지만 A-B 정도 되는것 같습니다.\n\n사진을 잘 찍지 못해서. 원하시는 사진 있으면 따로 얼마든지 보내드릴수있고, 시동영상도 가지고있지만 핸드폰카메라로는 담아낼수가 없기에 직접 오셔서 확인하시길 추천드립니다. 엔진컨디션 확실한 아이입니다. 오실때 냉간시동 확인하고 싶으신분은 미리 얘기해주시면 냉간시동 들을수있게 협조해드리겟습니다. 타고는 싶은데 제대로된아이 찾다 지치신분들. 언제든지 와서 직접 보시면 후회하는일 없으실거에요. 그리고 화물거래는 안합니다. 선입금에 노리턴이더라도 와서 보시고 직접 얹어서 가시길 바랍니다. 트러블 분쟁 원하지 않습니다. 현 바이크 상태는 즐기기 부족함없는상태이며 판매전까진 주기적 마실을 다니기 때문에 유지 및 보수 꾸준히 하며 키로수는 주기적 상승합니다.\n\n\n쇼에이 지티에어 불개미 L 사이즈 오토바이와 함께 구매시 저렴히게 드리겟습니다. 블루투스는 유클리어 amp200 장착되어있습니다.\n\n신중하게 연락주시길 바랍니다.\n\n추가내용\n\n연락하셔서 화석 이야기하시면서 가격 후려치시는분들 적당히좀 부탁드립니다.\n정말 돈주고도 부품을 구할 수 없는 화석이 아닙니다. 자잘한 부품 하나하나 수급 원활하고 유지비 별로 들것도 없어요.\n지금은 운행 및 기능적인 부분에서 수리할부분 없습니다. 하지만 자잘한 기스나 까짐 세월에 흔적이 보이는부분 다 수리하려하신다면 미들급 신차 한번에 가시는게 금액적으로 더 나을것으로 생각합니다.\n꼭 구매하시는게 아니더라도 궁굼한게있으면 연락주세요. 구매와 상관없는 질문도 답장해드립니다.\n\n예열이 된 상태이지만 구매에 참고가 되실수있게 동영상 첨부합니다.\n\n내용추가\n엔진오일 교체주기까지 대략 800km조금안되게 남았어요. 구매자분 나오실때 지켜봐서 엔진오일을 갈아서 보내던지 아니면 가격적인부분에서 맞춰보던지 하겟습니다.\n', 6700000, '판매중', '2019-10-30 00:52:32'),
	(13, 1, '경기북부', '19년 아프리카트윈 노말 DCT 블랙 팝니다', '안녕하세요.\n\n2019년 6월 출고 아프리카트윈 노말 dct 블랙 판매합니다.\n\n제가 1대 차주이고 출퇴근용으로 2,500km 운행했습니다.\n\n왼쪽 너클가드, 백미러 기스 있습니다. 오프로드 운행 x판매 전까지 키로수 소폭 증가 예정입니다.\n\n감사합니다.\n\n\n튜닝 내역:\n\n디젤 안개등\n\nTOURATECH 라이트가드\n\nBarkbusters 너클가드\n\nMOTORTEK 엔진가드\n\n램마운트 핸드폰거치대\n\nGIVI 탱그탑\n\nGIVI 탑박스\n\nKriga 엔진가드백\n\nKriga 사이드백\n\n아크리포빅 머플러\n\n블랙박스 앞, 뒤\n\n튜브리스 작업\n\n\n튜닝비 5,750,000\n\n그 외 1,000km 혼코 초회점검 하면서 엔진오일 교환했습니다.', 19500000, '판매완료', '2019-10-30 00:54:34'),
	(14, 5, '인천부천', 'R6 판매합니다.', '2021년식 r6 알식스 판매합니다.\r\n\r\n판매전 세차 및 체인청소 루브칠 완료했으며 자주 가는 샾에서 최종점검 다 완료하였습니다.\r\n\r\n튜닝내역및 점검이력\r\n\r\n1000 점검 및 오일교체\r\n\r\n1500 오일 및 필터교체\r\n\r\n3296 오일교체\r\n\r\n5757 오일 및 필터교체\r\n\r\n6200 키로 리어 슈퍼코로사2교체\r\n\r\n8873 오일 및 필터교체\r\n\r\n9901 프론트 슈퍼코르사 v3교체\r\n\r\n10873 오일교체\r\n\r\n​\r\n\r\n​\r\n\r\n특이사항\r\n\r\n주차사고 좌꿍으로 보험처리 완료\r\n\r\n탱크 찍힘, 우측 카울 기스\r\n\r\n​\r\n\r\n​\r\n\r\n튜닝내역\r\n\r\n아코사토 마스터 실린더 \r\n\r\n프렌튜보 메쉬호스 \r\n\r\n도미노 그립 \r\n\r\n풀식스 프론트 휀다 \r\n\r\n라이테크 프로가드 \r\n\r\n라이테크 마스터실린더 캡\r\n\r\n라이테크 탱크패드 \r\n\r\n라이테크 휠 슬라이더 \r\n\r\n라이테크 알루미늄 절삭커버 3종 \r\n\r\n라이테크 마그네슘 레버(클러치) \r\n\r\n라이테크 오일캡 \r\n\r\n라이테크 백스텝 \r\n\r\n하이드랍 스위치 \r\n\r\n라이테크 핸들밸런스 \r\n\r\n라이테크 패독 휠슬라이더 \r\n\r\nSC 프로젝트 crt-로우 \r\n\r\n저먼아이3 \r\n\r\n무선충전 거치대 \r\n\r\n테크스펙 니그립\r\n\r\n리어브레이크 캡 \r\n\r\n휀다 리스킷 \r\n\r\n스모크 스크린\r\n\r\nusb 1구 충전구', 17400000, '판매중', '2019-10-30 16:39:24');

-- 테이블 spring_motorcycle_bbs.category 구조 내보내기
CREATE TABLE IF NOT EXISTS `category` (
  `category_no` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(15) NOT NULL,
  PRIMARY KEY (`category_no`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.category:~29 rows (대략적) 내보내기
DELETE FROM `category`;
INSERT INTO `category` (`category_no`, `category_name`) VALUES
	(1, '서울'),
	(2, '부산'),
	(3, '대구'),
	(4, '대전'),
	(5, '울산'),
	(6, '광주'),
	(7, '경북'),
	(8, '경남'),
	(9, '충북'),
	(10, '충남'),
	(11, '전북'),
	(12, '전남'),
	(13, '강원'),
	(14, '통합창원'),
	(15, '경기북부'),
	(16, '경기남부'),
	(17, '제주'),
	(18, '인천부천'),
	(19, '청주'),
	(20, '구미'),
	(21, '세종'),
	(22, '제휴업체'),
	(23, '해외'),
	(24, '양산'),
	(25, '포항'),
	(26, '전주'),
	(27, '수원'),
	(28, '춘천'),
	(29, '천안');

-- 테이블 spring_motorcycle_bbs.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_no` int(11) NOT NULL AUTO_INCREMENT,
  `board_no` int(11) NOT NULL,
  `user_no` int(11) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_wdate` datetime DEFAULT NULL,
  PRIMARY KEY (`comment_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.comment:~2 rows (대략적) 내보내기
DELETE FROM `comment`;
INSERT INTO `comment` (`comment_no`, `board_no`, `user_no`, `comment_content`, `comment_wdate`) VALUES
	(2, 12, 3, '각개 판매 되나요? \n\n\n\n안돼요?', '2019-10-30 01:08:29'),
	(3, 14, 5, '댓글이빈다.\n\nㅈㅁㄷㅁㅈㄷㅈㅁㄷ\n\nㅈㄷㅈㄷㅈㄷㅈㄷ\n\nㅈㅈㅈ', '2019-10-30 16:43:42');

-- 테이블 spring_motorcycle_bbs.file 구조 내보내기
CREATE TABLE IF NOT EXISTS `file` (
  `file_no` int(11) NOT NULL AUTO_INCREMENT,
  `board_no` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `file_real_name` text NOT NULL,
  `file_size` bigint(20) NOT NULL,
  PRIMARY KEY (`file_no`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.file:~155 rows (대략적) 내보내기
DELETE FROM `file`;
INSERT INTO `file` (`file_no`, `board_no`, `file_name`, `file_real_name`, `file_size`) VALUES
	(1, 1, '20191029233413_0.jpg', '1.jpg', 60202),
	(2, 1, '20191029233413_1.jpg', '2.jpg', 79064),
	(3, 1, '20191029233413_2.jpg', '3.jpg', 85575),
	(4, 1, '20191029233413_3.jpg', '4.jpg', 88357),
	(5, 1, '20191029233413_4.jpg', '5.jpg', 92665),
	(6, 1, '20191029233413_5.jpg', '6.jpg', 87578),
	(7, 1, '20191029233413_6.jpg', '7.jpg', 80947),
	(8, 1, '20191029233413_7.jpg', '8.jpg', 85581),
	(9, 1, '20191029233413_8.jpg', '9.jpg', 136304),
	(10, 1, '20191029233413_9.jpg', '10.jpg', 141404),
	(11, 2, '20191029233704_0.jpg', '2.jpg', 92386),
	(12, 2, '20191029233704_1.jpg', '3.jpg', 71511),
	(13, 2, '20191029233704_2.jpg', '4.jpg', 64036),
	(14, 2, '20191029233704_3.jpg', '5.jpg', 71509),
	(15, 2, '20191029233704_4.jpg', '6.jpg', 87039),
	(16, 2, '20191029233704_5.jpg', '7.jpg', 70213),
	(17, 2, '20191029233704_6.jpg', '8.jpg', 57726),
	(18, 2, '20191029233704_7.jpg', '9.jpg', 90093),
	(19, 2, '20191029233704_8.jpg', '10.jpg', 82390),
	(20, 2, '20191029233704_9.jpg', '11.jpg', 79874),
	(21, 2, '20191029233704_10.jpg', '12.jpg', 157240),
	(22, 3, '20191029233807_0.jpg', '4A09443B-60FB-4603-AD58-BC6D86D85B34.jpg', 130491),
	(23, 3, '20191029233807_1.jpg', '14C6C1CA-E9CC-4A10-9B70-66ADD8CC0157.jpg', 134515),
	(24, 3, '20191029233807_2.jpg', '15F37EC4-AFD8-4674-AE66-1D6DADE49A99.jpg', 150728),
	(25, 3, '20191029233807_3.jpg', '79C37A86-2042-4395-B29C-DE4633185B3D.jpg', 108143),
	(26, 3, '20191029233807_4.jpg', 'B6AA4837-C12B-4E32-82BD-BD1711F186F0.jpg', 111686),
	(27, 3, '20191029233807_5.jpg', 'C517CD16-16FE-47E4-BC5D-AF1CA99523F8.jpg', 205184),
	(28, 3, '20191029233807_6.jpg', 'DE463BDD-997E-467D-92E4-FF340BE39BB4.jpg', 158054),
	(29, 3, '20191029233807_7.jpg', 'image.jpg', 272062),
	(30, 4, '20191029233953_0.jpg', '20191012_003118.jpg', 175482),
	(31, 4, '20191029233953_1.jpg', '20191012_003125.jpg', 117213),
	(32, 4, '20191029233953_2.jpg', '20191012_003133.jpg', 152246),
	(33, 4, '20191029233953_3.jpg', '20191012_003142.jpg', 158339),
	(34, 4, '20191029233953_4.jpg', '20191012_003152.jpg', 187055),
	(35, 4, '20191029233953_5.jpg', '20191012_003212.jpg', 154272),
	(36, 4, '20191029233953_6.jpg', '20191012_003219.jpg', 139847),
	(37, 4, '20191029233953_7.jpg', '20191012_003240.jpg', 184837),
	(38, 5, '20191030003659_0.jpg', '11.jpg', 123298),
	(39, 5, '20191030003659_1.jpg', 'KakaoTalk_20191002_172005055.jpg', 84603),
	(40, 5, '20191030003659_2.jpg', 'KakaoTalk_20191002_172102051.jpg', 94395),
	(41, 5, '20191030003659_3.jpg', 'KakaoTalk_20191002_173813312.jpg', 70834),
	(42, 5, '20191030003659_4.jpg', 'KakaoTalk_20191026_234751007.jpg', 120126),
	(43, 5, '20191030003659_5.jpg', 'KakaoTalk_20191026_234752137.jpg', 158720),
	(44, 5, '20191030003659_6.jpg', 'KakaoTalk_20191026_234752645.jpg', 101254),
	(45, 5, '20191030003659_7.jpg', 'KakaoTalk_20191026_234753150.jpg', 100284),
	(46, 5, '20191030003659_8.jpg', 'KakaoTalk_20191027_000928970.jpg', 154498),
	(47, 6, '20191030004028_0.jpg', '1.jpg', 172399),
	(48, 6, '20191030004028_1.jpg', '2.jpg', 176225),
	(49, 6, '20191030004028_2.jpg', '3.jpg', 230056),
	(50, 6, '20191030004028_3.jpg', '4.jpg', 251864),
	(51, 6, '20191030004028_4.jpg', '5.jpg', 274874),
	(52, 6, '20191030004028_5.jpg', '6.jpg', 142438),
	(53, 6, '20191030004028_6.jpg', '7.jpg', 110633),
	(54, 6, '20191030004028_7.jpg', '8.jpg', 186312),
	(55, 6, '20191030004028_8.jpg', '9.jpg', 182152),
	(56, 6, '20191030004028_9.jpg', '10.jpg', 263167),
	(57, 7, '20191030004327_0.jpg', '1.jpg', 144322),
	(58, 7, '20191030004327_1.jpg', '2.jpg', 187151),
	(59, 7, '20191030004327_2.jpg', '3.jpg', 179830),
	(60, 7, '20191030004327_3.jpg', '4.jpg', 65646),
	(61, 7, '20191030004327_4.jpg', '5.jpg', 134744),
	(62, 7, '20191030004327_5.jpg', '6.jpg', 151786),
	(63, 7, '20191030004327_6.jpg', '7.jpg', 99177),
	(64, 7, '20191030004327_7.jpg', '8.jpg', 121247),
	(65, 8, '20191030004526_0.jpg', '1.jpg', 307847),
	(66, 8, '20191030004526_1.jpg', '2.jpg', 312854),
	(67, 8, '20191030004526_2.jpg', '3.jpg', 312250),
	(68, 8, '20191030004526_3.jpg', '4.jpg', 158146),
	(69, 8, '20191030004526_4.jpg', '5.jpg', 220059),
	(70, 8, '20191030004526_5.jpg', '6.jpg', 169244),
	(71, 8, '20191030004526_6.jpg', '7.jpg', 215710),
	(72, 9, '20191030004747_0.jpg', '20190802_061111.jpg', 142783),
	(73, 9, '20191030004747_1.jpg', '20190802_061118.jpg', 158631),
	(74, 9, '20191030004747_2.jpg', '20190802_061125.jpg', 182794),
	(75, 9, '20191030004747_3.jpg', '20190802_061130.jpg', 175044),
	(76, 9, '20191030004747_4.jpg', '20190802_061135.jpg', 152871),
	(77, 9, '20191030004747_5.jpg', '20190802_061140.jpg', 146736),
	(78, 9, '20191030004747_6.jpg', '20190802_061146.jpg', 150747),
	(79, 9, '20191030004747_7.jpg', '20190802_061152.jpg', 136750),
	(80, 9, '20191030004747_8.jpg', '20190802_061214.jpg', 79684),
	(81, 9, '20191030004747_9.jpg', '20190802_061412.jpg', 148299),
	(82, 10, '20191030004933_0.jpg', '20190609_162929.jpg', 165627),
	(83, 10, '20191030004933_1.jpg', '20190622_200519.jpg', 90621),
	(84, 10, '20191030004933_2.jpg', '20190623_080044.jpg', 156220),
	(85, 10, '20191030004933_3.jpg', '20190623_085236.jpg', 140177),
	(86, 10, '20191030004933_4.jpg', '20190623_085354.jpg', 124074),
	(87, 10, '20191030004933_5.jpg', '20190818_080827.jpg', 140680),
	(88, 10, '20191030004933_6.jpg', '20190818_080850.jpg', 101126),
	(89, 10, '20191030004933_7.jpg', '20190825_081444.jpg', 153515),
	(90, 10, '20191030004933_8.jpg', '20190825_081546.jpg', 101877),
	(91, 10, '20191030004933_9.jpg', '20190825_104401.jpg', 128989),
	(92, 10, '20191030004933_10.jpg', '20190901_192114.jpg', 102676),
	(93, 10, '20191030004933_11.jpg', '20190915_163650.jpg', 149137),
	(94, 10, '20191030004933_12.jpg', '20190915_163735.jpg', 101103),
	(95, 10, '20191030004933_13.jpg', '20190915_172800.jpg', 189221),
	(96, 10, '20191030004933_14.jpg', '20191028_140925.jpg', 179833),
	(97, 10, '20191030004933_15.jpg', '20191028_140931.jpg', 184437),
	(98, 10, '20191030004933_16.jpg', '20191028_140941.jpg', 175634),
	(99, 10, '20191030004933_17.jpg', '20191028_140953.jpg', 181561),
	(100, 10, '20191030004933_18.jpg', '20191028_141000.jpg', 168729),
	(101, 10, '20191030004933_19.jpg', '20191028_143213.jpg', 122671),
	(102, 10, '20191030004933_20.jpg', '20191028_143228.jpg', 177608),
	(103, 10, '20191030004933_21.jpg', '20191028_143234.jpg', 179981),
	(104, 10, '20191030004933_22.jpg', '20191028_143240.jpg', 174034),
	(105, 11, '20191030005103_0.jpg', '20191008_095446.jpg', 179439),
	(106, 11, '20191030005103_1.jpg', '20191008_095451.jpg', 180485),
	(107, 11, '20191030005103_2.jpg', '20191008_095454.jpg', 148185),
	(108, 11, '20191030005103_3.jpg', '20191008_095503.jpg', 184792),
	(109, 11, '20191030005103_4.jpg', '20191008_095507.jpg', 164039),
	(110, 11, '20191030005103_5.jpg', '20191008_095516.jpg', 180866),
	(111, 11, '20191030005103_6.jpg', '20191008_095530.jpg', 190725),
	(112, 11, '20191030005103_7.jpg', '20191008_095532.jpg', 183030),
	(113, 11, '20191030005103_8.jpg', '20191008_095536.jpg', 133245),
	(114, 11, '20191030005103_9.jpg', '20191008_095603.jpg', 162842),
	(115, 11, '20191030005103_10.jpg', '20191008_095604.jpg', 170367),
	(116, 11, '20191030005103_11.jpg', '20191009_100841.jpg', 385228),
	(117, 11, '20191030005103_12.jpg', '20191011_090603.jpg', 107377),
	(118, 11, '20191030005103_13.jpg', '20191011_101405.jpg', 115945),
	(119, 11, '20191030005103_14.jpg', '20191017_233354.jpg', 160745),
	(120, 11, '20191030005103_15.jpg', '20191017_233727.jpg', 146814),
	(121, 12, '20191030005236_0.jpg', 'KakaoTalk_20191018_144811490_01.jpg', 163280),
	(122, 12, '20191030005236_1.jpg', 'KakaoTalk_20191018_144811490_02.jpg', 175625),
	(123, 12, '20191030005236_2.jpg', 'KakaoTalk_20191018_144811490_03.jpg', 177103),
	(124, 12, '20191030005236_3.jpg', 'KakaoTalk_20191018_144811490_04.jpg', 159991),
	(125, 12, '20191030005236_4.jpg', 'KakaoTalk_20191018_144811490_05.jpg', 159362),
	(126, 12, '20191030005236_5.jpg', 'KakaoTalk_20191018_144811490_07.jpg', 174949),
	(127, 12, '20191030005236_6.jpg', 'KakaoTalk_20191018_144811490_09.jpg', 165283),
	(128, 12, '20191030005236_7.jpg', 'KakaoTalk_20191018_144811490_10.jpg', 177570),
	(129, 12, '20191030005236_8.jpg', 'KakaoTalk_20191018_144811490_11.jpg', 114055),
	(130, 13, '20191030005438_0.jpg', 'KakaoTalk_20191027_173303161_01.jpg', 224542),
	(131, 13, '20191030005438_1.jpg', 'KakaoTalk_20191027_173303161_02.jpg', 151462),
	(132, 13, '20191030005438_2.jpg', 'KakaoTalk_20191027_173303161_03.jpg', 309035),
	(133, 13, '20191030005438_3.jpg', 'KakaoTalk_20191027_173303161_04.jpg', 150122),
	(134, 13, '20191030005438_4.jpg', 'KakaoTalk_20191027_173303161_05.jpg', 304727),
	(135, 13, '20191030005438_5.jpg', 'KakaoTalk_20191027_173303161_06.jpg', 280816),
	(136, 13, '20191030005438_6.jpg', 'KakaoTalk_20191027_173303161_07.jpg', 235379),
	(137, 13, '20191030005438_7.jpg', 'KakaoTalk_20191027_173303161_08.jpg', 190420),
	(138, 13, '20191030005438_8.jpg', 'KakaoTalk_20191027_173303161_09.jpg', 187347),
	(139, 13, '20191030005438_9.jpg', 'KakaoTalk_20191027_173303161_10.jpg', 157543),
	(140, 13, '20191030005438_10.jpg', 'KakaoTalk_20191027_173303161_11.jpg', 285760),
	(141, 13, '20191030005438_11.jpg', 'KakaoTalk_20191027_173303161_12.jpg', 154767),
	(142, 13, '20191030005438_12.jpg', 'KakaoTalk_20191027_173303161_13.jpg', 145043),
	(143, 13, '20191030005438_13.jpg', 'KakaoTalk_20191027_173303161_14.jpg', 228133),
	(144, 13, '20191030005438_14.jpg', 'KakaoTalk_20191027_173303161_15.jpg', 267230),
	(145, 13, '20191030005438_15.jpg', 'KakaoTalk_20191028_200030178.jpg', 137851),
	(146, 14, '20191030163928_0.jpg', '1.jpg', 60202),
	(147, 14, '20191030163928_1.jpg', '2.jpg', 79064),
	(148, 14, '20191030163928_2.jpg', '3.jpg', 85575),
	(149, 14, '20191030163928_3.jpg', '4.jpg', 88357),
	(150, 14, '20191030163928_4.jpg', '5.jpg', 92665),
	(151, 14, '20191030163928_5.jpg', '6.jpg', 87578),
	(152, 14, '20191030163928_6.jpg', '7.jpg', 80947),
	(153, 14, '20191030163928_7.jpg', '8.jpg', 85581),
	(154, 14, '20191030163928_8.jpg', '9.jpg', 136304),
	(155, 14, '20191030163928_9.jpg', '10.jpg', 141404);

-- 테이블 spring_motorcycle_bbs.menu 구조 내보내기
CREATE TABLE IF NOT EXISTS `menu` (
  `menu_no` int(11) NOT NULL AUTO_INCREMENT,
  `menu_parent` varchar(20) NOT NULL,
  `menu_child` varchar(20) NOT NULL,
  `menu_title` varchar(80) NOT NULL,
  `menu_type` varchar(10) NOT NULL,
  PRIMARY KEY (`menu_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.menu:~0 rows (대략적) 내보내기
DELETE FROM `menu`;

-- 테이블 spring_motorcycle_bbs.sessions 구조 내보내기
CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- 테이블 데이터 spring_motorcycle_bbs.sessions:~2 rows (대략적) 내보내기
DELETE FROM `sessions`;
INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
	('6QjZBhKwifjmUQyCh-vdgLzUBQ0WRc3o', 1574238132, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}'),
	('yE75c1Ji-LafLhyW_bd_WXSOeoNg1sU2', 1574214640, '{"cookie":{"originalMaxAge":null,"expires":null,"httpOnly":true,"path":"/"}}');

-- 테이블 spring_motorcycle_bbs.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `user_no` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(30) NOT NULL,
  `user_pw` varchar(30) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(70) NOT NULL,
  `user_lv` varchar(10) NOT NULL,
  PRIMARY KEY (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=COMPACT;

-- 테이블 데이터 spring_motorcycle_bbs.user:~5 rows (대략적) 내보내기
DELETE FROM `user`;
INSERT INTO `user` (`user_no`, `user_id`, `user_pw`, `user_name`, `user_email`, `user_lv`) VALUES
	(1, '201844021', '1234', '오주헌', '201844021@itc.ac.kr', 'user'),
	(2, 'test2', '1234', '테스터2', 'test2@test.com', 'user'),
	(3, 'admin', '1234', '관리자', 'admin@admin.com', 'admin'),
	(4, 'test', '1234', '테스터1', '201844021@itc.ac.kr', 'user'),
	(5, 'user', '1234', '사용자1', 'dhwngjs01@naver.com', 'user');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
