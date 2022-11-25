<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-21
  Time: 오후 3:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!-- 자격증 시험일정 리스트 템플릿 시작 -->
<div id="lic-schedule-template">
    <c:forEach items="${licSchedules}" var="schedule">
        <div class="row align-items-center">
            <div class="col-lg-7 col-md-7 col-12">
                <div class="item-image">
                    <img src="../../resources/images/qnet-logo.gif" alt="#" height="72" width="106">
                    <div class="content">
                        <h3 class="title"><a href="javascript:void(0)">${schedule.license_name}</a></h3>
                        <span class="price">${schedule.lic_desc}</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-md-2 col-12">
                <p>${schedule.lic_step}</p>
            </div>
            <div class="col-lg-2 col-md-2 col-12">
                <p>${schedule.lic_end_date}</p>
                <input id="ipt-lic-code" hidden value="${schedule.license_code}">
            </div>
            <div class="col-lg-1 col-md-1 col-12 align-right">
                <ul class="action-btn">
                    <li><a href="javascript:void(0)"><i class="lni lni-plus"></i></a></li>
                </ul>
            </div>
        </div>
    </c:forEach>
</div>
<!-- 자격증 시험일정 리스트 템플릿 끝 -->
</body>
</html>
