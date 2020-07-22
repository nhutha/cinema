<%@ page pageEncoding="utf-8"%>

<!doctype html>
<html>

<head>
  <title>ADMIN</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <!--     Fonts and icons     -->
  <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <!-- Material Kit CSS -->
  <link href="../css/material-dashboard.css?v=2.1.1" rel="stylesheet" /><base>
  <script type="text/javascript" src="../js/jquery.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(()=>{
  		$(logout).click(()=>{
  			if(confirm("Bạn có chắc muốn thoát")){
  				window.location.href = "/CINEMA/home/index.htm";
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
        <a class="navbar-brand" href="http://localhost:8080/CINEMA/home/index/${name }.htm" style="margin-left: 20px"><img width="200px"
				src="../image/logo.webp"></a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li class="nav-item active  ">
            <a class="nav-link" href="#0">
              <i class="material-icons">dashboard</i>
              <p>${name}</p>
            </a>
          </li>
          <!-- your sidebar here -->
		  <li class="nav-item ">
            <a class="nav-link" href="http://localhost:8080/CINEMA/admin/user/${name }.htm">
              <i class="material-icons">person</i>
              <p>List User</p>
            </a>
          </li>
          <li class="nav-item ">
            <a class="nav-link" href="http://localhost:8080/CINEMA/admin/movie/${name }.htm">
              <i class="material-icons">theaters</i>
              <p>List Movie</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel">
      <!-- Navbar -->
      <nav class="navbar navbar-expand-lg navbar-transparent navbar-absolute fixed-top ">
        <div class="container-fluid">
          <button class="navbar-toggler" type="button" data-toggle="collapse" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="sr-only">Toggle navigation</span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
            <span class="navbar-toggler-icon icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" href="#pablo" id="logout">
                  <i class="material-icons">power_settings_new</i> Logout
                </a>
              </li>
              <!-- your navbar here -->
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="container-fluid">
          <!-- your content here -->
        </div>
      </div>
    </div>
  </div>
</body>

</html>