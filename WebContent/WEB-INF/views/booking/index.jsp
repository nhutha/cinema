<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="rft"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Đặt vé</title>
	<!-- for-mobile-apps -->
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
	<meta name="keywords" content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<!-- //for-mobile-apps -->
	<link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
	<link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
	<link href="http://localhost:8080/CINEMA/css/styleBook.css" rel="stylesheet" type="text/css" media="all" />
	<script src="http://localhost:8080/CINEMA/js/jquery-1.11.0.min.js"></script>
	<script src="http://localhost:8080/CINEMA/js/jquery.seat-charts.js"></script>
	
</head>
<body>
	<div class="content">
	<a href="http://localhost:8080/CINEMA/home/index/${namePeople }.htm">
	<h1 id="name">${namemovie}</h1>
	</a>
	
	<div class="main">
	<input id="money" value="${money }" hidden="true" > 
		<div>
			<label for="date"><b>Date: </b></label>
			<input type="date" name="date" id="date">
			<input id="chair" hidden="true" type="text" value="${datachair }">  
			<input id="current"  type="text" hidden="true" value="${nowDay }">  
			<input id="money"  type="text" hidden="true" value="${money }">  
			<input id="namePeople"  type="text" hidden="true" value="${namePeople }">  
			<input id="mail"  type="text" hidden="true" value="${mail }">  
			<c:forEach var="p" items="${showtime }" varStatus="status">
			<c:choose>
				<c:when test="${time == p.time }">
					<button id="time_${status.count }" disabled="disabled">${p.time }</button>
				</c:when>
				<c:otherwise>
					<button id="time_${status.count }">${p.time }</button>
				</c:otherwise>
			</c:choose>
			</c:forEach>
		</div>
		<div class="demo">
			<div id="seat-map">
				<div class="front">SCREEN</div>					
			</div>
			<div class="booking-details">
				<ul class="book-left">
					<li>Movie </li>
					<li>Time </li>
					<li>Tickets</li>
					<li>Total</li>
					<li>Seats :</li>
				</ul>
				<ul class="book-right">
					<li>: ${namemovie}</li>
					<li id="showDay">: ${nowDay }</li>
					<li>: <span id="counter">0</span></li>
					<li>: <b><span id="total">0</span><i> VNĐ</i></b></li>
				</ul>
				<div class="clear"></div>
				<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
			
						
				<button class="checkout-button" id = "book">Book Now</button>	
				<div id="legend"></div>
			</div>
			<div style="clear:both"></div>
	    </div>

			<script type="text/javascript">
			
			var price = $(money).val(); //price
			
				$(document).ready(function() {
					var People = $('#namePeople').val();
					var mail = $("#mail").val();
					console.log(People);
					var book = [];
					$("#book").click(()=>{
						if(book.length==0){
							alert("Bạn chưa chọn ghế");
							return;
						}
						
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[0]).text();
						if(time == ""){
							alert("Bạn chưa chọn suất chiếu");
							return;
						}
						if(People == "Đăng nhập"){
							alert("Bạn chưa đăng nhập");
							window.location.href = "http://localhost:8080/CINEMA/home/index.htm";
							return;
						}
						alert("bạn đã đặt ghế thành công vui lòng kiểm tra email");
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + book +"/" + People+".htm";
					})
				
					var currentDay = $('#current').val();
					var temp = $('#date').val();
					if( currentDay == ""){
						document.getElementById('date').valueAsDate = new Date();
						var today = new Date();
						var dd = String(today.getDate()).padStart(2, '0');
						var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
						var yyyy = today.getFullYear();

						today = dd + '/' + mm + '/' + yyyy;
						$("#showDay").text(today);
					}else{
						$('#date').val(currentDay);
					}
					var text =[];
					for(let i=1;i<10;i++){
						text.push('#time_' +i);
					}
					$(text[0]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[0]).text();
						if(time == ""){
							time = "temp";
						}
						
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People +".htm";
					})
					$(text[1]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[1]).text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+".htm";
					})
					$(text[2]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[2]).text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+ ".htm";
					})
					$(text[3]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[3]).text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+ ".htm";
					})
					$(text[4]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[4]).text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+ ".htm";
					})
					$(text[5]).click(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $(text[5]).text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+ ".htm";
					})
					$('#date').change(()=>{
						var ngay = $('#date').val();
						var name = $('#name').text();
						var time = $('#time').text();
						if(time == ""){
							time = "temp";
						}
						window.location.href = "http://localhost:8080/CINEMA/booking/"+ name + "/" + time + "/" + ngay  + "/" + People+ ".htm";
					});
					var $cart = $('#selected-seats'), //Sitting Area
					$counter = $('#counter'), //Votes
					$total = $('#total'); //Total money
					console.log("$total: "+$total);
				
					var data= $('#chair').val();
					var sc = $('#seat-map').seatCharts({
						map: [  //Seating chart
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
						],
						naming : {
							top : false,
							getLabel : function (character, row, column) {
								return column;
							}
						},
						legend : { //Definition legend
							node : $('#legend'),
							items : [
								[ 'a', 'available',   'Available' ],
								[ 'a', 'unavailable', 'Sold'],
								[ 'a', 'selected', 'Selected']
							]					
						},
						click: function () { //Click event
							if (this.status() == 'available') { //optional seat
								$('<li>'+(this.settings.row+1)+' - '+this.settings.label+'</li>')
									.attr('id', 'cart-item-'+this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);
								book.push(this.settings.id);
								
								$counter.text(sc.find('selected').length+1);
								$total.text(recalculateTotal(sc)+Number(price));	
								return 'selected';
							} else if (this.status() == 'selected') { //Checked
									//Update Number
									$counter.text(sc.find('selected').length-1);
									//update totalnum
									$total.text(recalculateTotal(sc)-price);
										
									//Delete reservation
									$('#cart-item-'+this.settings.id).remove();
									//optional
									return 'available';
							} else if (this.status() == 'unavailable') { //sold
								return 'unavailable';
							} else {
								return this.style();
							}
						}
					});
					//sold seat
					
					sc.get(data.split(",")).status('unavailable');
						
				});
				//sum total money
				function recalculateTotal(sc) {
					var total =0;
					sc.find('selected').each(function () {
						total += Number (price);
					});
							
					return total;
				}
			</script>
	</div>
</div>
<script src="../js/jquery.nicescroll.js"></script>
<script src="../js/scripts.js"></script>
</body>
</html>

