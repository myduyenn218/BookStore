<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<%@ page pageEncoding="utf-8" %>

<!doctype html>
<html class="no-js" lang="">
<head>
    <title>Product Details || Witter Multipage Responsive Template</title>
    <jsp:include page="head.jsp"/>
    <link rel="stylesheet" href="/public/customer/css/shop.css">
    <style>
        .white-panel {
            border-radius: 4px;
            background: #fff;
            padding: 20px 10px;
        }
    </style>
</head>
<body style="background: #f4f4f4">

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
                    <h2>PRODUCT DETAILS</h2>
                    <ul class="breadcrumbs-list">
                        <li>
                            <a title="Return to Home" href="../../index.jsp">Home</a>
                        </li>
                        <li>Product Details</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%
    ResultSet img = (ResultSet) request.getAttribute("img");
    ResultSet book = (ResultSet) request.getAttribute("book");
    ResultSet cate = (ResultSet) request.getAttribute("cate");

%>
<!-- Breadcrumbs Area Start -->
<!-- Single Product Area Start -->
<div class="single-product-area section-padding">
    <div class="container">
        <div class="row white-panel">
            <div class="col-md-6 col-sm-7">
                <div class="single-product-image-inner">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <%
                            int i = 0;
                            while (img.next()) {
                                i++;
                        %>
                        <div role="tabpanel" class="tab-pane <%=i==1?"active":""%>" id="<%=img.getString("id")%>">
                            <a class="venobox" href="/public/customer/img/shop/<%= img.getString("img")%>"
                               data-gall="gallery" title="">
                                <img src="/public/customer/img/shop/images/<%= img.getString("img")%>" alt="">
                            </a>
                        </div>

                        <% } %>
                        <%--                                <div role="tabpanel" class="tab-pane" id="two">--%>
                        <%--                                    <a class="venobox" href="img/single-product/bg-2.jpg" data-gall="gallery" title="">--%>
                        <%--                                        <img src="img/single-product/bg-2.jpg" alt="">--%>
                        <%--                                    </a>--%>
                        <%--                                </div>--%>
                        <%--                                <div role="tabpanel" class="tab-pane" id="three">--%>
                        <%--                                    <a class="venobox" href="img/single-product/bg-3.jpg" data-gall="gallery" title="">--%>
                        <%--                                        <img src="img/single-product/bg-3.jpg" alt="">--%>
                        <%--                                    </a>--%>
                        <%--                                </div>--%>
                    </div>
                    <!-- Nav tabs -->
                    <ul class="product-tabs" role="tablist">
                        <%
                            img.beforeFirst();
                            i = 0;
                            while (img.next()) {
                                i++;
                        %>
                        <li role="presentation" class="<%=i==1?"active":""%>"><a href="#<%=img.getString("id")%>"
                                                                                 aria-controls="one" role="tab"
                                                                                 data-toggle="tab">
                            <img height="160" width="150" src="/public/customer/img/shop/images/<%= img.getString("img")%>"
                                 alt="">
                        </a></li>
                        <% } %>
                        <%--                                <li role="presentation"><a href="#two" aria-controls="two" role="tab" data-toggle="tab"><img src="img/single-product/2.jpg" alt=""></a></li>--%>
                        <%--                                <li role="presentation"><a href="#three" aria-controls="three" role="tab" data-toggle="tab"><img src="img/single-product/3.jpg" alt=""></a></li>--%>
                    </ul>
                </div>
            </div>
            <div class="col-md-6 col-sm-5">
                <div class="single-product-details ">
                    <h4><%= book.getString("title")%>
                    </h4>
                    <div class="star-rating" style="justify-content: left">
                        <div class="back-stars">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>

                            <div class="front-stars" style="width: <%= book.getInt("rating")%>%">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                            </div>
                        </div>
                    </div>
                    <% ResultSet author = (ResultSet) request.getAttribute("author");
                        author.first();
                    %>
                    <p><label style="padding-right: 5px">Tác giả: </label><%= author.getString("name")%>
                    </p>
                    <div class="availability">
                        <%--                                <span>In stock</span>--%>
                    </div>

                    <div class="single-product-price">
                        <h2><%= Util.formatCurrency(book.getString("price"))%>
                        </h2>
                    </div>
                    <div class="product-attributes clearfix">
                                <span class="pull-left" id="quantity-wanted-p">
									<span class="dec qtybutton">-</span>
									<input type="number" value="1" min="1" class="cart-plus-minus-box">
									<span class="inc qtybutton">+</span>	
								</span>
                        <span>
                                    <a class="cart-btn btn-default" onclick="addToCardSingle(<%=book.getInt("id")%>)">
                                        <i class="flaticon-shop"></i>
                                        Add to cart
                                    </a>
                               </span>
                    </div>
                    <div class="add-to-wishlist">
                        <a class="wish-btn" href="#">
                            <i class="fa fa-heart-o"></i>
                            ADD TO WISHLIST
                        </a>
                    </div>
                    <div class="single-product-categories">
                        <label>Categories:</label>
                        <% cate.first(); %>
                        <span><%= cate.getString("name")%></span>
                    </div>
                    <div class="social-share">
                        <label>Share: </label>
                        <ul class="social-share-icon">
                            <li><a href="#"><i class="flaticon-social"></i></a></li>
                            <li><a href="#"><i class="flaticon-social-1"></i></a></li>
                            <li><a href="#"><i class="flaticon-social-2"></i></a></li>
                        </ul>
                    </div>
                    <div id="product-comments-block-extra">
                        <ul class="comments-advices">
                            <li>
                                <a href="#" class="fa fa-edit">Write a review</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        <div style="padding-top: 50px" class="row">
            <div class="col-12">
                <h3>Giới thiệu sách: </h3>
                <div class="white-panel">
                    <p><%= book.getString("description")%>
                    </p>
                </div>

            </div>
        </div>
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous"
                src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v5.0"></script>
        <div class="commentfb row" id="comments">
            <div class="fb-comments" data-href="http://localhost:8080/single-product" data-numposts="5"></div>
        </div>
    </div>
</div>
<!-- Single Product Area End -->
<!-- Related Product Area Start -->
<div class="related-product-area">
    <h2 class="section-title">RELATED PRODUCTS</h2>
    <div class="container">
        <div class="row">
            <div class="related-product indicator-style">
                <%
                    ResultSet listBook = (ResultSet) request.getAttribute("listBook");
                    while (listBook.next()) {
                %>
                <div class="col-md-3">
                    <div class="single-banner" style="background: white">
                        <div class="product-wrapper">
                            <a href="<%=Util.fullPath("single-product?id=" +listBook.getString("id"))%>"
                               class="single-banner-image-wrapper">
                                <%--                                                <img alt="" src="public/customer/img/featured/1.jpg">--%>
                                <img alt="" src="/public/customer/img/shop/images/<%= listBook.getString(4)%>"
                                     style="margin-top: 30px">


                                <div class="price"><span><%=  Util.formatCurrency(listBook.getString("price"))%></span>
                                </div>
                            </a>
                            <div class="product-description">
                                <div class="functional-buttons">
                                    <a onclick="addToCard(<%=listBook.getInt("id")%>,1)"
                                       title="Add to Cart">
                                        <i class="fa fa-shopping-cart"></i>
                                    </a>
                                    <a
                                            title="Add to Wishlist">
                                        <i class="fa fa-heart-o"></i>
                                    </a>
                                    <a title="Quick view" data-toggle="modal"
                                       data-target="#preview<%= listBook.getInt(1)%>">
                                        <%--Khai báo dòng này sẽ mở 1 cái modal có id là previewid, ví dụ book có ìd là 10 thì data-tagert là preview10, tức là mở modal có là preview10--%>
                                        <i class="fa fa-compress"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="banner-bottom text-center" style="height: 150px;">
                            <div class="banner-bottom-title">
                                <a href="<%=Util.fullPath("single-product?id=" +listBook.getString("id"))%>"><%= listBook.getString(2)%>
                                </a>
                            </div>
                            <div class="star-rating">
                                <div class="back-stars">
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                    <i class="fa fa-star" aria-hidden="true"></i>

                                    <div class="front-stars" style="width: <%= listBook.getInt("rating")%>%">
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                        <i class="fa fa-star" aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="quickview-wrapper">
                    <!-- Modal -->
                    <div class="modal fade" id="preview<%= listBook.getInt(1)%>" tabindex="-1"
                         role="dialog">
                        <%--Tạo ra 1 modal có id là previewid để chứa thông tin book có id là id, modal này sẽ dc kích bởi data-tagert bên trên --%>
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                </div>
                                <div class="modal-body">
                                    <div class="modal-product">
                                        <div class="product-images">
                                            <div class="main-image images">
                                                <img alt=""
                                                     src="/public/customer/img/shop/images/<%= listBook.getString(4)%>">

                                            </div>
                                        </div>
                                        <div class="product-info">
                                            <h1><%= listBook.getString(2)%>
                                            </h1> <%--Gán title --%>
                                            <div class="price-box">
                                                <p class="s-price"><span class="special-price"><span
                                                        class="amount"><%=  Util.formatCurrency(listBook.getString("price"))%></span></span>
                                                </p> <%--Gán price--%>
                                            </div>
                                            <a href="<%=Util.fullPath("single-product?id=" +listBook.getString("id"))%>"
                                               class="see-all">See all
                                                features</a>
                                            <div class="quick-add-to-cart">
                                                <form method="post" class="cart">
                                                    <div class="numbers-row">
                                                        <input type="number" id="french-hens" min="1"
                                                               value="1">
                                                    </div>
                                                    <button class="single_add_to_cart_button"
                                                            type="submit"><a
                                                            href="<%= Util.fullPath("AddCart?id="+listBook.getInt(1))%>">Add
                                                        to cart</a>
                                                    </button>
                                                </form>
                                            </div>
                                            <div class="quick-desc">
                                                <%--Gán description ử đây --%>
                                            </div>
                                            <div class="social-sharing">
                                                <div class="widget widget_socialsharing_widget">
                                                    <h3 class="widget-title-modal">Share this
                                                        product</h3>
                                                    <ul class="social-icons">
                                                        <li><a target="_blank" title="Facebook" href="#"
                                                               class="facebook social-icon"><i
                                                                class="fa fa-facebook"></i></a></li>
                                                        <li><a target="_blank" title="Twitter" href="#"
                                                               class="twitter social-icon"><i
                                                                class="fa fa-twitter"></i></a></li>
                                                        <li><a target="_blank" title="Pinterest"
                                                               href="#" class="pinterest social-icon"><i
                                                                class="fa fa-pinterest"></i></a></li>
                                                        <li><a target="_blank" title="Google +" href="#"
                                                               class="gplus social-icon"><i
                                                                class="fa fa-google-plus"></i></a></li>
                                                        <li><a target="_blank" title="LinkedIn" href="#"
                                                               class="linkedin social-icon"><i
                                                                class="fa fa-linkedin"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div><!-- .product-info -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</div>
<!-- Related Product Area End -->
<!-- Footer Area Start -->
<jsp:include page="footer.jsp"/>
<!-- Footer Area End -->
<!-- all js here -->
<!-- jquery latest version -->
<jsp:include page="jquery.jsp"/>
<script>
    function addToCardSingle(id) {
        quantity = $('.cart-plus-minus-box').val();
        console.log(quantity);
        addToCard(id, quantity)
    }

    function changeCommentsUrl() {
        var comments = $('#comments');
        comments.html("");
        comments.html("<div class=\"fb-comments\" data-href=\"" + window.location.href + "\" data-numposts=\"5\"></div>");
    }

    changeCommentsUrl();

</script>
</body>
</html>