<%--
  Created by IntelliJ IDEA.
  User: steelrain
  Date: 2022-11-20
  Time: 오전 6:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div id="video-paging-template">
        <c:forEach items="${videoList}" var="video">
            <div class="col-lg-3 col-md-4 col-12">
                <div class="single-item-grid">
                    <div class="image">
                        <a href="/search/youtube/play?videoId=${video.video_id}"><img src="${video.video_thumbnail}" alt="#"></a>
                    </div>
                    <div class="content">
                        <label class="text-sm-start">${video.video_channel_title}</label>
                        <p class="h6"><b>${video.video_title}</b></p>
                        <p class="description">${video.video_desc}</p>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div id="paging-index-template" >
        <div class="pagination left">
            <ul class="pagination-list">
                <c:choose>
                    <c:when test="${videoPaging.page<=1}">
                        <li><a><i class="lni lni-chevron-left"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:searchYoutubeList('${videoPaging.page-1}')"><i class="lni lni-chevron-left"></i></a></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach begin="${videoPaging.startPage}" end="${videoPaging.endPage}" var="i" step="1">
                    <c:choose>
                        <c:when test="${i eq videoPaging.page}">
                            <li class="active"><a href="javascript:searchYoutubeList('${i}')">${i}</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="javascript:searchYoutubeList('${i}')">${i}</a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <c:choose>
                    <c:when test="${videoPaging.page>=videoPaging.maxPage}">
                        <li><a><i class="lni lni-chevron-right"></i></a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="javascript:searchYoutubeList('${videoPaging.page+1}')"><i class="lni lni-chevron-right"></i></a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>

</body>
</html>
