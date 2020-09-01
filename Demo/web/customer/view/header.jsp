<%@ page import="controller.page.ListBook" %>
<%@ page import="Util.Util" %>
<%@ page import="Model.Cart" %>
<%@ page import="Model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="Model.Product" %>
<!--Header Area Start-->
<div id="alert-login" class="bootbox modal fade bootbox-alert in hide" role="dialog"
     style="display: block; padding-right: 16px; background: rgba(255,255,255,0.3)">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <button type="button" class="bootbox-close-button close" data-dismiss="modal" aria-hidden="true"
                        style="margin-top: -10px;" onclick="hideAlertLogin()">x
                </button>
                <div class="bootbox-body">You must login to use this function.</div>
            </div>
            <div class="modal-footer"><a href="<%=Util.fullPath("login")%>" data-bb-handler="ok" type="button"
                                         class="btn btn-primary">OK</a></div>
        </div>
    </div>
</div>
<div id="snackbar">
</div>
<div class="header-area bg-white" style="background-color: white">
    <div class="container">
        <div class="row">
            <div class="col-md-2 col-sm-6 col-xs-6">
                <div class="header-logo">
                    <a href="<%= Util.fullPath("")%>">
                        <img src="/public/customer/img/logo.png" alt="">
                    </a>
                </div>
            </div>
            <div class="col-md-1 col-sm-6 visible-sm  col-xs-6">
                <div class="header-right">
                    <ul>
                        <li>
                            <a href="account.jsp"><i class="flaticon-people"></i></a>
                        </li>
                        <li class="shoping-cart">
                            <a href="#">
                                <i class="flaticon-shop"></i>
                                <span>2</span>
                            </a>
                            <div class="add-to-cart-product">
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="/public/customer/img/shop/images/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="cart-product">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="/public/customer/img/shop/images/1.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span>1</span>
                                            x
                                            <a href="single-product.jsp">East of eden</a>
                                        </p>
                                        <a href="single-product.jsp">S, Orange</a>
                                        <span class="cart-price">$ 140.00</span>
                                    </div>
                                    <div class="cart-product-remove">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <div class="total-cart-price">
                                    <div class="cart-product-line fast-line">
                                        <span>Shipping</span>
                                        <span class="free-shiping">$10.50</span>
                                    </div>
                                    <div class="cart-product-line">
                                        <span>Total</span>
                                        <span class="total">$ 140.00</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href="checkout.jsp">
                                        Check out
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9 col-sm-12 hidden-xs">
                <div class="mainmenu text-center">
                    <nav>
                        <ul id="nav">
                            <li><a href="<%= Util.fullPath("")%>">HOME</a></li>
                            <li><a href="<%= Util.fullPath("list-book")%>">LIST BOOK</a></li>
                            <li><a href="<%= Util.fullPath("contact")%>">CONTACT</a></li>
                            <li><a href="<%= Util.fullPath("about")%>">ABOUT</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-1 hidden-sm">
                <div class="header-right" style="margin-left: -100px;">
                    <ul>
                        <li class="shoping-cart" style="margin-right: 5px;">

                            <% if (request.getSession().getAttribute("user") == null) { %>
                            <a href="<%= Util.fullPath("login")%>"><i class="fa fa-sign-in"></i>
                                    <% } else { %>
                                <a href="<%= Util.fullPath("account/edit?id="+ ((User)(request.getSession().getAttribute("user"))).getId())%>"><i class="flaticon-people"></i>
                                    <% } %>

                                </a>
                        </li>
                        <li class="shoping-cart" style="margin-right: 5px">
                            <%
                                User user = (User) request.getSession().getAttribute("user");
                                boolean isLogin = user != null;
                                Cart cart = isLogin ? user.getCart() : (Cart) request.getSession().getAttribute("cart");
                            %>
                            <a href="<%=Util.fullPath("checkout")%>">
                                <i class="flaticon-shop"></i>
                                <span id="shopping-cart-counter">
                                    <%=cart.getQuantity()%>
                                </span>
                            </a>
                            <div id="shopping-cart-wrapper" class="add-to-cart-product">
                                <%
                                    for (Map.Entry<Integer, Product> entry : cart.data.entrySet()) {
                                        Product item = entry.getValue();
                                %>
                                <div class="cart-product" id="cartproductid<%=item.getId()%>">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="/public/customer/img/shop/images/<%=item.getImg()%>" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <p>
                                            <span id="quantity-id<%=item.getId()%>"><%=item.getQuantity()%> </span>
                                            x
                                            <a href="single-product.jsp"><%=Util.shortOfTitle(item.getTitle())%>
                                            </a>
                                        </p>
                                        <span class="cart-price">
                                            <%=Util.showPrice(item.getPrice())%></span>
                                    </div>
                                    <div class="cart-product-remove" onclick="removeCartProduct(<%=item.getId()%>)">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <%}%>
                                <div class="total-cart-price">
                                    <div class="cart-product-line">
                                        <span>Total</span> <span class="total">
                                        <% if (cart.getQuantity() != 0) {%>
                                            <span id="cart-total-price"><%=Util.showPrice(cart.getTotalPrice())%> </span>
                                        <%} else {%>
                                       <span id="cart-total-price">0</span>
                                        <%}%>
                                        VND</span>
                                    </div>
                                </div>
                                <div class="cart-checkout">
                                    <a href="<%=Util.fullPath("checkout")%>">
                                        Check out
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>

                        <li class="shoping-cart" style="margin-right: 5px">
                            <%
                                ArrayList<Product> wishlist = isLogin ? user.getWishlist().getWishlist() : null;
                            %>
                            <a href="<%=Util.fullPath("account/wishlist")%>">
                                <i class="fa fa-heartbeat"></i>
                                <span id="counter-wish">
                                    <% if (isLogin) { %>
                                        <%= wishlist.size()%>
                                    <% } else {%>
                                        0
                                <%}%></span>
                            </a>


                            <div class="add-to-cart-product" id="wish-wrapper">
                                <%
                                    if (isLogin) {
                                        for (Product item : wishlist) {
                                %>
                                <div class="cart-product" id="wishproductid<%=item.getId()%>">
                                    <div class="cart-product-image">
                                        <a href="single-product.jsp">
                                            <img src="/public/customer/img/shop/images/<%=item.getImg()%>" alt="">
                                        </a>
                                    </div>
                                    <div class="cart-product-info">
                                        <a href="single-product.jsp"><%=Util.shortOfTitle(item.getTitle())%>
                                        </a>
                                        <a href="single-product.jsp"><%=item.getType()%>
                                        </a>
                                        <span class="cart-price"><%=Util.showPrice(item.getPrice())%></span>
                                    </div>
                                    <div class="cart-product-remove" onclick="removeWishlistItemAjax(<%=item.getId()%>)">
                                        <i class="fa fa-times"></i>
                                    </div>
                                </div>
                                <% }
                                } %>
                                <div class="cart-checkout">
                                    <a href="<%=Util.fullPath("account/wishlist")%>">
                                        WISH LIST
                                        <i class="fa fa-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="<%= Util.fullPath("list-book")%>"><i class="fa fa-search"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--Header Area End-->
