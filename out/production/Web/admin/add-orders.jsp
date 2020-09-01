<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Orders</title>
    <jsp:include page="head.jsp"/>

    <link href="/public/admin/css/jquery-editable-select.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-7 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12" style="margin-left: 13%">
                        <h2 class="tm-block-title d-inline-block">Add Orders</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-9 col-lg-6 col-md-12" style="margin: auto">
                        <form action="<%= Util.fullPath("admin/orders/add") %>" method="POST" onsubmit="onFormSubmit"
                              class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                >Customer<a style="color: red"> *</a></label>
                                <input type="hidden" name="id_customer" id="id_customer">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectcustomer"
                                        required>
                                    <%
                                        ResultSet customer = (ResultSet) request.getAttribute("customer");
                                        while (customer.next()) {
                                    %>
                                    <option data-cc="<%= customer.getString("id")%>"><%= customer.getString("fullname")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="form-group mb-3">
                                <label
                                        for="subtotal"
                                >Subtotal<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="subtotal"
                                        name="subtotal"
                                        type="tel"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="shipping"
                                >Shipping<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="shipping"
                                        name="shipping"
                                        type="text"
                                        class="form-control novalidate"
                                                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="total"
                                >Total<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="total"
                                        name="total"
                                        type="text"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                >Statuses<a style="color: red"> *</a></label
                                >
                                <input type="hidden" name="statusID" id="statusID">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectstatusID"
                                        required>
                                    <%
                                        ResultSet statuses = (ResultSet) request.getAttribute("statuses");
                                        while (statuses.next()) {
                                    %>
                                    <option data-cc="<%= statuses.getString("id")%>"><%= statuses.getString("status")%>
                                    </option>
                                    <% } %>
                                </select>
                            </div>
                    </div>
                    <div class="col-9" style="margin: auto">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Orders Now</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp"/>

<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="/public/admin/jquery-ui-datepicker/jquery-ui.min.js"></script>
<!-- https://jqueryui.com/download/ -->
<script src="/public/admin/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="/public/admin/js/jquery-editable-select.min.js"></script>

</body>
</html>
