<%@ page import="Util.Util" %>
<nav class="navbar navbar-expand-xl">
    <div class="container h-100">
        <a class="navbar-brand" href="index.jsp">
            <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse"
                data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mx-auto h-100">
                <li class="nav-item">
                    <a class="nav-link active" href="<%= Util.fullPath("admin") %>">
                        <i class="fas fa-tachometer-alt"></i>
                        Dashboard
                        <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= Util.fullPath("admin/product") %>">
                        <i class="fas fa-shopping-cart"></i>
                        Products
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%= Util.fullPath("admin/producer") %>">
                        <i class="fas fa-shopping-cart"></i>
                        Producer
                    </a>
                </li>



                <li class="nav-item">
                    <a class="nav-link" href="<%= Util.fullPath("admin/account") %>">
                        <i class="far fa-user"></i>
                        Accounts
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link d-block" href="login.jsp">
                        Admin, <b>Logout</b>
                    </a>
                </li>
            </ul>
        </div>
    </div>

</nav>
<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/public/admin/js/bootstrap.min.js"></script>