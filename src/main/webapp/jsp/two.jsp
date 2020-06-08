<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户展示</title>
    <%-- bootstrap的核心css --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/boot/css/bootstrap.min.css">
    <%-- jqGrid --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/jqGrid/css/trirand/ui.jqgrid-bootstrap.css">
    <%-- jquery.js --%>
    <script src="${pageContext.request.contextPath}/boot/js/jquery-3.3.1.min.js"></script>
    <%-- bootstrap.js --%>
    <script src="${pageContext.request.contextPath}/boot/js/bootstrap.min.js"></script>
    <%-- 国际化 --%>
    <script src="${pageContext.request.contextPath}/jqGrid/js/trirand/i18n/grid.locale-cn.js"></script>
    <%-- jqGrid核心js --%>
    <script src="${pageContext.request.contextPath}/jqGrid/js/trirand/jquery.jqGrid.min.js"></script>
    <script>
        /*function init(){
            $("#myBody").empty();
            $.ajax({
                url:/emp/selectEmpAll",
                datatype:"json",
                success:function (data) {
                    $.each(data,function (index, item) {
                        /!*console.log(item.id);*!/
                        $("#myBody").append("<tr>" +
                            "<td>"+item.id +"</td>"+
                            "<td>"+item.name +"</td>"+
                            "<td>"+item.password +"</td>"+
                            "<td>"+item.birthday +"</td>"+
                            "<td>"+item.mobile +"</td>"+
                            "<td>"+item.state +"</td>"+
                            "<td><button id='"+item.id+"' class='btn btn-primary' onclick='updateEmp(this)'>修改</button><button class='btn btn-primary'>删除</button></td>"+
                            "</tr>")
                    })
                }
            })
        }*/

        $(function () {
            $("#list").jqGrid({
                url:"${pageContext.request.contextPath}/emp/selectAll",
                editurl:"${pageContext.request.contextPath}/emp/zsg",     //功能判断
                datatype:"json",
                autowidth:true,
                styleUI:"Bootstrap",
                colNames:["ID","姓名","密码","生日","手机","状态"],
                colModel:[
                    {name:"id"},
                    {name:"name",editable:true},
                    {name:"password",editable:true},
                    {name:"birthday",editable:true},
                    {name:"mobile",editable:true},
                    {name:"state",editable:true}
                ],
                pager:"#pager",         //分页工具栏
                viewrecords:true,       //是否显示总条数
                // rowNum:2,               //每页展示数据的条数
            }).jqGrid("navGrid","#pager",{}
            ,{reloadAfterSubmit:false,closeAfterEdit:true},
            {closeAfterAdd:true},
                {closeAfterDel:true})
        })

        $("#highlight").click(function () {
            $("#myBody").empty();
            $('#myModals').modal('hide');
            var content = $("#exampleInputName1").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/emp/higlight",
                type: "post",
                data:"content="+content,
                success: function (data) {
                    for (var i = 0;i<data.length;i++){
                        $("#myBody").append(
                            "<tbody>"+
                            "<tr>" +
                            "<td>姓名</td>"+
                            "<td>" + data[i].name + "</td>" +
                            "</tr>"+
                            "<tr>" +
                            "<td>密码</td>"+
                            "<td>" + data[i].password + "</td>" +
                            "</tr>"+
                            "<tr>" +
                            "<td>生日</td>"+
                            "<td>" + data[i].birthday + "</td>" +
                            "</tr>"+
                            "<tr>" +
                            "<td>电话</td>"+
                            "<td>" + data[i].mobile + "</td>" +
                            "</tr>"+
                            "<tr>" +
                            "<td>状态</td>"+
                            "<td>" + data[i].state + "</td>" +
                            "</tr>"
                            + "<tbody>")
                    }

                    $('#myModal').modal({
                        show: false
                    });
                },
                datatype: "json"
            })
            alert(data)
        });






        /*/!*展示用户* *!/
        $.ajax({
            url:"/emp/selectEmpAll",
            datatype:"json",
            success:function (data) {
                $.each(data,function (index, item) {
                    /!*console.log(item.id);*!/
                    $("#myBody").append("<tr>" +
                        "<td>"+item.id +"</td>"+
                        "<td>"+item.name +"</td>"+
                        "<td>"+item.password +"</td>"+
                        "<td>"+item.birthday +"</td>"+
                        "<td>"+item.mobile +"</td>"+
                        "<td>"+item.state +"</td>"+
                        "<td><button id='\"+item.id+\"' class='btn btn-primary' onclick='updateEmp(this)'>修改</button><button class='btn btn-primary'>删除</button></td>"+
                        "</tr>")
                })
            }
        })
        /!*添加用户* *!/
        $("#mySave").click(function () {
            var serialize = $("#addEmp").serialize();
            console.log(serialize);
            $.ajax({
                url:"/emp/addEmp",
                datatype:"json",
                data:serialize,
                success:function () {
                    $("#addModal").modal("hide");
                    $("#addEmp")[0].reset();
                    /!*加载数据*!/
                    init();
                }
            })
        })
        /!*模糊查询*!/
        $("#selectByLike").click(function () {
            $.ajax({
                url:"/emp/selectByLike",
                datatype:"json",
                data:$("#slectByLikeForm").serialize(),
                success:function (data) {
                    $("#myBody").empty();
                    $.each(data, function (index, item) {
                        $("#myBody").append("<tr>" +
                            "<td>" + item.id + "</td>" +
                            "<td>" + item.name + "</td>" +
                            "<td>" + item.password + "</td>" +
                            "<td>" + item.birthday + "</td>" +
                            "<td>" + item.mobile + "</td>" +
                            "<td>" + item.state + "</td>" +
                            "<td> <button class='btn btn-primary'>修改</button><button class='btn btn-primary'>删除</button></td>" +
                            "</tr>")
                    })
                }
            })
        })
        /!*修改用户信息*!/
        function updateEmp(item){
            var id = $(item).attr("id");
            $.ajax({
                url:"/emp/selectById",
                datatype:"json",
                data:{"id":id},
                success:function (data) {
                    $("#name2").val(data.name)
                    $("#password2").val(data.password)
                    $("#birthday2").val(data.birthday)
                    $("#mobile2").val(data.mobile)
                    var status = data.state;
                    if (state=="激活"){
                        $("#state2").val('激活')
                    }else{
                        $("#state2").val('未激活')
                    }
                    /!*
                    *    弹出修改模态框
                    * *!/
                    $("#updateModal").modal("show")
                }
            })
        }*/
       /* })*/
    </script>
</head>
<body>

<div class="modal fade" id="myModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form class="form-horizontal" method="post">
                    <table id="myBody" border="1px" cellpadding="0" cellspacing="0" width="70%"></table>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>

    <%--页面主体--%>

    <div class="col-sm-10">
        <div class="page-header">
            <h3 id="myH3">用户管理</h3>
        </div>
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#showUser" data-toggle="tab">用户列表</a>
            </li>
            <li>
                <a href="#" data-toggle="modal" data-target="#addModal">用户添加</a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane active" id="showUser">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <%--<form id="slectByLikeForm" class="form-inline">
                            <div class="form-group">
                                <label for="name1">姓名</label>
                                <input type="text" name="name" placeholder="输入姓名" class="form-control" id="name1">
                            </div>
                            <div class="form-group">
                                <label for="mobile1">手机号</label>
                                <input type="text" placeholder="输入手机号" class="form-control" id="mobile1">
                            </div>
                            <div class="form-group">
                                <label>激活状态</label>
                                <select class="form-control" name="state">
                                    <option value="激活">激活</option>
                                    <option value="未激活">未激活</option>
                                </select>
                            </div>
                            <button id="selectByLike" type="button" class="btn btn-primary">
                                查询
                            </button>
                        </form>--%>
                        <%--es查询--%>
                        <%--<form action="">
                            <input class="input-group-lg" type="text" name="name">
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">查询</button>
                        </form>--%>
                            <div class="panel panel-default">
                                <div class="panel-heading"><h3>用户数据管理</h3>
                                    <center>
                                        <form class="form-inline" action="javascript:void(0)">
                                            <div class="form-group">
                                                <label for="exampleInputName1">姓名</label>
                                                <input type="text" class="form-control" name="name" id="exampleInputName1"
                                                       placeholder="请输入...">
                                            </div>
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal" id="highlight">
                                                查询
                                            </button>
                                        </form>
                                    </center>
                                </div>
                            </div>
                    <div class="panel-body">
                        <%--
                            表格数据
                        --%>
                        <table id="list">
                            <%--<thead>
                            <tr>
                                <th>Id</th>
                                <th>姓名</th>
                                <th>密码</th>
                                <th>生日</th>
                                <th>手机号</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="myBody">

                            </tbody>--%>
                        </table>
                        <%--分页工具栏--%>
                        <div id="pager" style="height: 50px"></div>

                        <%--
                            分页
                        --%>
                        <%--<nav>
                            <ul class="pager">
                                <li><a href="#">上一页</a></li>
                                <li><a href="#">下一页</a></li>
                            </ul>
                        </nav>
                    </div>--%>
                </div>
            </div>
        </div>
    </div>

        <div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    ...
                </div>
            </div>
        </div>

    <!--
        添加用户模态框
    -->
    <%--<div class="modal fade" id="addModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">添加用户</h4>
                </div>
                <div class="modal-body">
                    <form id="addEmp" class="form-horizontal" method="post">
                        <div class="form-group">
                            <label for="name" class="col-sm-2 control-label col-sm-offset-2">姓名</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password" class="col-sm-2 control-label col-sm-offset-2">密码</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="password" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="birthday" class="col-sm-2 control-label col-sm-offset-2">生日</label>
                            <div class="col-sm-5">
                                <input type="date" class="form-control" id="birthday" placeholder="年-月-日" name="birthday">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mobile" class="col-sm-2 control-label col-sm-offset-2">手机号</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="mobile" name="mobile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="state" class="col-sm-2 control-label col-sm-offset-2">激活状态</label>
                            <div class="col-sm-5">
                                <select class="form-control" id="state" name="state">
                                    <option value="未激活">不激活</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="mySave">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>--%>

    <%--
    修改用户模态框
    --%>
    <!-- 修改用户弹出框 -->
    <%--<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel1">修改用户信息</h4>
                </div>
                <div class="modal-body">
                    <form id="change" class="form-horizontal" action="${pageContext.request.contextPath}" method="get">
                        <input id="id1" name="id" style="visibility: hidden">
                        <div class="form-group">
                            <label for="name2" class="col-sm-2 control-label col-sm-offset-2">姓名</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="name2" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="password2" class="col-sm-2 control-label col-sm-offset-2">密码</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="password2" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="birthday2" class="col-sm-2 control-label col-sm-offset-2">生日</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="birthday" id="birthday2" placeholder="年-月-日">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="mobile2" class="col-sm-2 control-label col-sm-offset-2">手机号</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" id="mobile2" name="mobile">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="state2" class="col-sm-2 control-label col-sm-offset-2">激活状态</label>
                            <div class="col-sm-5">
                                <select class="form-control" id="state2" name="state">
                                    <option value="激活">激活</option>
                                    <option value="未激活">未激活</option>
                                </select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="$('#change').submit();">保存</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>--%>
</body>
</html>