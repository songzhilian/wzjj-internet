<#assign ctx="${rc.contextPath}">
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>温州交警网上事故查询</title>
    <script type="text/javascript" src="${ctx}/static/easyui-1.4.5/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/easyui-1.4.5/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/easyui-1.4.5/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx}/static/sunland/js/utils.js"></script>
    <script type="text/javascript" src="${ctx}/static/sunland/js/dict.js"></script>
    <link rel="stylesheet" href="${ctx}/static/easyui-1.4.5/themes/default/easyui.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/static/easyui-1.4.5/themes/icon.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/static/sunland/css/ydjw.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/static/sunland/css/style.css" type="text/css"></link>

    <script type="text/javascript">
        $(function(){
            initTab();
            var pageNumber = '${pageNumber!}';
            var pageSize = '${pageSize!}';
            if (pageNumber == '') {
                pageNumber = 1;
                pageSize = 10;
            }
            $('#acdDg').datagrid({
                pagination:true,
                rownumbers:true,
                singleSelect:true,
                pageNumber: parseInt(pageNumber),
                pageSize: parseInt(pageSize),
                idField:'lsh',
                height: '260px',
                url:'${ctx}/acd/data/list',
                onClickRow: subDataGrid,
                frozenColumns:[[

                    {field: 'sgbh', title: '事故编号',width:200,align:'center'},
                    {field: 'sgfssj', title: '事故时间',width:150,align:'center',formatter:getDate}

                ]],
                columns: [
                    [
                        {field:'lsh',hidden:true},
                        {field: 'sgdd', title: '事故地点',width:220,align:'center'},
                        {field: 'sgss', title: '事故事实',width:300,align:'center'},
                        {field: 'zrtjjg', title: '调解结果',width:300,align:'center'},
                        {field: 'yl2', title: '简易事故类型',width:100,align:'center',formatter:getSglx}
                    ]
                ],
                toolbar:$("#tb")
            });
        });

        function initTab(){
            var tabs = $('#tabId').tabs().tabs('tabs');
            for(var i=0; i<tabs.length; i++){
                tabs[i].panel('options').tab.unbind().bind('mouseenter',{index:i},function(e){
                    $('#tabId').tabs('select', e.data.index);
                });
            }
        }

        function getDate(value, row, index) {
            if (value) {
                return new Date(value).format('yyyy-MM-dd hh:mm:ss');
            }
            return '';
        }

        function getSglx(value, row, index){
            if(value == '999999'){
                return '现场处理';
            }else if(value == '999996'){
                return '事后处理';
            }else{
                return '现场处理';
            }
        }

        function getSgzr(value, row, index){
            if(value == '1'){
                return '全部';
            }else if(value == '2'){
                return '主要';
            }else if(value == '3'){
                return '同等';
            }else if(value == '4'){
                return '次要';
            }else if(value == '5'){
                return '无责';
            }else if(value == '6'){
                return '无法认定';
            }
        }

        function getRybh(value, row, index){
            if(value == '1'){
                return '甲';
            }else if(value == '2'){
                return '已';
            }else if(value == '3'){
                return '丙';
            }else if(value == '4'){
                return '丁';
            }else if(value == '5'){
                return '戊';
           }
        }

        function getXb(value, row, index){
            if(value == '1'){
                return '男';
            }else if(value == '2'){
                return '女';
            }else{
                return '';
            }
        }



        function resetForm(){
            $("#frmSearch").form('clear');
        }

        function searchAcd(){
            var data = $("#frmSearch").serializeObject();
            $('#acdDg').datagrid('load', data);
        }

        //子项菜单
        function subDataGrid(index, row){
            $.post("${ctx}/acd/data/item",{lsh:row.lsh},function(data){
                if(data != null) {
                    row = data;
                    $("#acdInfo").panel({content:showAcdInfo(row)}); //加入面板内容


                    $('#acdRyInfo').datagrid({
                        pagination:false,
                        singleSelect: true,
                        rownumbers: true,
                        data:row.acdDutyHumanList,
                        fitColumns: false,
                        loadMsg: '',
                        height: 'auto',
                        frozenColumns:[[
                            {field: 'rybh', title: '人员编号', width: 100,align:'center',formatter:getRybh},
                            {field: 'xm', title: '姓名', width: 100,align:'center'},
                            {field: 'sfzmhm', title: '身份证号', width: 140,align:'center'},
                            {field: 'dh', title: '联系电话', width: 140,align:'center'},
                            {field: 'sgzr', title: '事故责任',width: 100,align:'center',formatter:getSgzr},
                            {field: 'hphm', title: '号牌号码',width: 100,align:'center'},
                            {field: 'hpzl', title: '号牌种类',width: 100,align:'center',formatter:getHpzl}

                        ]],
                        columns: [
                            [
                                {field: 'xb', title: '性别',width: 100,align:'center',formatter:getXb},
                                {field: 'nl', title: '年龄', formatter: parseInteger,width: 80,align:'center'},
                                {field: 'zz', title: '住址', width: 250,align:'center'},
                                {field: 'wfxw1', title: '违法行为1', width: 300,align:'center'},
                                {field: 'wfxw2', title: '违法行为2', width: 300,align:'center'},
                                {field: 'wfxw3', title: '违法行为3', width: 300,align:'center'},
                                {field: 'jtfs', title: '交通方式',width: 100,align:'center',formatter:getDict_AcdJtfs},
                                {field: 'dabh', title: '档案编号',width: 100,align:'center'},
                                {field: 'zjcx', title: '准驾车型',width: 100,align:'center'},
                                {field: 'fzjg', title: '发证机关',width: 100,align:'center'},
                                {field: 'fdjh', title: '发动机号',width: 150,align:'center'},
                                {field: 'clsbdh', title: '车架号',width: 150,align:'center'},
                                {field: 'clpp', title: '车辆品牌',width: 150,align:'center'},
                                {field: 'clxh', title: '车辆型号',width: 150,align:'center'},
                                {field: 'csys', title: '车身颜色',width: 100,align:'center',formatter:getCsys},
                                {field: 'cllx', title: '车辆类型',width: 150,align:'center'},
                                {field: 'jdcsyr', title: '机动车所有人',width: 150,align:'center'},
                                {field: 'clsyxz', title: '车辆使用性质',width: 100,align:'center',formatter:getSyxz},
                                {field: 'bxgs', title: '保险公司',width: 200,align:'center'},
                                {field: 'bxpzh', title: '保险凭证号',width: 150,align:'center'}


                            ]
                        ]
                    });

                }else{
                    $.messager.alert('错误提示','获取数据异常','error');
                    return;
                }
            });
        }

        function showAcdInfo(row){
            var html = "<table>";
            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">事故编号:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.sgbh)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">事故发生时间:</td>';
            html += '<td style="width: 180px"> <input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+getDate(row.sgfssj)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">路名:</td>';
            html += '<td style="width: 200px"><input class="easyui-textbox" type="text" name="name" style="width:200px;height:25px;" value="'+convertNullStr(row.lm)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">路号:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+convertNullStr(row.lh)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">事故地点:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.sgdd)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">受伤人数:</td>';
            html += '<td style="width: 180px"> <input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.ssrs)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">公里数:</td>';
            html += '<td style="width: 200px"><input class="easyui-textbox" type="text" name="name" style="width:200px;height:25px;" value="'+convertNullStr(row.gls)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">米数:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+convertNullStr(row.ms)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">财产损失:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.zjccss)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">认定原因:</td>';
            html += '<td style="width: 180px"> <input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.sgrdyy)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">天气:</td>';
            html += '<td style="width: 200px"><input class="easyui-textbox" type="text" name="name" style="width:200px;height:25px;" value="'+getDict_Tq(row.tq)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">道路类型:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+getDllx(row.dllx)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">公路等级:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+getGlxzdj(row.glxzdj)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">现场:</td>';
            html += '<td style="width: 180px"> <input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+getXc(row.xc)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">事故形态:</td>';
            html += '<td style="width: 200px"><input class="easyui-textbox" type="text" name="name" style="width:200px;height:25px;" value="'+getSgxt(row.sgxt)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">车辆间事故:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+getCljsg(row.cljsg)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">单车事故:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+getDcsg(row.dcsg)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">接案人:</td>';
            html += '<td style="width: 180px"> <input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+convertNullStr(row.jar1)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">经办人:</td>';
            html += '<td style="width: 200px"><input class="easyui-textbox" type="text" name="name" style="width:200px;height:25px;" value="'+convertNullStr(row.jbr)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">调解方式:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+getTjfs(row.tjfs)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">结案方式:</td>';
            html += '<td style="width: 180px"><input class="easyui-textbox" type="text" name="name" style="width:180px;height:25px;" value="'+getJafs(row.jafs)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:100px;" align="right">调解结果:</td>';
            html += '<td style="width: 520px" colspan="3"> <input class="easyui-textbox" type="text" name="name" style="width:520px;height:25px;" value="'+convertNullStr(row.zrtjjg)+'" editable="false"></input></td>';
            html += '<td style="font-size: 12px;width:80px;" align="right">受理时间:</td>';
            html += '<td style="width: 120px"><input class="easyui-textbox" type="text" name="name" style="width:120px;height:25px;" value="'+getDate(row.slsj)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += '<tr style="width: 1000px">';
            html += '<td style="font-size: 12px;width:80px;" align="right">事故事实:</td>';
            html += '<td style="width: 810px" colspan="7"><input class="easyui-textbox" type="text" name="name" style="width:810px;height:25px;" value="'+convertNullStr(row.sgss)+'" editable="false"></input></td>';
            html += ' </tr>';

            html += "</table>";
            return html;
        }

        function printWs(){
            var data = $("#acdDg").datagrid("getSelected");
            if(data != null){
                window.open('${ctx}/acd/bxgs/print?lsh='+data.lsh+"&type=bxgs",'newwindow','top=0,left=0,toolbar=yes,menubar=yes,scrollbars=yes, resizable=yes,location=yes, status=yes');
            }else{
                $.messager.alert('提示', '请选择要打印的数据',"warning");
            }
        }

        function logout(){
            $.messager.confirm('提示信息', '确定退出？', function(r){
                if (r){
                    window.location.href="${ctx}/bxlogin/logout";
                }
            });
        }
    </script>
</head>
<body >
<div id="main" class="easyui-layout" >
    <div class="top">
    </div>

    <div style="width: 80%;margin:0px auto">
        <table style="width: 100%" align="center">
            <tr>
                <td>
                    <div class="user" >
                        <div class="user-img"></div>
                        <div class="user-label">欢迎您!<span class="user-color"></span></div>
                    </div>
                    <div class="clock"><div class="clock-ico"></div>日期：<span id="time"></span></div>
                    <script language="javascript">
                        $('.user').width($('.user-label').width()+35);
                        setInterval("document.getElementById('time').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);
                    </script>
                    <div class="user-logout">
                        <div class="logout-ico"></div><a href="#" onclick="logout()">安全退出</a>
                    </div>
                </td>
                </tr>
        </table>
    </div>

    <div style="width: 80%;margin:0px auto">
        <!-- 表单编辑区域 -->

        <table id="acdDg" style="width: 100%" title="简易事故查询打印"></table>
        <div id="tb" style="padding:5px;height:auto">
            <div style="margin-bottom:5px">
                <a href="#" class="easyui-linkbutton" iconCls="icon-print" plain="true" onclick="printWs()">打印</a>
            </div>
            <form id="frmSearch" method="post">
                <div>
                    事故编号: <input class="easyui-textbox" type="text" id="sgbh" name="sgbh" data-options="required:false" style="width:220px"/>
                    事故时间: <input id="sgsjStart" name="sgsjStart" class="easyui-datetimebox"  editable="false" style="width:150px">
                    至: <input id="sgsjEnd" name="sgsjEnd" class="easyui-datetimebox"  editable="false" style="width:150px">
                    事故地点: <input class="easyui-textbox" type="text" id="sgdd" name="sgdd" data-options="required:false" style="width:220px"/>
                    当事人: <input id="dsr" name="dsr" class="easyui-textbox"  style="width:150px">

                </div>
                <div style="height: 10px">
                </div>
                <div>
                    号牌号码: <input id="hphm" name="hphm" class="easyui-textbox"  style="width:220px">
                    身份证号: <input id="sfzmhm" name="sfzmhm" class="easyui-textbox"  style="width:150px">
                    手机号: <input id="sjhm" name="sjhm" class="easyui-textbox"  style="width:150px">
                    <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchAcd()">查询</a>
                    <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="resetForm()">重置</a>
                </div>
            </form>
    </div>
</div>
    <div id="tabId" style="width: 80%;margin:0px auto;height: 250px;" class="easyui-tabs">
        <div title="事故信息" style="padding:10px">
            <table id="acdInfo"></table>
        </div>

        <div title="事故人员信息" style="width: 100%;padding:10px">
            <table id="acdRyInfo" style="width: 100%"></table>
        </div>
    </div>
</div>
</body>

</html>