<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Forgot password</title>
    <jsp:include page="head.jsp"/>
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
        <div class="row flex-center">
            <div class="col-md-6 col-sm-6">
                <div class="create-account-form">
                    <h1>Reset password</h1>

                    <p>Please enter your desired password in the box below.</p>

                    <form class="" method="POST" action="<%= Util.fullPath("reset-pass")%>">

                        <div id="newPassword1" class="form-group has-feedback">
                            <label class="control-label" for="inputNewPassword1">New password</label>
                            <input type="password" name="pass" id="inputNewPassword1" class="form-control"
                                   autocomplete="off">
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                        </div>

                        <div id="newPassword2" class="form-group has-feedback">
                            <label class="control-label" for="inputNewPassword2">Confirm new password</label>
                            <input type="password" name="repass" id="inputNewPassword2" class="form-control"
                                   autocomplete="off">
                            <span class="form-control-feedback glyphicon glyphicon-password"></span>
                            <div id="inputNewPassword2Msg"></div>
                        </div>

                        <div class="form-group">
                            <label class="control-label">Security level of your password</label>
                            <br>

                            <div class="progress" id="passwordStrengthBar">
                                <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0"
                                     aria-valuemax="100">
                                    <span class="sr-only">New Password Rating: 0%</span>
                                </div>
                            </div>

                            <div class="alert alert-info">
                                <strong>Some tips on how to create strong passwords</strong><br><small>
                                Use a different password for each of your important accounts, like your email and online
                                banking<br>Create your password using 8
                                characters or more. It can be any combination of letters, numbers, and symbols<br>Avoid
                                creating passwords from info that others might know or could easily find out</small>
                            </div>


                        </div>

                        <div class="form-group">
                            <div class="text-center">
                                <input class="btn btn-default btn-primary" type="submit" name="submit"
                                       value="Save changes"
                                       disabled="disabled">
                                <input class="btn btn-default" type="reset" value="Cancel">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
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


<script type="text/javascript">
    var pwStrengthErrorThreshold = 50;
    var pwStrengthWarningThreshold = 75;
    var pwstrength;

    jQuery("#inputNewPassword1").keyup(function () {
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
            jQuery('input[type="submit"]').attr('disabled', 'disabled');
        } else {
            if (password2) {
                $newPassword2.removeClass('has-error')
                    .addClass('has-success');
                jQuery("#inputNewPassword2").next('.form-control-feedback').removeClass('fa fa-times').addClass('fa fa-check');
                if (pwstrength >= pwStrengthErrorThreshold)
                    jQuery(' input[type="submit"]').removeAttr('disabled');
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
