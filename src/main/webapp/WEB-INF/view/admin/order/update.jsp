<%--
  Created by IntelliJ IDEA.
  User: lambuunguyen
  Date: 7/17/18
  Time: 00:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Cập nhật đơn đặt hàng"/>
</jsp:include>
<body>

<div id="wrapper">
    <!-- Navigation -->
    <jsp:include page="../../template/nav-tag__admin.jsp"/>
    <div id="page-wrapper">

        <div class="container-fluid">

            <!-- Page Heading -->
            <jsp:include page="../../template/breakcrumb--child__admin.jsp">
                <jsp:param name="parentURL" value="${pageContext.request.contextPath}/admin/order/"/>
                <jsp:param name="parentTitle" value="đơn đặt hàng"/>
                <jsp:param name="pageURL" value="${pageContext.request.contextPath}/admin/oder/update"/>
                <jsp:param name="pageTitle" value="Cập nhật đơn đặt hàng"/>
            </jsp:include>
            <!-- /.row -->
            <div class="row">
                <div class="col-md-12 col-md-offset-0">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">Cập nhật đơn đặt hàng</h4>
                        </div>
                        <div class="panel-body">
                            <form:form id="order" modelAttribute="order" method="post">
                                <form:hidden path="username"/>
                                <form:hidden path="totalPrice"/>
                                <form:hidden path="totalPaid"/>
                                <form:hidden path="dealStatus"/>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Mã đơn hàng</label>
                                            <form:input path="id" class="form-control" disabled="true"/>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Ngày tạo</label>
                                            <fmt:formatDate var="date" value="${order.date}" pattern="dd/MM/yyyy"/>
                                            <input type="text" class="form-control" value="${date}" disabled>
                                            <form:hidden path="date"/>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Loại khách hàng</label>
                                            <input type="text" class="form-control" value="Nhà thầu" disabled>
                                        </div>
                                        <div class="col-md-3">
                                            <label>Tình trạng</label>
                                            <form:select path="closed" style="display:block; width: 100%; height: 4rem;">
                                                <form:option value="true">Đang xử lý</form:option>
                                                <form:option value="false">Đóng</form:option>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">

                                </div>
                                <div class="form-group">
                                    <label>Khách hàng</label>
                                    <input type="text" class="form-control" name="manufacturer" value="Thân Văn Sử" disabled>
                                </div>

                                <div class="form-group">
                                    <label>Địa chỉ</label>
                                    <input type="text" class="form-control" name="manufacturer" value="CVPM Quang Trung, Quận 12, TP.Hồ Chí Minh" disabled>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <label>Điện thoại</label>
                                            <input type="text" class="form-control" name="manufacturer" value="0942745670" disabled>
                                        </div>
                                        <div class="col-md-9">
                                            <label>Email</label>
                                            <input type="text" class="form-control" name="manufacturer" value="sutv@fpt.edu.vn" disabled>
                                        </div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label>Chi tiết sản phẩm</label>
                                    <div class="table-responsive">
                                        <table class="table table-hover table-striped">
                                            <thead>
                                            <tr>
                                                <th class="text-center">STT</th>
                                                <th class="text-center">Tên sản phẩm</th>
                                                <th class="text-center">Số lượng</th>
                                                <th class="text-center">Giá bán</th>
                                                <th class="text-center">Thành tiền</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td class="text-right">1</td>
                                                <td>Vòi Lạnh Lavabo American Standard Sandra W126</td>
                                                <td class="text-right">100</td>
                                                <td class="text-right">700.000 đ</td>
                                                <td class="text-right">700.0000 đ</td>
                                            </tr>
                                            <tr>
                                                <td class="text-right">2</td>
                                                <td>Bồn cầu Caesar</td>
                                                <td class="text-right">15</td>
                                                <td class="text-right">2.000.000 đ</td>
                                                <td class="text-right">14.000.0000 đ</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                        <div class="panel-footer">
                            <input type="submit" onclick="document.getElementById('order').submit();" class="btn btn-primary" value="Lưu lại">
                            <a href="${pageContext.request.contextPath}/admin/order" class="btn btn-default">Quay lại</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->

    </div>
    <!-- /#page-wrapper -->
</div>
<!-- /#wrapper -->

<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

<!-- Bootstrap Core JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


</body>
</html>
