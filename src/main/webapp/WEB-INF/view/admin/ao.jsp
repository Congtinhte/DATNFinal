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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <style>
        #addFormContainer {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }
    </style>
    <style>
        #addFormContainer1 {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Màu nền với độ trong suốt */
            z-index: 9999;
            justify-content: center;
            align-items: center;
            display: flex;
        }

        #addForm {
            background-color: white; /* Màu nền của biểu mẫu */
            padding: 20px;
            border-radius: 5px; /* Góc bo tròn cho khung biểu mẫu */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2); /* Đổ bóng cho biểu mẫu */
        }

        #addForm button[type="submit"] {
            background-color: #007BFF; /* Màu nền của nút */
            color: white; /* Màu chữ trắng */
            border: none;
            cursor: pointer;
        }

        #addForm button[type="submit"]:hover {
            background-color: #0056b3; /* Màu nền khi di chuột vào */
        }
    </style>
    <style>
        .image {
            width: 80px;
            height: 80px;
            overflow: hidden;
            border-radius: 50%;
        }

        .image img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 50%;
        }
    </style>
    <style>
        /* CSS cho hiệu ứng chạy thời gian 2s */
        .swal2-popup {
            position: relative;
        }

        .swal2-popup .progress-bar-container {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 4px;
            background-color: #007bff; /* Màu của thanh thời gian */
            animation: slide-out 1s linear;
        }

        @keyframes slide-out {
            0% {
                width: 100%;
            }
            100% {
                width: 0%;
            }
        }

         .red-border {
             border: 1px solid red;
         }
        .black-border {
            border: 1px solid red;
        }
    </style>
    </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="/admin/index/1" class="nav-link">Trang chủ</a>
            </li>
        </ul>

        <!-- Right navbar links -->
        <ul class="navbar-nav ml-auto">
            <!-- Navbar Search -->
            <li class="nav-item">
                <a class="nav-link" data-widget="fullscreen" href="#" role="button">
                    <i class="fas fa-expand-arrows-alt"></i>
                </a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Brand Logo -->

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <c:choose>
                    <c:when test="${adminOrStaff == 1}">
                        <div class="image">
                            <img src="/images/test.jpg" >
                        </div>

                    </c:when>
                    <c:when test="${adminOrStaff == 2}">
                        <div class="image">
                            <img src="/images/test1.jpg" >
                        </div>
                    </c:when>
                </c:choose>
                <div class="info">
                    <a href="#" class="d-block">${nameUser}</a>
                </div>
            </div>

            <!-- SidebarSearch Form -->
            <div class="form-inline">
                <div class="input-group" data-widget="sidebar-search">
                    <input class="form-control form-control-sidebar" type="search" placeholder="Search"
                           aria-label="Search">
                    <div class="input-group-append">
                        <button class="btn btn-sidebar">
                            <i class="fas fa-search fa-fw"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                    data-accordion="false">
                    <!-- Add icons to the links using the .nav-icon class
                         with font-awesome or any other icon font library -->
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Bảng điều khiển
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/index/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Trang chủ</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/thong_ke/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thống kê</p>
                                </a>
                            </li>

                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/ban-quay/trang-chu" class="nav-link">
                            <i class="nav-icon fas fa-store"></i>
                            <p>
                                Bán Quầy
                                <span class="right badge badge-danger">New</span>
                            </p>
                        </a>
                    </li>
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link active">
                            <i class="nav-icon fas fa-table"></i>
                            <p>
                                Bảng
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/ao/view/1" class="nav-link active">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/hang/view/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hãng</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/loai_ao/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Loại áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/chat_vai/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Chất vải</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/form/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Form áo</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/huong_dan_bao_quan/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Hướng dẫn bảo quản</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/mau_sac/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Màu sắc</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/size/view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Size</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item ">
                        <a href="#" class="nav-link ">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Quản Lý Tài Khoản
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/nhanvien/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Nhân Viên</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="/admin/khachhang/1" class="nav-link ">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Khách Hàng</p>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link">
                            <i class="nav-icon far fa-plus-square"></i>
                            <p>
                                Chương trình giảm giá
                                <i class="fas fa-angle-left right"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            <li class="nav-item">
                                <a href="/admin/chuong_trinh_giam_gia/add_view/1" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>Thêm chương trình</p>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá sản phẩm
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_sp/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                    <li class="nav-item">
                                        <a href="/admin/ap-dung" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Áp dụng</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="nav-item">
                                <a href="#" class="nav-link">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>
                                        Giảm giá hóa đơn
                                        <i class="fas fa-angle-left right"></i>
                                    </p>
                                </a>
                                <ul class="nav nav-treeview">
                                    <li class="nav-item">
                                        <a href="/admin/view_chuong_trinh_giam_gia_hd/1" class="nav-link">
                                            <i class="far fa-circle nav-icon"></i>
                                            <p>Các chương trình</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/quan_li_don_hang/1" class="nav-link">
                            <i class="nav-icon fas fa-money-bill-alt"></i>
                            <p>
                                Quản lí hóa đơn
                            </p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/chat" class="nav-link">
                            <i class="nav-icon fas fa-envelope"></i>
                            <p>
                                Chat hỗ trợ
                                <span style="${allChat==0?"display: none;":""}"
                                      class="right badge badge-danger">${allChat}</span>
                            </p>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- /.sidebar-menu -->
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/admin/ao/view/1">Trang chủ</a></li>
                            <li class="breadcrumb-item active">Áo</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-header">
                                    <button class="btn btn-primary" id="addButton" onclick="clickThem()"><i class="fas fa-plus"></i> Thêm</button>
                                </div>
                                <div class="card-body">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="form-group col-3"></div>
                                                <div class="form-group col-3"></div>
                                                <div class="form-group col-3">
                                                    <label for="searchText2">Lọc</label>
                                                    <select class="form-control" name="loai_ao_id" id="searchText2">
                                                        <c:forEach items="${listHangs}" var="list">
                                                            <option value="${list.ten}">${list.ten}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form-group col-3">
                                                    <label for="searchText3">Lọc</label>
                                                    <select class="form-control" name="loai_ao_id" id="searchText3">
                                                        <c:forEach items="${listLoaiAos}" var="list">
                                                            <option value="${list.ten}">${list.ten}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Ảnh</th>
                                            <th>Hãng</th>
                                            <th>Loại</th>
                                            <th>Chất vải</th>
                                            <th>Form</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listAos}" var="list">
                                            <tr>
                                                <td>${list.ma}</td>
                                                <td>${list.ten}</td>
                                                <td style="width: 100px">
                                                    <img style="width: 100px; height: 120px; border: 1px solid #3bac8b; padding: 5px;" src="/images/${list.anhs.get(0).ten_url}" alt="">
                                                </td>
                                                <td>${list.hang.ten}</td>
                                                <td>${list.loaiAo.ten}</td>
                                                <td>${list.chatVai.ten}</td>
                                                <td>${list.form.ten}</td>
                                                <td>
                                                    <button formaction="/admin/ao/detail" name="detail"
                                                            value="${list.id}"
                                                            class="btn btn-primary me-2"><i class="fas fa-edit"></i> Detail
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Ảnh</th>
                                            <th>Hãng</th>
                                            <th>Loại</th>
                                            <th>Chất vải</th>
                                            <th>Form</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <form method="post">
                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Áo chưa hoàn thiện</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="example2" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Hãng</th>
                                            <th>Loại</th>
                                            <th>Chất vải</th>
                                            <th>Form</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listAoChuaHoanThiens}" var="list">
                                            <tr>
                                                <td>${list.ma}</td>
                                                <td>${list.ten}</td>
                                                <td>${list.hang.ten}</td>
                                                <td>${list.loaiAo.ten}</td>
                                                <td>${list.chatVai.ten}</td>
                                                <td>${list.form.ten}</td>
                                                <td>
                                                    <button formaction="/admin/ao/detail" name="detail"
                                                            value="${list.id}"
                                                            class="btn btn-primary me-2"><i class="fas fa-edit"></i> Detail
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Mã</th>
                                            <th>Tên</th>
                                            <th>Hãng</th>
                                            <th>Loại</th>
                                            <th>Chất vải</th>
                                            <th>Form</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>
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
                <div class="container">
                    <h3 style="text-align: center; padding-top: 10px; color: white">ÁO
                        <i style="display: inline-block" class="fas fa-angle-down"
                           onclick="toggleView('view_anh2')"></i>
                    </h3>
                    <div id="view_anh2" style="display:none">
                        <form method="post" id="addForm">
                            <input type="hidden" name="id" value="${item.id}">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Tên Sản Phẩm :</label>
                                    <input type="text" class="form-control" value="${item.ten}"
                                           placeholder="Tên Sản Phẩm"
                                           name="ten1" id="ten1">
                                    <span id="errorTen1" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Hãng :</label>
                                    <select class="form-control" name="hang_id1">
                                        <c:forEach items="${listHangs}" var="h">
                                            <option value="${h.id}" ${item.hang.id == h.id?'selected':''}>${h.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="ngayNhap1">Ngày nhập:</label>
                                    <br>
                                    <fmt:formatDate value="${item.ngayNhap}" pattern="yyyy-MM-dd" var="formattedDate"/>
                                    <input type="date" id="ngayNhap1" name="ngayNhap1" class="form-control"
                                           value="${formattedDate}">
                                    <span id="errorNgayChon1" class="text-danger"></span>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Loại áo :</label>
                                    <select class="form-control" name="loai_ao_id1">
                                        <c:forEach items="${listLoaiAos}" var="la">
                                            <option value="${la.id}" ${item.loaiAo.id == la.id?'selected':''}>${la.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Chất Vải :</label>
                                    <select class="form-control" name="chat_vai_id1">
                                        <c:forEach items="${listChatVais}" var="cv">
                                            <option value="${cv.id}" ${item.chatVai.id == cv.id?'selected':''}>${cv.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Cổ Áo</label>
                                    <select class="form-control" name="co_ao1">
                                        <option value="Cổ áo nhọn" ${item.coAo == "Cổ áo nhọn"?'selected':''}>Cổ áo nhọn</option>
                                        <option value="Cổ áo cài nút" ${item.coAo == "Cổ áo cài nút"?'selected':''}>Cổ áo cài nút</option>
                                        <option value="Cổ áo trụ" ${item.coAo == "Cổ áo trụ"?'selected':''}>Cổ áo trụ</option>
                                        <option value="Cổ áo cổ tàu" ${item.coAo == "Cổ áo cổ tàu"?'selected':''}>Cổ áo cổ tàu</option>
                                        <option value="Cổ áo tròn" ${item.coAo == "Cổ áo tròn"?'selected':''}>Cổ áo tròn</option>
                                        <option value="Cổ áo mandarin" ${item.coAo == "Cổ áo mandarin"?'selected':''}>Cổ áo mandarin</option>
                                        <option value="Cổ áo notch" ${item.coAo == "Cổ áo notch"?'selected':''}>Cổ áo notch</option>
                                        <option value="Cổ áo wingtip" ${item.coAo == "Cổ áo wingtip"?'selected':''}>Cổ áo wingtip</option>
                                        <option value="Cổ áo mandarin stand-up" ${item.coAo == "Cổ áo mandarin stand-up"?'selected':''}>Cổ áo mandarin stand-up</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Túi Áo :</label>
                                    <select class="form-control" name="tui_ao1">
                                        <option value="Túi ngực bổ sung" ${item.tui == "Túi ngực bổ sung"?'selected':''}>Túi ngực bổ sung</option>
                                        <option value="Túi khuy" ${item.tui == "Túi khuy"?'selected':''}>Túi khuy</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Tay Áo</label>
                                    <select class="form-control" name="tay_ao1">
                                        <option value="Ngắn" ${item.tayAo == "Ngắn"?'selected':''}>Ngắn</option>
                                        <option value="Dài" ${item.tayAo == "Dài"?'selected':''}>Dài</option>
                                        <option value="Không có" ${item.tayAo == "Không có"?'selected':''}>Không có</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Form áo :</label>
                                    <select class="form-control" name="form_id1">
                                        <c:forEach items="${listForms}" var="f">
                                            <option value="${f.id}" ${item.form.id == f.id?'selected':''}>${f.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Giá Nhập :</label>
                                    <input type="number" class="form-control" value="${item.giaNhap}"
                                           placeholder="Giá Nhập Sản Phẩm" name="gianhap1" id="gianhap1">
                                    <span id="errorGiaNhap1" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Giá Bán :</label>
                                    <input type="number" class="form-control" value="${item.giaBan}"
                                           placeholder="Giá Bán Sản Phẩm" name="giaban1" id="giaban1">
                                    <span id="errorGiaBan1" class="text-danger"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Mô Tả :</label>
                                <textarea class="form-control" id="mota1" rows="3"
                                          name="mota1">${item.moTa}</textarea>
                                <span id="errorMoTa1" class="text-danger"></span>
                            </div>

                            <button class="btn btn-primary" formaction="/admin/ao/update/${item.id}" type="submit" onclick="addProduct1()">
                                <i class="fas fa-sync"></i>Cập nhật
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <c:choose>
                <c:when test="${checkUpdate == 1}">
                    <hr>
                    <div class="container-fluid" style=" color: black">
                        <div class="container">
                            <h3 style="text-align: center;  color: white">MÀU SẮC, SIZE VÀ SỐ LƯỢNG
                                <i style="display: inline-block" class="fas fa-angle-down"
                                   onclick="toggleView('view_anh3')"></i>
                            </h3>
                            <div id="view_anh3" style="display:none">
                                <form method="post" id="addForm">
                                    <input type="hidden" name="ao_id" value="${item.id}">
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label>Màu sắc : </label>
                                            <select class="form-control" name="mau_sac_id">
                                                <c:forEach items="${listMauSacs}" var="ms">
                                                    <option value="${ms.id}" ${aoChiTiet.mau_sac.id == ms.id?'selected':''}>${ms.ten}</option>
                                                </c:forEach>
                                            </select>
                                            <span id="errorMauSac" class="text-danger"></span>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Size :</label>
                                            <c:forEach items="${listSizes}" var="sz">
                                                <input type="checkbox" name="size_id"
                                                       value="${sz.id}" ${aoChiTiet.size.id == sz.id ? 'checked' : ''}>${sz.ten}
                                            </c:forEach>
                                            <br>
                                            <span id="errorSizes" class="text-danger"></span>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label>Số lượng :</label>
                                            <input type="number" class="form-control" placeholder="Số lượng"
                                                   name="soLuong" id="soLuong"
                                                   value="${aoChiTiet.slton}">
                                            <span id="errorSoLuong" class="text-danger"></span>
                                        </div>
                                    </div>
                                    <button class="btn btn-success" formaction="/admin/ao_chi_tiet/add" type="submit" onclick="checkAoChiTiet()">
                                        <i class="fas fa-plus"></i> Thêm
                                    </button>
                                    <button class="btn btn-primary"
                                            formaction="/admin/ao_chi_tiet/update"
                                            type="submit" onclick="checkAoChiTiet()">
                                        <i class="fas fa-sync"></i>Cập nhật
                                    </button>
                                </form>
                                <div class="card shadow mb-4"
                                     style="color: black; margin-top: 10px">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Danh sách áo chi tiết</h6>
                                    </div>
                                    <form method="post" id="addForm">
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-bordered" id="dataTable">
                                                    <thead>
                                                    <tr>
                                                        <th>Màu sắc</th>
                                                        <th>Size</th>
                                                        <th>Số lượng</th>
                                                        <th>Số lượng bán</th>
                                                        <th>Trạng thái</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </thead>
                                                    <tfoot>
                                                    <tr>
                                                        <th>Màu sắc</th>
                                                        <th>Size</th>
                                                        <th>Số lượng</th>
                                                        <th>Số lượng bán</th>
                                                        <th>Trạng thái</th>
                                                        <th>Action</th>
                                                    </tr>
                                                    </tfoot>
                                                    <tbody>
                                                    <c:forEach items="${listAoChiTiets}" var="list">
                                                        <tr>
                                                            <td>${list.mau_sac.ten}</td>
                                                            <td>${list.size.ten}</td>
                                                            <td>${list.slton}</td>
                                                            <td>${list.slban}</td>
                                                            <td>${list.trangthai==1?'Hoạt Động':'Ngừng Hoạt Động'}</td>
                                                            <td>
                                                                <button formaction="/admin/ao_chi_tiet/detail"
                                                                        name="detail"
                                                                        value="${list.id}"
                                                                        class="btn btn-primary me-2"><i class="fas fa-edit"></i> Detail
                                                                </button>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>
                </c:when>
            </c:choose>
            <c:choose>
                <c:when test="${checkAnhs > 0}">
                    <div class="container-fluid" style="color: black;margin-left: 12.5%;width: 75%">
                        <div class="container">
                            <h3 style="text-align: center; color: white">ẢNH SẢN PHẨM
                                <i style="display: inline-block" class="fas fa-angle-down"
                                   onclick="toggleView('view_anh4')"></i>
                            </h3>
                            <div id="view_anh4" style="display:none;background: white; border-radius: 5px;">
                                <form enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="ao_id" value="${item.id}">
                                    <input type="file" name="ten_url1" id="imageInput" accept="image/*" onchange="displayImage()">
                                    <span id="errorAnh" class="text-danger"></span>
                                    <div id="imagePreview" style="padding-bottom: 10px;padding-left: 10px"></div>
                                    <button formaction="/admin/anh/add" type="submit" class="btn btn-success" onclick="themAnh()"><i class="fas fa-plus"></i> Thêm Anh
                                    </button>
                                </form>
                                <div class="form-row">
                                    <c:forEach items="${listAnhs}" var="anh">
                                        <div class="form-group col-md-3" style="position: relative;">
                                            <img src="/images/${anh.ten_url}" alt="" style="width: 100%;height: 300px">
                                            <a href="/admin/anh/delete/${anh.id}"
                                               class="delete-icon"
                                               style="position: absolute; top: 0; right: 0;margin-right: 10px">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>

        <div id="addFormContainer1" style="display: none;">
            <div class="container-fluid">
                <div class="container">
                    <div id="view_anh5" style="display:block">
                        <h3 style="text-align: center; padding-top: 10px; color: white">ÁO
                            <i style="display: inline-block" class="fas fa-angle-down"
                               onclick="toggleView('view_anh5')"></i>
                        </h3>
                        <form method="post" id="addForm">
                            <input type="hidden" name="id" >
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Tên Sản Phẩm <span class="text-danger">(*)</span> :</label>
                                    <input type="text" class="form-control"
                                           placeholder="Tên Sản Phẩm"
                                           name="ten" id="ten">
                                    <span id="errorTen" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Hãng :</label>
                                    <select class="form-control" name="hang_id">
                                        <c:forEach items="${listHangs}" var="h">
                                            <option value="${h.id}" >${h.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="ngayNhap">Ngày nhập <span class="text-danger">(*)</span> :</label>
                                    <br>
                                    <input type="date" id="ngayNhap" name="ngayNhap" class="form-control">
                                    <span id="errorNgayChon" class="text-danger"></span>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Loại áo :</label>
                                    <select class="form-control" name="loai_ao_id">
                                        <c:forEach items="${listLoaiAos}" var="la">
                                            <option value="${la.id}" >${la.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Chất Vải :</label>
                                    <select class="form-control" name="chat_vai_id">
                                        <c:forEach items="${listChatVais}" var="cv">
                                            <option value="${cv.id}">${cv.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Cổ Áo</label>
                                    <select class="form-control" name="co_ao">
                                        <option value="Cổ áo nhọn" >Cổ áo nhọn</option>
                                        <option value="Cổ áo cài nút" >Cổ áo cài nút</option>
                                        <option value="Cổ áo trụ" >Cổ áo trụ</option>
                                        <option value="Cổ áo cổ tàu" >Cổ áo cổ tàu</option>
                                        <option value="Cổ áo tròn" >Cổ áo tròn</option>
                                        <option value="Cổ áo mandarin">Cổ áo mandarin</option>
                                        <option value="Cổ áo notch" >Cổ áo notch</option>
                                        <option value="Cổ áo wingtip">Cổ áo wingtip</option>
                                        <option value="Cổ áo mandarin stand-up" >Cổ áo mandarin stand-up</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Túi Áo :</label>
                                    <select class="form-control" name="tui_ao">
                                        <option value="Túi ngực bổ sung" >Túi ngực bổ sung</option>
                                        <option value="Túi khuy">Túi khuy</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Tay Áo</label>
                                    <select class="form-control" name="tay_ao">
                                        <option value="Ngắn" >Ngắn</option>
                                        <option value="Dài" >Dài</option>
                                        <option value="Không có" >Không có</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-4">
                                    <label>Form áo :</label>
                                    <select class="form-control" name="form_id">
                                        <c:forEach items="${listForms}" var="f">
                                            <option value="${f.id}">${f.ten}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label>Giá Nhập <span class="text-danger">(*)</span> :</label>
                                    <input type="number" class="form-control"
                                           placeholder="Giá Nhập Sản Phẩm" name="gianhap" id="gianhap">
                                    <span id="errorGiaNhap" class="text-danger"></span>
                                </div>
                                <div class="form-group col-md-6">
                                    <label>Giá Bán <span class="text-danger">(*)</span> :</label>
                                    <input type="number" class="form-control"
                                           placeholder="Giá Bán Sản Phẩm" name="giaban" id="giaban">
                                    <span id="errorGiaBan" class="text-danger"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label>Mô Tả <span class="text-danger">(*)</span> :</label>
                                <textarea class="form-control" id="mota" rows="3"
                                          name="mota"></textarea>
                                <span id="errorMoTa" class="text-danger"></span>
                            </div>

                            <button class="btn btn-success" formaction="/admin/ao/add" type="submit"
                                    onclick="addProduct()">
                                <i class="fas fa-plus"></i> Thêm Mới
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Control Sidebar -->
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
    var addFormContainer1 = document.getElementById("addFormContainer1");

    // Add an event listener to the button
    addButton.addEventListener("click", function () {
        // Toggle the visibility of the form container
        if (addFormContainer1.style.display === "none" || addFormContainer1.style.display === "") {
            addFormContainer1.style.display = "block";
        } else {
            addFormContainer1.style.display = "none";
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
    addFormContainer1.addEventListener("click", function (event) {
        // Check if the click occurred outside the form
        if (event.target === addFormContainer1) {
            // Hide the form
            addFormContainer1.style.display = "none";
        }
    });

    if (window.location.href === "http://localhost:8080/admin/ao/view/1") {
        // If the URL matches, show the form container
        addFormContainer.style.display = "none";
    } else {
        addFormContainer.style.display = "block";
    }

    function clickThem() {
        event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
    }
</script>
<script>
    $(document).ready(function () {
        $('#searchText1').on('input', function () {
            var searchText = $(this).val().toLowerCase();
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (rowText.includes(searchText)) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText2').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        // Sự kiện thay đổi combobox
        $('#searchText3').on('change', function () {
            var selectedValue = $(this).val().toLowerCase();

            // Hiển thị tất cả dòng trong bảng trước
            $('#example1 tbody tr').show();

            // Kiểm tra giá trị của từng dòng và ẩn dòng không khớp
            $('#example1 tbody tr').each(function () {
                var rowText = $(this).text().toLowerCase();
                if (!rowText.includes(selectedValue)) {
                    $(this).hide();
                }
            });
        });
    });
</script>
<script>
    function toggleView(elementId) {
        var element = document.getElementById(elementId);
        element.style.display = (element.style.display === "block") ? "none" : "block";
    }
</script>
<script>
    function addProduct() {

        var ten = document.getElementsByName('ten')[0].value;
        var gianhap = document.getElementsByName('gianhap')[0].value;
        var giaban = document.getElementsByName('giaban')[0].value;
        var mota = document.getElementsByName('mota')[0].value;
        var ngayNhap = document.getElementsByName('ngayNhap')[0].value;

        var errorTen = document.getElementById('errorTen');
        var errorGiaNhap = document.getElementById('errorGiaNhap');
        var errorGiaBan = document.getElementById('errorGiaBan');
        var errorMoTa = document.getElementById('errorMoTa');
        var errorNgayChon = document.getElementById('errorNgayChon');

        var hasError = false;

        if (ten.trim() === '') {
            errorTen.innerText = 'Vui lòng nhập tên.';
            document.getElementById('ten').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('ten').style.borderColor = 'gray';
            errorTen.innerText = '';
        }

        if (mota.trim() === '') {
            errorMoTa.innerText = 'Vui lòng nhập mô tả.';
            document.getElementById('mota').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('mota').style.borderColor = 'gray';
            errorMoTa.innerText = '';
        }

        if (gianhap.trim() === '') {
            errorGiaNhap.innerText = 'Vui lòng nhập giá nhập.';
            document.getElementById('gianhap').style.borderColor = 'red';
            hasError = true;
        } else if (parseFloat(gianhap) < 0) {
            errorGiaNhap.innerText = 'Vui lòng nhập số dương.';
            document.getElementById('gianhap').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('gianhap').style.borderColor = 'gray';
            errorGiaNhap.innerText = '';
        }

        if (giaban.trim() === '') {
            errorGiaBan.innerText = 'Vui lòng nhập giá bán.';
            document.getElementById('giaban').style.borderColor = 'red';
            hasError = true;
        } else if (parseFloat(giaban) < 0) {
            errorGiaNhap.innerText = 'Vui lòng nhập số dương.';
            document.getElementById('giaban').style.borderColor = 'red';
            hasError = true;
        } else {
            // Validation for the 'Giá Bán' (not less than Giá Nhập)
            if (parseFloat(giaban) < parseFloat(gianhap)) {
                errorGiaBan.innerText = 'Giá bán không được nhỏ hơn giá nhập.';
                document.getElementById('giaban').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('giaban').style.borderColor = 'gray';
                errorGiaBan.innerText = '';
            }
        }

        // Validation for the 'Ngày Nhập' (not greater than current date and not empty)
        if (ngayNhap.trim() === '') {
            errorNgayChon.innerText = 'Vui lòng nhập ngày nhập.';
            document.getElementById('ngayNhap').style.borderColor = 'red';
            hasError = true;
        } else {
            var currentDate = new Date();
            var inputDate = new Date(ngayNhap);

            if (inputDate > currentDate) {
                document.getElementById('ngayNhap').style.borderColor = 'red';
                errorNgayChon.innerText = 'Ngày nhập không được lớn hơn ngày hiện tại.';
                hasError = true;
            } else {
                document.getElementById('ngayNhap').style.borderColor = 'gray';
                errorNgayChon.innerText = '';
            }
        }

        if (hasError) {
            event.preventDefault();
        }
    }

    function addProduct1() {

        var ten1 = document.getElementsByName('ten1')[0].value;
        var gianhap1 = document.getElementsByName('gianhap1')[0].value;
        var giaban1 = document.getElementsByName('giaban1')[0].value;
        var mota1 = document.getElementsByName('mota1')[0].value;
        var ngayNhap1 = document.getElementsByName('ngayNhap1')[0].value;

        var errorTen1 = document.getElementById('errorTen1');
        var errorGiaNhap1 = document.getElementById('errorGiaNhap1');
        var errorGiaBan1 = document.getElementById('errorGiaBan1');
        var errorMoTa1 = document.getElementById('errorMoTa1');
        var errorNgayChon1 = document.getElementById('errorNgayChon1');

        var hasError = false;

        if (ten1.trim() === '') {
            errorTen1.innerText = 'Vui lòng nhập tên.';
            document.getElementById('ten1').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('ten1').style.borderColor = 'gray';
            errorTen1.innerText = '';
        }

        if (mota1.trim() === '') {
            errorMoTa1.innerText = 'Vui lòng nhập mô tả.';
            document.getElementById('mota1').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('mota1').style.borderColor = 'gray';
            errorMoTa1.innerText = '';
        }

        if (gianhap1.trim() === '') {
            errorGiaNhap1.innerText = 'Vui lòng nhập giá nhập.';
            document.getElementById('gianhap1').style.borderColor = 'red';
            hasError = true;
        }else if (parseFloat(gianhap1) < 0) {
            errorGiaNhap1.innerText = 'Vui lòng nhập số dương.';
            document.getElementById('gianhap1').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('gianhap1').style.borderColor = 'gray';
            errorGiaNhap1.innerText = '';
        }

        if (giaban1.trim() === '') {
            errorGiaBan1.innerText = 'Vui lòng nhập giá bán.';
            document.getElementById('giaban1').style.borderColor = 'red';
            hasError = true;
        }else if (parseFloat(giaban1) < 0) {
            errorGiaBan1.innerText = 'Vui lòng nhập số dương.';
            document.getElementById('giaban1').style.borderColor = 'red';
            hasError = true;
        }  else {
            // Validation for the 'Giá Bán' (not less than Giá Nhập)
            if (parseFloat(giaban1) < parseFloat(gianhap1)) {
                errorGiaBan1.innerText = 'Giá bán không được nhỏ hơn giá nhập.';
                document.getElementById('giaban1').style.borderColor = 'red';
                hasError = true;
            } else {
                document.getElementById('giaban1').style.borderColor = 'gray';
                errorGiaBan1.innerText = '';
            }
        }

        // Validation for the 'Ngày Nhập' (not greater than current date and not empty)
        if (ngayNhap1.trim() === '') {
            errorNgayChon1.innerText = 'Vui lòng nhập ngày nhập.';
            document.getElementById('ngayNhap1').style.borderColor = 'red';
            hasError = true;
        } else {
            var currentDate = new Date();
            var inputDate = new Date(ngayNhap1);

            if (inputDate > currentDate) {
                document.getElementById('ngayNhap1').style.borderColor = 'red';
                errorNgayChon1.innerText = 'Ngày nhập không được lớn hơn ngày hiện tại.';
                hasError = true;
            } else {
                document.getElementById('ngayNhap1').style.borderColor = 'gray';
                errorNgayChon1.innerText = '';
            }
        }

        if (hasError) {
            event.preventDefault();
        }
    }

    function checkAoChiTiet(){
        var sizes = $("input[name='size_id']:checked").length;
        var soLuong = $("input[name='soLuong']").val();

        var errorSizes = document.getElementById('errorSizes');
        var errorSoLuong = document.getElementById('errorSoLuong');


        var hasError = false;

        if (sizes === 0) {
            errorSizes.innerText = 'Vui lòng chọn size';
            hasError = true;
        } else {
            errorSizes.innerText = '';
        }

        if (soLuong === "") {
            errorSoLuong.innerText = 'Vui lòng nhập số lượng';
            document.getElementById('soLuong').style.borderColor = 'red';
            hasError = true;
        } else if (soLuong < 0) {
            errorSoLuong.innerText = 'Số lượng không thể là số âm';
            document.getElementById('soLuong').style.borderColor = 'red';
            hasError = true;
        } else {
            document.getElementById('soLuong').style.borderColor = 'gray';
            errorSoLuong.innerText = '';
        }

        if (hasError) {
            event.preventDefault();
        }
    }

    var loiAoChiTietStr = "${loiAoChiTietStr}";

    if (loiAoChiTietStr == 2){
        addFormContainer.style.display = "none";
        Swal.fire({
            icon: 'error',
            html: '<div class="swal-text">Sản phẩm bạn chọn không tồn tại</div><div class="progress-bar-container"></div>',
            allowOutsideClick: true // Cho phép đóng thông báo bằng cách nhấp bên ngoài
        });
        setTimeout(() => {
            Swal.close();
            addFormContainer.style.display = "block";
        }, 1000);
    }
</script>
<script>
    var selectedImageName = "";
    function displayImage() {
        var input = document.getElementById('imageInput');
        var preview = document.getElementById('imagePreview');

        while (preview.firstChild) {
            preview.removeChild(preview.firstChild);
        }

        var file = input.files[0];

        if (file) {
            selectedImageName = file.name;

            var reader = new FileReader();

            reader.onload = function (e) {
                var img = document.createElement('img');
                img.src = e.target.result;
                img.style.maxWidth = '100px';
                img.style.maxHeight = '100px';
                preview.appendChild(img);
            };

            reader.readAsDataURL(file);
        }
    }

    function themAnh(){
        var errorAnh = document.getElementById('errorAnh');
        var hasError = false;

        if (!selectedImageName) {
            errorAnh.innerText = 'Vui lòng chọn ảnh.';
            hasError = true;
        } else {
            errorAnh.innerText = '';
        }

        if (hasError) {
            event.preventDefault(); // Ngăn chặn submit form nếu có lỗi
        }
    }
</script>
</body>
</html>
