<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CINEMA</title>
<jsp:include page="style.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet" href="http://localhost:8080/CINEMA/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script type="text/javascript" src="http://localhost:8080/CINEMA/js/jquery.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
<script type="text/javascript">
  	$(document).ready(()=>{
  	
  		$(dangky).click(()=>{
  			document.getElementById('id02').style.display='block';
  			document.getElementById('id01').style.display='none';
			})
			$(dangnhap).click(()=>{
  			document.getElementById('id01').style.display='block';
  			document.getElementById('id02').style.display='none';
			})
		$(logout).click(()=>{
  			if(confirm("Bạn có chắc muốn thoát")){
  				window.location.href = "http://localhost:8080/CINEMA/home/index.htm";
  			}
  		})
  	})
  </script>
</head>
<body>

<div class="tabcontentLogin" id="sign-up-form">

<div id="id01" class="modal" style="${styledangnhap}" >
						<form class="modal-content animat"
							action="http://localhost:8080/CINEMA/login/dangnhap.htm"
							style="width: 500px; margin-top: 0px;" method="POST">
							<div class="imgcontainer">
								<span
									onclick="document.getElementById('id01').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="email"><b>Email</b></label>
								 <input type="text" 
									class="form-control" placeholder="Enter Email" name="your_email"
									required>
									 <label for="psw"><b>Password</b></label>
								<input type="password" class="form-control"
									placeholder="Enter Password" name="password" required>
									<p>${message }</p>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 20%;">Đăng Nhập</button>
									<button type="submit" id="dangky" class="btn btn-outline-success"
									style="margin-left: 30px">Đăng Ký</button>

							</div>
						</form>
					</div>
</div>


<div class="tabcontentLogin" id="sign-in-form">

<div id="id02" class="modal" style="${styledangky}">
						<form class="modal-content animate"
							action="http://localhost:8080/CINEMA/login/dangky.htm"
							style="width: 500px; margin-top: 0px;" method="POST">
							<div class="imgcontainer" style="margin: 0px 0px 0px 0px !important;">
								<span
									onclick="document.getElementById('id02').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="email"><b>Email</b></label>
								 <input type="text" class="form-control" placeholder="Enter Email" name="email" required> <label for="uname"><b>FullName</b></label> 
								 <input type="text" class="form-control" placeholder="Enter FullName" name="fullName" required> <label for="psw"><b>Password</b></label>
								<input type="password" class="form-control"
									placeholder="Enter Password" name="password" required>
								<label for="phone"><b>Phone</b></label> <input type="text"
									class="form-control" placeholder="Enter Phone" name="phone"
									required> <label for="address"><b>Address</b></label> <input
									type="text" class="form-control" placeholder="Enter Address"
									name="address" required> <label for="birthDay"><b>BirthDay</b></label>
								<input type="date" class="form-control"
									placeholder="Enter BirthDay" name="birthDay" required>
									<p>${message2 }</p>
								<button id="dangnhap"  type="submit" class="btn btn-outline-success"
									style="margin-left: 20%;">Đăng Nhập</button>
									<button type="submit" class="btn btn-outline-success"
									style="margin-left: 30px">Đăng Ký</button>

							</div>
						</form>
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
					<a class="login" href="#" onclick="document.getElementById('id01').style.display='block'"><img
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

		<div class="tab" style="margin-left: 40%">
			<span class="tab-inner" style="margin-right: 15px">
				<button class="tablinks btn btn-outline-success" onclick="openCity(event, 'sign-up')"
					id="defaultOpen">Phim đang chiếu</button>
			</span>
			<span class="tab-inner">
				<button class="tablinks btn btn-outline-success" onclick="openCity(event, 'sign-in')">Phim sắp chiếu</button>
			</span>
		</div>

		<div class="tabcontent" id="sign-up">
			<c:forEach var="i" items="${dataDang }" >
				<a  href="http://localhost:8080/CINEMA/chitiet/${i.picture}/${name }.htm">
					<span>
						<img class="show" src="http://localhost:8080/CINEMA/image/${i.picture }">
					</span>
				</a>
			</c:forEach>
			
			</div>
		<div class="tabcontent" id="sign-in">
			<c:forEach var="k" items="${dataSap }" >
				<span>	
					<a href="http://localhost:8080/CINEMA/chitiet/${k.picture}/${name }.htm">
						<img class="show" src="http://localhost:8080/CINEMA/image/${k.picture }">
					</a>
				</span>
			</c:forEach>
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
var modal = document.getElementById('id02');

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal) {
     modal.style.display = "none";
 }
}


</script>
	<footer>
	
	 </footer>

	<script src="http://localhost:8080/CINEMA/js/bootstrap.min.js"></script>

</body>
</html>