<%@page contentType="text/html; UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>jqGrid</title>
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
        /*加载页面*/
        $(function () {
            $("#list").jqGrid({
                url:"${pageContext.request.contextPath}/emp/queryAll",
                editurl:"aa",       //增 oper=add 删 oper=del 改 oper=edit      根据传递的oper进行判断
                datatype:"json",
                autowidth:true,     //适应父容器
                styleUI:"Bootstrap",
                colNames:["ID","姓名","密码","生日","手机","状态"],
                colModel:[
                    {name:"id"},
                    {name:"name",editable:true},
                    {name:"password",editable:true},
                    {name:"birthday",editable:true},
                    {name:"mobile"},
                    {name:"state"}
                ],
                pager:"#page",      //分页工具栏
                rowNum:3,           //每页显示的条数
                rowList:[3,5,10],   //页数选择
                sortname:"id",        //列排序  选择某个字段进行排序
                viewrecords:true,      //是否显示数据总条数
                caption:"我的表格",     //表格标题
                //cellEdit:true,          //启动或禁用单元格编辑功能
                //toolbar:[true,'both'],         //表格工具栏
                //height:500,         //表格高度
                multiselect:true,       //多选框
                hiddengrid:true,        //是否展示表格
            }).jqGrid("navGrid","#page",{})
        })
    </script>
</head>
<body>
    <table id="list"></table>
    <div id="page" style="height: 50px"></div>
</body>
</html>


