<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Creat An Account || Witter Multipage Responsive Template</title>
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
<!-- Mobile Menu Start -->
<!-- Mobile Menu End -->
<!-- Loging Area Start -->
<div class="page-header">
    <div class="col-lg-5 col-md-7 col-sm-10 col-xs-12 box">
        <form action="<%=Util.fullPath("register")%>" method="post">
            <h1 class="page-title font-weight-normal mb-5">SIGN UP</h1>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email address"
                       class="form-control" <%if(request.getAttribute("old-email")!=null){%>
                       value="<%=request.getAttribute("old-email")%>" <%}%> required>
            </div>
            <% if (request.getAttribute("err-email") != null) { %>
            <div class="alert-danger-my">
                <%= request.getAttribute("err-email")%>
            </div>
            <%}%>

            <div class="form-group">
                <input name="username" type="text" placeholder="Username"
                       class="form-control" <%if(request.getAttribute("username")!=null){%>
                       value="<%=request.getAttribute("username")%>" <%}%>required>
            </div>
            <div id="newPassword1" class="form-group has-feedback">
                <input type="password" name="pass" id="inputNewPassword1" class="form-control"
                       placeholder="Password" autocomplete="off" required>
                <span class="form-control-feedback glyphicon glyphicon-password"></span>
            </div>
            <div id="newPassword2" class="form-group has-feedback">
                <input type="password" name="re-pass" id="inputNewPassword2" class="form-control"
                       placeholder="Retype Password" autocomplete="off" required>
                <span class="form-control-feedback glyphicon glyphicon-password"></span>
                <div id="inputNewPassword2Msg"></div>
            </div>
            <div class="progress hide" id="passwordStrengthBar" style="height: 10px">
                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0"
                     aria-valuemax="100">
                    <span class="sr-only">New Password Rating: 0%</span>
                </div>
            </div>
            <% if (request.getAttribute("err-pass") != null) { %>
            <p class="alert-danger-my">
                <%= request.getAttribute("err-pass")%>
            </p>
            <%}%>
            <div class="form-group">
                <input name="phone" type="tel" placeholder="Phone"
                       class="form-control" <%if(request.getAttribute("phone")!=null){%>
                       value="<%=request.getAttribute("phone")%>" <%}%> required>
            </div>
            <% if (request.getAttribute("err-phone") != null) { %>
            <p class="alert-danger-my">
                <%= request.getAttribute("err-phone")%>
            </p>
            <%}%>
            <div class="form-group">
                <label class="d-block">
                    <input type="checkbox" class="mr-1" name="sports"> I have read and agree to the <a href="#">term
                    of service</a>
                </label>
            </div>
            <button type="submit" class="btn-block btn-default text-center form-control border-0" disabled="disabled">
                SIGN
                UP
            </button>
            <div class="m-4"></div>
            <div class="col-12 text-center">
                <p>Had an account? <a href="<%=Util.fullPath("login")%>">Sign In</a></p>
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

<script type="text/javascript">
    var pwStrengthErrorThreshold = 50;
    var pwStrengthWarningThreshold = 75;
    var pwstrength;

    jQuery("#inputNewPassword1").keyup(function () {
        $('.progress').removeClass("hide");
        var pwStrengthErrorThreshold = 50;
        var pwStrengthWarningThreshold = 75;

        var $newPassword1 = jQuery("#newPassword1");
        var pw = jQuery("#inputNewPassword1").val();
        var pwlength = (pw.length);
        if (pwlength > 5) pwlength = 5;
        var numnumeric = pw.replace(/[0-9]/g, "");
        var numeric = (pw.length - numnumeric.length);
        if (numeric > 3) numeric = 3;
        var symbols = pw.replace(/\W/g, "");
        var numsymbols = (pw.length - symbols.length);
        if (numsymbols > 3) numsymbols = 3;
        var numupper = pw.replace(/[A-Z]/g, "");
        var upper = (pw.length - numupper.length);
        if (upper > 3) upper = 3;
        pwstrength = ((pwlength * 10) - 20) + (numeric * 10) + (numsymbols * 15) + (upper * 10);
        if (pwstrength < 0) pwstrength = 0;
        if (pwstrength > 100) pwstrength = 100;

        $newPassword1.removeClass('has-error has-warning has-success');
        jQuery("#inputNewPassword1").next('.form-control-feedback').removeClass('fa-exclamation-triangle fa-times fa-check');
        jQuery("#passwordStrengthBar .progress-bar").removeClass("progress-bar-danger progress-bar-warning progress-bar-success").css("width", pwstrength + "%").attr('aria-valuenow', pwstrength);
        jQuery("#passwordStrengthBar .progress-bar .sr-only").html('New Password Rating: ' + pwstrength + '%');
        if (pwstrength < pwStrengthErrorThreshold) {
            $newPassword1.addClass('has-error');
            jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('fa fa-times');
            jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-danger");
        } else if (pwstrength < pwStrengthWarningThreshold) {
            $newPassword1.addClass('has-warning');
            jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('fa fa-exclamation-triangle');
            jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-warning");
        } else {
            $newPassword1.addClass('has-success');
            jQuery("#inputNewPassword1").next('.form-control-feedback').addClass('fa fa-times');
            jQuery("#passwordStrengthBar .progress-bar").addClass("progress-bar-success");
        }
        validatePassword2();
    });

    function validatePassword2() {
        var password1 = jQuery("#inputNewPassword1").val();
        var password2 = jQuery("#inputNewPassword2").val();
        var $newPassword2 = jQuery("#newPassword2");

        if (password2 && password1 !== password2) {
            $newPassword2.removeClass('has-success')
                .addClass('has-error');
            jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('fa fa-check').addClass('fa fa-times');
            jQuery("#inputNewPassword2Msg").html('<p class="help-block">The passwords entered do not match</p>');
            jQuery('button[type="submit"]').attr('disabled', 'disabled');
        } else {
            if (password2) {
                $newPassword2.removeClass('has-error')
                    .addClass('has-success');
                jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('fa fa-times').addClass('fa fa-check');
                if (pwstrength >= pwStrengthErrorThreshold)
                    jQuery('button[type="submit"]').removeAttr('disabled');
            } else {
                $newPassword2.removeClass('has-error has-success');
                jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('fa fa-times fa fa-times');
            }
            jQuery("#inputNewPassword2Msg").html('');
        }
    }

    jQuery(document).ready(function () {
        jQuery('.using-password-strength input[type="submit"]').attr('disabled', 'disabled');
        jQuery("#inputNewPassword2").keyup(function () {
            validatePassword2();
        });
    });

</script>
</body>
</html>
