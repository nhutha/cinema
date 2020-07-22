<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="utf-8">
	<title>Chi Tiết Phim</title>
	<style type="text/css">
		#video_background {
position: absolute;
bottom: 0px;
right: 0px;
min-width: 100%;
min-height: 100%;
width: auto;
height: auto;
z-index: -1000;
overflow: hidden;
}
	</style>
	<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/bootstrap.min.css">
	<link href="http://localhost:8080/CINEMA/css/style.css" rel="stylesheet" type="text/css" media="all" />
	<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/stylecustom.css">
	<script type="text/javascript" src="http://localhost:8080/CINEMA/js/slideshow.js"></script>
	<script src="http://localhost:8080/CINEMA/js/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/font-awesome.min.css">
<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/stylelogin.css" />
<link
	href="http://localhost:8080/CINEMA/css/material-dashboard.css?v=2.1.1"
	rel="stylesheet" />
	<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/AddCss.css">
<!-- Material Kit CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/bootstrap.min.css">
	<style type="text/css">
		.show{
		margin: 10px 10px 10px 10px;
		width: 300px;
		 height: 450px;
		}
	</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/stylelogin.css" />

	
<script type="text/javascript">
  	$(document).ready(()=>{
  		$(logout).click(()=>{
  			if(confirm("Bạn có chắc muốn thoát")){
  				window.location.href = "/CINEMA/home/index.htm";
  			}
  		})
  	})
  </script>
<script type="text/javascript" src="http://localhost:8080/CINEMA/js/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
	<!--webfont-->
	
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="tabcontentLogin" id="sign-up-form">

<div id="id01" class="modal" style="${styledangnhap}" >
						<div class="embed-responsive embed-responsive-4by3" style="width: 1000px;height: 500px;margin-left: 15%"> 
  <iframe class="embed-responsive-item" src="${link }" style="width: 1000px;height: 500px;margin-left: 15%"></iframe>
</div>
					</div>
</div>
	<div>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="http://localhost:8080/CINEMA/home/index.htm"><img width="300px"
				src="http://localhost:8080/CINEMA/image/logo.webp"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<form class="form-inline my-2 my-lg-0 nar-location">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>
					</li>

				</ul>
				<div class="narlanguage" style="margin-right: 0px !important;">
					<a class="login" href="http://localhost:8080/CINEMA/home/index/${name }.htm"><img
						src="http://localhost:8080/CINEMA/image/user.png"></img> ${name}</a> <a class="language"
						href="#">VN</a> | <a class="language" href="#">EN</a>
					<c:if test="${name != 'Đăng nhập' }">
						<a style="margin-left: 15px" href="#pablo" id="logout"> <i
							class="material-icons">power_settings_new</i> Logout
						</a>
					</c:if>

					<!-- your navbar here -->

				</div>
			</div>
		</nav>
	</div>
	<div>
	
<video id="video_background" preload="auto" muted autoplay="true" loop="loop"  >
			
			<source src="http://localhost:8080/CINEMA/video/${movie}.mp4" type="video/mp4"/>
	</video>
	<div class="header-info"  style="color:  blue; float: left; margin-left: 60px">
				<h1 style="color:  #FF6B6B;">${namemovie}</h1>
				<p class="age"><a href="#" style="color:  #F7FFF7;">All Age</a> Don Hall, Chris Williams</p>
				<p class="review" style="color:  #F7FFF7;">Rating	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;  8,5/10</p>
				<p class="review reviewgo" style="color:  #F7FFF7;" >Genre	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : &nbsp;&nbsp; ${categoty}</p>
				<p class="review" style="color:  #F7FFF7;">Release &nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp; ${date}</p>
				<div class="form-group" style="padding: 0px;margin: 0px">
					<textarea  class="special form-control" rows="5" style="color: #F7FFF7;border:none ; background-color:transparent ; text-align: justify;overflow: hidden; margin: 0px;padding: 0px">${content}</textarea>
				</div>
				
				<div style="margin-top: 40px">
				<button id="dangnhap"  onclick="document.getElementById('id01').style.display='block'" class="btn btn-outline-success" style="margin-left: 10%;">TRAILLER</button>
					<a href="http://localhost:8080/CINEMA/booking/${namemovie }/${name}.htm">
					<button type="submit" class="btn btn-outline-success" style="margin-left: 30px">Mua vé</button>
					</a>
				
				</div>
			</div>
	</div>
			<script type="text/javascript">
            function openCity(evt, cityName) {
                var i, tabcontent, tablinks;
                tabcontent = document.getElementsByClassName("tabcontent");
                for (i = 0; i < tabcontent.length; i++) {
                    tabcontent[i].style.display = "none";
                }
                tablinks = document.getElementsByClassName("tablinks");
                for (i = 0; i < tablinks.length; i++) {
                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                }
                document.getElementById(cityName).style.display = "block";
                evt.currentTarget.className += " active";
            }
    
            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
        </script>
        	<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}


</script>
</body>
</html>