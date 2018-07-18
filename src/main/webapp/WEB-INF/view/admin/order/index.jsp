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
<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../template/head-admin_tag.jsp">
    <jsp:param name="title" value="Trang quản lý đơn hàng"/>
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
                        Trang quản lý đơn đặt hàng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i> Tổng quan
                        </li>
                        <li class="active">
                            <i class="fa fa-archive"></i> Đơn đặt hàng
                        </li>
                    </ol>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <h4>Danh sách đơn đặt hàng</h4>


                    <div class="table-responsive">
                        <table class="table table-hover table-striped" id="example">
                            <thead>
                            <tr>
                                <th class="text-center"></th>
                                <th class="text-center">Mã</th>
                                <th class="text-center">Ngày tạo</th>
                                <th class="text-center">Tổng tiền</th>
                                <th class="text-center">Loại khách hàng</th>
                                <th class="text-center">Tài khoản</th>
                                <th class="text-center">Tình trạng</th>
                                <th class="text-center">Tuỳ chọn</th>
                            </tr>
                            </thead>
                            <tbody>

                            <tr data-key-1="Thân Văn Sử" data-key-2="CVPM Quang Trung, Quận 12, TP.Hồ Chí Minh" data-key-3="0942745670" data-key-4="sutv@fpt.edu.vn">
                                <td class="details-control"></td>
                                <td>HD1234</td>
                                <td>21/07/2018</td>
                                <td>2.000.000đ</td>
                                <td>Nhà thầu</td>
                                <td>sutv</td>
                                <td>Đóng</td>
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/admin/order/update" class="btn btn-warning btn-xs">Sửa</a>
                                    <a href="${pageContext.request.contextPath}/admin/order/detail" class="btn btn-success btn-xs">Chi tiết</a>
                                </td>
                            </tr>
                        </table>
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

<!-- Datatables JavaScript -->
<script src="https://cdn.datatables.net/1.10.18/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.18/js/dataTables.bootstrap.min.js"></script>

<script>
    function format(dataSource) {
        var html = '<table class="table table-hover" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" id="childRowTable"><tbody>';
        for (var key in dataSource) {
            html += '<tr>' +
                '<td>' + key + '</td>' +
                '<td>' + dataSource[key] + '</td>' +
                '</tr>';
        }
        return html += '</tbody></table>';
    }
    $(document).ready(function () {
        var table = $('#example').DataTable({
            columnDefs: [{
                targets: 1, // the target for this configuration, 0 it's the first column
                render: function (data, type, row) {
                    return data.length > 100 ?
                        data.substr(0, 100) + '…' :
                        data;
                }
            }],
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

        // Add event listener for opening and closing details
        $('#example').on('click', 'td.details-control', function () {
            var tr = $(this).closest('tr');
            var row = table.row(tr);

            if (row.child.isShown()) {
                // This row is already open - close it
                row.child.hide();
                tr.removeClass('shown');
            } else {
                // Open this row
                row.child(format({
                    'Khách hàng': tr.data('key-1'),
                    'Địa chỉ': tr.data('key-2'),
                    'Điện thoại': tr.data('key-3'),
                    'Email': tr.data('key-4')
                })).show();
                tr.addClass('shown');
            }
        });
    });


</script>

</body>

</html>