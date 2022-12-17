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

	const listHeadr = ['음식 이름', '카테고리', 'Made By', '칼로리', '탄수화물', '단백질', '지방', '당', '나트륨', '트랜스<br>지방', '칼슘', '비타민C', '철분']
	//  Result FoodLists Section
	$("#foodBtn").click(function() {
		if ($("#foodname").val() == "") {
			alert("음식 이름을 입력하세요")
			return;
		}//if
		$.ajax({
			type: "get",
			url: "/board/foodListDesc?foodname=" + $("#foodname").val(),
		})//ajax
			.done(function(resp) {
				if (resp != null) {
					var str = '';
					str += "<div class='container'>";
					str += "<div data-aos='fade-up' class='list-text-header row'>"
					for (let i = 0; i < 12; i++) {
						if (i != 0) {
							str += "<div class='col'></div>"
						} else {
							str += "<div class='col-3'></div>"
						}//if
					}//for
					str += "</div>" //list-text-header row
					
					let i = 0;
					$('.list-text-header.row > div').each(function(index, item) {
						$(this).append(listHeadr[i])
						i++;
						if (i = 2) {
							i++;
							return i;
						}
					})//list-text-header row > div
					str += "<div data-aos='fade-up' class='list-text-content'>";

						str += "<div class='slide-up'>";
					$.each(resp, function(key, val) {
							str += "<div class='row'>";
						for (let i = 1; i < 13; i++) {
							if (i = 1) {
								str += "<div class='col-3'>" + Object.values(val)[i] + '</div> ';
							} else if (i != 3) {
								str += "<div class='col'>" + Object.values(val)[i] + "</div>"
							}//if
						}//for
							str += '</div>'; //row
					});//each
						str += '</div>'; //slide-up
					str += '</div>'; //list-text-content

					str +=
						"<div data-aos='fade-up' data-aos-delay='100' class='link-sector'>";
						str += "<div class='row justify-content-end'>";
							str += "<div class='col-4'>";
								str += "<a href='#'>";
									str += '<h3>';
										str += '나만의 식단 만들기';
										str += "<i class='bi bi-arrow-right'></i>";
									str += '</h3>';
								str += '</a>';
							str += '</div>'; //col-4
						str += '</div>'; //row justify-content-end
					str += '</div>'; //link-sector

					str += "</div>" //container

					$('#foodlists').html(str);

					if ($('#foodlists').css('display') == 'none') {
						$('#foodlists').show();
					}//display
				}//if
			})//.done
			.fail(function(e) {
				alert("error" + e)
			})
	})//foodBtn

	//	var checkbox = $("input[name=fcode]:checkbox");

	var	foodObj = {
					0 : 'foodcode'
		};
	
	$("#selectFoodBtn").click(function() {

		if ($("#SelectFoodname").val() == "") {
			alert("음식 이름을 입력하세요")
			return;
		}//if

		$.ajax({
			type: "get",
			url: "/board/foodList?foodname=" + $("#SelectFoodname").val(),
		})//ajax

		.done(function(resp) {
			if (resp != null) {
				var str = "<div class='container'  style='text-align: center;'>";
					str += "<table class='table table-hover'>"
						str += "<thead> <tr>"
						str += "<th><input type='checkbox'></th>"
						for(i=0; i<3; i++) {
								str += "<th></th>"
						}//for
						str += "</tr> </thead>"
						str += "</tbody>"
					
					let i = 1;
					for (i=1; i<4; i++) {
						$('tr > th').next().text(
							listHeadr[i]
						)
					}//for
				$.each(resp, function(key, val) {
					str += "<tr>"
						str += "<td><input type='checkbox' class='chckbox' value= '" + val.foodcode + "' name='fcode'></td>"
						for (i=1; i<4; i++) {
							$('tr > th').next().text(
								Object.values(val)[i]
							)
						}//for
					str += "</tr>"
				})//each
						str += "</tbody>"
					str += "</table>"
				
				$("#selectFood").html(str)
				if ($("#selectFood").css("display") == "none") {
						$("#selectFood").show();
				}//display
			}//resp

			let i = 0;
			$("input[name=fcode]:checkbox").click(function() {
				if ($(this).is(":checked") == true) {
						if(foodObj[i] != $(this).val()) {
							foodObj[i] = $(this).val();
							i++;
							return i;
						}
				}//isChecked
				else if ($(this).is(":checked") == false) {
					for(let i = 0; i < Object.keys(foodObj).length; i++) {
					  	if(foodObj[i] == $(this).val()) {
							delete foodObj[i];
					    	return i;
					  	}//if
					}//for
				}//else
			})//.click
			console.log(foodObj)
		})//done
		.fail(function(e) {
			alert("error" + e)
		})//fail
	})//selectFoodBtn
	
	

	$("#finBtn").click(function() {
		window.opener.getReturnObj(JSON.stringify(foodObj))
		self.close();
	})//finBtn
	
	$("#closeBtn").click(function() {
		self.close();
	})//closeBtn
 
});
