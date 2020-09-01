<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Accounts - Product Admin Template</title>
    <jsp:include page="head.jsp"/>
    <link rel="stylesheet" href="/public/admin/css/table.css">
</head>

<body id="reportsPage">
<div class="" id="home">
    <jsp:include page="header.jsp"/>

    <div class="container mt-5"  style="min-height: 500px">

        <table id="user" class="table table-striped table-bordered table-sm">

            <thead>
            <tr>
                <th>#</th>
                <th>ID</th>
                <th>Username</th>
                <th>FullName</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Gender</th>
                <th>Address</th>
<%--                <th>DOB</th>--%>

                <th>Role</th>
                <th></th>
                <th>Actions</th>
            </tr>
            </thead>


            <tbody>
            <%
                ResultSet user = (ResultSet) request.getAttribute("user");
//
                int stt = 0;
                while (user.next()) {
                    stt++;

            %>
            <tr>
                <td class="text-center"><%= stt%></td>
                <td class="tm-product-name">
                    <a href="#"><%= user.getString("id")%>
                    </a>
                </td>
                <td class="tm-product-name">
                    <a href="#"><%= user.getString("name")%>
                    </a>
                </td>


                <td class="text-center"><%= user.getString("fullname")%>
                </td>
                <td class="text-center"><%= user.getString("email")%>
                </td>
                <td class="text-center"><%= user.getString("phone")%>
                </td>

                <td class="text-center">
                    <%= user.getString("gender")%>
                </td>
                <td class="text-center">
                    <%= user.getString("address")%>
                </td>


                <td class="text-center"><%= user.getString("idgroup").equals("1")? "User" : "Admin"%> </td>

                <td class="text-center">
                    <% if(user.getString("is_active").equals("1")) {%>
                    <i class="fa fa-check" style="color: #2196F3" >
                    </i>
                    <% } else {%>
                    <i class="fa fa-minus-circle" style="color: red !important;" >
                    </i>
                    <% } %>
                </td>
                <td id="" class="text-center">

                    <a href="#" class="edit"><i
                            class="fa fa-pencil"
                            data-toggle="tooltip" title="Edit"></i></a>
                    <a href="#" class="delete" ><i
                            class="fa fa-trash"
                            data-toggle="tooltip"
                            title="Delete"></i></a>
                </td>
            </tr>
            <% } %>

            </tbody>
        </table>
    </div>

    <jsp:include page="footer.jsp"/>
</div>


<script src="/public/admin/js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->

<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="/public/admin/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
<script>

    $(document).ready(function () {
        $('#user').DataTable({
            "columnDefs": [

                {"orderable": false, "targets": [5]},
                {"width": "0%", "targets": 5},
                {"width": "7%", "targets": 0}
            ],
            dom: 'Blfrtip',
            buttons: [
                {
                    text: 'New product',
                    className: "btn btn-primary",
                    action: function () {
                        window.location.href = "/admin/product/add";
                    }
                }
            ]


        });
    });


</script>
</body>
</html>
