<%@ page import="java.sql.ResultSet" %>
<%@ page import="Util.Util" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Producer</title>
    <jsp:include page="head.jsp"/>

    <link href="/public/admin/css/jquery-editable-select.min.css" rel="stylesheet">
    <script src="https://cdn.ckeditor.com/ckeditor5/16.0.0/classic/ckeditor.js"></script>
</head>

<body>
<jsp:include page="header.jsp"/>

<div class="container tm-mt-big tm-mb-big">
    <div class="row">
        <div class="col-xl-6 col-lg-10 col-md-12 col-sm-12 mx-auto">
            <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                <div class="row">
                    <div class="col-12">
                        <h2 class="tm-block-title d-inline-block">Add Producer</h2>
                    </div>
                </div>
                <div class="row tm-edit-product-row">
                    <div class="col-xl-12 col-lg-6 col-md-12">
                        <form action="<%= Util.fullPath("admin/producer/add") %>" method="POST" onsubmit="onFormSubmit"
                              class="tm-edit-product-form">
                            <div class="form-group mb-3">
                                <label
                                        for="name">Producer Name<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="name"
                                        name="name"
                                        type="text"
                                        class="form-control novalidate"
                                        required/>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="name">Address<a style="color: red"> *</a>
                                </label>
                                <input
                                        id="address"
                                        name="address"
                                        type="text"
                                        class="form-control novalidate"
                                        required/>
                            </div>
                            <div class="form-group mb-3">
                                <label
                                        for="contact"
                                >Contact<a style="color: red"> *</a></label
                                >
                                <input
                                        id="contact"
                                        name="contact"
                                        type="email"
                                        class="form-control novalidate"
                                        required/>
                            </div>

                    </div>
                    <div class="col-12">
                        <button type="submit" class="btn btn-primary btn-block text-uppercase" style="margin-top: 30px">Add Producer Now</button>
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

    $(function () {
        window.jQuery = $;
        // $("#expire_date").datepicker();
        ClassicEditor
            .create(document.querySelector('#editor'))
            .then(e = > editor = e
    )
    .
        catch(error = > {console.log(error)}
    )
        ;

        $('#selectCetagories').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#category').val(el.data('cc'));
            });
        $('#selectPublisher').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#publisher').val(el.data('cc'));
            });
        $('#selectAuthor').editableSelect()
            .on('select.editable-select', function (e, el) {
                // el is the selected item "option"
                $('#author').val(el.data('cc'));
            });
    });

</script>
</body>
</html>
