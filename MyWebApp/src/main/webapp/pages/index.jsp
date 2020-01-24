<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>B.A.R.S</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap-4.1.3-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/newStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/CSS/newFixed.css">
</head>

<body data-spy="scroll" data-target="#navbarResponsive">

    <!-- Start Home Section-->
    <div id="Home">

        <!-- Navigation -->
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="index.html"><img src="../Images/BASE.gif" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive">
                <span class = "navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#Home">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#About">About</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#Portfolio">Portfolio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#Team">Team</a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#Contact">Contact</a>
                    </li>
                </ul>

            </div>
        </nav>

    </div>

    <!-- Start Image Slider-->
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="7000">
        <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"> </li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"> </li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"> </li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <!--Slide 1-->
            <div class="carousel-item active" style="background-image: url(../Images/Gamer.jpg);">
                <div class="carousel-caption text-center">
                    <h1>Based Account Retrieval System</h1>
                    <h3>We Got B.A.R.S</h3>
                    <a class="btn btn-outline-light btn-lg" href="login" target="_top">Get Started</a>
                </div>
            </div>

            <!--Slide 2-->
            <div class="carousel-item" style="background-image: url(../Images/Gamingroom.jpg);"></div>
            <!--Slide 3-->
            <div class="carousel-item" style="background-image: url(../Images/OldWoman.jpg);"></div>
        </div>
        <!--End Carousel Inner-->
        <!--Previous & Next Buttons-->
        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </a>

    </div>
    <!--End Image Slider-->

    <!-- End Home Section-->




    <div id="About" class="offset">

        <div class="col-12 narrow text-center">
            <h1>About Us</h1>
            <p class="lead">OH NO! You try to login and play with your friends and realized you have been banned. You think back "Was it that time I cursed out that noob?", "Was it that time I used an aimbot to get Nuke on Skidrow?" or "Blasphemy! This has to be a mistake".
                Well no matter we can help you recover your account so you can go back in and enjoy the virtual community once again. All you need to do is fill out a form, and wait for The Admins and The BasedGod to determine your fate. <br>We Got B.A.R.S.</p>
        </div>

    </div>



    <!-- Start Portfolio Section-->
    <div id="Portfolio" class="offset">


        <div class="jumbotron container-fluid">
            <div class="col-12 text-center">
                <h3 class="heading">Portfolio</h3>
                <div class="heading-underline"></div>
            </div>
            <div class="row no-padding">
                <div class="col-sm-4">
                    <div class="portfolio">
                        <a href="https://www.linkedin.com/in/omoruyi-omofonmwan-03104494/" target="_blank">
                            <img src="../Images/LinkedIn.png" alt="LinkedIn Logo"></a>
                    </div>

                </div>
                 <div class="col-sm-4">
                    <div class="portfolio">
                        
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="portfolio">
                        <a href="https://stackoverflow.com/users/9561309/acompletenoobsmoke?tab=profile" target="_blank">
                            <img src="../Images/StackOverflowLogo.jpg" alt="StackOverflow Logo"></a>
                    </div>
                </div>
                 



                <div class="narrow text-center">
                    <div class="col-12">
                        <p class="lead">Check Out My Projects On Github </p>
                        <a class="btn btn-secondary btn-md" href="https://github.com/ACompleteNoobSmoke" target="_blank">Go To Github</a>
                    </div>
                </div>
            </div>
        </div>
        <!--End Jumbotron-->

    </div>
    <!-- End Portfolio Section-->


    <!-- Start Team Section-->
    <div id="Team" class="offset">
        <div class="col-12 text-center">
            <h3 class="heading">Team</h3>
            <div class="heading-underline"></div>
        </div>
        <div class="row padding">
            <div class="col-md-6">
                <div class="card text-center">
                    <img class="card-img-top" src="../Images/ProfilePic.jpg" alt="" height="602" width="761">
                    <div class="card-body">
                        <h4>Omoruyi Omofonmwan</h4>
                        <p>"I am a self taught Java Developer and I love technology and art. I view programming as an art form which makes it incredibly fun for me to create/develop projects. TYBG!"</p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card text-center">
                    <img class="card-img-top" src="../Images/LilBGlasses.png" alt="" height="602" width="761">
                    <div class="card-body">
                        <h4>The BASEDONE</h4>
                        <p>"I am all about love, prosperity, and positivity. I feel if a gamer account is banned then he/she is no longer positive. Then it occured to me why not create an oppurtinity for the gamer to be able to enjoy life again thus the
                            creation of this company. No need to thank me. Remember We Got B.A.R.S."</p>
                    </div>
                </div>
            </div>

        </div>


    </div>
    <!-- End Team Section-->





    <!-- Start Contact Section-->
    <div id="Contact" class="offset">


        <footer>
            <div class="row justify-content-center">
                <div class="col-md-5 text-center">
                    <img src="../Images/BASE.gif" alt="">
                    <p>We should be able to restore your account so that you can go back to enjoying gaming with your friends or developing content for your Twitch community. <br> We Got B.A.R.S.</p>

                    <strong>Contact Information</strong>
                    <p>(708) 265-8950 <br> OmoruyiOmofonmwan@yahoo.com</p>
                    <a href="https://www.youtube.com/watch?v=Thw33qJ5DXo" target=_blank><i class = "fab fa-youtube-square"></i></a>
                    <a href="https://www.linkedin.com/in/omoruyi-omofonmwan-03104494/" target=_blank><i class = "fab fa-linkedin"></i></a>
                    <a href="https://github.com/ACompleteNoobSmoke" target=_blank><i class = "fab fa-github-square"></i></a>
                </div>
                <hr class="socket"> &copy; Project 2: WebApp
            </div>
        </footer>
    </div>
    <!-- End Contact Section-->


    <!--- Script Source Files -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrap-4.1.3-dist/js/bootstrap.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v5.11.2/js/all.js"></script>
    <!--- End of Script Source Files -->

</body>

</html>