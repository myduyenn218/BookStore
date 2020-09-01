<%@ page import="Util.Util" %>
<%@ page pageEncoding="utf-8" %>
<%@ page import="java.sql.ResultSet" %>
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
<div class="" id="home" style="background: #f5f5f5">

    <jsp:include page="header.jsp"/>
    <div class="container">
        <div class="row">
            <div class="col">
                <p class="mt-5 mb-5">Welcome back, <b>Admin</b></p>
            </div>
        </div>
        <!-- row -->
        <div class="row tm-content-row">
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Doanh thu theo tháng</h2>
                    <canvas id="revenueChart"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block">
                    <h2 class="tm-block-title">Performance</h2>
                    <canvas id="barChart"></canvas>
                </div>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller">
                    <h2 class="tm-block-title">Storage Information</h2>
                    <div id="pieChartContainer">
                        <canvas id="pieChart" class="chartjs-render-monitor" width="200" height="200"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-12 tm-block-col">
                <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                    <h2 class="tm-block-title">Orders List</h2>
                    <table id="dtBasicExample" class="table table-striped table-bordered" cellspacing="0" width="100%">
                        <button class="dt-button btn btn-primary" tabindex="0" aria-controls="product"
                                type="button" style="margin-right: 100px;margin-top: 17px; float: right">
                            <a href="<%=Util.fullPath("admin/orders/add")%>"
                               style="color: white; text-decoration: none;">New orders</a>
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
                            int stt = 0;
                            while (orders.next()) {
                                stt++;
                        %>
                        <tr>
                            <td scope="row" class="text-center"><%= stt%>
                            </td>
                            <td>
                                <%= orders.getString(2)%>
                            </td>
                            <td>
                                <%= orders.getString(3)%>
                            </td>
                            <td>
                                <%= orders.getString(4)%>
                            </td>
                            <td>
                                <%= orders.getString(5)%>
                            </td>
                            <td>
                                <%= orders.getString(6)%>
                            </td>
                            <td>
                                <%= orders.getString(7)%>
                            </td>
                            <td style="text-align: center; width: 100px">
                                <a class="delete"
                                   href="<%= Util.fullPath("admin/orders/edit?id=" + orders.getString(1)) %>"
                                   class="tm-product-delete-link">
                                    <i class="fas fa-edit"></i>
                                </a>

                                <a class="delete"
                                   href="<%= Util.fullPath("admin/orders/delete?id=" + orders.getString(1)) %>"
                                   class="tm-product-delete-link">
                                    <i class="far fa-trash-alt tm-product-delete-icon"></i>
                                </a>
                            </td>
                        </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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


<script src="/public/admin/js/moment.min.js"></script>
<!-- https://momentjs.com/ -->
<script src="/public/admin/js/Chart.min.js"></script>
<!-- http://www.chartjs.org/docs/latest/ -->
<script src="/public/admin/js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="/public/admin/js/tooplate-scripts.js"></script>
<script>
    function drawRevenueChart(month, revenue) {

        var revenueChart = new Chart(document.getElementById('revenueChart'), {
            type: 'bar',
            data: {
                labels: month,
                datasets: [{
                    label: 'Doanh thu',
                    data: revenue,
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {

                            beginAtZero: true,
                        },
                        scaleLabel: {
                            display: true,
                            labelString: "Lợi nhuận (VNĐ)"
                        }
                    }],
                    xAxes: [{
                        ticks: {

                            sampleSize: 12,
                            autoSkip:false,
                            callback: function(value, index, values) {
                                return 'Tháng ' + value;
                            }
                        }
                    }]
                }
            }
        });
    }

    function loadRevenueChart(year) {
        var url = year ? "/admin/orders/statistic?type=revenue&year=" + year : "/admin/orders/statistic?type=revenue";

        $.getJSON(url, function (data) {
            console.log(data);
            drawRevenueChart(data.map.month.myArrayList, data.map.revenue.myArrayList);
        });
    }

    $(function () {
        loadRevenueChart(null);
    });
</script>
</body>
</html>