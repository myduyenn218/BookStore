<!doctype html>
<html class="no-js" lang="">
    <head>
        <title>WishList || Witter Multipage Responsive Template</title>
        <jsp:include page="head.jsp"/>
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
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
					       <h2>Wishlist</h2> 
					       <ul class="breadcrumbs-list">
						        <li>
						            <a title="Return to Home" href="../../index.jsp">Home</a>
						        </li>
						        <li>Wishlist</li>
						    </ul>
					    </div>
					</div>
				</div>
			</div>
		</div> 
		<!-- Breadcrumbs Area Start --> 
        <!-- Shop Area Start -->
        <div class="shopping-area section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-3 col-xs-12">
                        <div class="shop-widget">
                            <div class="shop-widget-top">
                                <aside class="widget widget-categories">
                                    <h2 class="sidebar-title text-center">CATEGORY</h2>
                                    <ul class="sidebar-menu">
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LEARNING                                          
                                                <span>(5)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LIGHTING                                            
                                                <span>(8)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                              <i class="fa fa-angle-double-right"></i>
                                               LIVING ROOMS
                                                <span>(4)</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                               <i class="fa fa-angle-double-right"></i>
                                                LAMP                                           
                                                <span>(7)</span>
                                            </a>
                                        </li>
                                    </ul>
                                </aside> 
                                <aside class="widget shop-filter">
                                    <h2 class="sidebar-title text-center">PRICE SLIDER</h2>
                                    <div class="info-widget">
                                        <div class="price-filter">
                                            <div id="slider-range"></div>
                                            <div class="price-slider-amount">
                                                <input type="text" id="amount" name="price"  placeholder="Add Your Price" />
                                                <div class="widget-buttom">
                                                    <input type="submit"  value="Filter"/>  
                                                    <input type="reset" value="CLEAR" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </aside>                            
                            </div>
                            <div class="shop-widget-bottom">
                                <aside class="widget widget-tag">
                                    <h2 class="sidebar-title">POPULAR TAG</h2>
                                    <ul class="tag-list">
                                        <li>
                                            <a href="#">e-book</a>
                                        </li>
                                        <li>
                                            <a href="#">writer</a>
                                        </li>
                                        <li>
                                            <a href="#">book’s</a>
                                        </li>
                                        <li>
                                            <a href="#">eassy</a>
                                        </li>
                                        <li>
                                            <a href="#">nice</a>
                                        </li>
                                        <li>
                                            <a href="#">author</a>
                                        </li>
                                    </ul>
                                </aside>
                                <aside class="widget widget-seller">
                                    <h2 class="sidebar-title">TOP SELLERS</h2>
                                    <div class="single-seller">
                                        <div class="seller-img">
                                            <img src="img/shop/1.jpg" alt="" />
                                        </div>
                                        <div class="seller-details">
                                            <a href="shop.jsp"><h5>Book’s</h5></a>
                                            <h5>$ 50.00</h5>
                                            <ul>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="single-seller">
                                        <div class="seller-img">
                                            <img src="img/shop/2.jpg" alt="" />
                                        </div>
                                        <div class="seller-details">
                                            <a href=""><h5>Book’s</h5></a>
                                            <h5>$ 50.00</h5>
                                            <ul>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                                <li><i class="fa fa-star icolor"></i></li>
                                            </ul>
                                        </div>
                                    </div>
                                </aside>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-9 col-xs-12">
                        <div class="wishlist-right-area table-responsive">
                            <table class="wish-list-table">
                                <thead>
                                    <tr>
                                        <th class="t-product-name">Products</th>
                                        <th class="product-details-comment">Product Details & Comment</th>
                                        <th class="product-price-cart">Add To Cart</th>
                                        <th class="w-product-remove">Remove</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="img/wishlist/1.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="product-details">
                                            <h4>People of the book</h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
                                            <textarea placeholder="Please Enter Your Comment"></textarea>
                                        </td>
                                        <td class="product-cart">
                                            <div class="product-cart-details">
                                                <span>$ 200.00</span>
                                                <input type="number" value="1">
                                                <input type="submit" value="ADD TO CART">
                                            </div>
                                            <p>
                                                <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="img/wishlist/2.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="product-details">
                                            <h4>The historian</h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
                                            <textarea placeholder="Please Enter Your Comment"></textarea>
                                        </td>
                                        <td class="product-cart">
                                            <div class="product-cart-details">
                                                <span>$ 200.00</span>
                                                <input type="number" value="1">
                                                <input type="submit" value="ADD TO CART">
                                            </div>
                                            <p>
                                                <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="flaticon-delete"></i>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="product-image">
                                            <a href="#">
                                                <img src="img/wishlist/3.jpg" alt="">
                                            </a>
                                        </td>
                                        <td class="product-details">
                                            <h4>Consequences</h4>
                                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </p>
                                            <textarea placeholder="Please Enter Your Comment"></textarea>
                                        </td>
                                        <td class="product-cart">
                                            <div class="product-cart-details">
                                                <span>$ 200.00</span>
                                                <input type="number" value="1">
                                                <input type="submit" value="ADD TO CART">
                                            </div>
                                            <p>
                                                <a href="#">Edit</a>
                                            </p>
                                        </td>
                                        <td class="product-remove">
                                            <a href="#">
                                                <i class="fa fa-trash-o"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="wishlist-bottom-link">
                            <a class="wishlist-single-link" href="../../index.jsp">
                                <i class="fa fa-angle-double-left"></i>
                                Back
                            </a>
                            <div class="shopingcart-bottom-area wishlist-bottom-area pull-right">
                                <a href="#" class="right-shoping-cart">SHARE WISHLIST</a>
                                <a href="#" class="right-shoping-cart">ADD ALL TO CART</a>
                                <a href="#" class="right-shoping-cart">UPDATE WISHLIST</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Shop Area End -->
		<!-- Footer Area Start -->
        <jsp:include page="footer.jsp"/>
		<!-- Footer Area End -->
		<!-- all js here -->
		<!-- jquery latest version -->
        <jsp:include page="jquery.jsp"/>
    </body>
</html>