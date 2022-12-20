<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Nutrity</title>
<meta content="" name="description">
<meta content="" name="keywords">

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Favicons -->
<link href="/img/Nutrity-favicon.png" rel="icon">
<link href="/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
<link href="/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
<link href="/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
<link href="/vendor/aos/aos.css" rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/css/main.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Logis - v1.2.1
  * Template URL: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<!-- ======= Header ======= -->
	<header id="header" class="header d-flex align-items-center fixed-top">
		<div
			class="container-fluid container-xl d-flex align-items-center justify-content-between">

			<a href="/" class="logo d-flex align-items-center"> <!-- Uncomment the line below if you also wish to use an image logo -->
				<!-- <img src="assets/img/logo.png" alt=""> -->
				<h1>Nutrity</h1>
			</a> <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i> <i
				class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
			<nav id="navbar" class="navbar">
				<ul>
					<li><a href="/" class="active">홈</a></li>
					<!--           <li><a href="about">About</a></li> -->
					<sec:authentication property="principal" var="p" />
					<sec:authorize access="isAuthenticated()">
						<li><a href="/board/list/${p.user.num}">내 식단</a></li>
					</sec:authorize>
					<sec:authorize access="isAnonymous()">
						<li><a href="/board/list">내 식단</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ADMIN')">
						<li><a href="/admin/memlist">회원 목록</a></li>
					</sec:authorize>
					<li><a href="/board/insert">식단 입력</a></li>
					<!--           <li><a href="pricing.html">Subscribe</a></li> -->
					<!-- <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li> -->
					<!--           <li><a href="#">???</a></li> -->
					
					<sec:authorize access="isAnonymous()">
						<li><a href="/login">로그인</a></li>
						<li><a class="get-a-quote" href="/join">회원 가입</a></li>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<li><a href="/modify">내 정보 수정</a></li>
						<li><a href="/logout">로그아웃</a></li>
					</sec:authorize>

				</ul>
			</nav>
			<!-- .navbar -->

		</div>
	</header>
	<!-- End Header -->
	<!-- End Header -->