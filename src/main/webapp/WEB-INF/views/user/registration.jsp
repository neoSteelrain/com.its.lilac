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
                                <img src="../../../resources/images/default-profile.jpg" id="img-preView" alt="#">
                            </div>
                            <div>
                                <input id="ipt-profile" type="file" class="form-control" accept="image/*" onchange="setProfile()">
                            </div>
                        </main>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-12">
                    <div class="product-info">
                        <h2 class="title">회원가입</h2>
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" id="ipt-nickname" maxlength="20" placeholder="닉네임을 입력하세요" onblur="checkNickname()">
                            <label id="lbl-nickname" for="ipt-nickname">닉네임</label>
                            <span id="nickNameNotice"></span>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="email" class="form-control" id="ipt-email" maxlength="30" placeholder="name@example.com" onblur="checkDuplicatedEmail()">
                            <label for="ipt-email">이메일</label>
                            <span id="emailNotice"></span>
                        </div>
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
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control" id="ipt-password" maxlength="20"
                                   placeholder="영문 대소문자 숫자 특수기호 포함 6-20자리" onblur="checkPassword()">
                            <label for="ipt-password">비밀번호</label>
                            <span id="pwNotice"></span>
                        </div>
                        <div class="button">
                            <button type="button" id="btn-registration" class="btn" onclick="requestRegistration()">회원가입</button>
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
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
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

    const setProfile = () => {
        const files = $('#ipt-profile').prop('files');
        //const files = $('#ipt-profile')[0].files;
        if(files == undefined)
            return;

        let reader = new FileReader();
        reader.onload = (e) => {
            $('#img-preView').attr('src', e.target.result);
        }
        reader.readAsDataURL(files[0]);
    }

    const checkNickname = () => {
        const nickname = $('#ipt-nickname').val();
        const nickNameNotice = $('#nickNameNotice');
        if(nickname == ""){
            nickNameNotice.css('color', 'red');
            nickNameNotice.html('이름은 필수입력입니다.');
        }else{
            nickNameNotice.css('color', 'white');
            nickNameNotice.html('');
        }
    }

    const checkAddress = () => {
        const address = $('#ipt-address').val();
        const addressNotice = $('#addressNotice');
        if(address == ""){
            addressNotice.css('color', 'red');
            addressNotice.html('주소는 필수입력입니다.');
            return false;
        }else{
            addressNotice.css('color', 'white');
            addressNotice.html('');
            return true;
        }
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
        }else{
            pwNotice.css('color', 'red');
            pwNotice.html('');
        }
    }

    const checkDuplicatedEmail = () => {
        console.log($('#ipt-email').val());
        const emailInput = $('#ipt-email').val();
        const emailNotice = $('#emailNotice');
        const emailRegex = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}(.[a-zA-Z]{2,3})?$/u;
        if (emailInput == "") {
            emailNotice.css('color', 'red');
            emailNotice.html('이메일 주소는 필수입력입니다')
            return;
        }
        if (!emailRegex.test(emailInput)) {
            emailNotice.css('color', 'red');
            emailNotice.html('이메일 주소형식에 어긋납니다')
            $('#ipt-email').focus();
            return;
        }

        $.ajax({
            type: "get",
            url: "/user/checkDuplicatedEmail",
            datatype: "text",
            data: {
                email: emailInput
            },
            success: function (result) {
                if (result == "YES") {
                    emailNotice.css('color', 'red');
                    emailNotice.html('중복된 이메일입니다.')
                } else if (result == "NO") {
                    emailNotice.css('color', 'green');
                    emailNotice.html('사용가능한 이메일입니다.')
                }
            },
            error: function () {
                alert('이메일 검증에서 오류가 발생하였습니다');
            }
        });
    }

    const requestRegistration = () => {
        /*
         주소입력창은 readonly로 설정해놔서 아직 적당하게 처리할 이벤트는 못찾았다.
         그래서 일단 회원가입을 진행할때 주소입력이 있는지 없는지 체크해준다.
         */
        if(!checkAddress())
            return;

        let signUpFrmData = new FormData();
        signUpFrmData.append("member_nickname", $('#ipt-nickname').val());
        signUpFrmData.append("member_email", $('#ipt-email').val());
        signUpFrmData.append("member_address", $('#ipt-address').val());
        signUpFrmData.append("member_password", $('#ipt-password').val());
        // 프로필이미지 처리
        const profileImgs = $('#ipt-profile').prop('files');
        if (profileImgs.length > 0) {
            // 프로필이미지는 1개만 선택가능하므로 0번째 값만 읽어온다.
            signUpFrmData.append("profileFile", profileImgs[0]);
        }
        // 회원가입 버튼 비활성화
        $("#btn-registration").prop("disabled", true);
        $.ajax({
            type: "post",
            enctype: "multipart/form-data",
            url: "/user/registration",
            data: signUpFrmData,
            processData: false,
            contentType: false,
            success: function (result) {
                // 회원가입 버튼 활성화
                $("#btn-registration").prop("disabled", false);
                if(result == "YES")
                    alert("회원가입이 완료되었습니다.");
                else if(result == "NO")
                    alert("회원가입에 실패하였습니다.");
                //location.href = "/member/sign-in";
            },
            error: function (e) {
                alert("회원가입과정에서 오류가 발생하였습니다.");
                $("#btn-registration").prop("disabled", false);
            }
        });
    }
</script>
</body>
</html>
