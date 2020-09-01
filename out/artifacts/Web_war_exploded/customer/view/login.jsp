<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Creat An Account || Witter Multipage Responsive Template</title>
    <jsp:include page="head.jsp"/>
    <style>

        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            /* display: none; <- Crashes Chrome on hover */
            -webkit-appearance: none;
            margin: 0;
            /* <-- Apparently some margin are still there even though it's hidden */
        }

        .box {
            border-radius: 8px;
            position: relative;
            background: #fff;
            border: 1px solid #dedede;
            box-shadow: 0px 20px 80px 0px rgba(153, 153, 153, 0.3);
            padding: 2.5rem 4.5rem !important;
        }

        .form-control {
            border-radius: 10px !important;
            color: #141313;
            font-size: 12px;
            font-weight: 500;
            width: 100%;
            height: 50px !important;
            padding: 14px;
            line-height: 1.42857143 !important;
            background-image: none;
            letter-spacing: 1px;
            margin-bottom: 10px;
            -webkit-box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
            box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
        }

        input[type=number] {
            -moz-appearance: textfield;
        }

        .bt-fb {
            border: 0.5px solid #3b5998;
            color: #3b5998;
        }

        .bt-fb:hover {
            background-color: #3b5998;
            color: white;
        }

        .bt-gg {
            border: 0.5px solid #b23121;
            color: #b23121;
        }

        .bt-gg:hover {
            background-color: #b23121;
            color: white;
        }

        .mb-3 {
            margin-bottom: 1rem;
        }

        .mb-5 {
            margin-bottom: 40px;
        }

        .mr-3 {
            margin-right: 1rem;
        }

        .fb_iframe_widget {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .fb_iframe_widget > span {
            border-radius: 10px !important;
            color: #141313;
            font-size: 12px;
            font-weight: 500;
            width: 100%;
            height: 50px !important;
            padding: 14px;
            line-height: 1.42857143 !important;
            background-image: none;
            letter-spacing: 1px;
            margin-bottom: 10px;
            -webkit-box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
            box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
        }

        .fb_iframe_widget iframe {
            position: relative !important;
        }
    </style>
    <script>
        // This is called with the results from from FB.getLoginStatus().
        function statusChangeCallback(response) {
            console.log('statusChangeCallback');
            console.log(response);
            console.log(response.authResponse.accessToken);
            //alert(response.authResponse.accessToken);
            if (response.status === 'connected') {
                window.location.href = 'FB_login?access_token=' + response.authResponse.accessToken;
            } else {
                // The person is not logged into your app or we are unable to tell.
                alert('Please log into this app.');
            }
        }

        // This function is called when someone finishes with the Login
        // Button. See the onlogin handler attached to it in the sample
        // code below.
        function checkLoginState() {
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        }

        window.fbAsyncInit = function () {
            FB.init({
                appId: '1060067031013824',
                cookie: true, // enable cookies to allow the server to access
                // the session
                xfbml: true, // parse social plugins on this page
                version: 'v5.0' // use graph api version 2.8
            });
            FB.getLoginStatus(function (response) {
                statusChangeCallback(response);
            });
        };

        function fb_login() {
            FB.login(function (response) {
                if (response.status === 'connected') {
                    window.location.href = 'FB_login?access_token=' + response.authResponse.accessToken;
                    // Logged into your webpage and Facebook.
                } else {
                    // The person is not logged into your webpage or we are unable to tell.
                }
            });
        }

        // Load the SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s);
            js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        // Here we run a very simple test of the Graph API after login is
        // successful. See statusChangeCallback() for when this call is made.
    </script>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->
<!--Header Area Start-->
<jsp:include page="header.jsp"/>
<!--Header Area End-->
<!-- Mobile Menu Start -->
<!-- Mobile Menu End -->
<!-- Loging Area Start -->
<div class="login-account section-padding">
    <div class="container">
        <div class="row" style="display: flex; justify-content: center; ">
            <% if (request.getAttribute("mess") != null) {%>
            <div class="alert alert-danger"><i class="fa fa-times-circle" aria-hidden="true"
                                               style="margin-right: 10px"></i> <%request.getAttribute("mess");%>
            </div>
            <%}%>
            <form class="col-md-7 box" action="<%= Util.fullPath("login")%>" method="post">
                <div>
                    <h1 class="page-title font-weight-normal mb-5">SIGN IN</h1>
                    <div class="form-group">
                        <input id="email" type="email" name="email" placeholder="email address" class="form-control">
                    </div>
                    <div class="form-group">
                        <input id="password" type="password" name="pass" placeholder="password" class="form-control">
                    </div>
                    <p class="form-row">
                        <%= request.getAttribute("err") != null ? request.getAttribute("err") : ""%>
                    </p>
                    <div class="col-12 text-right mb-3">
                        <a href="<%=Util.fullPath("forgot-pass")%>">FORGOT PASSWORD?</a>
                    </div>
                    <button type="submit" class="btn-block btn-default text-center form-control border-0">SIGN
                        IN
                    </button>
                    <div class="btn-block text-center form-control bt-fb"
                            onclick="fb_login()"><i
                            class="fa fa-facebook mr-3"></i>SIGN IN WITH FACEBOOK
                    </div>

                    <div class="btn-block text-center form-control bt-gg"><i
                            class="fa fa-google mr-3"></i>SIGN IN WITH GOOGLE+
                    </div>
                    <div class="m-4"></div>
                    <div class="col-12 text-center">
                        <p>Don't have an acount? <a href="<%=Util.fullPath("register")%>">Sign Up</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Loging Area End -->
<!-- Footer Area Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="jquery.jsp"/>


</body>
</html>
