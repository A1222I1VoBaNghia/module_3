<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
    <h1>Customer list</h1>
    <table>
        <tr>
            <th>Tên</th>
            <th>Ngày sinh</th>
            <th>Địa chỉ</th>
            <th>Ảnh</th>
        </tr>
        <c:forEach items="${customerList}" var="c">
        <tr>
            <td>${c.name}</td>
            <td>${c.birthday}</td>
            <td>${c.address}</td>
            <td>${c.img}<c:import url="/image"></td>
        </tr>
        </c:forEach>
</table>
</body>
</html>
