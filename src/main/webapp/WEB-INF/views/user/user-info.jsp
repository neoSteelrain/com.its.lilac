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
    <link   rel="stylesheet" href="../../../resources/css/glightbox.min.css"/>
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
                        <h3>Steve Aldridge
                            <span><a href="javascript:void(0)">@username</a></span>
                        </h3>
                    </div>
                    <div class="dashboard-menu">
                        <ul>
                            <li><a href="dashboard.html"><i class="lni lni-dashboard"></i> Dashboard</a></li>
                            <li><a class="active" href="profile-settings.html"><i class="lni lni-pencil-alt"></i>
                                Edit Profile</a></li>
                            <li><a href="my-items.html"><i class="lni lni-bolt-alt"></i> My Ads</a></li>
                            <li><a href="favourite-items.html"><i class="lni lni-heart"></i> Favourite ads</a></li>
                            <li><a href="post-item.html"><i class="lni lni-circle-plus"></i> Post An Ad</a></li>
                            <li><a href="bookmarked-items.html"><i class="lni lni-bookmark"></i> Bookmarked</a></li>
                            <li><a href="messages.html"><i class="lni lni-envelope"></i> Messages</a></li>
                            <li><a href="delete-account.html"><i class="lni lni-trash"></i> Close account</a></li>
                            <li><a href="invoice.html"><i class="lni lni-printer"></i> Invoice</a></li>
                        </ul>
                        <div class="button">
                            <a class="btn" href="javascript:void(0)">Logout</a>
                        </div>
                    </div>
                </div>
                <!-- Start Dashboard Sidebar -->
            </div>
            <div class="col-lg-9 col-md-8 col-12">
                <div class="main-content">
                    <!-- Start Profile Settings Area -->
                    <div class="dashboard-block mt-0 profile-settings-block">
                        <h3 class="block-title">Profile Settings</h3>
                        <div class="inner-block">
                            <div class="image">
                                <img src="https://via.placeholder.com/300x300" alt="#">
                            </div>
                            <form class="profile-setting-form" method="post" action="#">
                                <div class="row">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>First Name*</label>
                                            <input name="first-name" type="text" placeholder="Steve">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Last Name*</label>
                                            <input name="last-name" type="text" placeholder="Aldridge">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Username*</label>
                                            <input name="usernames" type="text" placeholder="@username">
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Email Address*</label>
                                            <input name="email" type="email" placeholder="username@gmail.com">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group upload-image">
                                            <label>Profile Image*</label>
                                            <input name="profile-image" type="file" placeholder="Upload Image">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group message">
                                            <label>About You*</label>
                                            <textarea name="message" placeholder="Enter about yourself"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group button mb-0">
                                            <button type="submit" class="btn ">Update Profile</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- End Profile Settings Area -->
                    <!-- Start Password Change Area -->
                    <div class="dashboard-block password-change-block">
                        <h3 class="block-title">Change Password</h3>
                        <div class="inner-block">
                            <form class="default-form-style" method="post" action="#">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Current Password*</label>
                                            <input name="current-password" type="password"
                                                   placeholder="Enter old password">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>New Password*</label>
                                            <input name="new-password" type="password"
                                                   placeholder="Enter new password">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label>Retype Password*</label>
                                            <input name="retype-password" type="password"
                                                   placeholder="Retype password">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group button mb-0">
                                            <button type="submit" class="btn ">Update Password</button>
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
</body>
</html>
