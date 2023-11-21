<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | DataTables</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../../resources/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="../../../resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../../../resources/dist/css/adminlte.min.css">
    <style>
        #addFormContainer {

            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 15%;
            padding-left: 15%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white;
            /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }
    </style>
    <style>
        #addFormContainer1 {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            padding-top: 15%;
            padding-left: 15%;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm1 {
            background-color: white;
            width: 70%;
            height: 300px;
            /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px;
            /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            /* Đổ bóng cho biểu mẫu */
        }

        #addForm1 button[type="submit"] {
            background-color: #007BFF;
            /* Màu nền của nút */
            color: white;
            /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm1 button[type="submit"]:hover {
            background-color: #0056b3;
            /* Màu nền khi di chuột vào */
        }
    </style>
</head>

<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->


    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <button class="btn btn-primary" id="addButton" onclick="clickThem()">Thêm</button>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="example1" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Tên</th>
                                        <th>Hình ảnh</th>
                                        <th>Trạng thái</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Mã</th>
                                        <th>Tên</th>
                                        <th>Hình ảnh</th>
                                        <th>Trạng thái</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <div id="addFormContainer" style="display: none;">
            <div class="container-fluid">
                <div class="container" id="addForm">
                    <h3 style="text-align: center">LOẠI ÁO</h3>
                    <input type="hidden" name="id" value="${item.id}">
                    <div class="form-group">
                        <label for="formGroupExampleInput">Mã</label>
                        <input type="text" name="ma" value="${item.ma}" class="form-control"
                               id="formGroupExampleInput" placeholder="Mã">
                        <span id="errorMa" class="text-danger"></span>
                    </div>
                    <div class="form-group">
                        <label for="formGroupExampleInput2">Tên</label>
                        <input type="text" name="ten" value="${item.ten}" class="form-control"
                               id="formGroupExampleInput2" placeholder="Tên ">
                        <span id="errorTen" class="text-danger"></span>
                    </div>

                    <button class="btn btn-primary" formaction="/admin/loai_ao/add" type="submit"
                            onclick="addProduct()" id="addButton1">Thêm Mới
                    </button>

                    </button>
                </div>
            </div>
        </div>
        <div id="addFormContainer1" style="display: none;">
            <!-- Shop Detail Start -->
            <div class="container-fluid pb-5">
                <div class="row px-xl-5">
                    <div class="col-lg-5 mb-30">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner bg-light">
                                <c:forEach items="${anhs}" var="list" varStatus="status">
                                    <div class="carousel-item ${status.index == 0 ? 'active' : ''}">
                                        <img class="" style="width: 100%; height: 450px" src="/images/${list.ten_url}" alt="Image">
                                    </div>
                                </c:forEach>
                            </div>
                            <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                                <i class="fa fa-2x fa-angle-left text-dark"></i>
                            </a>
                            <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                                <i class="fa fa-2x fa-angle-right text-dark"></i>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-7 h-auto mb-30">
                        <div class="h-100 bg-light p-30">
                            <h3>${ao.ten}</h3>
                            <c:choose>
                                <c:when test="${giamgia != 2}">
                                    <div class="gia">
                                        <p>
                                            <del><fmt:formatNumber value="${ao.giaBan}" type="currency" currencySymbol="VNĐ"/></del>
                                            <strong><fmt:formatNumber value="${ao.giaBan * (100 - giamgia) / 100}" type="currency"
                                                                      currencySymbol="VNĐ"/></strong>
                                        </p>
                                    </div>
                                </c:when>
                                <c:when test="${giamgia == 2}">
                                    <div class="gia">
                                        <p>
                                            <strong><fmt:formatNumber value="${ao.giaBan}" type="currency"
                                                                      currencySymbol="VNĐ"/></strong>
                                        </p>
                                    </div>
                                </c:when>
                            </c:choose>
                            <div><h6><strong>${slAoDaBan}</strong> sản phẩm đã bán</h6></div>
                            <div id="soLuongTonStr"></div>
                            <input type="hidden" id="soLuongTon">
                            <form method="post">
                                <input type="hidden" name="idAo" value="${ao.id}" id="idAo">
                                <div class="d-flex mb-4">
                                    <strong class="text-dark mr-3">Colors:</strong>
                                    <c:forEach items="${mauSacs}" var="list" varStatus="vTri">
                                        <div class="custom-control custom-radio custom-control-inline">
                                            <input type="radio" id="radio${vTri.index + 1}" name="mauSac" value="${list.id}">
                                            <label class="radio-label" for="radio${vTri.index + 1}"><span
                                                    style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                                <%--                                <input type="radio" class="custom-control-input" id="color-${vTri.index + 1}" name="mauSac" value="${list.id}">--%>
                                                <%--                                <label class="custom-control-label" for="color-${vTri.index + 1}">${list.ten}</label>--%>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="d-flex mb-3">
                                    <strong class="text-dark mr-3">Sizes:</strong>
                                    <c:forEach items="${sizes}" var="list" varStatus="vTri">
                                        <div class="custom-control custom-radio custom-control-inline" style="margin-left: 8px">
                                            <input type="radio" id="size${vTri.index + 1}" name="size" value="${list.id}">
                                            <label class="radio-label" for="size${vTri.index + 1}"><span
                                                    style="padding-left: 10px;padding-top: 5px">${list.ten}</span></label>

                                                <%--                                <input type="radio" class="custom-control-input" id="size-${vTri.index + 1}" name="size" value="${list.id}">--%>
                                                <%--                                <label class="custom-control-label" for="size-${vTri.index + 1}">${list.ten}</label>--%>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="d-flex align-items-center mb-4 pt-2">
                                    <div class="input-group quantity mr-3" style="width: 130px;" id="mauSacAndSize">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary btn-minus" type="button" onclick="decreaseQuantity()">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                            <input type="text" class="form-control bg-secondary border-0 text-center" value="1"
                                                   name="sl" id="quantityInput">
                                            <button class="btn btn-primary btn-plus" type="button" onclick="increaseQuantity()">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <input type="hidden" name="idKh" value="${idKh}">
                                    <button class="btn btn-primary px-3" formaction="/user/gio_hang/add_gio_hang/${idKh}"
                                            onclick="addProduct()"><i class="fa fa-shopping-cart mr-1"></i> Add To
                                        Cart
                                    </button>
                                </div>
                            </form>
                            <div class="d-flex pt-2">
                                <strong class="text-dark mr-2">Share on:</strong>
                                <div class="d-inline-flex">
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-facebook-f"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-twitter"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-linkedin-in"></i>
                                    </a>
                                    <a class="text-dark px-2" href="">
                                        <i class="fab fa-pinterest"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Shop Detail End -->
<%--            <div class="container-fluid">--%>
<%--                <div class="container" id="addForm1">--%>
<%--                    <h3 style="text-align: center">Click hiển thị table 2</h3>--%>

<%--                    <input type="hidden" name="id" value="${item.id}">--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="formGroupExampleInput">Mã</label>--%>
<%--                        <input type="text" name="ma" value="${item.ma}" class="form-control"--%>
<%--                               id="formGroupExampleInput" placeholder="Mã">--%>
<%--                        <span id="errorMa" class="text-danger"></span>--%>
<%--                    </div>--%>
<%--                    <div class="form-group">--%>
<%--                        <label for="formGroupExampleInput2">Tên</label>--%>
<%--                        <input type="text" name="ten" value="${item.ten}" class="form-control"--%>
<%--                               id="formGroupExampleInput2" placeholder="Tên ">--%>
<%--                        <span id="errorTen" class="text-danger"></span>--%>
<%--                    </div>--%>

<%--                    <button class="btn btn-primary" formaction="/admin/loai_ao/add" type="submit"--%>
<%--                            onclick="addProduct()">Thêm Mới--%>
<%--                    </button>--%>

<%--                    </button>--%>
<%--                </div>--%>
<%--                --%>
<%--            </div>--%>
        </div>
        <!-- /.content -->
    </div>
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="../../../resources/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../../resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
<script src="../../../resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../../resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../../resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../../resources/plugins/jszip/jszip.min.js"></script>
<script src="../../../resources/plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../../resources/plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../../resources/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<!-- AdminLTE App -->
<script src="../../../resources/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../../resources/dist/js/demo.js"></script>
<!-- Page specific script -->
<script>
    $(function () {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
        }).buttons().container().appendTo('#example1_wrapper .col-md-6:eq(0)');
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
            "responsive": true,
        });
    });
</script>
<script>
    // Get references to the button and form container
    var addButton = document.getElementById("addButton");
    var addFormContainer = document.getElementById("addFormContainer");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer.style.display === "none" || addFormContainer.style.display === "") {
            addFormContainer.style.display = "block";
        } else {
            addFormContainer.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer) {
            // Hide the form
            addFormContainer.style.display = "none";
        }
    });

</script>
<script>
    // Get references to the button and form container
    var addButton1 = document.getElementById("addButton1");
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton1.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
        }
    });

    // Add an event listener to the background overlay
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });

</script>
</body>

</html>