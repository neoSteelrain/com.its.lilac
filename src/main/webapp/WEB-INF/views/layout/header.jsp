<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-19
  Time: 오후 3:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>ClassiGrids - Classified Ads and Listing Website Template</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="../../../resources/images/favicon.svg"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">

    <!-- ========================= CSS here ========================= -->
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="../../../resources/css/animate.css"/>
    <link rel="stylesheet" href="../../../resources/css/tiny-slider.css"/>
    <link rel="stylesheet" href="../../../resources/css/glightbox.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/main.css"/>
</head>
<body>
<header class="header navbar-area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-12">
                <div class="nav-inner">
                    <nav class="navbar navbar-expand-lg">
                        <a class="navbar-brand" href="/">
                            <img src="../../../resources/images/logo/logo.svg" alt="Logo">
                        </a>
                        <button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                aria-expanded="false" aria-label="Toggle navigation">
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon"></span>
                            <span class="toggler-icon`"></span>
                        </button>
                        <div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
                            <ul id="nav" class="navbar-nav ms-auto">
                                <li class="nav-item">
                                    <a class=" active dd-menu collapsed" href="javascript:void(0)"
                                       data-bs-toggle="collapse" data-bs-target="#submenu-1-1"
                                       aria-controls="navbarSupportedContent" aria-expanded="false"
                                       aria-label="Toggle navigation">관리자</a>
                                    <!-- <ul class="sub-menu collapse" id="submenu-1-1">
                                        <li class="nav-item"><a href="index.html">회원관리</a></li>
                                        <li class="nav-item active"><a href="index2.html"></a></li>
                                        <li class="nav-item"><a href="index3.html">Home Version 3</a></li>
                                    </ul> -->
                                </li>
                                <!-- <li class="nav-item">
                                    <a href="category.html" aria-label="Toggle navigation">Categories</a>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-3"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Listings</a>
                                    <ul class="sub-menu collapse" id="submenu-1-3">
                                        <li class="nav-item"><a href="item-listing-grid.html">Ad Grid</a></li>
                                        <li class="nav-item"><a href="item-listing-list.html">Ad Listing</a></li>
                                        <li class="nav-item"><a href="item-details.html">Ad Details</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-4"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Pages</a>
                                    <ul class="sub-menu mega-menu collapse" id="submenu-1-4">
                                        <li class="single-block">
                                            <ul>
                                                <li class="mega-menu-title">Essential Pages</li>
                                                <li class="nav-item"><a href="about-us.html">About Us</a></li>
                                                <li class="nav-item"><a href="item-details.html">Ads Details</a></li>
                                                <li class="nav-item"><a href="post-item.html">Ads Post</a></li>
                                                <li class="nav-item"><a href="pricing.html">Pricing Table</a></li>
                                                <li class="nav-item"><a href="registration.html">Sign Up</a></li>
                                                <li class="nav-item"><a href="login.html">Sign In</a></li>
                                                <li class="nav-item"><a href="contact.html">Contact Us</a></li>
                                                <li class="nav-item"><a href="faq.html">FAQ</a></li>
                                                <li class="nav-item"><a href="404.html">Error Page</a></li>
                                                <li class="nav-item"><a href="mail-success.html">Mail Success</a>
                                                </li>
                                                <li class="nav-item"><a href="coming-soon.html">Comming Soon</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="single-block">
                                            <ul>
                                                <li class="mega-menu-title">Dashboard</li>
                                                <li class="nav-item"><a href="dashboard.html">Account Overview</a>
                                                </li>
                                                <li class="nav-item"><a href="profile-settings.html">My Profile</a>
                                                </li>
                                                <li class="nav-item"><a href="my-items.html">My Ads</a></li>
                                                <li class="nav-item"><a href="favourite-items.html">Favorite Ads</a>
                                                </li>
                                                <li class="nav-item"><a href="post-item.html">Ad post</a></li>
                                                <li class="nav-item"><a href="bookmarked-items.html">Bookmarked Ad</a>
                                                </li>
                                                <li class="nav-item"><a href="messages.html">Messages</a></li>
                                                <li class="nav-item"><a href="delete-account.html">Close account</a>
                                                </li>
                                                <li class="nav-item"><a href="invoice.html">Invoice</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item">
                                    <a class=" dd-menu collapsed" href="javascript:void(0)"
                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-5"
                                        aria-controls="navbarSupportedContent" aria-expanded="false"
                                        aria-label="Toggle navigation">Blog</a>
                                    <ul class="sub-menu collapse" id="submenu-1-5">
                                        <li class="nav-item"><a href="blog-grid-sidebar.html">Blog Grid Sidebar</a>
                                        </li>
                                        <li class="nav-item"><a href="blog-single.html">Blog Single</a></li>
                                        <li class="nav-item"><a href="blog-single-sidebar.html">Blog Single
                                                Sibebar</a></li>
                                    </ul>
                                </li> -->
                            </ul>
                        </div> <!-- navbar collapse -->
                        <div class="login-button">
                            <ul>
                                <li id="li-login">
                                    <a href="/user/log-in"><i class="lni lni-enter"></i> 로그인</a>
                                </li>
                                <li id="li-registration">
                                    <a href="/user/registration"><i class="lni lni-user"></i> 회원가입</a>
                                </li>
                            </ul>
                        </div>

                        <div class="dropdown">
                            <button class="btn btn-primary btn-sm dropdown-toggle" type="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">회원메뉴
                            </button>
                            <ul class="dropdown-menu">
                                <li>
                                    <button class="dropdown-item" type="button">회원정보</button>
                                </li>
                                <li>
                                    <button class="dropdown-item" type="button">강의노트</button>
                                </li>
                                <li>
                                    <button class="dropdown-item" type="button">로그아웃</button>
                                </li>
                            </ul>
                        </div>

                        <!-- <div class="button header-button">
                            <a href="post-item.html" class="btn">Post an Ad</a>
                        </div> -->
                    </nav> <!-- navbar -->
                </div>
            </div>
        </div> <!-- row -->
    </div>
</header>
<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
</body>
</html>
