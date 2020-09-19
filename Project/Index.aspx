<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proximity Marketing Using Bluetooth Low Energy</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="js/js1.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous" />

	<!--Custom styles-->

    <style>
      
/* ========== Universal Stylings ========== */

body, html{
	height: 100%;
	width:100%;
}

h1,h2,h3,h4,h5{
	position: relative;
	font-family: 'Montserrat', sans-serif;
}
h6{
	position: relative;
}
.bg-primary{
	background-color: #B47F41!important;
}
.bg-dark{
	background-color: #0f0a05!important;
}
.bg-white{
	background-color: #fff;
}
.text-inverse{
	color: #074052;
}
.text-primary{
	color: #B47F41!important;
}
a.text-primary{
	color: #B47F41;
}
a.text-primary:hover{
	color: #916634!important;
	text-decoration: none;
}


.text-underline-white:before{
	content:"";
	position: absolute;
	width:100px;
	height: 4px;
	left:50%;
	margin-left:-50px;
	background:#fff;
	bottom: -15px;
	border-radius: 10px;
}
.text-underline-rb-white:before{
	content:"";
	position: absolute;
	width:100px;
	height: 4px;
	left:0;
	background:#fff;
	bottom: -15px;
	border-radius: 10px;
}
.text-underline-primary:before{
	content:"";
	position: absolute;
	width:50px;
	height: 4px;
	left:50%;
	margin-left:-25px;
	background:#35CBDF;
	bottom: -15px;
	border-radius: 10px;
}
.text-underline-rb-primary:before{
	content:"";
	position: absolute;
	width:100px;
	height: 4px;
	left:0;
	background:#35CBDF;
	bottom: -15px;
	border-radius: 10px;
}
.bg-overlay:before{
	content:"";
	background:rgba(0,0,0,0.7);
	position: absolute;
	height: 100%;
	width:100%;
	left:0;
	top:0;
	z-index: -1;
}
.bg-overlay-primary:before{
	content:"";
	background:rgba(49,31,10,0.5);
	position: absolute;
	height: 100%;
	width:100%;
	left:0;
	top:0;
	z-index: -1;
}
.bg-right{
	background:url("Login-Background.jpg");
	background-repeat: no-repeat;
	background-position: top right;
}

.parallax{
	background-attachment: fixed!important;
}


/* ========== Page Loading Style ========== */
.loaders {
    width: 100%;
    box-sizing: border-box;
    display: flex;
    flex: 0 1 auto;
    flex-direction: row;
    flex-wrap: wrap;
 }
 .loaders .loader {
      box-sizing: border-box;
      display: flex;
      flex: 0 1 auto;
      flex-direction: column;
      flex-grow: 1;
      flex-shrink: 0;
      flex-basis: 25%;
      max-width: 25%;
      height: 200px;
      align-items: center;
      justify-content: center;
  }
  .loader{display: table;
    height: 100%;
    position: fixed;
    width: 100%;
    z-index: 1200;
  }

.loader-bg{
  background: #0F0A06;
}

.loader-inner {
    display: table-cell;
    text-align: center;
    vertical-align: middle;
}




/* ========== Top Navigation ========== */
.top-nav {
    height: 80px;
    transition: 0.2s ease-in;
	-webkit-transition: 0.2s ease-in;
	-moz-transition: 0.2s ease-in;
}
.top-nav .navbar-nav li .nav-link {
    color: #fff;
    font-size: 18px;
    padding:6px 26px;
    margin:6px 5px 0;
    font-weight: 400;
    text-transform: uppercase;
    transition: 0.2s ease-in;
	-webkit-transition: 0.2s ease-in;
	-moz-transition: 0.2s ease-in;
}
.top-nav li a.nav-link:hover, .top-nav .nav-item.active a.nav-link{
    color: #fff;
    background-color: #B47F41;
	border-color: #B47F41;
	border-radius: 50px;
    transition: 0.5s ease-in;
	-webkit-transition: 0.5s ease-in;
	-moz-transition: 0.5s ease-in;
}
.top-nav .navbar-brand{
	font-size: 22px;
	color: #fff;
	font-family: 'Montserrat', sans-serif;
}
.top-nav .search-box li a.nav-link{
	border:1px solid #B47F41;
	padding: 6px 15px;
}
.top-nav.light-header{
	height: 60px;
	background: rgba(0,0,0,0.6);
	box-shadow: 0 0 10px rgba(0,0,0,0.23);
	transition: 0.5s ease-in;
	-webkit-transition: 0.5s ease-in;
	-moz-transition: 0.5s ease-in;
	z-index: 9999;
}
.top-nav.light-header .navbar-brand{
	color: #fff;
}

.top-nav.light-header .search-box li a.nav-link{
	padding: 6px 15px;
	border:1px solid #fff;
}
.top-nav.light-header .search-box li a.nav-link i{
	color:#fff!important;
}

/* ========== Intro Header ========== */
.intro{
	float: left;
	width:100%;
	display: flex;
	align-items:center;
	height:100%;
	position: relative;
	z-index: 1;
}
.intro.intro-small{
	height: 60%;
}
.intro-bg{
	/*background:url("https://grafreez.com/wp-content/temp_demos/razor/img/intro-bg-01.jpg");
	background-repeat:no-repeat;
	background-position: center center;
	background-size:cover;*/
}
.caption-container{
	width:50rem;
	margin:0 auto;
}
.caption-two-panel{
	display: flex;
	align-items:center;
}
.intro h1{
	font-weight: 700;
	font-family: 'Abril Fatface', cursive;
	font-size: 3.8rem;
}
.intro-caption .btn i{
	float: left;
	margin-right:15px;
}
.intro .carousel-item{
	height: 100vh;
}
.intro .carousel-item::before{
	content:"";
	background:rgba(0,0,0,0.6);
	position: absolute;
	width:100%;
	height: 100vh;
}
.intro  .carousel-caption{
	top:25%;
}

/* ========== Who We Are ========== */


/* ========== Responsive Stylings ========== */
@media (max-width: 991px){
	.container{
		width: 100%;
	}
	.intro .intro-box{
		padding-left: 0;
		margin-bottom: 0;
	}
	.intro .intro-box span{
		margin-right: 10px;
	}
	.intro .intro-box .list-item{
		width: 85%;
	}
	.content-half ul li i{
		font-size: 20px;
	}
	.content-half ul li .list-content{
		width:77%;
	}
	.content-half ul li strong{
		line-height: 0;
	}
	.testimonial-section .single-testimonial .carousel-item{
		width: 100%;
		margin-left: 0;
		margin-right: 0;
	}
	.widget h2 {
    	font-size: 1.5rem;
	}
	.widget .counter{
		line-height: 0;
		font-size: 1.7rem;
	}
	.widget .fa-3x{
		font-size: 2rem;
	}
	.widget .stat-content h4{
		font-size: 1.2rem;
	}
	.search-box{
		display: none;
	}
}

@media (max-width: 767px){
	.container{
		width:100%;
	}
	.intro .intro-form-small input[type="text"], .intro .intro-form-small input[type="password"]{
		width: 36%;
	}
	.intro .carousel-caption{
		top:10%;
	}
	.widget.widget-counter .container{
		width: 100%;
	}
	.contact-section #map {
    	height: 400px
	}
	#navbarSupportedContent{
	background: rgba(0, 0, 0, 0.5) none repeat scroll 0 0!important;
	padding: 30px 0
	}
	#navbarSupportedContent li{
		text-align: center;
	}
	#about .copy-container {
	    background-color:rgba(255,255,255,0.9);
	    box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
	    padding: 30px;
	}

}

.action-sec-demo{position:fixed; background:#e08b28;width:100%; bottom:0;z-index:99999; padding:20px 0; height:120px;}
.btn-theme{background-color:#6a3f0c; color:#fff;}

.section_login{
float: left;
    width: 100%;
    padding: 5rem 0;
    position: relative;
    z-index: 1;
    background-image: url(http://getwallpapers.com/wallpaper/full/a/5/d/544750.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    height: 100%;
    font-family: 'Numans', sans-serif;
}

.container_login{
height: 100%;
align-content: center;

}
  .card{
height: 370px;
margin-top: auto;
margin-bottom: auto;
width: 400px;
background-color: rgba(0,0,0,0.5) !important;
}

.social_icon span{
font-size: 60px;
margin-left: 10px;
color: #FFC312;
}

.social_icon span:hover{
color: white;
cursor: pointer;
}

.card-header h3{
color: white;
}

.social_icon{
position: absolute;
right: 20px;
top: -45px;
}

.input-group-prepend span{
width: 50px;
background-color: #FFC312;
color: black;
border:0 !important;
}

input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;

}

.remember{
color: white;
}

.remember input
{
width: 20px;
height: 20px;
margin-left: 15px;
margin-right: 5px;
}

.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}

.login_btn:hover{
color: black;
background-color: white;
}

.links{
color: white;
}

.links a{
margin-left: 4px;
}

  </style>

</head>

<body>
  
        <form id="form1" runat="server">
            <nav class="navbar navbar-expand-md fixed-top top-nav">
                <div class="container-fluid">
                   <%-- <a class="navbar-brand" href="Index.aspx"><strong style="font-family: sans-serif;">Proximity Marketing Using Bluetooth Low Energy</strong></a>--%>
                    
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="#home">HOME <span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#adminlogin">ADMIN LOGIN</a>
                            </li>
                           
                        </ul>
                    </div>
                   
                </div>
            </nav>

            <section id="home" class="intro intro-bg bg-overlay parallax">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 caption-two-panel ml-auto pt-5">
                            <div class="intro-caption mt-5">
                                <h1 class="text-white mb-2">Proximity Marketing Using Bluetooth Low Energy</h1>
                                <p class="text-white mb-4">Bluetooth Low Energy is a form of wireless communication designed especially for short-range communication. Bluetooth Low Energy is very similar to Wi-Fi in the sense that it allows devices to communicate with each other. However, Bluetooth Low Energy is meant for situations where battery life is preferred over high data transfer speeds. </p>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <section class="section_login" id="adminlogin">
                <div class="container_login">
                    <div class="d-flex justify-content-center h-100">
                        <div class="card">
                            <div class="card-header">
                                <h3>ADMIN LOGIN</h3>

                            </div>
                            <div class="card-body">

                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtbx_username" Width="40%" placeholder="username" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="user" runat="server" ControlToValidate="txtbx_username"   
ErrorMessage="Please Enter a Username" ForeColor="Red"></asp:RequiredFieldValidator>  
                                </div>
                                <div class="input-group form-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <asp:TextBox ID="txtbx_pass" Width="40%" CssClass="form-control" runat="server" TextMode="Password" placeholder="password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="red" runat="server" ControlToValidate="txtbx_pass" ErrorMessage="Please Enter Password"></asp:RequiredFieldValidator>         
                                </div>

                                <div class="row align-items-center remember">
                                    <input type="checkbox" runat="server" id="chkbx_remember" />Remember Me
				
                                </div>
                                <div class="form-group">
                                    <asp:Button ID="Button1" CssClass="btn float-right login_btn" runat="server" Text="Login" OnClick="Button1_Click" />
                                    
                                </div>

                            </div>
                           <%-- <div class="card-footer">
                                <div class="d-flex justify-content-center links">
                                    Don't have an account?<a href="#">Sign Up</a>
                                </div>
                                <div class="d-flex justify-content-center">
                                    <a href="#">Forgot your password?</a>
                                </div>
                            </div>--%>
                        </div>
                    </div>
                </div>
            </section>

            <script>

                function invalidlogin() {
                    swal("Invalid Login");
                }

            </script>

    </form>


</body>
</html>
