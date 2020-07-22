<%@ page pageEncoding="utf-8"%>
	<div class="review-slider">
			 <ul id="flexiselDemo1">
			<li><img src="http://localhost:8080/CINEMA/image/r1.jpg" alt=""/></li>
			<li><img src="http://localhost:8080/CINEMA/image/r2.jpg" alt=""/></li>
			<li><img src="http://localhost:8080/CINEMA/image/r3.jpg" alt=""/></li>
			<li><img src="http://localhost:8080/CINEMA/image/r4.jpg" alt=""/></li>
			<li><img src="http://localhost:8080/CINEMA/image/r5.jpg" alt=""/></li>
			<li><img src="http://localhost:8080/CINEMA/image/r6.jpg" alt=""/></li>
		</ul>
			<script type="text/javascript">
		$(window).load(function() {
			
		  $("#flexiselDemo1").flexisel({
				visibleItems: 6,
				animationSpeed: 1000,
				autoPlay: true,
				autoPlaySpeed: 3000,    		
				pauseOnHover: false,
				enableResponsiveBreakpoints: true,
				responsiveBreakpoints: { 
					portrait: { 
						changePoint:480,
						visibleItems: 2
					}, 
					landscape: { 
						changePoint:640,
						visibleItems: 3
					},
					tablet: { 
						changePoint:768,
						visibleItems: 4
					}
				}
			});
			});
		</script>
		<script type="text/javascript" src="http://localhost:8080/CINEMA/js/jquery.flexisel.js"></script>	
	</div>
