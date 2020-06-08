<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="../boot/js/jquery-3.3.1.min.js"></script>
    <script src="../boot/js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" href="../boot/css/bootstrap.min.css">
    <title>用户管理</title>
    <style>
        #d {
            margin-top: -18px;
        }
    </style>
</head>
<body>
    <!--导航条-->
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">后台管理系统</a>
            </div>
            <div class="collapse navbar-collapse">
                <div class="nav navbar-right">
                    <a href="" class="navbar-text">
                        <b>欢迎:</b>小黑&nbsp;&nbsp;
                        <span class="glyphicon glyphicon-hand-right"></span>
                        退出登录
                    </a>
                </div>
            </div>
        </div>
        </div>
    </nav>
    <!--手风琴-->
    <div>
        <div class="col-sm-2">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                <p style="text-align: center">用户管理</p>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="col-sm-offset-4">
                                <button class="btn btn-default btn-danger">
                                    用户列表
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                <p style="text-align: center">类别管理</p>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <div class="col-sm-offset-4">
                                <button class="btn btn-default btn-danger">
                                    类别列表
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                <p style="text-align: center">图书管理</p>
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <div class="col-sm-offset-4">
                                <button class="btn btn-default btn-danger">
                                    图书列表
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--面板-->
        <div>
            <div class="col-sm-8">
                <!--用户-->
                <div>
                    <div class="page-header" id="d">
                        <h2>用户管理</h2>
                    </div>
                </div>
                <!--标签页-->
                <ul class="nav nav-tabs">
                    <li><a href="#aaa" data-toggle="tab">用户列表</a></li>
                    <li class="active"><a href="#bbb" data-toggle="modal" data-target="#myModal">
                        用户添加
                    </a></li>
                </ul>
            <div class="panel panel-default">
                <!-- Default panel contents -->
                <div class="panel-heading">
                    <!--搜索框-->
                    <form action="" class="form-inline">
                        <div class="col-sm-offset-2">
                        <b>姓名</b><input type="text" class="form-control">
                        <b>手机</b><input type="text" class="form-control">
                        <b>激活状态</b>
                            <select name="" id="">
                                <option value=""></option>
                            </select>
                        <button class="btn btn-default btn-primary">查询</button>
                        </div>
                    </form>
                </div>
                <div class="panel-body">
                    <!-- Table -->
                    <table class="table table-bordered table-hover">
                        <tr>
                            <td><b>ID</b></td>
                            <td><b>姓名</b></td>
                            <td><b>密码</b></td>
                            <td><b>生日</b></td>
                            <td><b>手机</b></td>
                            <td><b>状态</b></td>
                            <td><b>操作</b></td>
                        </tr>
                        <c:forEach items="${requestScope.emps}" var="e">
                        <tr>
                            <td>${e.id}</td>
                            <td>${e.name}</td>
                            <td>${e.password}</td>
                            <td><fmt:formatDate value="${e.birthday}"></fmt:formatDate></td>
                            <td>${e.mobile}</td>
                            <td>${e.state}</td>
                            <td>
                                <button class="btn btn-default btn-primary">删除</button>
                                <button class="btn btn-default btn-primary">修改</button>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                    <%--分页--%>
                    <nav aria-label="...">
                        <ul class="pager">
                            <li><a href="#">上一页</a></li>
                            <li><a href="#">下一页</a></li>
                        </ul>
                    </nav>
                </div>
                    <!--模态框-->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                            </div>
                            <div class="modal-body">
                                <form action="" class="form-inline">
                                    <div class="col-sm-offset-2">
                                        <label>姓名</label>
                                        <input type="text" class="form-control col-sm-offset-2">
                                    </div>
                                    <br>
                                    <div class="col-sm-offset-2">
                                        <label>密码</label>
                                        <input type="text" class="form-control col-sm-offset-2">
                                    </div>
                                    <br>
                                    <div class="col-sm-offset-2">
                                        <label>年龄</label>
                                        <input type="text" class="form-control col-sm-offset-2">
                                    </div>
                                    <br>
                                    <div class="col-sm-offset-2">
                                        <label>生日</label>
                                        <input type="text" class="form-control col-sm-offset-2" placeholder="年/月/日">
                                    </div>
                                    <br>
                                    <div class="col-sm-offset-2">
                                        <label>手机号</label>
                                        <input type="text" class="form-control col-sm-offset-2">
                                    </div>
                                    <br>
                                    <div class="col-sm-offset-2">
                                        <label>激活状态</label>
                                            <button class="btn btn-default dropdown-toggle col-sm-offset-1" type="button" data-toggle="dropdown">
                                                激活
                                                <span class="caret"></span>
                                            </button>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary btn-default" data-dismiss="modal">保存</button>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>