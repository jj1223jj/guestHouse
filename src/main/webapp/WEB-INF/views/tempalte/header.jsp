<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<c:set var = "root" value = "${pageContext.request.contextPath}"/>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="X-UA-Compatible" content="IE=Edge">
		<meta charset="utf-8">

		<%-- <link rel="stylesheet" href="${root}/resources/css/register/test0.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test1.css"/> 
		<link rel="stylesheet" href="${root}/resources/css/register/test2.css"/>
		<link rel="stylesheet" href="${root}/resources/css/register/test3.css"/> --%>
		
		
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 헤더영역 -->

	<header id="headerWrap" class="" style="margin-left: 0px;">
		<h1><a href="/">paradise city</a></h1>
		<nav class="gnb">
			<ul>
				<li>
					<a href="/front/reservation">offers</a>
				</li>
				<li>
					<a href="#">hotels</a>
					<div class="gnbDepth2" style="display: none;">
						<div>
							<h2><a href="/front/hotel/overview"><span>hotel</span>paradise</a></h2>
							<ul>
								<li><a href="/front/hotel/overview">Overview</a></li>
								<li class="on"><a href="/front/hotel/room/list">객실</a></li>
								<li><a href="/front/hotel/dining/list">다이닝</a></li>
								<li><a href="/front/hotel/facility/list">부대시설</a></li>
								<li><a href="/front/reservation?TAB_CD=HTL&amp;V_SBU_CD_HTL[]=000001&amp;SBU_CD_HTL[]=000001">OFFERS</a></li>
								<li><a href="/front/event/event?SBU_CD=000002">Events</a></li>
								<li><a href="/front/hotel/support">고객지원</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/artParadiso/overview"><span>hotel</span>ART PARADISO</a></h2>
							<ul>
								<li><a href="/front/artParadiso/overview">Overview</a></li>
								<li class="on"><a href="/front/artParadiso/room/list">객실</a></li>
								<li><a href="/front/artParadiso/dining/list">다이닝</a></li>
								<li><a href="/front/artParadiso/facility/list">부대시설</a></li>
								<li><a href="/front/reservation?TAB_CD=HTL&amp;V_SBU_CD_HTL[]=000002&amp;SBU_CD_HTL[]=000002">OFFERS</a></li>
								<li><a href="/front/event/event?SBU_CD=000003">Events</a></li>
								<li><a href="/front/artParadiso/support">고객지원</a></li>
							</ul>
						</div>
					</div>
				</li>
				
				<li>
					<a href="#">casino</a>
					<div class="gnbDepth2" style="display: none;">
						<div>
							<h2><a href="/front/casino/overview"><span>casino</span>PARADISE CASINO</a></h2>
							<ul>
								<li><a href="/front/casino/overview">Overview</a></li>
								<li class="on"><a href="/front/casino/operation">이용안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000004">Events</a></li>
								<li><a href="/front/casino/jackpot">잭팟스토리</a></li>
								<li><a href="/front/reservation?SBU_CD=000003">Offers</a></li>
								<li><a href="/front/casino/gameGuide">게임가이드</a></li>
								<li><a href="/front/casino/facility">시설안내</a></li>
								<li><a href="/front/casino/support">고객지원</a></li>
							</ul>
						</div>
					</div>
				</li>
				
				<li>
					<a href="#">entertainment</a>
					<div class="gnbDepth2" style="display: none;">
						<div>
							<h2><a href="/front/cimer/overview"><span>SPA</span>CIMER</a></h2>
							<ul>
								<li><a href="/front/cimer/overview">Overview</a></li>
								<li><a href="/front/cimer/facility">시설안내</a></li>
								<li class="on"><a href="/front/cimer/operation">가격 및 이용안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000005">Events</a></li>
								<li><a href="/front/reservation?TAB_CD=PKG&amp;V_SBU_CD_PKG[]=000004&amp;SBU_CD_PKG[]=000004">Offers</a></li>
								<li><a href="/front/cimer/support">고객지원</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/chroma/overview"><span>club</span>CHROMA</a></h2>
							<ul>
								<li><a href="/front/chroma/overview">Overview</a></li>
								<li class="on"><a href="/front/chroma/facility">가격 및 이용안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000006">Events</a></li>
								<li><a href="/front/reservation?TAB_CD=PKG&amp;V_SBU_CD_PKG[]=000005&amp;SBU_CD_PKG[]=000005">Offers</a></li>
								<li><a href="/front/chroma/photo">Photos &amp; Videos</a></li>
								<li><a href="/front/chroma/artist/list">ARTISTS</a></li>
								<li><a href="/front/chroma/support">고객지원</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/plaza/overview"><span>SHOPPING</span>PLAZA</a></h2>
							<ul>
								<li><a href="/front/plaza/overview">Overview</a></li>
								<li class="on"><a href="/front/plaza/facility/list">시설안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000008">Events</a></li>
								<li><a href="/front/plaza/support">고객지원</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/wonderbox/overview"><span>THEME PARK</span>WONDERBOX</a></h2>
							<ul>
								<li><a href="/front/wonderbox/overview">Overview</a></li>
								<li class="on"><a href="/front/wonderbox/facility">시설안내</a></li>
								<li><a href="/front/wonderbox/operation">가격 및 이용안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000007">Events</a></li>
								<li><a href="/front/reservation?TAB_CD=PKG&amp;V_SBU_CD_PKG[]=000006&amp;SBU_CD_PKG[]=000006">OFFERS</a></li>
								<li><a href="/front/wonderbox/support">고객지원</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">dine &amp; drink</a>
					<div class="gnbDepth2" style="display: none;">
						<div>
							<h2><a href="/front/dining?F_CATE1=FINE DINE %26 DRINK"><span>F&amp;B</span>DINE &amp; DRINK</a></h2>
							<ul>
								<li><a href="/front/dining?F_CATE1=FINE DINE %26 DRINK">FINE DINE &amp; DRINK</a></li>
								<li><a href="/front/dining?F_CATE1=CASUAL DINE %26 DRINK">CASUAL DINE &amp; DRINK</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li class="">
					<a href="#">ACTIVITIES</a>
					<div class="gnbDepth2" style="display: none; height: 400px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
						<div>
							<h2><a href="/front/activities/paradise/list"><span>ACTIVITIES</span>ACTIVITIES</a></h2>
							<ul>
								<li><a href="/front/activities/paradise/list">파라다이스 즐길거리</a></li>
								<li><a href="/front/activities/around/list">주변 즐길거리</a></li>
							</ul>
						</div>
					</div>
				</li>
				<li>
					<a href="#">groups &amp; weddings</a>
					<div class="gnbDepth2" style="display: none;">
						<div>
							<h2><a href="/front/convention/overview"><span>BALLROOM</span>CONVENTION</a></h2>
							<ul>
								<li><a href="/front/convention/overview">Overview</a></li>
								<li class="on"><a href="/front/convention/facility">시설안내</a></li>
								<li><a href="/front/convention/wedding">웨딩서비스</a></li>
								<li><a href="/front/convention/party">연회서비스</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/studio/overview"><span>STUDIO</span>STUDIO PARADISE</a></h2>
							<ul>
								<li><a href="/front/studio/overview">Overview</a></li>
								<li class="on"><a href="/front/studio/facility">시설안내</a></li>
								<li><a href="/front/studio/rent">대관안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000010">이벤트/대관현황</a></li>
								<li><a href="/front/studio/support">고객지원</a></li>
							</ul>
						</div>
						
						<div>
							<h2><a href="/front/culturePark/overview"><span>OPEN SPACE</span>CULTURE PARK</a></h2>
							<ul>
								<li><a href="/front/culturePark/overview">Overview</a></li>
								<li><a href="/front/culturePark/rent">대관안내</a></li>
							</ul>
						</div>
						
					</div>
				</li>
				<li class="">
					<a href="#">art</a>
					<div class="gnbDepth2" style="display: none; height: 400px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;">
						<div>
							<h2><a href="/front/artSpace/overview"><span>ART GALLERY</span>PARADISE ART SPACE</a></h2>
							<ul>
								<li><a href="/front/artSpace/overview">전시소개</a></li>
								<li><a href="/front/artSpace/gallery">갤러리소개</a></li>
								<li><a href="/front/artSpace/operation">이용안내</a></li>
								<li><a href="/front/event/event?SBU_CD=000009">Events</a></li>
								<li><a href="/front/reservation?SBU_CD=000007">offers</a></li>
								<li><a href="/front/artSpace/mdProduct">md상품</a></li>
								<li><a href="/front/artSpace/exhibition/list">지난전시</a></li>
								<li><a href="/front/artSpace/pressroom">프레스룸</a></li>
								<li><a href="/front/artSpace/support">고객지원</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/artGarden/overview"><span style="height:16px;"></span>ART GARDEN</a></h2>
							<ul>
								<li><a href="/front/artGarden/overview">작품소개</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/paradiseWalk/overview"><span style="height:16px;"></span>PARADISE WALK</a></h2>
							<ul>
								<li><a href="/front/paradiseWalk/overview">작품소개</a></li>
							</ul>
						</div>
						<div>
							<h2><a href="/front/art"><span>artworks</span>ART COLLECTION</a></h2>
							<ul>
								<li><a href="/front/art">작품소개</a></li>
								<li><a href="/front/art/map">ART MAP</a></li>
							</ul>
						</div>
					</div>
				</li>
			</ul>
		</nav>
		
		<div class="topLink">
			<div class="more">
				<a href="#" class="topMore">More</a>
				<ul>
					<li><a href="/front/event/event">EVENTS</a></li>
					<li><a href="/front/memnotice/membership">MEMBERSHIP</a></li>
					<li><a href="/front/notice">고객지원</a></li>
					<li><a href="/front/contents/pcity/paradiseCity?M1=PAR&amp;M2=PC">ABOUT US</a></li>
					
					<li><a href="/front/login">로그인</a></li>
					<li><a href="/front/member/joinStep1">회원가입</a></li>
					
					<li><a href="/auth/front/mypage/reservation">예약확인/취소</a></li>
				</ul>
			</div>
			<script type="text/javascript">
				function jsChangeLang(lang) {
					$.session.clear();
					location.href = "/?language=" + lang;
				}
			</script>
			
		</div>
		
		<div class="bgDepth" style="display: none; height: 400px; padding-top: 0px; margin-top: 0px; padding-bottom: 0px; margin-bottom: 0px;"></div>
		<!-- <p style="text-align: center; position: absolute; font-size: 100px;">JEJU STAY</p> -->
	</header>
			<!-- //헤더영역 -->
	
</body>
</html>