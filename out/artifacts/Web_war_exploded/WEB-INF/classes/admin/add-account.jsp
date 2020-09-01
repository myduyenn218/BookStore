<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Account</title>
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
                        <h2 class="tm-block-title d-inline-block">Add Account</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-9 col-lg-6 col-md-12" style="margin: auto">
                        <form action="<%= Util.fullPath("/admin/account/add") %>" method="POST" onsubmit="onFormSubmit"
                              class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                        for="name"
                                >Name<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="email"
                                >Email<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="email"
                                        name="email"
                                        type="email"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="fullname"
                                >Full name<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="fullname"
                                        name="fullname"
                                        type="text"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                >Gender<a style="color: red"> *</a></label
                                >
                                <input type="hidden" name="gender" id="gender">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectgender"
                                        required>
                                    <option
                                            data-cc="Nam">Male
                                    </option>
                                    <option
                                            data-cc="Nu">Female
                                    </option>
                                </select>
                            </div>

<%--                            <div class="form-group mb-3">--%>
<%--                                <label--%>
<%--                                >Gender<a style="color: red"> *</a></label>--%>
<%--                                <select name="gender"--%>
<%--                                        style="display: block;width: 100%;height: calc(2.25rem + 2px);padding: .375rem .75rem;font-size: 1rem;line-height: 1.5;color: #495057;background-color: #fff;background-clip: padding-box;border: 1px solid #ced4da;border-radius: .25rem;transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;">--%>
<%--                                    <option value="Nam">Male--%>
<%--                                    </option>--%>
<%--                                    <option value="Nu">Female--%>
<%--                                    </option>--%>
<%--                                </select>--%>
<%--                            </div>--%>

                            <div class="form-group mb-3">
                                <label
                                        for="pass"
                                >Pass<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="pass"
                                        name="pass"
                                        type="password"
                                        class="form-control novalidate"
                                        required
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="address"
                                >Address
                                </label>
                                <input
                                        id="address"
                                        name="address"
                                        type="text"
                                        class="form-control novalidate"
                                <%--                                        required--%>
                                />
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="phone"
                                >Phone
                                </label>
                                <input
                                        id="phone"
                                        name="phone"
                                        type="tel"
                                        class="form-control novalidate"
                                <%--                                        required--%>
                                />
                            </div>

                            <div class="form-group mb-3">
                                <label
                                >Active<a style="color: red"> *</a></label
                                >
                                <input type="hidden" name="is_active" id="is_active">
                                <select
                                        class="custom-select tm-select-accounts"
                                        id="selectis_active"
                                        required>
                                    <option
                                            data-cc="1">Admin
                                    </option>
                                    <option
                                            data-cc="0">Customer
                                    </option>
                                </select>
                            </div>

                    </div>
                    <div class="col-9" style="margin: auto">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Account Now</button>
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
<script>
    function selectFileWithCKFinder(elementId) {
        CKFinder.modal({
            chooseFiles: true,
            displayFoldersPanel: false,
            width: 800,
            height: 600,
            onInit: function (finder) {
                finder.on('files:choose', function (evt) {
                    var file = evt.data.files.first();
                    var output = document.getElementById(elementId);
                    output.value = file.getUrl();
                });

                finder.on('file:choose:resizedImage', function (evt) {
                    var output = document.getElementById(elementId);
                    output.value = evt.data.resizedUrl;
                });
            }
        });
    }

    var editor

    function onFormSubmit() {
        if (editor) {
            editor.updateSourceElement();
            console.log(editor.getData());
        } else {
            console.log("NULL");
        }
    }

    //IDE bị ngu, không nhận cú pháp => của ES6, nên phải dùng cú pháp này
    //Nếu không bấm format nó sẽ nhảy ngu
    $(function () {
        window.jQuery = $;
        // $("#expire_date").datepicker();
        ClassicEditor
            .create(document.querySelector('#editor'))
            .then(function (value) {
                editor = value;
            })
            .catch(function (reason) {
                console.log(reason);
            })
        ;

        $('#selectcustomer').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#id_customer').val(el.data('cc'));
            });
        $('#selectis_active').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#is_active').val(el.data('cc'));
            });
        $('#selectgender').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#gender').val(el.data('cc'));
            });
    });

</script>
</body>
</html>
