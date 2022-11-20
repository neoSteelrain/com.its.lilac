<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-17
  Time: 오전 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>ClassiGrids - Classified Ads and Listing Website Template</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="/resources/images/favicon.svg"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/resources/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="/resources/css/animate.css"/>
    <link rel="stylesheet" href="/resources/css/tiny-slider.css"/>
    <link rel="stylesheet" href="/resources/css/glightbox.min.css"/>
    <link rel="stylesheet" href="/resources/css/main.css"/>
</head>
<body>
<!--[if lte IE 9]>
<p class="browserupgrade">
    You are using an <strong>outdated</strong> browser. Please
    <a href="https://browsehappy.com/">upgrade your browser</a> to improve
    your experience and security.
</p>
<![endif]-->

<!-- Preloader -->
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<!-- /End Preloader -->
<jsp:include page="../views/layout/header.jsp" flush="false"></jsp:include>

<section class="hero-area style2 overlay">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7 col-md-12 col-12">
                <div class="hero-text wow fadeInLeft" data-wow-delay=".3s">
                    <!-- Start Hero Text -->
                    <div class="section-heading">
                        <h2>Lilac</h2>
                        <p> 자격증 정보와 유튜브검색까지 한번에 해결하고 <br>강의노트에서 진척상황까지 확인할 수 있습니다</p>
                    </div>
                    <!-- End Hero Text -->
                </div>
            </div>
            <div class="col-lg-5 col-md-12 col-12">
                <!-- Start Search Form -->
                <div class="search-form style2 wow fadeInRight" data-wow-delay=".5s">
                    <h3 class="heading-title">자격증 이름을 입력하세요</h3>
                    <p class="sub-heding-text">여러분의 자격증 취득을 기원합니다</p>
                    <div class="row">
                        <div class="col-12 ">
                            <div class="search-input">
                                <label for="ipt-keyword"><i class="lni lni-search-alt theme-color"></i></label>
                                <input type="text" name="ipt-keyword" id="ipt-keyword" placeholder="자격증 이름을 입력하세요">
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="search-input">
                                <label for="category"><i class="lni lni-grid-alt theme-color"></i></label>
                                <select name="category" id="category">
                                    <option value="none" selected disabled>자격증 분류</option>
                                    <option value="none">정보처리기사</option>
                                    <option value="none">정보처리산업기사</option>
                                    <option value="none">리눅스마스터1급</option>
                                    <option value="none">리눅스마스터2급</option>
                                    <option value="none">빅데이터분석기사</option>
                                </select>
                            </div>
                        </div>
                        <!-- <div class="col-12">
                            <div class="search-input">
                                <label for="location"><i class="lni lni-map-marker theme-color"></i></label>
                                <select name="location" id="location">
                                    <option value="none" selected disabled>Locations</option>
                                    <option value="none">New York</option>
                                    <option value="none">California</option>
                                    <option value="none">Washington</option>
                                    <option value="none">Birmingham</option>
                                    <option value="none">Chicago</option>
                                    <option value="none">Phoenix</option>
                                </select>
                            </div>
                        </div> -->
                        <div class="col-12">
                            <div class="search-btn button">
                                <button id="btn-search" class="btn" onclick="searchYoutubeList()"><i
                                        class="lni lni-search-alt"></i> 검색
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Search Form -->
            </div>
        </div>
    </div>
</section>
<!-- End Hero Area -->

<!-- 자격증 시험일정 정보 시작 -->
<section class="categories style2">
    <div class="container">
        <div class="cat-inner">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">자격증 시험일정 정보</h2>
                        <!-- <p class="wow fadeInUp" data-wow-delay=".6s"></p> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="main-content">
                    <div class="dashboard-block mt-0">
                        <!-- <nav class="list-nav">
                            <ul>
                                <li class="active"><a href="javascript:void(0)">All Ads <span>42</span></a></li>
                                <li><a href="javascript:void(0)">Published <span>88</span></a></li>
                                <li><a href="javascript:void(0)">Featured <span>12</span></a></li>
                                <li><a href="javascript:void(0)">Sold <span>02</span></a></li>
                                <li><a href="javascript:void(0)">Active <span>45</span></a></li>
                                <li><a href="javascript:void(0)">Expired <span>55</span></a></li>
                            </ul>
                        </nav> -->
                        <!-- Start Items Area -->
                        <div class="my-items">
                            <!-- Start Item List Title -->
                            <div class="item-list-title">
                                <div class="row align-items-center">
                                    <div class="col-lg-7 col-md-7 col-12">
                                        <p>자격증 정보</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>마감날짜</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>신청가능여부</p>
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-12 align-right">
                                        <p>강의노트</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End List Title -->
                            <!-- Start Single List -->
                            <div class="single-item-list">
                                <div class="row align-items-center">
                                    <div class="col-lg-7 col-md-7 col-12">
                                        <div class="item-image">
                                            <img src="https://via.placeholder.com/100x100" alt="#">
                                            <div class="content">
                                                <h3 class="title"><a href="javascript:void(0)">Brand New Iphone 11 Pro
                                                    Maxfdfsdfffffffffffffdfsfdsfsffsdffffff</a></h3>
                                                <span class="price">$800</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>2023-2-12</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>아니오</p>
                                    </div>
                                    <div class="col-lg-1 col-md-1 col-12 align-right">
                                        <ul class="action-btn">
                                            <li><a href="javascript:void(0)"><i class="lni lni-plus"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List -->

                            <!-- Pagination -->
                            <div class="pagination left">
                                <ul class="pagination-list">
                                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-left"></i></a></li>
                                    <li class="active"><a href="javascript:void(0)">1</a></li>
                                    <li><a href="javascript:void(0)">2</a></li>
                                    <li><a href="javascript:void(0)">3</a></li>
                                    <li><a href="javascript:void(0)">4</a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                        </div>
                        <!-- End Items Area -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 자격증 시험일정 정보 끝 -->

<!-- 유튜브 검색결과 시작 -->
<section class="items-tab section">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="section-title">
                    <h2 class="wow fadeInUp" data-wow-delay=".4s">Youtube</h2>
                    <p class="wow fadeInUp" data-wow-delay=".6s">자격증으로 검색한 유튜브 영상 목록입니다</p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <!-- <nav>
                    <div class="nav nav-tabs" id="nav-tab" role="tablist">
                        <button class="nav-link active" id="nav-latest-tab" data-bs-toggle="tab"
                            data-bs-target="#nav-latest" type="button" role="tab" aria-controls="nav-latest"
                            aria-selected="true">Latest Ads</button>
                    </div>
                </nav> -->
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-latest" role="tabpanel"
                         aria-labelledby="nav-latest-tab">
                        <div id="div-youtube-list" class="row">
                            <!-- 유튜브 영상 아이템 시작 -->
                            <c:forEach items="${videoList}" var="video">
                                <div class="col-lg-3 col-md-4 col-12">
                                    <div class="single-item-grid">
                                        <div class="image">
                                            <a href="/search/youtube/play?videoId=${video.video_id}"><img
                                                    src="${video.video_thumbnail}" alt="#"></a>
                                            <i class=" cross-badge lni lni-bolt"></i>
                                            <span class="flat-badge sale">추천영상</span>
                                        </div>
                                        <div class="content">
                                            <label class="text-sm-start">${video.video_channel_title}</label>
                                            <p class="h6"><b>${video.video_title}</b></p>
                                            <p class="description">${video.video_desc}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <!-- 유튜브 영상 아이템 끝 -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--유튜브 페이징 인덱스 시작 -->
        <div id="div-paging-index">
<%--            <div class="pagination left">--%>
<%--                <ul class="pagination-list">--%>
<%--                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-left"></i></a></li>--%>
<%--                    <li><a href="javascript:void(0)">1</a></li>--%>
<%--                    <li class="active"><a href="javascript:void(0)">2</a></li>--%>
<%--                    <li><a href="javascript:void(0)">3</a></li>--%>
<%--                    <li><a href="javascript:void(0)">4</a></li>--%>
<%--                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>--%>
<%--                </ul>--%>
<%--            </div>--%>
        </div>
        <!--유튜브 페이징 인덱스 끝 -->
    </div>
</section>
<!-- 유튜브 검색결과 끝 -->

<!-- K-MOOC 정보 시작 -->
<section class="categories style2">
    <div class="container">
        <div class="cat-inner">
            <div class="row">
                <div class="col-12">
                    <div class="section-title">
                        <h2 class="wow fadeInUp" data-wow-delay=".4s">K-MOOC 정보</h2>
                        <!-- <p class="wow fadeInUp" data-wow-delay=".6s"></p> -->
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="main-content">
                    <div class="dashboard-block mt-0">
                        <h3 class="block-title">My Ads</h3>
                        <nav class="list-nav">
                            <ul>
                                <li class="active"><a href="javascript:void(0)">All Ads <span>42</span></a></li>
                                <li><a href="javascript:void(0)">Published <span>88</span></a></li>
                                <li><a href="javascript:void(0)">Featured <span>12</span></a></li>
                                <li><a href="javascript:void(0)">Sold <span>02</span></a></li>
                                <li><a href="javascript:void(0)">Active <span>45</span></a></li>
                                <li><a href="javascript:void(0)">Expired <span>55</span></a></li>
                            </ul>
                        </nav>
                        <!-- Start Items Area -->
                        <div class="my-items">
                            <!-- Start Item List Title -->
                            <div class="item-list-title">
                                <div class="row align-items-center">
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <p>Job Title</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Category</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Condition</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <p>Action</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End List Title -->
                            <!-- Start Single List -->
                            <div class="single-item-list">
                                <div class="row align-items-center">
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <div class="item-image">
                                            <img src="https://via.placeholder.com/100x100" alt="#">
                                            <div class="content">
                                                <h3 class="title"><a href="javascript:void(0)">Brand New Iphone 11 Pro
                                                    Max</a></h3>
                                                <span class="price">$800</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Electronic</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>New</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <ul class="action-btn">
                                            <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List -->
                            <!-- Start Single List -->
                            <div class="single-item-list">
                                <div class="row align-items-center">
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <div class="item-image">
                                            <img src="https://via.placeholder.com/100x100" alt="#">
                                            <div class="content">
                                                <h3 class="title"><a href="javascript:void(0)">New Ferrari F80 Car</a>
                                                </h3>
                                                <span class="price">$13000</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Car</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Vehicle</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <ul class="action-btn">
                                            <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List -->
                            <!-- Start Single List -->
                            <div class="single-item-list">
                                <div class="row align-items-center">
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <div class="item-image">
                                            <img src="https://via.placeholder.com/100x100" alt="#">
                                            <div class="content">
                                                <h3 class="title"><a href="javascript:void(0)">Rick Morton- Magicius
                                                    Chase</a></h3>
                                                <span class="price">$500</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Electronic</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>New</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <ul class="action-btn">
                                            <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List -->
                            <!-- Start Single List -->
                            <div class="single-item-list">
                                <div class="row align-items-center">
                                    <div class="col-lg-5 col-md-5 col-12">
                                        <div class="item-image">
                                            <img src="https://via.placeholder.com/100x100" alt="#">
                                            <div class="content">
                                                <h3 class="title"><a href="javascript:void(0)">HP Laptop 6560b core
                                                    i7</a>
                                                </h3>
                                                <span class="price">$750</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>Electronic</p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>New</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <ul class="action-btn">
                                            <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-eye"></i></a></li>
                                            <li><a href="javascript:void(0)"><i class="lni lni-trash"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single List -->
                            <!-- Pagination -->
                            <div class="pagination left">
                                <ul class="pagination-list">
                                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-left"></i></a></li>
                                    <li><a href="javascript:void(0)">1</a></li>
                                    <li class="active"><a href="javascript:void(0)">2</a></li>
                                    <li><a href="javascript:void(0)">3</a></li>
                                    <li><a href="javascript:void(0)">4</a></li>
                                    <li><a href="javascript:void(0)"><i class="lni lni-chevron-right"></i></a></li>
                                </ul>
                            </div>
                            <!--/ End Pagination -->
                        </div>
                        <!-- End Items Area -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- K-MOOC 정보 끝 -->


<!-- Start Footer Area -->
<footer class="footer">
    <!-- Start Footer Top -->
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer mobile-app">
                        <h3>Mobile Apps</h3>
                        <div class="app-button">
                            <a href="javascript:void(0)" class="btn">
                                <i class="lni lni-play-store"></i>
                                <span class="text">
                                        <span class="small-text">Get It On</span>
                                        Google Play
                                    </span>
                            </a>
                            <a href="javascript:void(0)" class="btn">
                                <i class="lni lni-apple"></i>
                                <span class="text">
                                        <span class="small-text">Get It On</span>
                                        App Store
                                    </span>
                            </a>
                        </div>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-link">
                        <h3>Locations</h3>
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="javascript:void(0)">Chicago</a></li>
                                    <li><a href="javascript:void(0)">New York City</a></li>
                                    <li><a href="javascript:void(0)">San Francisco</a></li>
                                    <li><a href="javascript:void(0)">Washington</a></li>
                                    <li><a href="javascript:void(0)">Boston</a></li>
                                </ul>
                            </div>
                            <div class="col-lg-6 col-md-6 col-12">
                                <ul>
                                    <li><a href="javascript:void(0)">Los Angeles</a></li>
                                    <li><a href="javascript:void(0)">Seattle</a></li>
                                    <li><a href="javascript:void(0)">Las Vegas</a></li>
                                    <li><a href="javascript:void(0)">San Diego</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-link">
                        <h3>Quick Links</h3>
                        <ul>
                            <li><a href="javascript:void(0)">About Us</a></li>
                            <li><a href="javascript:void(0)">How It's Works</a></li>
                            <li><a href="javascript:void(0)">Login</a></li>
                            <li><a href="javascript:void(0)">Signup</a></li>
                            <li><a href="javascript:void(0)">Help & Support</a></li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
                <div class="col-lg-3 col-md-6 col-12">
                    <!-- Single Widget -->
                    <div class="single-footer f-contact">
                        <h3>Contact</h3>
                        <ul>
                            <li>23 New Design Str, Lorem Upsum 10<br> Hudson Yards, USA</li>
                            <li>Tel. +(123) 1800-567-8990 <br> Mail. support@classigrids.com</li>
                        </ul>
                    </div>
                    <!-- End Single Widget -->
                </div>
            </div>
        </div>
    </div>
    <!--/ End Footer Middle -->
    <!-- Start Footer Bottom -->
    <div class="footer-bottom">
        <div class="container">
            <div class="inner">
                <div class="row">
                    <div class="col-12">
                        <div class="content">
                            <ul class="footer-bottom-links">
                                <li><a href="javascript:void(0)">Terms of use</a></li>
                                <li><a href="javascript:void(0)"> Privacy Policy</a></li>
                                <li><a href="javascript:void(0)">Advanced Search</a></li>
                                <li><a href="javascript:void(0)">Site Map</a></li>
                                <li><a href="javascript:void(0)">Information</a></li>
                            </ul>
                            <p class="copyright-text">Designed and Developed by <a href="https://graygrids.com/"
                                                                                   rel="nofollow" target="_blank">GrayGrids</a>
                            </p>
                            <ul class="footer-social">
                                <li><a href="javascript:void(0)"><i class="lni lni-facebook-filled"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-youtube"></i></a></li>
                                <li><a href="javascript:void(0)"><i class="lni lni-linkedin-original"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Footer Middle -->
</footer>
<!--/ End Footer Area -->

<!-- ========================= scroll-top ========================= -->
<a href="#" class="scroll-top btn-hover">
    <i class="lni lni-chevron-up"></i>
</a>

<!-- ========================= JS here ========================= -->
<script src="/resources/js/bootstrap.bundle.js"></script>
<script src="/resources/js/jQuery-3-6-1.js"></script>
<script src="/resources/js/wow.min.js"></script>
<script src="/resources/js/tiny-slider.js"></script>
<script src="/resources/js/glightbox.min.js"></script>
<script src="/resources/js/main.js"></script>
<script>
    //========= testimonial
    tns({
        container: '.testimonial-slider',
        items: 3,
        slideBy: 'page',
        autoplay: false,
        mouseDrag: true,
        gutter: 0,
        nav: true,
        controls: false,
        controlsText: ['<i class="lni lni-arrow-left"></i>', '<i class="lni lni-arrow-right"></i>'],
        responsive: {
            0: {
                items: 1,
            },
            540: {
                items: 1,
            },
            768: {
                items: 2,
            },
            992: {
                items: 2,
            },
            1170: {
                items: 2,
            }
        }
    }); // 부트스트랩 스크립트 끝
</script>
</body>
<script>

    /**
     * - 유튜브영상 리스트를 ajax로 비동기 업데이트 하는 함수
     * - 현재 UI 특성상 한번에 표시할 영상갯수는 8개로 고정한다
     * - 함수호출 순서 -
     * 사용자가 검색요청 -> searchYoutubeList 함수 -> searchKeyword 컨트롤러 -> paging-template.jsp 에서 jstl로 HTML 작성 ->
     * searchYoutubeList 함수에서 일반TEXT로 HTML을 받아서 jQuery로 유튜브영상리스트 div, 페이징인덱스 div를 업데이트
     * - 참고한 사이트 주소 : https://backstreet-programmer.tistory.com/105
     * @param offsetParam 이동할 페이지번호
     */
    const searchYoutubeList = (offsetParam) => {
        const m_keyword = $('#ipt-keyword').val();
        if (m_keyword == "")
            return;

        $.ajax({
            type: "get",
            url: "/search/youtube/keyword-search",
            dataType: "text",
            data: {
                keyword: m_keyword,
                offset: offsetParam,
                videoCount: "8"
            },
            success: (result) => {
                let html = jQuery('<div>').html(result);
                let contents = html.find("div#video-paging-template").html();
                $('#div-youtube-list').html(contents);

                let pagingIndex = html.find("div#paging-index-template").html();
                $('#div-paging-index').html(pagingIndex);
            },
            error: (errMsg) => {
                alert(errMsg);
            }
        });
    }
</script>
</html>
