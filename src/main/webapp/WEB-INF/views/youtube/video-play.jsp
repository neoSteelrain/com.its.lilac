<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-20
  Time: 오전 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/LineIcons.2.0.css"/>
    <link rel="stylesheet" href="../../../resources/css/animate.css"/>
    <link rel="stylesheet" href="../../../resources/css/tiny-slider.css"/>
    <link rel="stylesheet" href="../../../resources/css/glightbox.min.css"/>
    <link rel="stylesheet" href="../../../resources/css/main.css"/>
    <title>동영상 재생</title>
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

<section class="section blog-single">
    <div class="container" style="margin-top: 20px">
        <div class="row">
            <div class="col-lg-10 offset-lg-1 col-md-12 col-12">
                <div class="single-inner">
                    <div class="post-thumbnils ratio ratio-16x9">
<%--                        <img src="https://via.placeholder.com/850x460" alt="#">--%>
                        <iframe id="ytplayer" type="text/html" width="1024" height="576"
                                src="https://www.youtube.com/embed/${video.video_id}?autoplay=1&playsinline=1"
                                frameborder="0" allowfullscreen>
                        </iframe>
                    </div>
                    <div class="post-details">
                        <div class="detail-inner">
                            <h3 class="post-title">
                                ${video.video_title}
                            </h3>
                            <!-- post meta -->
                            <ul class="custom-flex post-meta">
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="lni lni-calendar"></i>
                                        업로드 날짜 : <fmt:formatDate value="${video.video_date}" pattern="yyyy-MM-dd hh:mm:ss"></fmt:formatDate>
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="lni lni-comments"></i>
                                        댓글수
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0)">
                                        <i class="lni lni-eye"></i>
                                        ${video.video_search_count}
                                    </a>
                                </li>
                            </ul>
                            <p>${video.video_desc}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="../../../resources/js/bootstrap.bundle.js"></script>
<script src="../../../resources/js/jQuery-3-6-1.js"></script>
<script src="../../../resources/js/wow.min.js"></script>
<script src="../../../resources/js/tiny-slider.js"></script>
<script src="../../../resources/js/glightbox.min.js"></script>
<script src="../../../resources/js/main.js"></script>
</body>
</html>
