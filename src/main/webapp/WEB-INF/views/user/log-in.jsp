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
                    <form id="frm-login" action="/user/log-in" method="post">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="ipt-email" name="email" maxlength="20"
                                   placeholder="이메일을 입력하세요" onblur="checkEmail()">
                            <label for="ipt-email">이메일</label>
                            <span id="emailNotice"></span>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="ipt-password" name="password" maxlength="30"
                                   placeholder="name@example.com" onblur="checkPassword()">
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
                            <button id="btn-logIn" type="button" class="btn" onclick="requestLogIn()">로그인</button>
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
<script>
    const checkEmail = () =>{
        const emailInput = $('#ipt-email').val();
        const emailNotice = $('#emailNotice');
        const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/u;
        if (emailInput == "") {
            emailNotice.css('color', 'red');
            emailNotice.html('이메일 주소는 필수입력입니다')
            return false;
        }
        if (!emailRegex.test(emailInput)) {
            emailNotice.css('color', 'red');
            emailNotice.html('이메일 주소형식에 어긋납니다')
            $('#ipt-email').focus();
            return false;
        }
        emailNotice.css('color', 'white');
        emailNotice.html('');
        return true;
    }

    const checkPassword = () => {
        const pwTag = $('#ipt-password');
        const pw = $('#ipt-password').val();
        const pwNotice = $('#pwNotice');
        const pwRegex = /^[A-Za-z\d\[\]\{\}\/\(\)\.\?\<\>!@#$%^&*=+-]{6,20}$/;
        if(pw != "" && !pwRegex.test(pw)) {
            pwNotice.css('color', 'red');
            pwNotice.html('비밀번호는 영문대,소문자,숫자,특수기호 조합으로 6-20자 입니다.');
            pwTag.val('');
            pwTag.focus();
            return false;
        }else{
            pwNotice.css('color', 'red');
            pwNotice.html('');
            return false;
        }
        return true;
    }

    const requestLogIn = () => {
        if(!checkEmail() && !checkPassword())
            return;

        $('#frm-login').submit();

        // const m_email = $('#ipt-email').val();
        // const m_password = $('#ipt-password').val();
        //
        // $.ajax({
        //     type:"post",
        //     url:"",
        //     dataType:"text",
        //     data:{
        //         email: m_email,
        //         password: m_password
        //     },
        //     success:(result)=>{
        //         if(result == "YES"){
        //
        //         }
        //     },
        //     error:()=>{
        //         alert("로그인 처리중 에러가 발생하였습니다.");
        //     }
        // });
    }

</script>
</body>
</html>
