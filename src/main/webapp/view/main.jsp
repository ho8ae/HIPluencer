<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html lang="en">



<link rel="preconnect" href="../fonts.gstatic.com/index.html" />
<link
	href="../fonts.googleapis.com/css27803.css?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="../fonts.googleapis.com/css2fcc1.css?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="../fonts.googleapis.com/css24a49.css?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<link
	href="../fonts.googleapis.com/css21ca1.css?family=Noto+Sans+KR:wght@100..900&amp;display=swap"
	rel="stylesheet">
<link
	href="../fonts.googleapis.com/css2155e.css?family=Black+Han+Sans&amp;family=Noto+Sans+KR:wght@100..900&amp;display=swap"
	rel="stylesheet">



<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HIPluncer</title>

<!-- include css -->
<link href="../css/main_style.css" rel="stylesheet" />
<link href="../css/bootstrap-icons.css" rel="stylesheet" />
<link href="../css/style.css" rel="stylesheet" />

<link href="../css/error.css" rel="stylesheet" />


<!-- include js -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2268b8632813c7611c2021f61b2e036&amp;libraries=services"></script>
<script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/main/4.4.18/kakao.js"></script>
<script charset="UTF-8" src="https://t1.daumcdn.net/mapjsapi/js/libs/services/1.0.2/services.js"></script>
<script src="../js/main_notLogin.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>





<script src="../js/sidebar.js"></script>


<script type="text/javascript"
	src="../../dapi.kakao.com/v2/maps/sdkff6d.json?appkey=9ceb3586edd786e4d4ff3425e390624c&amp;libraries=services"></script>


</head>
<script src="../js/main_notLogin.js"></script>

<body id="page-top">
    <div class="d-flex" id="wrapper">


        <div class="border-end text-dark-hipluncer bg-hipluncer" id="sidebar-wrapper">
            <div class="sidebar-heading text-center border-bottom"><a href="./intro.jsp"
                    class="text-dark-hipluncer text-decoration-none">HIPluncer</a>
            </div>
            <div class="list-group list-group-flush">
                <a class="p-3" href="#!">
                    <form class="d-flex" role="search" onsubmit="return false;">
                        <input class="form-control me-2" type="search" aria-label="Search" >
                        <button class="btn btn-hipluncer" data-bs-toggle="modal" data-bs-target="#loginModal"><i
                                class="bi bi-search"></i></button>
                    </form>
                </a>
                <a class="list-group-item-action p-3" href="main.jsp">
                    <button class="btn">메인</button>
                </a>
                <a class="list-group-item-action p-3" href="#community" data-bs-toggle="collapse" role="button"
                    aria-expanded="false" aria-controls="community">
                    <button class="btn">커뮤니티</button>
                    <div class="collapse mt-3" id="community">
                        <div class="card card-body">
                            <button class="btn btn-light mb-1 open-login-modal" type="button" data-bs-toggle="modal"
                                data-bs-target="#loginModal">
                                자유게시판
                            </button>
                            <button class="btn btn-light mb-1 open-login-modal" type="button" data-bs-toggle="modal"
                                data-bs-target="#loginModal">
                               	행사 공유소
                            </button>
                        </div>
                    </div>
                </a>
                <a class="list-group-item-action p-3" href="#good-restaurant" data-bs-toggle="collapse" role="button"
                    aria-expanded="false" aria-controls="good-restaurant">
                    <button class="btn">지역별 행사 (준비중!)</button>
                    <div class="collapse mt-3" id="good-restaurant">
                        <div class="card card-body">
                            <h6 class="card-title mb-2 text-body-secondary">지역</h6>
                            <button class="btn btn-light mb-1 open-login-modal" type="button" data-bs-toggle="collapse"
                                data-bs-target="#good-restaurant">
                                전체
                            </button>
                            <h6 class="card-title mb-2 text-body-secondary">지역별로 오픈 예정입니다!</h6>
                            <button class="btn btn-light disabled mb-1" type="button" data-bs-toggle="collapse"
                                data-bs-target="#good-restaurant">
                                서울
                            </button>
                            <button class="btn btn-light disabled mb-1" type="button" data-bs-toggle="collapse"
                                data-bs-target="#good-restaurant">
                                춘천
                            </button>
                            <button class="btn btn-light disabled mb-1" type="button" data-bs-toggle="collapse"
                                data-bs-target="#good-restaurant">
                                부산
                            </button>
                        </div>
                    </div>
                </a>
                
                <div class="card mt-3 mb-3 ms-3 me-3 text-center"
                    style="font-size: .875rem; background-color: rgba(0, 0, 0, .1); color: rgba(255, 255, 255, .8); border-radius: 0.35rem;">
                    <div class="card-body">
                        <img class="satellites mb-2" src="../images/hiplucner_icon.png" alt="..." style="height:3rem;">
                        <p class="card-text"><b>Hipluncer</b>는 웹서버구축 프로젝트로 만들게되었습니다. 앞으로 더 많은 기능 추가할 예정입니다.</p>
                        <a href="https://www.instagram.com/low_o80" target="_blank" class="btn btn-light">More
                            Information</a>
                    </div>
                </div>
                <a href="./login.jsp" class="m-2 btn btn-hipluncer">
                    <span class="text text-white">로그인</span>
                </a>
            </div>
        </div>

        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light shadow-sm" id="topNavbar">
                <div class="container-fluid">
                    <button class="btn btn-hipluncer" id="sidebarToggle">&lt;</button>

                </div>
            </nav>

            <div class="container-fluid px-4">
                <div class="container my-3">
                    <div class="row mt-3 mb-3">
                        <div class="col-lg-8 col-md-6 col-sm-8 col-xs-12 mb-3">
                            <div class="card">
                                <div class="card-body">
                                    <div class="font-weight-bold text-dark text-uppercase mb-1">
                                        HOT PLACE 네비게이션
                                    </div>
                                    <hr>
                                    <div id="map" style="position: relative; height:75vh;">
                                    <!-- 이곳에 카카오맵 넣을 예 -->
                                    
                                    
                                    
                                    </div>
                                    <a title="HIPluncer 아이콘" href="https://www.flaticon.com/kr/free-icons/"
                                        class="fs-8 text-muted pb-0">HIPLUNCER 아이콘 제작자: Freepik - Flaticon</a>
                                </div>
                                <div class="guide-board card-footer d-flex align-items-center justify-content-between"
                                    data-bs-toggle="modal" data-bs-target="#loginModal">
                                    <div class="small text-dark">여러분의 HOTPLACE도 소개해주세요!</div>
                                    <div class="small text-dark">
                                        <i class="bi bi-chevron-right"></i>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 col-sm-8 col-xs-12">
                            <div class="row">
                                <div class="card" style="padding : 0rem;">
                                    <div class="card-header">
                                        Hipluncer HOT
                                    </div>


                                    <ul class="list-group list-group-flush">

                                        <a href="#" class="list-group-item list-group-item-action"
                                            data-bs-toggle="modal" data-bs-target="#loginModal">오늘 한림대에서 공연합니다!~</a>

                                        <a href="#" class="list-group-item list-group-item-action"
                                            data-bs-toggle="modal" data-bs-target="#loginModal">이번 달 축제 모음!</a>

                                        <a href="#" class="list-group-item list-group-item-action"
                                            data-bs-toggle="modal" data-bs-target="#loginModal"> 20학번 빅데이터 김태호 화이팅!
                                        </a>

                                        <a href="#" class="list-group-item list-group-item-action"
                                            data-bs-toggle="modal" data-bs-target="#loginModal">사이트가 엄청 이뻐요!</a>

                                    </ul>
                                    <div class="guide-board card-footer d-flex align-items-center justify-content-between"
                                        data-bs-toggle="modal" data-bs-target="#loginModal">
                                        <div class="small text-dark">더보기</div>
                                        <div class="small text-dark">
                                            <i class="bi bi-chevron-right"></i>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="row mt-3">
                                <div class="guide-board card border-left-warning shadow h-100 py-2"
                                    data-bs-toggle="modal" data-bs-target="#loginModal">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    요즘 뜨는 신인 아티스트!</div>
                                                <div class="text-black-50 font-weight-bold small">알고싶으면 click!</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="bi bi-hand-index-thumb fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="row mt-3">
                                <div class="guide-board card border-left-succes shadow h-100 py-2"
                                    data-bs-toggle="modal" data-bs-target="#loginModal">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                   크루를 모집하거나 모집해보세요!</div>
                                                <div class="text-black-50 font-weight-bold small">알고싶으면 click!</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="bi bi-hand-index-thumb fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                          
                            
                            
                            <div class="row mt-3">
                                <div class="guide-board card border-right-primary shadow h-100 py-2"
                                    data-bs-toggle="modal" data-bs-target="#loginModal">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="font-weight-bold text-primary text-uppercase mb-1">
                                                    AI가 알려주는 힙합 정보 및 노래 추천 !</div>
                                                <div class="text-black-50 font-weight-bold small">알고싶으면
													Click! </div>
                                            </div>
                                            <div class="col-auto">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30"
                                                    fill="currentColor" class="bi bi-robot" viewBox="0 0 16 16">
                                                    <path
                                                        d="M6 12.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5M3 8.062C3 6.76 4.235 5.765 5.53 5.886a26.6 26.6 0 0 0 4.94 0C11.765 5.765 13 6.76 13 8.062v1.157a.93.93 0 0 1-.765.935c-.845.147-2.34.346-4.235.346s-3.39-.2-4.235-.346A.93.93 0 0 1 3 9.219zm4.542-.827a.25.25 0 0 0-.217.068l-.92.9a25 25 0 0 1-1.871-.183.25.25 0 0 0-.068.495c.55.076 1.232.149 2.02.193a.25.25 0 0 0 .189-.071l.754-.736.847 1.71a.25.25 0 0 0 .404.062l.932-.97a25 25 0 0 0 1.922-.188.25.25 0 0 0-.068-.495c-.538.074-1.207.145-1.98.189a.25.25 0 0 0-.166.076l-.754.785-.842-1.7a.25.25 0 0 0-.182-.135" />
                                                    <path
                                                        d="M8.5 1.866a1 1 0 1 0-1 0V3h-2A4.5 4.5 0 0 0 1 7.5V8a1 1 0 0 0-1 1v2a1 1 0 0 0 1 1v1a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2v-1a1 1 0 0 0 1-1V9a1 1 0 0 0-1-1v-.5A4.5 4.5 0 0 0 10.5 3h-2zM14 7.5V13a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V7.5A3.5 3.5 0 0 1 5.5 4h5A3.5 3.5 0 0 1 14 7.5" />
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                     
                            
                            
                            <div class="row mt-3">


                                <div class="guide-board card bg-opacity-75 text-white shadow"
                                    style="background-color:#000000; border-color:#000000;" data-bs-toggle="modal"
                                    data-bs-target="#loginModal">
                                    <div class="card-body">
                                        <span>'힙'이 곧 인생이다.</span>
                                        <div class="text-white-50 small">'합'은 리듬.</div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel"
                        aria-hidden="true" style="padding-right:17px;">



                        <!--로그인 안내 모달-->
                        <div class="modal-dialog modal-sm">
                            <div class="modal-content">
                                <div class="modal-body text-center">
                                    로그인이 필요한 서비스입니다.
                                </div>
                                <div class="modal-footer">
                                    <a href="login.jsp" class="btn btn-sm btn-hipluncer">로그인</a>
                                    <a class="btn btn-sm btn-secondary" data-bs-dismiss="modal">나가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</body>





</body> 






</html>