<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Product" %>

<div class="content-right">
    <% ArrayList<Product> wishlist = (ArrayList<Product>) request.getAttribute("wishlist");
        if (wishlist.size() != 0) {
    %>
    <h1 class="have-margin">Your wish list (<%=wishlist.size()%>) </h1>
    <div class="account-wishlist list-item " data-impress-list-title="Wishlist">
        <form id="wishlist" method="post">
            <% for (Product item : wishlist) {%>
            <div class="item wishlist-item" data-id="<%=item.getId()%>" data-price=""
                 data-title="" data-brand=""
                 data-category="">
                <div class="item-col-1">
                    <p class="image">
                        <a href="<%=Util.fullPath("single-product?id=" +item.getId())%>">
                            <img class="img-responsive"
                                 src="/public/customer/img/shop/images/<%=item.getImg()%>"
                                 width="130" height="182" alt="sample text">
                        </a>
                    </p>
                </div>
                <div class="item-col-2">
                    <div class="infomation">
                        <p class="title">
                            <a href="href="<%=Util.fullPath("single-product?id=" + item.getId())%>">
                            <%=item.getTitle()%> </a>
                        </p>
                        <p class="author"><%=item.getAuthor()%>
                        </p>
                        <p class="cover-books"><%=item.getType()%>
                        </p>
                        <p class="rating">
                        <div class="back-stars">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <div class="front-stars" style="width: <%= item.getRating()%>%">
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                                <i class="fa fa-star" aria-hidden="true"></i>
                            </div>
                        </div>
                        </p>
                        <%--                        <div class="description">--%>
                        <%--                            <%=item.getDescription()%>--%>
                        <%--                        </div>--%>
                    </div>
                </div>

                <div class="item-col-3">
                    <p class="price-sale">
                        <%=Util.showPrice(item.getPrice())%>đ<br>
                        <%--                        <span>399.000đ</span>--%>
                        <%--                        <span class="sale-tag">-25%</span>--%>
                    </p>
                    <p class="action">
                        <button type="button" class="btn btn-large btn-default btn-addtocart wishlist-add-to-cart"
                                data-product-id="<%=item.getId()%>" data-product-price="299000" data-item-id='7643960'
                                onclick="addToCardFromWishlist(<%=item.getId()%>)">
                            <span class="hidden-lg hidden-md"><i class="fa fa-shopping-cart"></i></span>
                            <span class="hidden-xs hidden-sm">Add to shopping cart</span>
                        </button>
                    </p>
                    <button type="button" class="btn btn-default btn-custom1 delete-wishlist-item"
                            data-item-id="" onclick="removeWishlistItem(<%=item.getId()%>)">
                        <img src="https://salt.tikicdn.com/desktop/img/account/cross.png" alt="">
                    </button>
                </div>
            </div>
            <% }%>
        </form>
    </div>
    <div class="list-pager">
    </div>
    <%
    } else {%>
    <div class="row">
        <div class="col-xs-12">
            <h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Wishlist <span>(0 product)</span></h5>
            <div class="empty-cart">
                <span class="mascot-image"></span>
                <p class="message">You have no items in your wishlish.</p>
                <a href="/" class="btn btn-yellow">Continue shopping</a>
            </div>
        </div>
    </div>
    <%}%>
</div>

<script>

</script>