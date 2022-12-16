/**
* Template Name: Logis - v1.2.1
* Template URL: https://bootstrapmade.com/logis-bootstrap-logistics-website-template/
* Author: BootstrapMade.com
* License: https://bootstrapmade.com/license/
*/


document.addEventListener('DOMContentLoaded', () => {
	"use strict";

	//food list 비동기화  



	/**
	 * Preloader
	 */
	const preloader = document.querySelector('#preloader');
	if (preloader) {
		window.addEventListener('load', () => {
			preloader.remove();
		});
	}

	/**
	 * Sticky header on scroll
	 */
	const selectHeader = document.querySelector('#header');
	if (selectHeader) {
		document.addEventListener('scroll', () => {
			window.scrollY > 100 ? selectHeader.classList.add('sticked') : selectHeader.classList.remove('sticked');
		});
	}

	/**
	 * Scroll top button
	 */
	const scrollTop = document.querySelector('.scroll-top');
	if (scrollTop) {
		const togglescrollTop = function() {
			window.scrollY > 100 ? scrollTop.classList.add('active') : scrollTop.classList.remove('active');
		}
		window.addEventListener('load', togglescrollTop);
		document.addEventListener('scroll', togglescrollTop);
		scrollTop.addEventListener('click', window.scrollTo({
			top: 0,
			behavior: 'smooth'
		}));
	}

	/**
	 * Mobile nav toggle
	 */
	const mobileNavShow = document.querySelector('.mobile-nav-show');
	const mobileNavHide = document.querySelector('.mobile-nav-hide');

	document.querySelectorAll('.mobile-nav-toggle').forEach(el => {
		el.addEventListener('click', function(event) {
			event.preventDefault();
			mobileNavToogle();
		})
	});

	function mobileNavToogle() {
		document.querySelector('body').classList.toggle('mobile-nav-active');
		mobileNavShow.classList.toggle('d-none');
		mobileNavHide.classList.toggle('d-none');
	}

	/**
	 * Hide mobile nav on same-page/hash links
	 */
	document.querySelectorAll('#navbar a').forEach(navbarlink => {

		if (!navbarlink.hash) return;

		let section = document.querySelector(navbarlink.hash);
		if (!section) return;

		navbarlink.addEventListener('click', () => {
			if (document.querySelector('.mobile-nav-active')) {
				mobileNavToogle();
			}
		});

	});

	/**
	 * Toggle mobile nav dropdowns
	 */
	const navDropdowns = document.querySelectorAll('.navbar .dropdown > a');

	navDropdowns.forEach(el => {
		el.addEventListener('click', function(event) {
			if (document.querySelector('.mobile-nav-active')) {
				event.preventDefault();
				this.classList.toggle('active');
				this.nextElementSibling.classList.toggle('dropdown-active');

				let dropDownIndicator = this.querySelector('.dropdown-indicator');
				dropDownIndicator.classList.toggle('bi-chevron-up');
				dropDownIndicator.classList.toggle('bi-chevron-down');
			}
		})
	});

	/**
	 * Initiate pURE cOUNTER
	 */
	new PureCounter();

	/**
	 * Initiate glightbox
	 */
	const glightbox = GLightbox({
		selector: '.glightbox'
	});

	/**
	 * Init swiper slider with 1 slide at once in desktop view
	 */
	new Swiper('.slides-1', {
		speed: 600,
		loop: true,
		autoplay: {
			delay: 5000,
			disableOnInteraction: false
		},
		slidesPerView: 'auto',
		pagination: {
			el: '.swiper-pagination',
			type: 'bullets',
			clickable: true
		},
		navigation: {
			nextEl: '.swiper-button-next',
			prevEl: '.swiper-button-prev',
		}
	});

	/**
	 * Animation on scroll function and init
	 */
	function aos_init() {
		AOS.init({
			duration: 1000,
			easing: 'ease-in-out',
			once: true,
			mirror: false
		});
	}
	window.addEventListener('load', () => {
		aos_init();
	});

	//  Result FoodLists Section
	$("#foodBtn").click(function() {
		if ($("#foodname").val() == "") {
			alert("음식 이름을 입력하세요")
			return;
		}
		$.ajax({
			type: "get",
			url: "/board/foodList?foodname=" + $("#foodname").val(),
		})
			.done(function(resp) {
				if (resp != null) {
					var str = "<div class='container'>";
					str += "<div data-aos='fade-up' class='list-text-header row'>"
					str += "<div class='col-3'>음식 이름</div>"
					str += "<div class='col'>카테고리</div> "
					str += "<div class='col'>칼로리</div> "
					str += "<div class='col'>탄수화물</div> "
					str += "<div class='col'>단백질</div> "
					str += "<div class='col'>지방</div> "
					str += "<div class='col'>당</div>"
					str += "<div class='col'>나트륨</div> "
					str += "<div class='col'>트랜스<br>지방</div> "
					str += "<div class='col'>칼슘</div> "
					str += "<div class='col'>비타민C</div> "
					str += "<div class='col'>철분</div> "
					str += "</div>"
					str += "<div data-aos='fade-up' class='list-text-content'>";

					$.each(resp, function(key, val) {
						str += "<div class='row slide-up'>"
						str += "<input type='checkbox'', value= '" + val.foodname + "' id>"
						str += "<div class='col-3'>" + val.foodname + "</div> "

						str += "<div class='col'>" + val.category + "</div> "

						str += "<div class='col'>" + val.kcal + "</div> "
						str += "<div class='col'>" + val.car + "</div> "
						str += "<div class='col'>" + val.protein + "</div> "
						str += "<div class='col'>" + val.fat + "</div> "
						str += "<div class='col'>" + val.suger + "</div>"
						str += "<div class='col'>" + val.sodium + "</div> "
						str += "<div class='col'>" + val.trans_fat + "</div> "
						str += "<div class='col'>" + val.calcium + "</div> "
						str += "<div class='col'>" + val.vit_c + "</div> "
						str += "<div class='col'>" + val.iron + "</div> "
						str += "</div>"
					})

					str += "</div>"
					str += "<div data-aos='fade-up' data-aos-delay='100' class='link-sector'>"
					str += "<div class='row justify-content-end'>"
					str += "<div class='col-4'>"
					str += "<a href='#'>"
					str += "<h3>"
					str += "나만의 식단 만들기"
					str += "<i class='bi bi-arrow-right'></i>"
					str += "</h3>"
					str += "</a>"
					str += "</div>"
					str += "</div>"
					str += "</div>"

					str += "</div>"

					$("#foodlists").html(str)
					if ($("#foodlists").css("display") == "none") {
						$("#foodlists").show();
					}
				}
			})
			.fail(function(e) {
				alert("error" + e)
			})
	})


	$("#selectFoodBtn").click(function() {
		if ($("#SelectFoodname").val() == "") {
			alert("음식 이름을 입력하세요")
			return;
		}
		$.ajax({
			type: "get",
			url: "/board/foodList?foodname=" + $("#SelectFoodname").val(),
		})
			.done(function(resp) {
				if (resp != null) {
					var str = "<div class='container'  style='text-align: center;'>";
					str += "<table class='table table-hover'>"
					str += "<thead> <tr>"
					str += "<th><input type='checkbox'></th>"
					str += "<th>음식 이름</th>"
					str += "<th>카테고리</th> "
					str += "<th>Made By</th> "
					str += "</tr>"
					str += "</thead>"
					str += "</tbody>"
					$.each(resp, function(key, val) {
						str += "<tr>"
						str += "<td><input type='checkbox'' value= '" + val.foodname + "' name='fname'></td>"
						str += "<td>" + val.foodname + "</td> "
						str += "<td>" + val.category + "</td> "
						str += "<td>" + val.madeby + "</td> "
						str += "</tr>"
					})
					str += "</tbody>"
					str += "</table>"

					$("#selectFood").html(str)
					if ($("#selectFood").css("display") == "none") {
						$("#selectFood").show();
					}
				}
			})
			.fail(function(e) {
				alert("error" + e)
			})
	})

	function food_check() {

		var select = eval("document.dietinsert");

		var checked = document.getElementsByName("fname");

		var chkList = "";



		for (var i = 0; i < select.fname.length; i++) {

			if (checked[i].checked == true) {

				chkList += checked[i].value + "";

			}

		}


		self.close();

	}

});
