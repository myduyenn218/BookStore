<%@ page import="Model.Cart" %>
<%@ page import="Model.Product" %>
<%@ page import="Util.Util" %>
<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Shopping Cart || Witter Multipage Responsive Template</title>
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
<!-- Breadcrumbs Area Start -->
<div class="breadcrumbs-area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="breadcrumbs">
                    <h2>SHOPPING CART</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="../../index.jsp">Home</a>
                        </li>
                        <li>Shopping Cart</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumbs Area Start -->
<!-- Cart Area Start -->
<div class="shopping-cart-area section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form method="post" action="<%=Util.fullPath("CartUpdate")%>">

                    <div class="wishlist-table-area table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-remove">Remove</th>
                                <th class="product-image">Image</th>
                                <th class="t-product-name">Product Name</th>
                                <th class="product-edit">Edit</th>
                                <th class="product-unit-price">Unit Price</th>
                                <th class="product-quantity">Quantity</th>
                                <th class="product-subtotal">Subtotal</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% Cart c = (Cart) request.getAttribute("Cart");
                                if (c == null) c = new Cart();
                                for (Product p : c.list()) {
                            %>
                            <tr>
                                <td class="product-remove">
                                    <a href="<%= Util.fullPath("DelProduct?id="+p.getId()) %>">
                                        <i class="flaticon-delete"></i>
                                    </a>
                                </td>
                                <td class="product-image">
                                    <a href="#">
                                        <img src="/public/customer/img/shop/images/<%= p.getImg()%>" style="height: 140px"
                                             alt="">
                                    </a>
                                </td>
                                <td class="t-product-name">
                                    <h3>
                                        <a href="#"><%= p.getTitle()%>
                                        </a>
                                    </h3>
                                </td>
                                <td class="product-edit">
                                    <p>
                                        <a href="#">Edit</a>
                                    </p>
                                </td>
                                <td class="product-unit-price">
                                    <p>$ <%= p.getPrice()%>
                                    </p>
                                </td>
                                <td class="product-quantity product-cart-details">
                                    <input type="hidden" name="id" value="<%= p.getId()%>">
                                    <input type="number" name="quantity" min="1" value="<%= p.getQuantity()%>">


                                </td>
                                <td class="product-quantity">
                                    <p>$ <%= p.getQuantity()%>
                                    </p>
                                </td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="shopingcart-bottom-area">
                        <a class="left-shoping-cart" href="<%=Util.fullPath("list-book")%>">CONTINUE SHOPPING</a>
                        <div class="shopingcart-bottom-area pull-right">
                            <a class="right-shoping-cart" href="#">CLEAR SHOPPING CART</a>

                            <%--                            <a class="right-shoping-cart" href="#">UPDATE SHOPPING CART</a>--%>
                            <input type="submit" value="UPDATE SHOPPING CART">
                        </div>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<!-- Cart Area End -->
<!-- Discount Area Start -->
<div class="discount-area">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="discount-main-area">
                    <div class="discount-top">
                        <h3>DISCOUNT CODE</h3>
                        <p>Enter your coupon code if have one</p>
                    </div>
                    <div class="discount-middle">
                        <input type="text" placeholder="">
                        <a class="" href="#">APPLY COUPON</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="subtotal-main-area">
                    <div class="subtotal-area">
                        <h2>SUBTOTAL<span>$ <%= c.total()%></span></h2>
                    </div>
                    <div class="subtotal-area">
                        <h2>GRAND TOTAL<span>$ <%= c.total()%></span></h2>
                    </div>
                    <a href="customer/view/checkout.jsp">CHECKOUT</a>
                    <p>Checkout With Multiple Addresses</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Discount Area End -->
<!-- Footer Area Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="jquery.jsp"/>
</body>
</html>