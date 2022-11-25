<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-24
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>강의노트</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
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
    <script>
        const removeLectureNote = (noteId) => {
            console.log("removeLectureNote : " + noteId);
            $.ajax({
                type:"get",
                url:"/lecture/remove-lecture-note",
                data:{
                    lectureNoteId:noteId
                },
                datatype: "text",
                success:(result)=>{
                    if(result == "YES"){
                        location.href = "lecture-note-list?memberId=" + ${memberId};
                    }else if(result == "NO"){
                        alert("강의노트 삭제에 실패하였습니다.");
                    }
                },
                error:(errmsg)=> {
                    alert(errmsg);
                }
            });
        }
    </script>
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

<jsp:include page="../layout/header.jsp" flush="false"></jsp:include>

<section class="dashboard section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-12 col-12">
                <!-- Start Dashboard Sidebar -->
                <div class="dashboard-sidebar">
                    <div class="user-image">
                        <img src="https://via.placeholder.com/300x300" alt="#">
                        <h3>회원이름
                            <span><a href="javascript:void(0)">@username</a></span>
                        </h3>
                    </div>
                    <div class="dashboard-menu">
                        <ul>
                            <li><a href="profile-settings.html"><i class="lni lni-pencil-alt"></i> 강의노트</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- Start Dashboard Sidebar -->
            </div>
            <div class="col-lg-9 col-md-12 col-12">
                <div class="main-content">
                    <div class="dashboard-block mt-0">
                        <h3 class="block-title">강의노트 목록</h3>
                        <nav class="list-nav">
                            <ul>
                                <li><a href="javascript:void(0)">전체 강의노트 <span>42</span></a></li>
                                <li><a href="javascript:void(0)">수강중 <span>88</span></a></li>
                                <li><a href="javascript:void(0)">완료됨 <span>12</span></a></li>
                                <li><a href="javascript:void(0)"  data-bs-toggle="modal" data-bs-target="#exampleModal">노트 추가 </a></li>
                            </ul>
                        </nav>
                        <!-- Start Items Area -->
                        <div class="my-items">
                            <!-- 강의노트 리스트 제목들 시작 -->
                            <div class="item-list-title">
                                <div class="row align-items-center">
                                    <div class="col-lg-7 col-md-7 col-12">
                                        <p>강의노트 </p>
                                    </div>
                                    <div class="col-lg-2 col-md-2 col-12">
                                        <p>만든날짜</p>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-12 align-right">
                                        <p>관리</p>
                                    </div>
                                </div>
                            </div>
                            <!-- 강의노트 리스트 제목들 끝 -->
                            <!-- 강의노트 출력 시작 -->
                            <div id="div-lectureNoteList" >
                                <c:forEach items="${noteList}" var="note">
                                    <div class="single-item-list">
                                        <div class="row align-items-center">
                                            <div class="col-lg-7 col-md-7 col-12">
                                                <div class="item-image">
                                                    <img src="https://via.placeholder.com/100x100" alt="#">
                                                    <div class="content">
                                                        <h3 class="title"><a href="javascript:void(0)">${note.lct_note_title}</a></h3>
                                                        <span class="price">${note.lct_desc}</span>
                                                        <input id="ipt-noteId" type="hidden" value="${note.lct_note_id}">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-2 col-md-2 col-12">
                                                <p><fmt:formatDate value="${note.lct_note_date}" pattern="yyyy-MM-dd"></fmt:formatDate></p>
                                            </div>
                                            <div class="col-lg-3 col-md-3 col-12 align-right">
                                                <ul class="action-btn">
                                                    <li><a href="javascript:void(0)"><i class="lni lni-pencil"></i></a></li>
                                                    <li><a href="javascript:removeLectureNote('${note.lct_note_id}');"><i class="lni lni-trash"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- 강의노트 출력 끝 -->

                            <!-- Pagination -->
                            <div class="pagination left">
                                <ul class="pagination-list">
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

<!-- 강의노트 생성 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">강의노트 만들기</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="ipt-lec" class="col-form-label">강의노트 이름:</label>
                        <input type="text" class="form-control" id="ipt-lec">
                    </div>
                    <div class="mb-3">
                        <label for="txa-lec" class="col-form-label">강의노트 설명:</label>
                        <textarea class="form-control" id="txa-lec"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="btn-cancle" type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button id="btn-add"  type="button" class="btn btn-primary" onclick="addLectureNote()">만들기</button>
            </div>
        </div>
    </div>
</div>

<script src="../../../resources/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
<script>
    const addLectureNote = () => {
        const m_title = $('#ipt-lec').val();
        const m_contents = $('#txa-lec').val();
        const m_memberId = ${memberId};

        $.ajax({
            type:"post",
            url:"/lecture/add-lecture_note",
            data:{
                lecTitle:m_title,
                lecContents:m_contents,
                memberId:m_memberId
            },
            success:(result)=>{
                if(result == "YES"){
                    $('#ipt-lec').val('');
                    $('#txa-lec').val('');
                    location.href = "/lecture/lecture-note-list?memberId=" + m_memberId;
                }else if(result == "NO"){
                    alert("강의노트 추가에 실패하였습니다.");
                }
            },
            error:()=>{
                alert("강의노트 추가중에 오류가 발생하였습니다.");
            }
        });
    }
</script>
</body>
</html>
