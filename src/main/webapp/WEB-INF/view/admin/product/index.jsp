<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/12/2018
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý sản phẩm"/>
</jsp:include>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp" />

    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Trang quản lý sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Sản phẩm
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách sản phẩm</h4>
                    <div class="form-group">
                        <a href="${pageContext.request.contextPath}/admin/product/create" class="btn btn-primary">Thêm</a>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Tên sản phẩm</th>
                                <th class="text-center">Loại</th>
                                <th class="text-center">Hãng sản xuất</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-center">Giá bán</th>
                                <th class="text-center">Trạng thái</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:set var="count" value="0" scope="page" />
                            <c:forEach var="p" items="${allProduct}">
                                <c:set var="count" value="${count + 1}" scope="page"/>
                            <tr>
                                <td class="text-center">${p.id}</td>
                                <td>${p.name}</td>
                                <td>${p.categoryByCategoryId.name}</td>
                                <td>${p.manufacturerByManufacturerId.name}</td>
                                <td class="text-center">${p.unitInStock}</td>
                                <td class="text-center"><fmt:formatNumber type="number" pattern="###,###" value="${p.salePrice}"/></td>
                                <c:choose>
                                    <c:when test="${p.enabled}">
                                        <td class="text-center" style="color: green">Hiển thị</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td class="text-center" style="color: red">Ẩn</td>
                                    </c:otherwise>
                                </c:choose>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/product/update?id=${p.id}" class="btn btn-warning btn-xs">Sửa</a>
                                    <a href="${pageContext.request.contextPath}/admin/product/detail?id=${p.id}" class="btn btn-success btn-xs">Chi tiết</a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>

<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            columnDefs: [ {
                targets: 1, // the target for this configuration, 0 it's the first column
                render: function ( data, type, row ) {
                    return data.length > 30 ?
                        data.substr( 0, 30 ) +'…' :
                        data;
                }
            } ],
            "language": {
                "sProcessing": "Đang xử lý...",
                "sLengthMenu": "Xem _MENU_ mục",
                "sZeroRecords": "Không tìm thấy dòng nào phù hợp",
                "sInfo": "Đang xem _START_ đến _END_ trong tổng số _TOTAL_ mục",
                "sInfoEmpty": "Đang xem 0 đến 0 trong tổng số 0 mục",
                "sInfoFiltered": "(được lọc từ _MAX_ mục)",
                "sInfoPostFix": "",
                "sSearch": "Tìm:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Đầu",
                    "sPrevious": "Trước",
                    "sNext": "Tiếp",
                    "sLast": "Cuối"
                }
            }
        });
    });


</script>

</body>

</html>