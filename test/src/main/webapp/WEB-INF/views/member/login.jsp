<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../include/header.jsp" %>    

<section id="hero" class="hero hero-bg-anime d-flex align-items-center">
    <div class="container">
      <div class="row gy-4 d-flex justify-content-between">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h2 data-aos="fade-up">나의 식단을
            <br>  
            더욱 건강하게!</h2>
          <p data-aos="fade-up" data-aos-delay="100">역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! 역시 먹는 게 최고야! </p>

          <form class="form-search d-flex align-items-stretch mb-3" data-aos="fade-up" data-aos-delay="200">
            <input type="text" class="form-control" placeholder="오늘 먹은 음식을 검색" id="foodname">
            <button type="button" class="btn btn-primary" id="foodBtn">Search</button>
          </form>
        </div>
      </div>
    </div>
  </section><!-- End Hero Section -->

  <main id="main">
    <!-- ======= Result Foodlists Section ======= -->
    <section id="foodlists" style="display: none;">
    </section>

<form action = "/login" method = "post">
UserName : <input type = "text" id = "useremail" name = "useremail"><br/>
PassWord : <input type = "text" id = "password" name = "password"><br/>
<button>로그인</button>
</form>

<%@ include file = "../include/footer.jsp" %>