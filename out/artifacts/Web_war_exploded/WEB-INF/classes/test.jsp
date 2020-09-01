<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/3/2019
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>TEST</title>
</head>
<body>
<div class="formStyle">

    <label>Username</label>
    <input type="text" id="userid"/>
    <small>(e.g. guest)</small>

    <label>Password</label>
    <input type="password" id="pswrd"/>
    <input type="submit" value="Login" id="login"/>
</div>
<jsp:include page="/customer/view/jquery.jsp"/>
<script>
    $(document).ready(function () {
        $('#login').click(function () {
            var user=$('#userid').val();
            var pwd=$('#pswrd').val();
            $.ajax({
                type: "POST",
                url:"Test",   // this is my servlet
                data:{"user":user,"password":pwd},
                success: function (data) {
                    if(data=='True'){
                        alert(data);
                        console.log('true')
                    }else{
                        alert('Fail....');
                    }
                }
            });
        });
    });
</script>
</body>
</html>
