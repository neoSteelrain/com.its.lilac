<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-22
  Time: 오후 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>로그인</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
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
<div class="preloader">
    <div class="preloader-inner">
        <div class="preloader-icon">
            <span></span>
            <span></span>
        </div>
    </div>
</div>
<section class="login section">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                <div class="form-head">
                    <h4 class="title">로그인</h4>
                    <form action="#!" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="ipt-email" maxlength="20"
                                   placeholder="이메일을 입력하세요">
                            <label for="ipt-email">이메일</label>
                            <span id="emailNotice"></span>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="ipt-password" maxlength="30"
                                   placeholder="name@example.com">
                            <label for="ipt-password">비밀번호</label>
                            <span id="pwNotice"></span>
                        </div>
                        <div class="check-and-pass">
                            <div class="row align-items-center">
                                <div class="col-lg-6 col-md-6 col-12">
                                    <div class="form-check">
                                        <input type="checkbox" class="form-check-input width-auto"
                                               id="exampleCheck1">
                                        <label class="form-check-label">아이디 기억하기</label>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 col-12">
                                    <a href="#" class="lost-pass">비밀번호 찾기</a>
                                </div>
                            </div>
                        </div>
                        <div class="button">
                            <button type="button" class="btn">로그인</button>
                        </div>
                        <div class="alt-option">
                            <span>외부 아이디로 로그인</span>
                        </div>
                        <div class="socila-login">
                            <ul>
                                <li><a href="#" class="google"><i class="lni lni-google"></i>구글아이디로 로그인</a>
                                </li>
                            </ul>
                        </div>
                        <p class="outer-link">아직 회원이 아니신가요? <a href="/user/registration">회원가입하러 가기</a>
                        </p>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../../resources/js/bootstrap.min.js"></script>
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
</body>
</html>
