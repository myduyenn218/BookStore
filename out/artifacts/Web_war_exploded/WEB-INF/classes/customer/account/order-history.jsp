<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Model.Ordered" %>


<%
    ArrayList<Ordered> ordereds = (ArrayList<Ordered>) request.getAttribute("ordereds");
    if (ordereds.size() == 0) {
%>
<div class="content-right">
    <div class="row">
        <div class="col-xs-12">
            <h5 class="lbl-shopping-cart lbl-shopping-cart-gio-hang">Order history <span>(0 product)</span></h5>
            <div class="empty-cart">
                <span class="mascot-image"></span>
                <p class="message">You have no items in your order history.</p>
                <a href="/" class="btn btn-yellow">Continue shopping</a>
            </div>
        </div>
    </div>
</div>
<%} else {%>
<div class="content-right">
    <h1 class="have-margin">Đơn hàng của tôi</h1>
    <div class="dashboard-order have-margin">
        <table class="table-responsive-2 list">
            <thead>
            <tr>
                <th>
                    <span class="hidden-xs hidden-sm hidden-md">Order id</span>
                    <span class="hidden-lg">Code</span>
                </th>
                <th>Order date</th>
                <th>Products</th>
                <th>Total payent</th>
                <th>
                    <span class="hidden-xs hidden-sm hidden-md">Status</span>
                    <span class="hidden-lg">Status</span>
                </th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Ordered item : ordereds) { %>
            <tr>
                <td><a
                        href="#"><%=item.getId()%>
                </a>
                </td>
                <td><%=item.getDate()%>
                </td>
                <td><%=item.getProducts()%></td>
                <td><%=item.getTotalPrice()%> đ</td>
                <td>
                        <span class="order-status">
                            <%=item.getStatus()%></span>
                </td>
            </tr>
            <% }
            } %>

            </tbody>
        </table>
    </div>

    <div class="list-pager">

    </div>
</div>