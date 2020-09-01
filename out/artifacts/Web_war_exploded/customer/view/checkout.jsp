<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="Model.User" %>
<%@ page import="Model.Cart" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Product" %>

<!doctype html>
<html class="no-js" lang="">
<head>

    <title>Checkout</title>
    <jsp:include page="../view/head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/checkout.css">
    <script src="/public/customer/js/vendor/jquery-1.12.0.min.js"></script>
</head>
<body>

<jsp:include page="../view/header.jsp"/>
<div class="tiki-cart">
    <div class="wrap">
        <div class="container have-height">

            <%
                User user = (User) request.getSession().getAttribute("user");
                boolean isLogin = user != null;
                Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
                if (cart.getQuantity() != 0) {

            %>
            <div class="row">
                <div class="col-xs-12">
                    <h2 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Cart <span>(<%=cart.getQuantity()%> <%
                        if (cart.getQuantity() == 1) { %>
                        product
                        <% } else { %>
                        products
                        <%}%>
                        )</span>
                    </h2>
                </div>
                <div class="col-xs-8 cart-col-1">
                    <form id="shopping-cart">
                        <% for (Map.Entry<Integer, Product> entry : cart.getData().entrySet()) {
                            Product product = entry.getValue();%>
                        <div class="row shopping-cart-item">
                            <div class="col-xs-3 img-thumnail-custom">
                                <p class="image">
                                    <img class="img-responsive"
                                         src="/public/customer/img/shop/images/<%=product.getImg()%>">
                                </p>
                            </div>
                            <div class="col-right">
                                <div class="box-info-product">
                                    <input type="hidden" class="hidden-quantity" name="quantity[310760531935701]"
                                           value="1">
                                    <div class="badge-tikinow-a">
                                        <p class="name">
                                            <a href=""
                                               target="_blank">
                                                <%=product.getTitle()%>
                                            </a>

                                        </p>
                                    </div>

                                    <p class="seller-by">
                                        by <span class="firm"><a href=""><%=product.getPublisher()%></a></span>
                                    </p>

                                    <p class="action">
                                        <a>
                                            Xóa
                                        </a>
                                        <a style="margin-left: 3rem">
                                            Để dành mua sau
                                        </a>
                                        <!-- <button type="button" class="btn btn-default btn-custom1 add-to-wishlist" data-product-id="1914877">Đưa vào wishlist</button> -->
                                    </p>
                                </div>
                                <div class="badge-tikinow-a">
                                    <div class="box-price">
                                        <p class="price"><%=Util.showPrice(product.getPrice())%>đ</p>
                                        <%--                                        <p class="price2">--%>
                                        <%--                                            27.000đ--%>
                                        <%--                                        </p>--%>
                                        <%--                                        <span class="sale">-22%</span>--%>
                                    </div>
                                </div>

                                <div class="quantity-block">
                                    <div class="input-group bootstrap-touchspin bootstrap-touchspin-injected">
                                        <span
                                                class="input-group-btn input-group-prepend"><button
                                                class="btn btn-primary bootstrap-touchspin-down"
                                                type="button"
                                                onclick="changeQuantityProduct(-1, <%=product.getId()%>)">-</button>
                                        </span>
                                        <input id="touch<%=product.getId()%>" type="number" min="1"
                                               value="<%=product.getQuantity()%>"
                                               name="touchspin"
                                               class="form-control">
                                        <span
                                                class="input-group-btn input-group-append"><button
                                                class="btn btn-primary bootstrap-touchspin-up"
                                                type="button"
                                                onclick="changeQuantityProduct(1, <%=product.getId()%>)">+</button>
                                        </span>
                                    </div>
                                </div>
                                <!-- <div class="box-info-discount"></div> -->
                            </div>
                        </div>
                        <% } %>
                    </form>
                </div>
                <div class="col-xs-4 cart-col-2">
                    <div id="right-affix" class="affix-top">

                        <div class="each-row">

                            <div class="box-style fee">

                                <p class="list-info-price">
                                    <span>Provisional pricing: </span>
                                    <strong id="giatamtinh"><%=Util.showPrice(cart.getTotalPrice())%>đ</strong>
                                </p>
                            </div>
                            <div class="box-style fee">
                                <div class="total2 clearfix">
                                    <span class="text-label">Total payment: </span>
                                    <div class="amount">
                                        <p>
                                            <strong id="thanhtien"><%=Util.showPrice(cart.getTotalPrice())%>đ</strong>
                                        </p>
                                        <p class="text-right">
                                            <small>(VAT included (where applicable))</small>
                                        </p>
                                    </div>
                                </div>
                            </div>

                            <a type="button" class="btn btn-large btn-block btn-danger btn-checkout"
                                    <%if (request.getSession().getAttribute("user") != null) {%>
                               href="<%=Util.fullPath("ConfirmOrder")%>" <%} else {%>
                               onclick="showAlertLogin()" <%}%>>
                                Proceed to ordering
                            </a>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="panel-group coupon" id="accordion">
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">PROMOTION CODE</h4>
                                        </div>
                                        <div id="collapseOne3" class="panel-collapsex`">
                                            <div class="panel-body">
                                                <div class="input-group">
                                                    <input id="coupon" placeholder="type here.." type="text"
                                                           class="form-control" value="">
                                                    <span class="input-group-btn">
														<button class="btn btn-default btn-coupon"
                                                                onclick="addPromotion()"
                                                                type="button" id="submit-promotion" disabled="disabled">Submit</button>
													</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } else { %>
            <div class="alert alert-danger"><i class="fa fa-times-circle" aria-hidden="true"
                                               style="margin-right: 10px"></i> Cart is empty. Please
                try again.
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Cart <span>(0 product)</span></h5>
                    <div class="empty-cart">
                        <span class="mascot-image"></span>
                        <p class="message">You have no items in your shopping cart.</p>
                        <a href="/" class="btn btn-yellow" disabled="disabled">Continue shopping</a>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
    </div>
</div>
<!-- Footer Area Start -->
<jsp:include page="../view/footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="../view/jquery.jsp"/>

<script src="/public/customer/js/jquery.bootstrap-touchspin.js"></script>

<script>

    function addPromotion() {
        var code = $('#coupon').val();
        addPromotionAjax(code);
    }

    <%--function cartPay() {--%>
    <%--    var user =<%=request.getAttribute("user") != null %>;--%>
    <%--    console.log(user);--%>
    <%--    if (user) {--%>
    <%--        window.location.href = 'cartPay';--%>
    <%--    } else {--%>
    <%--        showAlertLogin();--%>
    <%--    }--%>
    <%--}--%>

    function addPromotionAjax(code) {
        $.ajax({
            type: "POST",
            url: "/addPromotion",
            data: {"code": code},
            success: function (data) {
                if (data) {
                    $('#thanhtien').text(showPrice(data) + "VND")
                    showSnackbar("Added promotion")
                }
            }
        })
    }

    $('#coupon').keyup(function () {
        var selector = $(this);
        var code = selector.val();
        $.ajax({
            type: "POST",
            url: "/checkPromotionCode",
            data: {"code": code},
            success: function (data) {
                if (data === 'true') {
                    selector.removeClass("text-danger")
                    selector.addClass("text-success")
                    $('#submit-promotion').prop("disabled", false)
                } else {
                    selector.removeClass("text-success")
                    selector.addClass("text-danger")
                    $('#submit-promotion').prop("disabled", true)
                }
            }
        })
    })

</script>
</body>
</html>