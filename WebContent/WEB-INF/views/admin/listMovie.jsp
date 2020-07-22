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
				<div style="margin-left: 45%">
						<a class="nav-link" href="#" id="add"
							onclick="document.getElementById('id01').style.display='block'">
							<i class="material-icons">person_add</i> ADD
						</a>
					</div>
					<!-- your content here -->
					<div class="tabcontent" id="sign-up">
						<c:forEach var="item" items="${movies }">
						
						<a href="http://localhost:8080/CINEMA/admin/showTime/${name}/${item.id}.htm"><div class="img-with-text" style="float: left;text-align:  center;">
							<img  title="${item.name }" class="show" src="http://localhost:8080/CINEMA/image/${item.picture }" style="width: 225px;height: 225px; margin: 10px 10px 10px 10px">
							<p>
							<a href="http://localhost:8080/CINEMA/admin/movie/delete/${item.id }/${name}.htm">Delete</a> | 
							<a href="http://localhost:8080/CINEMA/admin/movie/editGetData/${item.id }/${name }.htm" >Edit</a>
							</p>
						</div>	</a>
						</c:forEach>
					</div>
					
					<div id="id01" class="modal">
						<form class="modal-content animate" enctype="multipart/form-data" method="POST"
							action="http://localhost:8080/CINEMA/admin/movie/them/${name }.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer" style="margin: 0px 0px 0px 0px !important;">
								<span
									onclick="document.getElementById('id01').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
								<label for="name"><b>Name</b></label> <input type="text"
									class="form-control" placeholder="Enter Name" name="nameMovie"
									required> 
									
								<label for="startDay"><b>StartDay</b></label>
								<input type="date" class="form-control"
									placeholder="Enter StartDay" name="startDay" required>
									<label for="endDay"><b>EndDay</b></label>
								<input type="date" class="form-control"
									placeholder="Enter EndDay" name="endDay" required>
								<label for="picture"><b>Picture</b></label>
								<input type="file" class="form-control" placeholder="Choose File" name="picture">
								<label for="content"><b>Content</b></label>
								<input type="text" class="form-control"
									placeholder="Enter Content" name="content" required>
									<label for="trailer"><b>Trailer</b></label>
								<input type="text" class="form-control"
									placeholder="Enter Trailer" name="trailer" required>
									<label for="category"><b>Category</b></label>
								<select class="form-control" name="category">
									<c:forEach items="${category }" var="item">
										<option value=" ${item.id }"> ${item.name }</option>
									</c:forEach>
									
								</select>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Add</button>

							</div>
						</form>
					</div>
					
					<div id="id02" class="modal" style="${style}">
						<form class="modal-content animate" enctype="multipart/form-data" method="POST"
							action="http://localhost:8080/CINEMA/admin/movie/editMovie/${name }/${id }.htm"
							style="width: 500px; margin-top: 0px;">
							<div class="imgcontainer" style="margin: 0px 0px 0px 0px !important;">
								<span
									onclick="document.getElementById('id02').style.display='none'"
									class="close" title="Close Modal">&times;</span>

							</div>

							<div class="container">
							<input id="dataFile" name="dataFile" value="${dataFile }" hidden="true">
							<input id="dataCategory" name="dataCategory" value="${dataCategory }" hidden="true">
								<label for="name"><b>Name</b></label> <input type="text"
									class="form-control" placeholder="Enter Name" name="nameMovie" value="${nameMovie }"
									required> 
									
								<label for="startDay"><b>StartDay</b></label>
								<input type="date" class="form-control" value="${startDay }"
									placeholder="Enter StartDay" name="startDay" required>
									<label for="endDay"><b>EndDay</b></label>
								<input type="date" class="form-control" value="${endDay }"
									placeholder="Enter EndDay" name="endDay" required>
								<label for="picture"><b>Picture</b></label>
								<input id="picture" type="file" class="form-control" value="${dataFile }" placeholder="Choose File" name="picture">
								<label for="content"><b>Content</b></label>
								<input type="text" class="form-control" value="${content }"
									placeholder="Enter Content" name="content" required>
									<label for="trailer"><b>Trailer</b></label>
								<input type="text" class="form-control" value="${trailer }"
									placeholder="Enter Trailer" name="trailer" required>
									<label for="category"><b>Category</b></label>
								<select id="category" class="form-control" name="category">
									<c:forEach items="${category }" var="item">
										<option value=" ${item.id }"> ${item.name }</option>
									</c:forEach>
									
								</select>
								<button type="submit" class="btn btn-outline-success"
									style="margin-left: 40%;">Edit</button>

							</div>
						</form>
					</div>
				
				</div>
			</div>
		</div>
	</div>

	<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
var modal2 = document.getElementById('id02');

//When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
 if (event.target == modal2) {
     modal.style.display = "none";
 }
}
</script>
</body>

</html>