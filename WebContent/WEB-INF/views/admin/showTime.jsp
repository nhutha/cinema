<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!doctype html>
<html>

<head>
<title>ADMIN</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0"
	name="viewport" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<!--     Fonts and icons     -->
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/AddCss.css">
<!-- Material Kit CSS -->
<link rel="stylesheet"
	href="http://localhost:8080/CINEMA/css/bootstrap.min.css">
<link
	href="http://localhost:8080/CINEMA/css/material-dashboard.css?v=2.1.1"
	rel="stylesheet" />
<base>
<style type="text/css">

.img-with-text {
    text-align: justify;
    width: [width of img];
}

.img-with-text img {
    display: block;
    margin: 0 auto;
}
</style>
<script type="text/javascript"
	src="http://localhost:8080/CINEMA/js/jquery.min.js"></script>
<script type="text/javascript">
  	$(document).ready(()=>{
  		$(logout).click(()=>{
  			if(confirm("Bạn có chắc muốn thoát")){
  				window.location.href = "http://localhost:8080/CINEMA/home/index.htm";
  			}
  		})
  		
  	 	

  	})
  </script>
</head>

<body>
	<div class="wrapper ">
		<div class="sidebar" data-color="purple" data-background-color="white">
			<!--
      Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

      Tip 2: you can also add an image using data-image tag
  -->
			<div class="logo">
				<a class="navbar-brand"  href="http://localhost:8080/CINEMA/home/index/${name }.htm" style="margin-left: 20px"><img
					width="200px" src="http://localhost:8080/CINEMA/image/logo.webp"></a>
			</div>
			<div class="sidebar-wrapper">
				<ul class="nav">
					<li class="nav-item active  "><a class="nav-link" href="#0">
							<i class="material-icons">dashboard</i>
							<p>${name}</p>
					</a></li>
					<!-- your sidebar here -->
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/CINEMA/admin/user/${name }.htm">
							<i class="material-icons">person</i>
							<p>List User</p>
					</a></li>
					<li class="nav-item "><a class="nav-link" href="http://localhost:8080/CINEMA/admin/movie/${name }.htm">
							<i class="material-icons">theaters</i>
							<p>List Movie</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel">
			<!-- Navbar -->
			<nav
				class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
				<div class="container-fluid">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						aria-controls="navigation-index" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="sr-only">Toggle navigation</span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span> <span
							class="navbar-toggler-icon icon-bar"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end">
						<ul class="navbar-nav">
							<li class="nav-item"><a class="nav-link" href="#pablo"
								id="logout"> <i class="material-icons">power_settings_new</i>
									Logout
							</a></li>
							<!-- your navbar here -->
						</ul>
					</div>
				</div>
			</nav>
			<!-- End Navbar -->
			<div class="content">
				<div class="container-fluid">
				<div style="margin-left: 45%;font-size: 30px;color: blue;margin-bottom: 10px">
						PHIM ${nameMovie }
					</div>
					<input value="${id }" hidden="true">
					<!-- your content here -->
					<div class="tabcontent" id="sign-up">
						<table class="table table-hover" style="text-align: center;">
						<tr>
							<th>Date</th>
							<th>Time</th>
							<th>Price</th>
							<th></th>
						</tr>
						<c:forEach var="item" items="${showtime }">
							<tr>
								<td>${item.showDay }</td>
								<td>${item.time }</td>
								<td>${item.price }</td>
								<td><a
									href="http://localhost:8080/CINEMA/admin/showTime/delete/${name }/${item.id }.htm">Delete</a>
									| <a
									href="http://localhost:8080/CINEMA/admin/showTime/editGetData/${name }/${item.id }.htm" >Edit</a></td>
							</tr>
						</c:forEach>
					</table>
					<div style="margin-left: 45%">
						<a class="nav-link" href="#" id="add"
							onclick="document.getElementById('id01').style.display='block'">
							<i class="material-icons">person_add</i> ADD
						</a>
					</div>
					</div>
					
					<div id="id01" class="modal">
						<form class="modal-content animate"
							action="http://localhost:8080/CINEMA/admin/showTime/them/${name }/${id}.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer">
								<span
									onclick="document.getElementById('id01').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								
								<label for="time" ><b>Time</b></label> <input type="text"
									class="form-control" placeholder="Enter Time" name="time"
									required> <label for="price"><b>Price</b></label> <input
									type="text" class="form-control" placeholder="Enter Price"
									name="price" required> <label for="showDay"><b>ShowDay</b></label>
								<input type="date" class="form-control"
									placeholder="Enter ShowDay" name="showDay" required>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Add</button>

							</div>
						</form>
					</div>
					<div id="id02" class="modal" style="${style}">
						<form class="modal-content animate"
							action="http://localhost:8080/CINEMA/admin/showTime/edit/${name }/${idShowTime }.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer">
								<span
									onclick="document.getElementById('id02').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="time" ><b>Time</b></label> <input type="text"
									class="form-control" placeholder="Enter Time" name="time" value="${time }"
									required> <label for="price"><b>Price</b></label> <input
									type="text" class="form-control" placeholder="Enter Price" value="${price }"
									name="price" required> <label for="showDay"><b>ShowDay</b></label>
								<input type="date" class="form-control" value="${showDay }"
									placeholder="Enter ShowDay" name="showDay" required>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Edit</button>

							</div>
						</form>
					</div>
				
				</div>
			</div>
		</div>
	</div>


</body>

</html>