<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@include file="../include/header.jsp" %>
    <script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<main id="main">
	<div class="breadcrumbs">
		<div class="page-header d-flex align-items-center"
			style="background-image: url('../img/month-cal-bg-1.jpg');">
			<div class="container position-relative">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6 text-center">
						<h2>결제</h2>
						<p>결제 창</p>
					</div>
				</div>
			</div>
		</div>
	</div>
    <section id="pricing" class="pricing pt-0">
      <div class="container" data-aos="fade-up">

        <div class="section-header">
          <h2>${p.user.num}의 결제 창</h2>

        </div>       
        <div class="row gy-4">

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
            <div class="pricing-item">
              <h3>7일</h3>
              <h4><sup>$</sup>100<span> / 주</span></h4>
              <ul>
                <li><i class="bi bi-check"></i>일주일 치 결제</li>                
              </ul>
              <a href="javascript:requestWeekPay()" class="buy-btn">구매</a>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
            <div class="pricing-item">
              <h3>1달</h3>
              <h4><sup>$</sup>101<span> / 월</span></h4>
              <ul>
                <li><i class="bi bi-check"></i>한 달치 구매</li>
              </ul>
              <a href="javascript:requestMonthPay()" class="buy-btn">구매</a>
            </div>
          </div><!-- End Pricing Item -->

          <div class="col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="pricing-item">
              <h3>1년</h3>
              <h4><sup>$</sup>102<span> / 년</span></h4>
              <ul>
                <li><i class="bi bi-check"></i>일 년치 구매</li>            
              </ul>
              <a href="javascript:requestYearPay()" class="buy-btn">구매</a>
            </div>
          </div><!-- End Pricing Item -->

        </div>

      </div>
    </section><!-- End Pricing Section -->
    </main>
    <script>    
var IMP = window.IMP; // 생략 가능
IMP.init("imp46400101"); // 예: imp00000000

// 주 별 결제
function requestWeekPay() {
	data = {
			name : "subscribe(week)",
			amount : 100	
	}
	customer_uid : ${p.user.num}
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param    	
        pg: "html5_inicis.INIBillTst",
        pay_method: "card",
        merchant_uid: "99",
        name: data.name,
        amount: data.amount,
        buyer_email: "${p.user.useremail}",
        buyer_name: "${p.user.realname}",
        buyer_tel: "${p.user.phone}",
        buyer_addr: "${p.user.address.address1}" +' '+ "${p.user.address.address2}",
        buyer_postcode: "${p.user.address.zipcode}"
    }, function (rsp) { // callback
        if (rsp.success) {           
            $.ajax({
            	type : "post",
            	url : "pay/${p.user.num}",  
            	contentType : "application/json;charset=utf-8",
            	data :JSON.stringify(data)
            })
            .done(function(resp){
            	if(resp == "success"){
            		alert("결제에 성공하셨습니다.")
                	location.href = "/board/list/${p.user.num}"
            	}           	
            })
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }

// 월 별 결제
function requestMonthPay() {
	data = {
			name : "subscribe(month)",
			amount : 101	
	}
	customer_uid : ${p.user.num}
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param    	
        pg: "html5_inicis.INIBillTst",
        pay_method: "card",
        merchant_uid: "100",
        name: data.name,
        amount: data.amount,
        buyer_email: "${p.user.useremail}",
        buyer_name: "${p.user.realname}",
        buyer_tel: "${p.user.phone}",
        buyer_addr: "${p.user.address.address1}" +' '+ "${p.user.address.address2}",
        buyer_postcode: "${p.user.address.zipcode}"
    }, function (rsp) { // callback
        if (rsp.success) {           
            $.ajax({
            	type : "post",
            	url : "pay/${p.user.num}",  
            	contentType : "application/json;charset=utf-8",
            	data :JSON.stringify(data)
            })
            .done(function(resp){
            	if(resp == "success"){
            		alert("결제에 성공하셨습니다.")
                	location.href = "/board/list/${p.user.num}"
            	}           	
            })
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }

// 연 별 결제
function requestYearPay() {
	data = {
			name : "subscribe(year)",
			amount : 102	
	}
	customer_uid : ${p.user.num}
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param    	
        pg: "html5_inicis.INIBillTst",
        pay_method: "card",
        merchant_uid: "101",
        name: data.name,
        amount: data.amount,
        buyer_email: "${p.user.useremail}",
        buyer_name: "${p.user.realname}",
        buyer_tel: "${p.user.phone}",
        buyer_addr: "${p.user.address.address1}" +' '+ "${p.user.address.address2}",
        buyer_postcode: "${p.user.address.zipcode}"
    }, function (rsp) { // callback
        if (rsp.success) {           
            $.ajax({
            	type : "post",
            	url : "pay/${p.user.num}",  
            	contentType : "application/json;charset=utf-8",
            	data :JSON.stringify(data)
            })
            .done(function(resp){
            	if(resp == "success"){
            		alert("결제에 성공하셨습니다.")
                	location.href = "/board/list/${p.user.num}"
            	}           	
            })
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: " +  rsp.error_msg);
        }
    });
  }
</script>
       <%@include file="../include/footer.jsp" %>