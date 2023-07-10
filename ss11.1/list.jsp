<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Product</title>
</head>
<body>
  <h1>List Product</h1>
  <a href="/product?action=create">Add new product</a>
  <table>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Quantity</th>
      <th>Price</th>
      <th>Date release</th>
      <th>Manufacturer</th>
    </tr>
    <c:forEach items="${products}" var="p">
      <tr>
      <td>${p.id}</td>
      <td>${p.name}</td>
      <td>${p.quantity}</td>
      <td>${p.price}</td>
      <td>
        <fmt:formatDate value="${p.dateRelease}" pattern="dd/MM/yyyy"/>
      </td>
      <td>${p.manufacturer}</td>
      <td><a href="/product?action=detail&id=${p.id}">View</td>
      <td><a href="/product?action=update&id=${p.id}">Update</td>
      <td><a href="/product?action=delete&id=${p.id}">Delete</td>
      </tr>
    </c:forEach>

  </table>
</body>
</html>
