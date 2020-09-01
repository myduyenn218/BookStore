<%@ page import="Model.User" pageEncoding="utf-8" %>
<%@ page import="Util.Util" %>
<div class="content-right">
    <% User user = (User) request.getAttribute("user");
    %>
    <h1 class="have-margin">Account information</h1>
    <div class="account-profile register-form">
        <form class="content" action="<%= Util.fullPath("/account/edit?id="+user.getId()) %>" method="post" action=""
              id="edit-account">
            <div class="form-group">
                <label class="control-label" >Họ tên </label>
                <div class="input-wrap">
                    <input type="text" name="name" class="form-control" id="name"
                           value="<%= user.getUserName()%>">
                    <span class="help-block"></span>
                </div>
                <label class="control-label" >Email </label>
                <div class="input-wrap">
                    <input type="text" name="email" class="form-control" id="email"
                           value="<%= user.getEmail()%>" placeholder="email">
                    <span class="help-block"></span>
                </div>
            </div>
<%--            <div class="form-group">--%>
<%--                <label class="control-label" for="full_name">Full name </label>--%>
<%--                <div class="input-wrap">--%>
<%--                    <input type="text" name="fullname" class="form-control" id="full_name"--%>
<%--                           value="<%= user.getFullName()%>" placeholder="Full name">--%>
<%--                    <span class="help-block"></span>--%>
<%--                </div>--%>
<%--            </div>--%>
            <div class="form-group">
                <label class="control-label" for="full_name">Số điện thoại </label>
                <div class="input-wrap">
                    <input type="text" name="phone" class="form-control" id="phone"
                           value="<%= user.getPhone()%>">
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group gender-select-wrap" id="register_name">
                <label class="control-label">Giới tính
                </label>
                <div class="input-wrap">
                    <span class="help-block">Vui lòng chọn giới tính</span>
                    <div class="row">
                        <div class="col-xs-4">
                            <label>
                                <input type="radio" name="gender" value="Nam" id="gender_male"
                                       class="gender" <% if ((user.getGender()!=null) && (user.getGender().equals("Nam"))) {%>
                                       checked <% }  %>>
                                Nam
                            </label>
                        </div>
                        <div class="col-xs-4">
                            <label>
                                <input type="radio" name="gender" value="Nữ" id="gender_female"
                                       class="gender" <% if ((user.getGender()!=null) && user.getGender().equals("Nữ")) {%>
                                       checked <% }  %>>
                                Nữ
                            </label>
                        </div>

                    </div>

                </div>
            </div>


            <div class="form-group ">
                <label class="control-label no-lh" for="">
                    Ngày sinh
                    <span>(Lựa chọn)</span>
                </label>

                <div class="input-wrap">
                    <input class="form-control" type="date" name="dateofbirth" value="<%=user.getDateofbirth()%>">
                    <span class="help-block"></span>
                </div>
            </div>

            <div class="form-group">
                <div class="input-wrap margin">
                    <!-- <label for="change-password" class="icheck-wrap">
                        <input type="checkbox" id="change-password" class="icheck js-icheck" >
                        Thay đổi mật khẩu.
                    </label> -->
                    <label class="checkbox">
                        <input type="checkbox" id="is_change_pass" name="is_change_pass" style="position: relative;
											margin-left: 0px;">
                        Thay đổi mật khẩu
                    </label>
                </div>
            </div>
            <div class="password-group" id="chagne-pass-gr">
                <div class="form-group">
                    <label class="control-label" for="old_password">Mật khẩu cũ</label>
                    <div class="input-wrap">
                        <input type="password" name="old_password" class="form-control"
                               id="old_password" value="" autocomplete="off"
                               placeholder="Nhập mật khẩu cũ">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="new_password">Mật khẩu mới</label>
                    <div class="input-wrap">
                        <input type="password" name="new_password" class="form-control"
                               id="new_password" value="" autocomplete="off"
                               placeholder="Mật khẩu từ 6 đến 32 ký tự">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label" for="re_new_password">Nhập lại mật khẩu</label>
                    <div class="input-wrap">
                        <input type="password" name="re_new_password" class="form-control"
                               id="re_new_password" value="" autocomplete="off"
                               placeholder="Nhập lại mật khẩu mới">
                        <span class="help-block"></span>
                    </div>
                </div>

            </div>
            <div class="form-group">
                <div class="input-wrap margin">
                    <input type="hidden" name="customer_birthdate" value="1998-11-30">
                    <button type="submit" class="btn btn-info btn-block btn-update">Cập nhật</button>
                </div>
            </div>
        </form>
    </div>
</div>