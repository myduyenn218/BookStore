<%@ page import="Util.Util" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Forgot password</title>
    <jsp:include page="head.jsp"/>
    <style>
        .page-header {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px 0px;

        }

        .page-title {
            color: #32b5f3;
        }

        .box {
            border-radius: 8px;
            position: relative;
            background: #fff;
            padding: 30px 40px;
            box-shadow: 0px 20px 80px 0px rgba(153, 153, 153, 0.3);
        }


        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
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

        .mb-5 {
            margin-bottom: 40px;
        }

        .form-group > span {
            margin-top: 18px;
        }

    </style>
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
<!-- Loging Area Start -->
<%--<div class="login-account section-padding">--%>
<%--    <div class="container">--%>
<%--        <div class="row flex-center" >--%>
<%--            <div class="col-md-6 col-sm-6">--%>
<%--                &lt;%&ndash;                       <form action="#" class="create-account-form" method="post">&ndash;%&gt;--%>
<%--                <form action="<%= Util.fullPath("forgot-pass")%>" class="create-account-form text-center" method="post">--%>
<%--                    <h2 class="heading-title">--%>
<%--                       RESET PASSWORD--%>
<%--                    </h2>--%>
<%--                    <p>Enter your email, and we’ll send you instructions on how to reset your password.</p>--%>
<%--                    <p class="form-row">--%>
<%--                        <input type="email" name="email" placeholder="Email address">--%>
<%--                    </p>--%>
<%--                    <div class="form-group submit">--%>
<%--                        <button name="submitforgot" id="submitcforgot" type="submit" class="btn-default btn-block">--%>
<%--                                    <span>--%>
<%--                                        <i class="fa fa-user left"></i>--%>
<%--                                    Send me a reset instructions--%>
<%--                                    </span>--%>
<%--                        </button>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<div class="page-header">
    <div class="col-lg-5 col-md-7 col-sm-10 col-xs-12 box">
        <form class="form-row" action="<%= Util.fullPath("forgot-pass")%>" method="post">
            <h1 class="page-title font-weight-normal mb-5">FORGOT PASSWORD</h1>
            <p>Enter your email, and we’ll send you instructions on how to reset your password.</p>
            <div class="col-12 mb-2">
                <div class="form-group">
                    <input name="email" type="text" placeholder="Email address " required class="form-control">
                </div>
            </div>
            <div class="col-12">
                <button type="submit" class="btn-block btn-default text-center form-control border-0"> Send me a
                    reset instructions
                </button>
            </div>

        </form>
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
