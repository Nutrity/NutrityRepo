<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-5 col-md-12 footer-info">
          <a href="index.html" class="logo d-flex align-items-center">
            <span>Nutrity</span>
          </a>
          <p>저희 홈페이지에 오신 것을 환영합니다.</p>
          <div class="social-links d-flex mt-4">
            <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

<!--         <div class="col-lg-3 col-6 footer-links"> -->
<!--           <h4>Useful Links</h4> -->
<!--           <ul> -->
<!--             <li><a href="/">홈</a></li> -->
<%--             <sec:authorize access="isAuthenticated()"> --%>
<!-- 				<li><a href="/modify">내 정보 수정</a></li> -->
<%--                 <li><a href="/board/list/${p.user.num}">내 식단</a></li> --%>
<%-- 			</sec:authorize> --%>
<%-- 			<sec:authorize access="isAnonymous()"> --%>
<!-- 				<li><a href="/board/list">내 식단</a></li> -->
<%-- 			</sec:authorize> --%>
<!-- 			    <li><a href="/board/insert">식단 입력</a></li> -->
<%--             <sec:authorize access = "hasRole('USER')"> --%>
<!-- 			    <li><a href="/pay">결제</a></li> -->
<!-- 			    <li><a href="/qualify">전문가 자격 인증</a></li> -->
<%-- 			 </sec:authorize> --%>
<!--           </ul> -->
<!--         </div> -->

<!--         <div class="col-lg-3 col-6 footer-links"> -->
<!--           <h4>Our Services</h4> -->
<!--           <ul> -->
<!--             <li><a href="#">Web Design</a></li> -->
<!--             <li><a href="#">Web Development</a></li> -->
<!--             <li><a href="#">Product Management</a></li> -->
<!--             <li><a href="#">Marketing</a></li> -->
<!--             <li><a href="#">Graphic Design</a></li> -->
<!--           </ul> -->
<!--         </div> -->

      </div>
    </div>

    <div class="container mt-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Nutrity</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>

  </footer><!-- End Footer -->
  <!-- End Footer -->

  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>
  
    <!-- Vendor JS Files -->
  <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="/vendor/aos/aos.js"></script>
  <script src="/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/js/main.js"></script>
</body>
</html>