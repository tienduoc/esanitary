<%--
  Created by IntelliJ IDEA.
  User: Tien Duoc
  Date: 7/11/2018
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../template/head-tag__user.jsp">
    <jsp:param name="title" value="Chi tiết đơn hàng"/>
</jsp:include>
<body>
<%@ include file="../../template/header-tag__user.jsp" %>
<main>
    <section class="section-breadcrumb">
        <div class="container">
            <h2 class="heading-primary--title">Chi tiết đơn hàng</h2>
            <ol class="breadcrumb heading-primary--sub">
                <li>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">
                    <a href="#">Chi tiết đơn hàng</a>
                </li>
            </ol>
        </div>
    </section>
    <section class="section-cart-title">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="heading-secondary">
                        <h2 class="heading-secondary--title">Đơn hàng: ${order.id}
                            <span class="heading-secondary--line"></span>
                        </h2>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section-cart">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <thead class="u-bg-color-primary-light">
                            <tr class="text-uppercase">
                                <th class="text-center">Sản phẩm</th>
                                <th class="text-center">Số lượng</th>
                                <th class="text-right">Đơn giá</th>
                                <th class="text-right">Thành tiền</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <form:form id="update" action="/order/update" method="post">
                                <input type="hidden" name="id" value="${order.id}">
                                <c:set var="sum" value="0"/>
                                <c:forEach var="od" items="${order.orderDetailsById}">
                                    <tr>
                                        <td><a href="product-detail.html">${od.productByProductId.name}</a></td>
                                        <td class="text-left">
                                            <input type="text" name="quantity" value="${od.quantity}">
                                            <br>
                                            <c:if test="${od.productId.equals(productId)}">
                                                <i style="color: #ff0000">${errQuantity}</i>
                                            </c:if>
                                        </td>
                                        <td class="text-right"><fmt:formatNumber pattern="###,###" value="${od.unitPrice}"/></td>
                                        <td class="text-right"><fmt:formatNumber pattern="###,###" value="${od.unitPrice * od.quantity}"/></td>
                                        <c:set var="sum" value="${sum + (od.unitPrice * od.quantity)}"/>
                                        <td><a href="${pageContext.request.contextPath}/order/remove?orderId=${od.orderId}&productId=${od.productId}">Xóa</a></td>
                                    </tr>
                                </c:forEach>
                            </form:form>
                            </tbody>
                            <tfoot class="u-bg-color-primary-light">
                            <tr>
                                <td colspan="3" class="text-right"><strong>Tổng cộng</strong></td>
                                <td class="text-right"><strong><fmt:formatNumber pattern="###,###" value="${sum}"/></strong></td>
                                <td></td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2  col-md-offset-8">
                    <a href="${pageContext.request.contextPath}/order" class="button button--light">Quay lại</a>
                </div>
                <div class="col-md-2">
                    <button type="submit" onclick="document.getElementById('update').submit();" class="btn button--black" style="width: 100%;">Cập nhật</button>
                </div>
            </div>
        </div>
    </section>
</main>
<script src="${pageContext.request.contextPath}/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/inputValidation.js"></script>
<script>
    $(window).scroll(function () {
        sessionStorage.scrollTop = $(this).scrollTop();
    });

    $(document).ready(function () {
        if (sessionStorage.scrollTop != "undefined") {
            $(window).scrollTop(sessionStorage.scrollTop);
        }
    });
</script>
</body>
</html>