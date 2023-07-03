<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<h1>PRODUCT DISCOUNT CACULATOR</h1>
<br/>
<form method="get" action="/discount">
    <label>Product Description: </label><br/>
    <input type="text" name="description"/><br/>
    <label>List Price: </label><br/>
    <input type="number" name="price" placeholder="USD" value="0"/><br/>
    <label>Discount Percent: </label><br/>
    <input type="number" name="percent" placeholder="USD" value="0"/><br/>
    <input type = "submit" id = "submit" value = "Calculate Discount"/>
</form>
</body>
</html>