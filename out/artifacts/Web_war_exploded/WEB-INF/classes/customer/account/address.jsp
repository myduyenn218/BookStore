<%@ page import="Util.Util" pageEncoding="utf-8" %>
<%@ page import="Model.User" %>
<div class="content-right">
    <h1 class="have-margin">
        Your address
    </h1>


    <% User user = (User) request.getSession().getAttribute("user");
        if (user.getAddress() == "") { %>
    <a class="add-address" href="<%= Util.fullPath("account/add-address")%>"><i class="add"></i>
        <span>Add new address</span></a>
    <% } else {%>
    <% if (request.getSession().getAttribute("mess") != null) {%>
    <div class="alert alert-success">
        <%=request.getSession().getAttribute("mess")%>
    </div>
    <%
            request.getSession().removeAttribute("mess");
        }
    %>
    <div class="dashboard-address">
        <div class="panel panel-default item is-default">
            <div class="panel-body">
                <p class="name"><%=user.getFullName()%><span class="default">Default address</span>
                </p>
                <p class="address"><span>Address:</span> <%=user.getAddress()%>
                </p>
                <p class="phone"><span>Phone number:</span> <%=user.getPhone()%>
                </p>
                <p class="action">
                    <a class="btn btn-default btn-custom1 js-edit edit-customer-address "
                       href="<%= Util.fullPath("account/add-address")%>">Edit</a>
                </p>


            </div>
        </div>
    </div>
    <%}%>
</div>