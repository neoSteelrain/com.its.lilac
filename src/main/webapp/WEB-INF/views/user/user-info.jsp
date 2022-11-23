<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-23
  Time: 오후 1:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href=".././../../resources/images/favicon.svg"/>
    <!-- Place favicon.ico in the root directory -->

    <!-- Web Font -->
    <link
            href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="../../../resources/css/animate.css"/>
    <link rel="stylesheet" href="../../../resources/css/tiny-slider.css"/>
    <link rel="stylesheet" href="../../../resources/css/glightbox.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/main.css"/>
    <title>회원정보</title>
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
<section class="dashboard section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-4 col-12">
                <!-- Start Dashboard Sidebar -->
                <div class="dashboard-sidebar">
                    <div class="user-image">
                        <img src="https://via.placeholder.com/300x300" alt="#">
                        <h3>유저 닉네임
                            <span><a href="javascript:void(0)">@username</a></span>
                        </h3>
                    </div>
                    <div class="dashboard-menu">
                        <ul>
                            <li><a class="active" href="#"><i class="lni lni-pencil-alt"></i> 회원정보 수정</a></li>
                            <li><a href="#"><i class="lni lni-bookmark"></i> 강의노트</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Start Dashboard Sidebar -->
            </div>
            <div class="col-lg-9 col-md-8 col-12">
                <div class="main-content">
                    <!-- Start Profile Settings Area -->
                    <div class="dashboard-block mt-0 profile-settings-block">
                        <div class="border border-dark">
                            <h3 class="block-title">회원정보 수정</h3>
                        </div>
                        <div class="inner-block">
                            <form class="profile-setting-form" method="post" action="#">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <input type="text" class="form-control" id="ipt-nickname" maxlength="20" placeholder="닉네임을 입력하세요" onblur="checkNickname()">
                                            <label id="lbl-nickname" for="ipt-nickname">닉네임</label>
                                            <span id="nickNameNotice"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <input type="email" class="form-control" id="ipt-email" maxlength="30" placeholder="name@example.com" onblur="checkDuplicatedEmail()">
                                            <label for="ipt-email">이메일</label>
                                            <span id="emailNotice"></span>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <div class="input-group mb-3">
                                                <input type="text" class="form-control" id="ipt-address" placeholder="주소는 시군구까지만 입력받습니다"
                                                       aria-label="Recipient's username" aria-describedby="btn-address" readonly>
                                                <span id="addressNotice"></span>
                                                <button type="button" class="btn btn-outline-secondary" id="btn-address"
                                                        onclick="execDaumPostcode()">주소찾기
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Email Address*</label>
                                            <input name="email" type="email" placeholder="username@gmail.com">
                                        </div>
                                    </div> -->
                                    <div class="row">
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group upload-image">
                                                <label>프로필 이미지 변경</label>
                                                <img src="../../../resources//images/default-profile.jpg"  width="300" height="300" alt="#">
                                                <input name="profile-image" type="file" placeholder="Upload Image">
                                            </div>
                                        </div>
                                        <div class="col-lg-6 col-12">
                                            <div class="form-group mb-3">
                                                <label>자기소개</label>
                                                <textarea name="message" placeholder="자신을 소개글을 입력하세요" rows="5"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group button mb-0">
                                            <button type="submit" class="btn ">업데이트</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- End Profile Settings Area -->
                    <!-- Start Password Change Area -->
                    <div class="dashboard-block password-change-block">
                        <h3 class="block-title">비밀번호 바꾸기</h3>
                        <div class="inner-block">
                            <form class="default-form-style" method="post" action="#">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="ipt-originPW" maxlength="20"
                                                   placeholder="영문 대소문자 숫자 특수기호 포함 6-20자리" onblur="checkPassword()">
                                            <label for="ipt-password">현재 비밀번호</label>
                                            <span id="pwNotice"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="ipt-newPw" maxlength="20"
                                                   placeholder="영문 대소문자 숫자 특수기호 포함 6-20자리" onblur="checkPassword()">
                                            <label for="ipt-password">변경할 비밀번호</label>
                                            <span id="pwNotice"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-floating mb-3">
                                            <input type="password" class="form-control" id="ipt-confirmPw" maxlength="20"
                                                   placeholder="영문 대소문자 숫자 특수기호 포함 6-20자리" onblur="checkPassword()">
                                            <label for="ipt-password">변경할 비밀번호 확인</label>
                                            <span id="pwNotice"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group button mb-0">
                                            <button type="submit" class="btn ">비밀번호 바꾸기</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- End Password Change Area -->
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
<script>
    function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            /*if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;

            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }*/

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            //document.getElementById('sample6_postcode').value = data.zonecode;
            let tmp = addr.split(" ", 2);
            document.getElementById("ipt-address").value = tmp[0] + " " + tmp[1];
            // 커서를 상세주소 필드로 이동한다.
            //document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</body>
</html>
