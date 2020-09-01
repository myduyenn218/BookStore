<%@ page import="Util.Util" pageEncoding="utf-8" %>
<div class="content-right">
    <h1 class="have-margin">
        Tạo sổ địa chỉ
    </h1>
    <div class="account-address-form address-form">
        <form class="form-horizontal bv-form" role="form" action="<%=Util.fullPath("addAddress")%>"
              method="post" id="address-info" novalidate="novalidate">
            <div class="form-group row  has-feedback">
                <div class="form-group row  has-feedback">
                    <label for="full_name"
                           class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Họ và tên: </label>
                    <div class="col-lg-8 col-md-8">
                        <input name="full_name" type="tel" class="form-control" id="full_name"
                               placeholder="Nhập họ và tên" value="" data-bv-field="full_name">
                    </div>
                </div>

                <div class="form-group row  has-feedback">
                    <label for="telephone"
                           class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Số điện
                        thoại:</label>
                    <div class="col-lg-8 col-md-8">
                        <input name="telephone" type="tel" class="form-control" id="telephone"
                               placeholder="Nhập số điện thoại" value="" data-bv-field="telephone">
                    </div>
                </div>

                <div class="form-group row  has-feedback">
                    <label for="street"
                           class="col-lg-4 col-md-4 control-label visible-md-block visible-lg-block">Địa
                        chỉ:</label>
                    <div class="col-lg-8 col-md-8">
                    <textarea class="form-control" id="street" name="address" cols="30" rows="10"
                              placeholder="Nhập địa chỉ" data-bv-field="street"></textarea>
                    </div>
                </div>

                <div class="form-group row end">
                    <div class="col-lg-offset-4 col-md-offset-4 col-lg-8 col-md-8">
                        <button type="submit" class="btn btn-info btn-update">Cập nhật</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

