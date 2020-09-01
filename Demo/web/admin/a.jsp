<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Order Page - Admin</title>

    <jsp:include page="head.jsp"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/public/admin/css/table.css">
</head>
<body id="reportsPage">
<jsp:include page="header.jsp"/>

<table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <button class="dt-button btn btn-primary" tabindex="0" aria-controls="product"
            type="button" style="margin-right: 8%;margin-top: 3.4%; float: right">
        <a href="<%=Util.fullPath("admin/orders/add")%>" style="color: white; text-decoration: none;">New orders</a>
    </button>
    <thead>
    <tr>
        <th class="th-sm">STT
        </th>
        <th class="th-sm">CUSTOMER
        </th>
        <th class="th-sm">ORDERDATE
        </th>
        <th class="th-sm">SUBTOTAL
        </th>
        <th class="th-sm">SHIPPING
        </th>
        <th class="th-sm">TOTAL
        </th>
        <th class="th-sm">STATUS
        </th>
        <th class="th-sm">
        </th>
    </tr>
    </thead>
    <tbody>
    <%
        ResultSet orders = (ResultSet) request.getAttribute("orders");
//        ResultSet customer = (ResultSet) request.getAttribute("customer");
        int stt = 0;
        while (orders.next()) {
            stt++;
    %>
    <tr>
        <td scope="row" class="text-center"><%= stt%>
        </td>
        <td>
            <%--            <%--%>
            <%--                ResultSet customer = (ResultSet) request.getAttribute("customer");--%>
            <%--                while (customer.next()) {--%>
            <%--            %>--%>
            <%= orders.getString("id_customer")%>
            <%--            <% } %>--%>
        </td>
        <td><%= orders.getString("orderDate")%>
        </td>
        <td><%= orders.getString("subtotal")%>
        </td>
        <td><%= orders.getString("shipping")%>
        </td>
        <td><%= orders.getString("total")%>
        </td>
        <td><%= orders.getString("statusID")%>
        </td>
        <td style="text-align: center; width: 100px">
            <a class="delete"
               href="<%= Util.fullPath("admin/orders/edit?id=" + orders.getString("id")) %>"
               class="tm-product-delete-link">
                <i class="fas fa-edit"></i>
            </a>

            <a class="delete"
               href="<%= Util.fullPath("admin/orders/delete?id=" + orders.getString("id")) %>"
               class="tm-product-delete-link">
                <i class="far fa-trash-alt tm-product-delete-icon"></i>
            </a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>

<jsp:include page="footer.jsp"/>


<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->

<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="/public/admin/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>


<script>
    $(function () {
        $(".tm-product-name").on("click", function () {
            window.location.href = "edit-producer.jsp";
        });
    });

    $(document).ready(function () {
        $('#product').DataTable({
            "columnDefs": [

                {"orderable": false, "targets": [5]},
                {"width": "0%", "targets": 5},
                {"width": "50%", "targets": 1},
                {"width": "7%", "targets": 0}
            ],
            dom: 'Bfrtip',
            buttons: [
                {
                    text: 'New product',
                    className: "btn btn-primary",
                    action: function () {
                        window.location.href = "/admin/producer/add";
                    }
                }
            ]


        });
        $('#category').DataTable({
            "bPaginate": false,
            "bLengthChange": false,
            "bFilter": true,
            "bInfo": false,
            "bAutoWidth": false,
            "columnDefs": [
                {"orderable": false, "targets": [1]},
                {"width": "5%", "targets": 1}
            ],
            dom: 'Bfrtip',
            buttons: [
                {
                    text: 'Create',
                    className: "btn btn-secondary",
                    action: function (e, dt, node, config) {
                        // alert('Button activated');
                    }
                }
            ]
        });
    });


</script>
<script>
    $(document).ready(function () {
        $('#dtBasicExample').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>

</body>
</html>