<%@page isELIgnored="false" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/emp/upload" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <input type="submit" value="文件上传">
    </form>
    <h1>加油，坚持</h1>
</body>
</html>