<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>

 <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero hero-bg-anime d-flex align-items-center">
    <div class="container">
      <div class="row gy-4 d-flex justify-content-between">
        <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
          <h2 data-aos="fade-up">나의 식단을
            <br>  
            더욱 건강하게!</h2>
          <p data-aos="fade-up" data-aos-delay="100">식단을 등록하여 건강을 챙겨보세요!!</p>

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
    <section id="foodlists">
    </section>

    <!-- ======= About Us Section ======= -->
    <section id="about" class="about pt-0">
      <div class="container" data-aos="fade-up">

        <div class="row gy-4">
          <div class="col-lg-6 position-relative align-self-start order-lg-last order-first">
            <img src="../img/about.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 content order-last  order-lg-first">
            <h3>Nutrity에서 식단을 기록해보세요!</h3>
            <ul>
              <li data-aos="fade-up" data-aos-delay="100">
                <i class="bi bi-diagram-3"></i>
                <div>
                  <h5>오늘의 식단을 기록해 보세요!</h5>
                  <p>하루 식단을 기록하여 관리해보세요! </p>
                </div>
              </li>
              <li data-aos="fade-up" data-aos-delay="200">
                <i class="bi bi-fullscreen-exit"></i>
                <div>
                  <h5>권장 영양소 섭취량을 확인해 보세요!</h5>
                  <p>성별에 따른 권장 영양소 섭취량과 기록한 식단을 비교해보세요!</p>
                </div>
              </li>
              <li data-aos="fade-up" data-aos-delay="300">
                <i class="bi bi-broadcast"></i>
                <div>
                  <h5>전문가와 상의해보세요!</h5>
                  <p>구독을 해보세요! 의사, 영양사, PT트레이너 등 전문가에게 <br> 기록한 식단에 대한 조언을 받을 수 있어요!</p>
                </div>
              </li>
            </ul>
          </div>
        </div>

      </div>
    </section><!-- End About Us Section -->

    <!-- ======= Call To Action Section ======= -->
    <section id="call-to-action" class="call-to-action">
      <div class="container" data-aos="zoom-out">

        <div class="row justify-content-center">
          <div class="col-lg-8 text-center">
            <h3>About Us</h3>
            <p> 이 홈페이지는 <br> 부산 IT교육센터 실무프로젝트기반 빅데이터분석 & 시각화 UI콘텐츠 개발과정 팀프로젝트의 일환으로 제작되었습니다.</p>
            <a class="cta-btn" href="#">Call To Action</a>
          </div>
        </div>

      </div>
    </section><!-- End Call To Action Section -->

    <!-- ======= Services Section ======= -->
    <section id="service" class="services pt-0">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <span>홈페이지 기능</span>
          <h2>홈페이지 기능</h2>

        </div>

        <div class="row gy-4">

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="100">
            <div class="card">
              <div class="card-img">
                <img src="../img/storage-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="service-details.html" class="stretched-link">식단 등록</a></h3>
              <p>오늘 또는 미래의 식단을 기록하여 관리할 수 있습니다.</p>
            </div>
          </div><!-- End Card Item -->
          
          
          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="600">
            <div class="card">
              <div class="card-img">
                <img src="../img/warehousing-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="#" class="stretched-link">음식 검색</a></h3>
              <p>음식을 검색하여 영양소들을 확인해 보세요! <br> 식약처에서 제공한 데이터를 토대로 찾아드립니다!</p>
            </div>
          </div><!-- End Card Item -->
          
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="500">
            <div class="card">
              <div class="card-img">
                <img src="../img/packaging-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="#" class="stretched-link">월별 식단 확인</a></h3>
              <p>식단 달력을 통해 한눈에 식단을 확인할 수 있습니다.</p>
            </div>
          </div><!-- End Card Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
            <div class="card">
              <div class="card-img">
                <img src="../img/logistics-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="#" class="stretched-link">식단 확인</a></h3>
              <p>등록한 식단을 확인하여 음식의 영양소와 권장 영양소 섭취량을 그래프를 통해 비교해 볼 수 있습니다.</p>
            </div>
          </div><!-- End Card Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
            <div class="card">
              <div class="card-img">
                <img src="../img/cargo-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="#" class="stretched-link">구독 시스템</a></h3>
              <p>결제를 통해 저희 페이지에서 구독자가 될 수 있습니다. 구독자가 되어 전문가 분들과 소통을 진행해 보세요.</p>
            </div>
          </div><!-- End Card Item -->

          <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
            <div class="card">
              <div class="card-img">
                <img src="../img/trucking-service.jpg" alt="" class="img-fluid">
              </div>
              <h3><a href="#" class="stretched-link">전문가 인증</a></h3>
              <p>혹시 식단 관리에 적합한 직업에 종사중이라면 <br> 전문가 인증을 해주세요. 소정의 혜택을 드립니다.</p>
            </div>
          </div><!-- End Card Item -->

        </div>

      </div>
    </section><!-- End Services Section -->

  </main><!-- End #main -->

<%@include file="include/footer.jsp" %>
    


