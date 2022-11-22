<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-22
  Time: 오후 4:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>회원가입</title>
    <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="shortcut icon" type="image/x-icon" href=".././../../resources/images/favicon.svg"/>
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

<section class="item-details section">
    <div class="container">
        <div class="top-area">
            <div class="row">
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-images">
                        <main id="gallery">
                            <div class="main-img">
                                <img src="../../../resources/images/default-profile.jpg" id="current" alt="#">
                            </div>
                            <div>
                                <input type="file" class="form-control">
                            </div>
                        </main>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-info">
                        <h2 class="title">회원가입</h2>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="ipt-nicaname" placeholder="닉네임을 입력하세요">
                            <label for="ipt-nicaname">닉네임</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="ipt-email" placeholder="name@example.com">
                            <label for="ipt-email">이메일</label>
                        </div>
                        <div class="form-floating mb-3">
                            <div class="input-group mb-3">
                                <input type="text" class="form-control" id="ipt-address" placeholder="주소는 시군구까지만 입력받습니다"
                                       aria-label="Recipient's username" aria-describedby="btn-address" readonly>
                                <button type="button" class="btn btn-outline-secondary" id="btn-address"
                                        onclick="execDaumPostcode()">주소찾기
                                </button>
                            </div>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="ipt-password"
                                   placeholder="영문 대소문자 숫자 특수기호 포함 6-18자리">
                            <label for="ipt-password">비밀번호</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control is-invalid" id="ipt-confirmPw" placeholder="">
                            <label for="ipt-confirmPw">비밀번호 확인</label>
                        </div>

                        <div class="social-share">
                            <h4>외부 계정으로 회원가입</h4>
                            <ul>
                                <li><a href="javascript:void(0)" class="facebook"><i
                                        class="lni lni-facebook-filled"></i></a></li>
                                <li><a href="javascript:void(0)" class="twitter"><i
                                        class="lni lni-twitter-original"></i></a></li>
                                <li><a href="javascript:void(0)" class="google"><i class="lni lni-google"></i></a></li>
                                <li><a href="javascript:void(0)" class="linkedin"><i
                                        class="lni lni-linkedin-original"></i></a></li>
                                <li><a href="javascript:void(0)" class="pinterest"><i class="lni lni-pinterest"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
                if(data.userSelectedType === 'R'){
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
                    //document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

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
