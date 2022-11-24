<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-19
  Time: 오후 3:34
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
                                    <%--                                    <a class=" active dd-menu collapsed" href="/user/log-in"--%>
                                    <%--                                        data-bs-toggle="collapse" data-bs-target="#submenu-1-1"--%>
                                    <%--                                        aria-controls="navbarSupportedContent" aria-expanded="false"--%>
                                    <%--                                        aria-label="Toggle navigation">회원관리</a>--%>
<%--                                    <a href="/user/user-info?memberId=2">회원관리</a>--%>
                                </li>
<%--                                <c:choose>--%>
<%--                                    <!-- 관리자 로그인 일 경우 -->--%>
<%--                                    <c:when test="${sessionScope.member_grade == 'A'}">--%>
<%--                                    </c:when>--%>
<%--                                    <!-- 일반회원 일 경우 -->--%>
<%--                                    <c:when test="${sessionScope.member_grade == 'B'}">--%>
<%--                                    </c:when>--%>
<%--                                    <c:otherwise>--%>

<%--                                    </c:otherwise>--%>
<%--                                </c:choose>--%>
                                <c:if test="${sessionScope.member_grade == 'B'}" var="result">
                                    <li class="nav-item">
                                        <a href="/user/user-info?memberId=${sessionScope.member_id}"><i class="lni lni-dashboard"></i> 회원정보</a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/user/user-info?memberId=${sessionScope.member_id}"><i class="lni lni-dashboard"></i> 강의노트</a>
                                    </li>
                                </c:if>
                            </ul>
                        </div> <!-- navbar collapse -->
                        <div class="login-button">
                            <ul>
                                <c:choose>
                                    <c:when test="${sessionScope.member_nickname != null}">
                                        <li>
                                            <span class="text">${sessionScope.member_nickname}</span>
                                        </li>
                                        <li id="li-login">
                                            <a href="/"><i class="lni lni-exit"></i> 로그아웃</a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li id="li-login">
                                            <a href="/user/log-in"><i class="lni lni-enter"></i> 로그인</a>
                                        </li>
                                        <li id="li-registration">
                                            <a href="/user/registration"><i class="lni lni-user"></i> 회원가입</a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
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
<script>
    const requestUserInfo = () => {
        console.log("FFFFFFF");
        location.href = "/user/user-info?memberId=" + ${sessionScope.member_id};
    }
</script>
</body>
</html>
