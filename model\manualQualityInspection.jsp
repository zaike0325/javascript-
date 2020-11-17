<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>后台-人工质检</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>layui-v2.5.4/layui/css/layui.css">
    <link href="<%=basePath%>css/systemStyle.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>css/newStyle.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>css/newVersion.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/newPlugStyle.css" type="text/css" rel="stylesheet"/>
    <script src="<%=basePath%>js/Jquery3.1.1.min.js"></script>
    <script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
    <script src="<%=basePath%>js/jquery.form.js" type="text/javascript"></script>
    <script src="<%=basePath%>layui-v2.5.4/layui/layui.all.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/vue.js"></script>
    <script src="<%=basePath%>js/common.js?v=121qwe" type="text/javascript"></script>
    <style>
        [v-cloak]{
            display: none;
        }
        body,html{
            background:#F0F4F7;
        }
        i{
            font-style: normal;
        }
        .btnList,.btnList2{
            float:left;
            box-sizing: border-box;
            padding: 6px 14px;
            margin-left:10px;
            border-radius: 4px;
            font-size: 12px;
            color: rgba(90,108,127,1);
            border: 1px solid rgba(224,231,237,1);
            cursor: pointer;
        }
        .selList li:hover {
            color: rgba(77,161,254,1);
        }
        .cheacked{
            border: 1px solid #4DA1FE;
            color: #4DA1FE;
            background:url(<%=basePath%>/newImg/3.2.7/cheacked.svg) no-repeat top right;
        }
        .titleTab{
            margin-bottom:15px;
        }
        .titleTab li{
            display:inline-block;
        }
        .tab1,.tab2{
            font-size:16px;
            color:rgba(90,108,127,1);
            border:0;
            padding-bottom:6px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            cursor: pointer;
        }
        .tab2 {
            margin-left: 40px
        }
        .tabOn{
            border-bottom:2px solid #4DA1FE;
            color:#4DA1FE;
        }
        .listContent{
            margin:20px 0;
            display: flex;
            height: 74px;
            background: #FFFFFF;
            border: 1px solid #E0E7ED;
        }
        .listNum{
            flex:1;
            position:relative;
            padding:0 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            cursor:pointer;
        }
        .doubt{
            position:relative;
            top:-2px;
            left:2px;
        }
        .liNum{
            font-size: 16px;
            font-weight: 500;
            color: #4DA1FE;
            line-height: 16px;
        }
        .listTitle{
            margin:20px 0 6px 0;
            font-size: 12px;
            color: #778CA2;
            line-height: 12px;
        }
        .line:before{
            display:inline-block;
            position:absolute;
            top:18px;
            left:-10px;
            width:1px;
            height:34px;
            background:#E0E7ED;
            content:"";
        }
        .tabBox{
            padding-left:20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .tabBox2{
            display:none;
        }
        .advQuery{
            top:96px;
        }
        #recheckBox,#seeBox{
            display:none;
        }
        .contetnBox{
            display:flex;
        }
        .leftBox{
            flex:1;
            border-right:1px solid #E0E7ED;
            height:458px;
        }
        .middleBox,.rigthBox{
            height:100%;
            width:333px;
        }
        .leftBox,.rigthBox{
            padding: 0 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .right_content{
            height:441px;
            overflow-y:auto;
        }
        .rigthBoxContent{
            height:458px;
            overflow-y:auto;
            padding-bottom:20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .middleBox{
            background:#F0F4F7;
            height:457px;
            overflow-y:auto;
            border-right:1px solid #E0E7ED;
        }
        .leftBox>div{
            margin-top:20px;
        }
        .staffInfo{
            padding-bottom:20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            border-bottom:1px solid #D8D8D8;
        }
        .lineTilte{
            position:relative;
            line-height:14px;
            font-weight: 600;
            color: #252631;
        }
        .lineTilte:before{
            display:inline-block;
            position: relative;
            top:2px;
            width:3px;
            height:14px;
            margin-right:6px;
            background:#4DA1FE;
            content:''
        }
        .titleInfo{
            font-size:12px;
            color:#778CA2;
        }
        .listInfo{
            line-height: 12px;
            margin-top:14px;
            font-size:12px;
            color:#252631;
        }
        .limitWidth{
            display:inline-block;
            width:233px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            vertical-align: bottom;
        }
        .footerBox,.footerBox2{
            display:flex;
            position:absolute;
            bottom:0;
            width: 1000px;
            height: 80px;
            line-height:80px;
            padding:0 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            background: #FFFFFF;
            box-shadow: 0px -5px 6px -2px rgba(0, 0, 0, 0.12);
        }
        .footerBox div:first-child,.footerBox2 div:first-child{
            width:500px;
        }
        .footerBox div:last-child,.footerBox2 div:last-child{
            flex:1;
            text-align:right;
        }
        .submitNextBtn,.submitNextBtn2,.keepBtn2{
            height:40px;
            /*line-height:40px;*/
            font-size: 14px;
            color: #FFFFFF;
            background: #4DA1FE;
            border-radius: 4px;
            padding:10px 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            outline:none;
            border:none;
            cursor: pointer;
        }
        .submitBtn,.submitBtn2,.cancelBtn{
            outline:none;
            height: 40px;
            margin-left:6px;
            font-size: 14px;
            color: #5A6C7F;
            background: #FFFFFF;
            border-radius: 4px;
            border: 1px solid #E0E7ED;
            padding:10px 20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            cursor: pointer;
        }
        #audio,#audio2{
            outline:none;
            position:relative;
            display:inline-block;
            top:16px;
            width:400px;
            height:41px;
        }
        #downAudio,#downAudio2{
            margin-left:20px;
            padding-left:15px;
            background: url(<%=basePath%>/newImg/3.2.7/download.svg) no-repeat;
            color:#4DA1FE;
        }
        .marRight{
            position:absolute;
            right:0;
            display:inline-block;
            width: 50px;
            height: 16px;
            padding-right:8px;
            line-height:12px !important;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            font-size: 12px;
            font-weight:500;
            text-align:center;
            color: #778CA2;
            border-radius: 9px;
            border: 1px solid #E0E7ED;
        }
        .show{
            background:url(<%=basePath%>/newImg/3.2.7/show.svg) no-repeat 35px 5px;
        }
        .hide{
            background:url(<%=basePath%>/newImg/3.2.7/hide.svg) no-repeat 35px 5px;
        }
        .loanInfo li{
            line-height: 12px;
            margin-top:14px;
            font-size:12px;
            color:#252631;
        }
        .loanInfo li span{
            font-size:12px;
            color:#778CA2;
        }
        .middleBox ul{
            padding-bottom:20px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .middleBox ul li{
            position: relative;
            padding:20px 10px 0px 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            font-size:14px;
            line-height:18px;
            border-radius: 4px;
            overflow: hidden;
        }
        .leftImg{
            position: absolute;
            left:5px;
            top:58px;
        }
        .rightImg{
            position: absolute;
            right:5px;
            top:58px;
        }
        .middleBox ul li span{
            display: block;
            font-size:12px;
            color:#778CA2;
            margin-bottom:6px;
        }
        .leftInfo div{
            display:inline-block;
            padding:10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            background:#fff;
        }
        .rightInfo div{
            display:inline-block;
            float:right;
            padding:10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            background:#E0E7ED;
        }
        .rightInfo span{
            text-align:right;
        }
        .hitModel,.speechAnalysis,.recheckResult{
            margin-top:20px;
        }
        .modelNameList{
            margin-top:14px;
        }
        .modelNameListLi{
            display:inline-block;
            padding:7px 7px;
            margin:0 10px 5px 0;
            line-height:14px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            background: #FFFFFF;
            border-radius: 4px;
            border: 1px solid #E0E7ED;
            vertical-align: middle;
            cursor:pointer;
        }
        .classification,.classification2{
            width:120px;
            font-size:12px;
            background-position:100px center;
            margin:5px 0 0 0;
        }
        .classificationDetails,.classificationDetails2{
            width:160px;
            font-size:12px;
            background-position:140px center;
            margin:5px 0 0 10px;
        }
        .selectBox2{
            position: relative;
        }
        .titleName{
            margin-top:10px;
            font-size: 12px;
            color: #778CA2;
        }
        .titleName i{
            font-style: normal;
            color: #FA5151;;
        }
        .remarks{
            margin-top:20px;
        }
        #remarks1,#remarks2{
            margin-top:6px;
            width: 290px;
            height: 100px;
            background: #FFFFFF;
            border-radius: 4px;
            border: 1px solid #E0E7ED;
            resize: none;
        }
        .speech1,.speech2,.speech3{
            display:inline-block;
            width: 84px;
            height: 28px;
            line-height:28px;
            text-align:center;
            border-radius: 2px;
            margin:14px 10px 0 0;
            border:1px solid #fff;
            cursor:pointer;
        }
        .speech1{
            background: rgba(255, 118, 135, 0.1);
            color:#FF7687;
        }
        .speech2{
            background: rgba(255, 122, 69, 0.1);;
            color:#FF7A45;
        }
        .speech3{
            background: rgba(89, 126, 247, 0.1);
            color:#597EF7;
        }
        .marTB{
            display:inline-block;
            margin:20px 0 10px 0;
        }
        .fontS{
            line-height:1.6;
            color:#252631;
        }
        .fontS span{
            display: block;
            max-width:285px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
        .showHide{
            margin-top:10px;
            padding:5px 0;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            height:160px;
            overflow-y:auto;
        }
        .showHide li i{
            max-width:160px;
            display:inline-block;
            margin-left:6px;
            font-style:normal;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
      .selList5,.selList1,.selList2,.selList3,.selList4{
          position: absolute;
          top: 32px;
          left: 10px;
          background: #fff;
          width: 100%;
          border-radius: 4px;
          border: 1px solid rgba(224,231,237,1);
          display: none;
          z-index: 34;
          max-height: 260px;
          overflow-y: auto;
          font-size: 12px;
      }
        .selList5 li,.selList1 li,.selList2 li,.selList3 li,.selList4 li{
            padding-left: 10px;
            color: #252631;
            height: 26px;
            line-height: 26px;
            cursor: pointer;
            word-break: break-all;
            word-wrap: break-word;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            text-align: left;
        }
       .selList1 li:hover,.selList2 li:hover,.selList3 li:hover,.selList4 li:hover,.selList5 li:hover{
            color: rgba(77,161,254,1);
        }
        .selList1 li.selected,.selList2 li.selected,.selList3 li.selected,.selList4 li.selected,.selList5 li.selected{
            background: #fff;
            color: rgba(77,161,254,1);
        }
        #sul .whiteBc:hover, #sul1 .whiteBc:hover, #sul2 .whiteBc:hover, #sul3 .whiteBc:hover, #sul4 .whiteBc:hover, #sul5 .whiteBc:hover{
            color: rgba(77,161,254,1);
        }
        #sul3 li.selected, #sul1 li.selected, #sul2 li.selected, #sul li.selected{
            color: rgba(77,161,254,1);
        }
        .onLine:before{
            display:inline-block;
            position:absolute;
            top:18px;
            left:-10px;
            width:3px;
            height:34px;
            background:rgba(77,161,254,1);
            content:"";
        }
        .colorBlue{
            color: rgba(77,161,254,1);
        }
        .itemImg{
            display:inline-block;
            width:16px;
            height:19px;
            background:url(<%=basePath%>/newImg/3.2.7/modelBg.svg) no-repeat;
            vertical-align: inherit;
        }
        .modelNameListLiCheck{
            border:1px solid  rgba(77,161,254,1);
        }
        .modelNameListLiCheck span{
            background:url(<%=basePath%>/newImg/3.2.9/checkModelBg.svg) no-repeat;
        }
        .speech1Bor{
            border:1px solid #FF7687;
        }
        .speech2Bor{
            border:1px solid #FF7A45;
        }
        .speech3Bor{
            border:1px solid #597EF7;
        }
    </style>
</head>
<body>
<%--cnzz监控代码--%>
<div style="display:none;">
    <script type="text/javascript">
        //        var cnzz_protocol = (("https:" == document.location.protocol) ? "https://" : "http://");
        //        document.write(unescape("%3Cspan id='cnzz_stat_icon_1278275230'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "v1.cnzz.com/z_stat.php%3Fid%3D1278275230' type='text/javascript'%3E%3C/script%3E"));
        //         document.write(unescape("%3Cspan id='cnzz_stat_icon_1278716378'%3E%3C/span%3E%3Cscript src='https://s9.cnzz.com/z_stat.php%3Fid%3D1278716378' type='text/javascript'%3E%3C/script%3E"));
        //document.write(unescape("%3Cspan id='cnzz_stat_icon_1278745736'%3E%3C/span%3E%3Cscript src='https://s9.cnzz.com/z_stat.php%3Fid%3D1278745736' type='text/javascript'%3E%3C/script%3E"));
        //        document.write(unescape("%3Cspan id='cnzz_stat_icon_1278226594'%3E%3C/span%3E%3Cscript src='https://s4.cnzz.com/z_stat.php%3Fid%3D1278226594' type='text/javascript'%3E%3C/script%3E"));
         if(window.location.href.indexOf('http://cs3.dachuizichan.com')!=-1){         //线上
            document.write(unescape("%3Cspan id='cnzz_stat_icon_1278226594'%3E%3C/span%3E%3Cscript src='https://s4.cnzz.com/z_stat.php%3Fid%3D1278226594' type='text/javascript'%3E%3C/script%3E"))
        }else if(window.location.href.indexOf('http://emergencycs.dachuizichan.com')!=-1){      //主干
            document.write(unescape("%3Cspan id='cnzz_stat_icon_1278745736'%3E%3C/span%3E%3Cscript src='https://s9.cnzz.com/z_stat.php%3Fid%3D1278745736' type='text/javascript'%3E%3C/script%3E"));
        }else if(window.location.href.indexOf('http://interfacecs3.dachuizichan.com')!=-1){     //测试
            document.write(unescape("%3Cspan id='cnzz_stat_icon_1278716378'%3E%3C/span%3E%3Cscript src='https://s9.cnzz.com/z_stat.php%3Fid%3D1278716378' type='text/javascript'%3E%3C/script%3E"));
        }
        //声明_czc对象:
        var _czc = _czc || []; 
    </script>
</div>
<div id="masking" style="position:absolute;width:100%;display:none;height:100%;top:0;left:0;z-index:220;" onclick="$('#masking').hide();$('#nameBox').hide();$('#nameBox1').hide();$('#nameBox2').hide();$('#nameBox3').hide();$('#treeBox').hide()"></div>
<div class="outerBox" id="nameBox" style="display:none;position:absolute;top:215px;left:89px;z-index:450;">
    <input id="nickNameTemp"  name="nickName" class="searchBgInput placeholderText" placeholder="搜索" autocomplete="off" type="text" data-id="" value="全部" onfocus="$('#sul .redBc').hide();$('#sul .whiteBc').show();searchname();" onkeyup="searchname();"/>
    <ul id="sul" style="margin-bottom: 0px" >
        <li class="redBc">未找到搜索结果</li>
        <li class="whiteBc" data-id="" data-title="全部" style="height: 30px"><a href="javascript:void(0);" title="全部" class="selected" >全部</a></li>
        <c:forEach items="${ClList}" var="data">
            <li class="whiteBc" data-id="${data.id}" data-title="${data.name}" >
                <p title="${data.name}">${data.name}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="outerBox" id="nameBox1" style="display:none;position:absolute;top:170px;left:95px;z-index:450;">
    <input id="nickNameTemp1"  name="nickName" class="searchBgInput placeholderText" placeholder="搜索" autocomplete="off" type="text" data-id="0" value="全部" onfocus="$('#sul1 .redBc').hide();$('#sul1 .whiteBc').show();searchname1();" onkeyup="searchname1();"/>
    <ul id="sul1" style="margin-bottom: 0px" >
        <li class="redBc">未找到搜索结果</li>
        <li class="whiteBc" data-id="0" data-title="全部" style="height: 30px"><a href="javascript:void(0);" title="全部" class="selected" >全部</a></li>
        <c:forEach items="${CoList}" var="data">
            <li class="whiteBc" data-id="${data.id}" data-title="${data.name}" >
                <p title="${data.name}">${data.name}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="outerBox" id="nameBox2" style="display:none;position:absolute;top:170px;left:347px;z-index:450;">
    <input id="nickNameTemp2"  name="nickName" class="searchBgInput placeholderText" placeholder="搜索" autocomplete="off" type="text" data-id="" value="全部" onfocus="$('#sul2 .redBc').hide();$('#sul2 .whiteBc').show();searchname2();" onkeyup="searchname2();"/>
    <ul id="sul2" style="margin-bottom: 0px" >
        <li class="redBc">未找到搜索结果</li>
        <li class="whiteBc" data-id="" data-title="全部" style="height: 30px"><a href="javascript:void(0);" title="全部" class="selected" >全部</a></li>
        <c:forEach items="${ClList}" var="data">
            <li class="whiteBc" data-id="${data.id}" data-title="${data.name}" >
                <p title="${data.name}">${data.name}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<div class="outerBox" id="nameBox3" style="display:none;position:absolute;top:170px;left:640px;z-index:450;">
    <input id="nickNameTemp3"  name="nickName" class="searchBgInput placeholderText" placeholder="搜索" autocomplete="off" type="text" data-id="0" value="全部" onfocus="$('#sul3 .redBc').hide();$('#sul3 .whiteBc').show();searchname3();" onkeyup="searchname3();"/>
    <ul id="sul3" style="margin-bottom: 0px" >
        <li class="redBc">未找到搜索结果</li>
        <li class="whiteBc" data-id="0" data-title="全部" style="height: 30px"><a href="javascript:void(0);" title="全部" class="selected" >全部</a></li>
        <c:forEach items="${CoList}" var="data">
            <li class="whiteBc" data-id="${data.id}" data-title="${data.name}" >
                <p title="${data.name}">${data.name}</p>
            </li>
        </c:forEach>
    </ul>
</div>
<div id="treeBox"class="outerBox" style="position: absolute;z-index: 230;display:none;color:#252631;font-size: 12px;width:180px;max-height:260px;left:378px;top:170px;overflow-y:auto">
    <div id="" style="height: 40px;line-height: 40px;margin-left: 18px" onclick="allDepartName(this)">全部</div>
    <%--<div class="pad20 outerBox alignR">--%>
    <%--<button class="layui-btn layui-btn-small layui-btn-normal" onclick="$('#treeBox').hide();$('#masking').hide();">确定</button><button  class="layui-btn layui-btn-small layui-btn-normal" style="background:#e3e3e3;color:#222;" onclick="$('#treeBox').hide();$('#masking').hide();$('#departName').val('');$('#departId').val('');">取消</button>--%>
    <%--</div>--%>
    <div id="test13" class="demo-tree-more" style="padding-bottom:15px"></div>
</div>
<div id="main" v-cloak>
    <div id="part1" class="part">
        <div class="queryArea" style="position: relative;top:0;left:0;width:100%;padding-top:0px;z-index: 110">
            <div class="titleText" style="line-height: 50px">
                <span class="titleTextNext">人工质检任务</span>
            </div>
            <ul class="titleTab">
                <li class="tab1 tabLi tabOn">待检录音</li>
                <li class="tab2 tabLi">已检录音</li>
            </ul>
            <div class="tabBox1">
                <table class="queryText">
                    <tr>
                        <td class="alignR">
                            债务人姓名
                        </td>
                        <td>
                            <input type="text"  class="inpNew cursorP" id="obligorName"/></td>
                        </td>
                        <td class="alignR">
                            被叫号码
                        </td>
                        <td style="width:220px;">
                            <input type="text"  class="inpNew cursorP" id="phoneNumber"/></td>
                        </td>
                        <td class="alignR">
                            呼叫时间
                        </td>
                        <td>
                            <span type="button" class="btnList cheacked" onclick="getToday(this)">今天</span>
                            <span type="button" class="btnList" onclick="getYestoday(this)">昨天</span>
                            <input type="text"  class="inpNew rangeDate cursorP" id="dateTime" readonly/></td>
                        </td>
                        <td class="searchBtnOne searchBtnOne1">
                            <button type="button" value="查询" class="blueBtn marR10 searchTable">查询</button>
                            <button type="button" value="重置" class="whiteBtn" onclick="resetBtn()">重置</button>
                        </td>
                    </tr>
                    <tr class="advQueryItem1 advQueryItem">
                        <td class="alignR padT15">
                            催收机构
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" id="collecteAgency" data-id="0" readonly onclick="showNickList1()"/>
                        </td>
                        <td class="alignR padT15">
                            部门
                        </td>
                        <td class="padT15">
                            <input type="text"  id="departName" class="inpNew dropDown cursorP"  onclick="$('#masking').show();$('#treeBox').show()" readonly>
                            <input id="departId" class="inpNew dropDown cursorP" type="hidden">
                        </td>
                        <td class="alignR padT15">
                            催收员
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew cursorP" id="collector"/></td>
                        </td>
                    </tr>
                    <tr class="advQueryItem1 advQueryItem">
                        <td class="alignR padT15">
                            委单方
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" id="nickName" readonly onclick="showNickList()"/>
                        </td>
                        <td class="alignR padT15">
                            呼叫时长(秒)
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="width:80px;margin-right:5px;" id="callDurationMin"/>-
                            <input type="text"  class="inpNew dropDown cursorP" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="width:80px;margin-left:5px;" id="callDurationMax"/>
                        </td>
                        <td class="padT15 alignR">是否命中</td>
                        <td class="padT15">
                            <div class="selectBox disInline"  style="width:200px;margin-right:20px;">
                                <input type="text" style="width:180px;" data-id="" value="全部" class="inpNew dropDown cursorP" id="is_check" readonly/>
                                <ul class="selList checkResult" style="width:180px;z-index:110;">
                                    <li data-id="" class="selected">全部</li>
                                    <li data-id="">是</li>
                                    <li data-id="">否</li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr class="advQueryItem1 advQueryItem">
                        <td class="padT15 alignR">命中模型</td>
                        <td class="padT15">
                            <div class="selectBox disInline"  style="width:200px;margin-right:20px;">
                                <input type="text" style="width:180px;" data-id="" value="全部" class="inpNew dropDown cursorP" id="checkResult" readonly/>
                                <ul class="selList checkResult" style="width:180px;z-index:110;">
                                    <li data-id="" class="selected">全部</li>
                                    <c:forEach items="${voiceTemplateList}" var="data">
                                        <li data-id="${data.modelName}">${data.modelName}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </td>
                        <td class="padT15 alignR">质检专员</td>
                        <td class="padT15">
                            <div class="selectBox disInline"  style="width:200px;margin-right:20px;">
                                <c:if test="${fn:length(voiceTemplateList) eq 1}">
                                    <input type="text" style="width:180px;" data-id="${voiceTemplateList[0].modelName}" value="${voiceTemplateList[0].modelName}" class="inpNew dropDown cursorP" id="checkWorker" readonly/>
                                    <c:forEach items="${voiceTemplateList}" var="data">
                                        <li data-id="${data.modelName}">${data.modelName}</li>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${fn:length(voiceTemplateList) > 1}">
                                    <input type="text" style="width:180px;" data-id="" value="请选择" class="inpNew dropDown cursorP" id="checkWorker" readonly/>
                                    <ul class="selList checkResult" style="width:180px;z-index:110;">
                                        <li data-id="" class="selected">请选择</li>
                                        <c:forEach items="${voiceTemplateList}" var="data">
                                            <li data-id="${data.modelName}">${data.modelName}</li>
                                        </c:forEach>
                                    </ul>
                                </c:if>
                            </div>
                        </td>
                        <td colspan="4" class="padT15 searchBtnTwo searchBtnTwo1">
                            <button type="button" value="查询" class="blueBtn marR10 searchTable" >查询</button>
                            <button type="button" value="重置" class="whiteBtn" onclick="resetBtn()">重置</button>
                        </td>
                    </tr>
                </table>
                <div class="advQuery1 advQuery" style="cursor: pointer;">
                    <img src="<%=basePath%>newImg/dateDown.png" style="padding-right:4px"/>
                    <span class="advQueryNext1 advQueryNext" style="color:#4DA1FE">高级筛选</span>
                </div>
            </div>
            <div class="tabBox2">
                <table class="queryText">
                    <tr>
                        <td class="alignR">
                            债务人姓名
                        </td>
                        <td>
                            <input type="text"  class="inpNew cursorP" id="obligorName2"/></td>
                        </td>
                        <td class="alignR">
                            被叫号码
                        </td>
                        <td style="width:220px;">
                            <input type="text"  class="inpNew cursorP" id="phoneNumber2"/></td>
                        </td>
                        <td class="alignR">
                            质检时间
                        </td>
                        <td>
                            <span type="button" class="btnList2 cheacked" onclick="getToday2(this)">今天</span>
                            <span type="button" class="btnList2" onclick="getYestoday2(this)">昨天</span>
                            <input type="text"  class="inpNew rangeDate cursorP" id="dateTime2" readonly/></td>
                        </td>
                        <td class="searchBtnOne searchBtnOne2">
                            <button type="button" value="查询" class="blueBtn marR10 searchTable2">查询</button>
                            <button type="button" value="重置" class="whiteBtn" onclick="resetBtn2()">重置</button>
                        </td>
                    </tr>
                    <tr class="advQueryItem2 advQueryItem">
                        <td class="alignR padT15">
                            催收员
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew cursorP" id="collector2"/></td>
                        </td>
                        <td class="alignR padT15">
                            委单方
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" id="nickName2" readonly onclick="showNickList2()"/>
                        </td>
                        <td class="alignR padT15">
                            催收机构
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" id="collecteAgency2" data-id="0" readonly onclick="showNickList12()"/>
                        </td>
                    </tr>
                    <tr class="advQueryItem2 advQueryItem">
                        <td class="alignR padT15">
                            呼叫时长(秒)
                        </td>
                        <td class="padT15">
                            <input type="text"  class="inpNew dropDown cursorP" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="width:80px;margin-right:5px;" id="callDurationMin2"/>-
                            <input type="text"  class="inpNew dropDown cursorP" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" style="width:80px;margin-left:5px;" id="callDurationMax2"/>
                        </td>
                        <td class="padT15 alignR">质检结果</td>
                        <td class="padT15">
                            <div class="selectBox5 disInline"  style="width:200px;position:relative;margin-right:20px;">
                                <input type="text" style="width:180px;" data-id="" value="" class="inpNew dropDown cursorP" id="checkResult2" readonly/>
                                <ul class="selList checkResult2" style="width:180px;">
                                    <li data-id="优质">提醒</li>
                                    <li data-id="合规">合规</li>
                                    <li data-id="提醒">提醒</li>
                                    <c:forEach items="${VoiceResultList}" var="data">
							            <li data-id="${data.id}" title="${data.typeName}">${data.typeName}</li>
							        </c:forEach>
                                </ul>
                            </div>
                        </td>
                        <td class="padT15 alignR">结果分类明细</td>
                        <td class="padT15 box6">
                            <div class="disInline"  style="position:relative;width:200px;margin-right:20px;">
                                <input type="text" style="width:180px;" data-id="" value="" class="inpNew dropDown cursorP" id="checkListName2" readonly disabled/>
                                <ul class="selList5 checkListName2" style="width:180px;">
                                    <li v-for="item in list2" :title="item.detailName">{{item.detailName}}</li>
                                </ul>
                            </div>
                        </td>
                        <td colspan="3" class="padT15 searchBtnTwo searchBtnTwo2" style="position:relative;left:-126px;">
                            <button type="button" value="查询" class="blueBtn marR10 searchTable2" >查询</button>
                            <button type="button" value="重置" class="whiteBtn" onclick="resetBtn2()">重置</button>
                        </td>
                    </tr>
                </table>
                <div class="advQuery2 advQuery" style="cursor: pointer;">
                    <img src="<%=basePath%>newImg/dateDown.png" style="padding-right:4px"/>
                    <span class="advQueryNext2 advQueryNext" style="color:#4DA1FE">高级筛选</span>
                </div>
            </div>
        </div>
        <!-- 列表 -->
        <div class="marT10 tabBox tabBox1" style="position: relative;top:0;left:0;width:100%;z-index: 100">
            <div class="listContent">
                <div class="listNum" onclick="searchDate(1,this)">
                    <p class="listTitle">模型命中<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日及历史被质检模型命中且未被人工质检的录音" alt=""/></p>
                    <span class="liNum">{{isHitTemplate | toNumber0}}</span>
                </div>
                <div class="listNum line"  onclick="searchDate(2,this)">
                    <p class="listTitle">辱骂威胁<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日及历史被辱骂威胁模型命中且未被人工质检的录音" alt=""/></p>
                    <span class="liNum">{{hitAbusive | toNumber0}}</span>
                </div>
                <div class="listNum line"  onclick="searchDate(3,this)">
                    <p class="listTitle">客户投诉<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日及历史被客户投诉模型命中且未被人工质检的录音" alt=""/></p>
                    <span class="liNum">{{hitComplaint | toNumber0}}</span>
                </div>
                <div class="listNum line"  onclick="searchDate(4,this)">
                    <p class="listTitle">嘲讽客户<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日及历史被嘲讽客户模型命中且未被人工质检的录音" alt=""/></p>
                    <span class="liNum">{{hitRidicule | toNumber0}}</span>
                </div>
                <div class="listNum line"  onclick="searchDate(5,this)">
                    <p class="listTitle">质检未命中<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日被送检但未被任何模型命中的录音" alt=""/></p>
                    <span class="liNum">{{isHitQuality | toNumber0}}</span>
                </div>
                <div class="listNum line"  onclick="searchDate(6,this)">
                    <p class="listTitle">未送检<img class="doubt" src="<%=basePath%>newImg/interrogativeGrey.svg" title="今日产生未被送去阿里质检的录音" alt=""/></p>
                    <span class="liNum">{{isQuality | toNumber0}}</span>
                </div>
            </div>
            <table class="layui-hide" id="demo" lay-filter="test"></table>
        </div>
        <div class="marT10 tabBox tabBox2" style="position: relative;top:15px;left:0;width:100%;z-index: 99">
            <table class="layui-hide" id="demo2" lay-filter="test2"></table>
        </div>
    </div>
    <div id="recheckBox">
        <input type="hidden" id="isQuality"/>
        <input type="hidden" id="_id"/>
        <div class="contetnBox">
            <div class="leftBox">
                <div class="staffInfo">
                    <div class="lineTilte">员工：{{callRecordQualityByKey.empName}}</div>
                    <div class="listInfo"><span class="titleInfo">催收机构：</span><span class="limitWidth" :title="callRecordQualityByKey.collectionName">{{callRecordQualityByKey.collectionName}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">部门：</span><span class="department">{{callRecordQualityByKey.departName}}</span></div>
                </div>
                <div class="obligorInfo">
                    <div class="lineTilte">债务人：{{callRecordQualityByKey.debtorName | toLine}}</div>
                    <div  class="listInfo"><span class="titleInfo">委单方：</span><span class="limitWidth">{{callRecordQualityByKey.nickname}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">呼叫时间：</span><span class="department">{{callRecordQualityByKey.callingTimeStr}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">电话：</span><span class="department">{{callRecordQualityByKey.passtiveNum}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">与本人关系：</span><span class="department">{{callRecordQualityByKey.contactsRelationship | toLine}}</span></div>
                </div>
                <div class="loanInfo">
                    <div class="lineTilte">贷款信息
                    <span class="marRight hide">收起</span>
                    </div>
                    <div class="showHide">
                        <ul v-if="dDebtorInfo.debtType1=='小额现金贷款'">
                        <li><span>委案总额：</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                        <li><span>贷款名称：</span><i :title="dDebtorInfo.debtType2">{{dDebtorInfo.debtType2 | toLine}}</i></li>
                        <li><span>商品名称/型号：</span><i :title="dDebtorInfo.debtType3">{{dDebtorInfo.debtType3 | toLine}}</i></li>
                        <li><span>合同号：</span><i>{{dDebtorInfo.contractNum | toLine}}</i></li>
                        <li><span>合同日期：</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                        <li><span>合同金额：</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                        <li><span>贷款期数：</span><i>{{dDebtorInfo.loanNper | toLine2}}</i></li>
                        <li><span>每期金额：</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                        <li><span>已还期数：</span><i>{{dDebtorInfo.hasAlsoNper | toLine}}</i></li>
                        <li><span>未结清总额：</span><i>{{dDebtorInfo.outstandingAmount | toLine2}}</i></li>
                        <li><span>未结清期数：</span><i>{{dDebtorInfo.outstandingNper | toLine}}</i></li>
                        <li><span>剩余本金：</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}}</i></li>
                        <li><span>逾期本金：</span><i>{{dDebtorInfo.principal | toLine2}}</i></li>
                        <li><span>逾期期数：</span><i>{{dDebtorInfo.overdueNper | toLine}}</i></li>
                        <li><span>逾期天数：</span><i>{{dDebtorInfo.overdueDaysStr | toLine}}</i></li>
                        <li><span>逾期利息：</span><i>{{dDebtorInfo.interest | toLine2}}</i></li>
                        <li><span>违约金：</span><i>{{dDebtorInfo.penalty | toLine2}}</i></li>
                        <li><span>手续费：</span><i>{{dDebtorInfo.otherCost | toLine2}}</i></li>
                        <li><span>逾期日期：</span><i>{{dDebtorInfo.overdueDateStr | toLine}}</i></li>
                        <li><span>客服电话：</span><i>{{dDebtorInfo.servicePhone | toLine}}</i></li>
                        <li><span>末次还款时间：</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}}</i></li>
                        <li><span>末次还款金额：</span><i>{{dDebtorInfo.finalPaymentAmount| toLine2}}</i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo.debtType1=='消费分期'">
                        <li><span>委案总额：</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                        <li><span>合同号：</span><i>{{dDebtorInfo.contractNum | toLine}}</i></li>
                        <li><span>订单日期：</span><i>{{dDebtorInfo.contractDateStr | toLine}} </i></li>
                        <li><span>合同金额：</span><i>{{dDebtorInfo.contractAmount | toLine2}} </i></li>
                        <li><span>商品名称：</span><i :title="dDebtorInfo.debtType3">{{dDebtorInfo.debtType3 | toLine}}</i></li>
                        <li><span>商品分期价格：</span><i>{{dDebtorInfo.instalmentsprice | toLine2}} </i></li>
                        <li><span>商品价格：</span><i>{{dDebtorInfo.stugoodprice | toLine2}}</i></li>
                        <li><span>首付价格：</span><i>{{dDebtorInfo.firstpaymoney | toLine2}} </i></li>
                        <li><span>分期期数：</span><i>{{dDebtorInfo.loanNper | toLine}} </i></li>
                        <li><span>每期还款金额：</span><i>{{dDebtorInfo.eachAmount | toLine2}} </i></li>
                        <li><span>账单日：</span><i>{{dDebtorInfo.statementDateStr | toLine}} </i></li>
                        <li><span>最后还款日：</span><i>{{dDebtorInfo.monthlydeadline | toLine}} </i></li>
                        <li><span>已还期数：</span><i>{{dDebtorInfo.hasAlsoNper | toLine}} </i></li>
                        <li><span>未结清总额：</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                        <li><span>未结清期数：</span><i>{{dDebtorInfo.outstandingNper | toLine}} </i></li>
                        <li><span>剩余本金：</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                        <li><span>逾期本金：</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                        <li><span>逾期期数：</span><i>{{dDebtorInfo.overdueNper | toLine}} </i></li>
                        <li><span>逾期天数：</span><i>{{dDebtorInfo.overdueDaysStr | toLine}} </i></li>
                        <li><span>逾期利息：</span><i>{{dDebtorInfo.interest | toLine}} </i></li>
                        <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                        <li><span>手续费（罚息）：</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                        <li><span>逾期日期：</span><i>{{dDebtorInfo.overdueDateStr | toLine}}</i></li>
                        <li><span>客服电话：</span><i>{{dDebtorInfo.servicePhone | toLine}}</i></li>
                        <li><span>末次还款时间：</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                        <li><span>末次还款金额：</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo.debtType1=='大额现金贷款'">
                        <li><span>委案总额：</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                        <li><span>贷款名称：</span><i :title="dDebtorInfo.debtType2">{{dDebtorInfo.debtType2 | toLine}}</i></li>
                        <li><span>商品名称/型号：</span><i :title="dDebtorInfo.debtType3">{{dDebtorInfo.debtType3  | toLine}}</i></li>
                        <li><span>合同号：</span><i>{{dDebtorInfo.contractNum | toLine}}</i></li>
                        <li><span>合同日期：</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                        <li><span>合同金额：</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                        <li><span>贷款期数：</span><i>{{dDebtorInfo.loanNper | toLine}}</i></li>
                        <li><span>每期金额：</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                        <li><span>已还期数：</span><i>{{dDebtorInfo.hasAlsoNper | toLine}}</i></li>
                        <li><span>未结清总额：</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                        <li><span>未结清期数：</span><i>{{dDebtorInfo.outstandingNper | toLine}} </i></li>
                        <li><span>剩余本金：</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                        <li><span>逾期本金：</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                        <li><span>逾期期数：</span><i>{{dDebtorInfo.overdueNper | toLine}} </i></li>
                        <li><span>逾期天数：</span><i>{{dDebtorInfo.overdueDaysStr | toLine}} </i></li>
                        <li><span>逾期利息：</span><i>{{dDebtorInfo.interest | toLine2}} </i></li>
                        <li><span>违约金：</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                        <li><span>手续费：</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                        <li><span>逾期日期：</span><i>{{dDebtorInfo.overdueDateStr | toLine}}</i></li>
                        <li><span>客服电话：</span><i>{{dDebtorInfo.servicePhone | toLine}}</i></li>
                        <li><span>末次还款时间：</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                        <li><span>末次还款金额：</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo.debtType1=='汽车抵押贷款'">
                        <li><span>委案总额：</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                        <li><span>产品名称：</span><i :title="dDebtorInfo.productName">{{dDebtorInfo.productName | toLine}}</i></li>
                        <li><span>车辆型号：</span><i>{{dDebtorInfo.cartype | toLine}}</i></li>
                        <li><span>发动机号：</span><i>{{dDebtorInfo.carenginenumber | toLine}}</i></li>
                        <li><span>车架号：</span><i>{{dDebtorInfo.carehicleframe | toLine}}</i></li>
                        <li><span>合同号：</span><i>{{dDebtorInfo.contractNum | toLine}}</i></li>
                        <li><span>合同日期：</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                        <li><span>合同金额：</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                        <li><span>贷款期数：</span><i>{{dDebtorInfo.loanNper | toLine}}</i></li>
                        <li><span>每期金额：</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                        <li><span>已还期数：</span><i>{{dDebtorInfo.hasAlsoNper | toLine}} </i></li>
                        <li><span>未结清总额：</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                        <li><span>未结清期数：</span><i>{{dDebtorInfo.outstandingNper | toLine}} </i></li>
                        <li><span>剩余本金：</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                        <li><span>逾期本金：</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                        <li><span>逾期期数：</span><i>{{dDebtorInfo.overdueNper | toLine}} </i></li>
                        <li><span>逾期天数：</span><i>{{dDebtorInfo.overdueDaysStr | toLine}} </i></li>
                        <li><span>逾期利息：</span><i>{{dDebtorInfo.interest | toLine2}} </i></li>
                        <li><span>手续费：</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                        <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                        <li><span>逾期日期：</span><i>{{dDebtorInfo.overdueDateStr | toLine}}</i></li>
                        <li><span>客服电话：</span><i>{{dDebtorInfo.servicePhone | toLine}}</i></li>
                        <li><span>末次还款时间：</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                        <li><span>末次还款金额：</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo.debtType1=='房产抵押贷款'">
                        <li><span>委案总额：</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                        <li><span>房抵评估金额：</span><i>{{dDebtorInfo.homeappraisal | toLine2}}</i></li>
                        <li><span>房屋是否有贷款：</span><i>{{dDebtorInfo.homeloansis | toLine}}</i></li>
                        <li><span>房屋是否为一抵：</span><i>{{dDebtorInfo.homeoneisone | toLine}}</i></li>
                        <li><span>房抵手续是否齐全（包含建委）：</span><i>{{dDebtorInfo.homeprocedure | toLine}}</i></li>
                        <li><span>合同号：</span><i>{{dDebtorInfo.contractNum | toLine}}</i></li>
                        <li><span>合同日期：</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                        <li><span>合同金额：</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                        <li><span>贷款期数：</span><i>{{dDebtorInfo.loanNper | toLine}}</i></li>
                        <li><span>每期金额：</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                        <li><span>已还期数：</span><i>{{dDebtorInfo.hasAlsoNper | toLine}}</i></li>
                        <li><span>未结清总额：</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                        <li><span>未结清期数：</span><i>{{dDebtorInfo.outstandingNper | toLine}} </i></li>
                        <li><span>剩余本金：</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                        <li><span>逾期本金：</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                        <li><span>逾期期数：</span><i>{{dDebtorInfo.overdueNper | toLine}} </i></li>
                        <li><span>逾期天数：</span><i>{{dDebtorInfo.overdueDaysStr | toLine}} </i></li>
                        <li><span>逾期利息：</span><i>{{dDebtorInfo.interest | toLine2}} </i></li>
                        <li><span>手续费：</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                        <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                        <li><span>逾期日期：</span><i>{{dDebtorInfo.overdueDateStr | toLine}}</i></li>
                        <li><span>客服电话：</span><i>{{dDebtorInfo.servicePhone | toLine}}</i></li>
                        <li><span>末次还款时间：</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                        <li><span>末次还款金额：</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="middleBox notChecked">
                <ul>
                    <li v-for="item in list" class="divBg">
                        <div v-if="item.role=='客户'" class="leftInfo">
                            <input type="hidden" :value="item.begin" class="item_begin"/>
                            <img class="leftImg" src="<%=basePath%>/newImg/3.2.7/right.svg" alt=""/>
                            <span>债务人</span>
                            <div v-html="$options.filters.redColor(item.words)"></div>
                        </div>
                        <div v-if="item.role=='客服'" class="rightInfo">
                            <input type="hidden" :value="item.begin" class="item_begin"/>
                            <img class="rightImg" src="<%=basePath%>/newImg/3.2.7/left.svg" alt=""/>
                            <span>催收员</span>
                            <div v-html="$options.filters.redColor(item.words)"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="rigthBox right_content">
                 <div class="notChecked">
                     <div class="hitModel" v-if="hitTemplate.length>0">
                         <div class="lineTilte">命中模型</div>
                         <ul class="modelNameList">
                             <li v-for="item in hitTemplate" class="modelNameListLi" onclick="modelNameListLiCheck(this)">
                                 <span class="itemImg"></span>{{item}}
                             </li>
                         </ul>
                     </div>
	                      <div class="speechAnalysis" v-if="callRecordQualityByKey.hitAbusive==1||callRecordQualityByKey.hitComplaint==1||callRecordQualityByKey.hitRidicule==1">
	                         <div class="lineTilte">语音分析</div>
	                         <i v-if="callRecordQualityByKey.hitAbusive==1">
	                         <span class="speech1 speechList" onclick="speechCheck(this,1)">辱骂威胁<img  style="position:relative;top:-2px;left:4px;" src="<%=basePath%>/newImg/3.2.7/speech1.svg" title="系统智能识别辱骂、威胁的情绪" alt=""/></span>
	                         </i>
	                         <i v-if="callRecordQualityByKey.hitComplaint==1">
	                         	<span class="speech2 speechList" onclick="speechCheck(this,2)">客户投诉<img  style="position:relative;top:-2px;left:4px;" src="<%=basePath%>/newImg/3.2.7/speech2.svg" title="系统智能识别扬言投诉、质疑态度等情绪" alt=""/></span>
	                         </i>
	                         <i v-if="callRecordQualityByKey.hitRidicule==1">
	                         	<span class="speech3 speechList" onclick="speechCheck(this,3)">嘲讽客户<img  style="position:relative;top:-2px;left:4px;" src="<%=basePath%>/newImg/3.2.7/speech3.svg" title="系统智能识别讥讽客户、反问质疑客户等情绪" alt=""/></span>
	                         </i>
	                     </div>
                 </div>
                <div class="recheckResult">
                    <div class="lineTilte">复检结果</div>
                    <div>
                        <div class="titleName"><i>*</i>质检结果</div>
                        <div class="selectBox1 disInline"  style="display:inline-block;width:120px;">
                            <input type="text" class="inpNew dropDown cursorP classification" data-id="" data-title="" placeholder="请选择" readonly/>
                            <ul class="selList1" style="width:120px;top:35px;left:0;">
                                <li data-id="1" data-title="1">合规</li>
                                <li data-id="2" data-title="2">提醒</li>
                                <c:forEach items="${VoiceResultList}" var="data">
                                    <li data-id="${data.id}" data-title="3" title="${data.typeName}">${data.typeName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="disInline"  style="display:inline-block;width:160px;position:relative">
                            <input type="text" class="inpNew dropDown cursorP classificationDetails" data-id="" data-title="" data-name="" placeholder="请选择分类明细" readonly disabled/>
                            <ul class="selList2" style="width:160px;top:35px;left:10px;">
                                <li v-for="item in list3" :data-id="item.detailName" :data-name="item.detailCode" :title="item.detailCode+' '+item.detailName">{{item.detailCode}}  {{item.detailName}}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="remarks">
                        <div class="titleName">备注</div>
                        <textarea name="" id="remarks1" maxlength="1000"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="footerBox">
            <div>
                <%--<audio :src="callRecordQualityByKey.filepath" controls id="audio" preload="auto"></audio>--%>
                <%--<audio src="" controls id="audio" preload="auto"></audio>--%>
                <audio src="" controls id="audio" preload="auto"></audio>
                    <input type="hidden" id="audioSrc" :value="callRecordQualityByKey.filepath"/>
                <%--<a id="downAudio" target="tempiframe">下载录音</a><iframe name="tempiframe" style="display:none"></iframe>--%>
            </div>
            <div>
                <button class="submitNextBtn">提交并复检下一条</button>
                <button class="submitBtn">提交</button>
            </div>
        </div>
    </div>
    <div id="seeBox">
        <input type="hidden" id="isQuality2"/>
        <input type="hidden" id="_id2"/>
        <div class="contetnBox">
            <div class="leftBox">
                <div class="staffInfo">
                    <div class="lineTilte">员工：{{callRecordQualityByKey2.empName}}</div>
                    <div class="listInfo"><span class="titleInfo">催收机构：</span><span class="limitWidth" :title="callRecordQualityByKey2.collectionName">{{callRecordQualityByKey2.collectionName}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">部门：</span><span class="department">{{callRecordQualityByKey2.departName}}</span></div>
                </div>
                <div class="obligorInfo">
                    <div class="lineTilte">债务人：{{callRecordQualityByKey2.debtorName | toLine}}</div>
                    <div  class="listInfo"><span class="titleInfo">委单方：</span><span class="limitWidth">{{callRecordQualityByKey2.nickname}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">呼叫时间：</span><span class="department">{{callRecordQualityByKey2.callingTimeStr}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">电话：</span><span class="department">{{callRecordQualityByKey2.passtiveNum}}</span></div>
                    <div  class="listInfo"><span class="titleInfo">与本人关系：</span><span class="department">{{callRecordQualityByKey2.contactsRelationship | toLine}}</span></div>
                </div>
                <div class="loanInfo" v-if="dDebtorInfo2">
                    <div class="lineTilte">贷款信息
                        <span class="marRight hide">收起</span>
                    </div>
                    <div class="showHide">
                        <ul v-if="dDebtorInfo2.debtType1=='小额现金贷款'">
                            <li><span>委案总额：</span><i>{{dDebtorInfo2.totalAmount | toLine2}}</i></li>
                            <li><span>贷款名称：</span><i :title="dDebtorInfo2.debtType2">{{dDebtorInfo2.debtType2 | toLine}}</i></li>
                            <li><span>商品名称/型号：</span><i :title="dDebtorInfo2.debtType3">{{dDebtorInfo2.debtType3 | toLine}}</i></li>
                            <li><span>合同号：</span><i>{{dDebtorInfo2.contractNum | toLine}}</i></li>
                            <li><span>合同日期：</span><i>{{dDebtorInfo2.contractDateStr | toLine}}</i></li>
                            <li><span>合同金额：</span><i>{{dDebtorInfo2.contractAmount | toLine2}}</i></li>
                            <li><span>贷款期数：</span><i>{{dDebtorInfo2.loanNper | toLine}}</i></li>
                            <li><span>每期金额：</span><i>{{dDebtorInfo2.eachAmount | toLine2}}</i></li>
                            <li><span>已还期数：</span><i>{{dDebtorInfo2.hasAlsoNper | toLine}}</i></li>
                            <li><span>未结清总额：</span><i>{{dDebtorInfo2.outstandingAmount | toLine2}}</i></li>
                            <li><span>未结清期数：</span><i>{{dDebtorInfo2.outstandingNper | toLine}}</i></li>
                            <li><span>剩余本金：</span><i>{{dDebtorInfo2.remainingPrincipal | toLine2}}</i></li>
                            <li><span>逾期本金：</span><i>{{dDebtorInfo2.principal | toLine2}}</i></li>
                            <li><span>逾期期数：</span><i>{{dDebtorInfo2.overdueNper | toLine}}</i></li>
                            <li><span>逾期天数：</span><i>{{dDebtorInfo2.overdueDaysStr | toLine}}</i></li>
                            <li><span>逾期利息：</span><i>{{dDebtorInfo2.interest | toLine2}}</i></li>
                            <li><span>违约金：</span><i>{{dDebtorInfo2.penalty | toLine2}}</i></li>
                            <li><span>手续费：</span><i>{{dDebtorInfo2.otherCost | toLine2}}</i></li>
                            <li><span>逾期日期：</span><i>{{dDebtorInfo2.overdueDateStr | toLine}}</i></li>
                            <li><span>客服电话：</span><i>{{dDebtorInfo2.servicePhone| toLine}}</i></li>
                            <li><span>末次还款时间：</span><i>{{dDebtorInfo2.finalPaymentTimeStr| toLine}}</i></li>
                            <li><span>末次还款金额：</span><i>{{dDebtorInfo2.finalPaymentAmount| toLine2}}</i></li>
                        </ul>
                        <ul v-if="dDebtorInfo2.debtType1=='消费分期'">
                            <li><span>委案总额：</span><i>{{dDebtorInfo2.totalAmount | toLine2}}</i></li>
                            <li><span>合同号：</span><i>{{dDebtorInfo2.contractNum| toLine}}</i></li>
                            <li><span>订单日期：</span><i>{{dDebtorInfo2.contractDateStr| toLine}} </i></li>
                            <li><span>合同金额：</span><i>{{dDebtorInfo2.contractAmount | toLine2}} </i></li>
                            <li><span>商品名称：</span><i :title="dDebtorInfo2.debtType3">{{dDebtorInfo2.debtType3| toLine}}</i></li>
                            <li><span>商品分期价格：</span><i>{{dDebtorInfo2.instalmentsprice | toLine2}} </i></li>
                            <li><span>商品价格：</span><i>{{dDebtorInfo2.stugoodprice | toLine2}}</i></li>
                            <li><span>首付价格：</span><i>{{dDebtorInfo2.firstpaymoney | toLine2}} </i></li>
                            <li><span>分期期数：</span><i>{{dDebtorInfo2.loanNper | toLine}} </i></li>
                            <li><span>每期还款金额：</span><i>{{dDebtorInfo2.eachAmount | toLine2}} </i></li>
                            <li><span>账单日：</span><i>{{dDebtorInfo2.statementDateStr | toLine}} </i></li>
                            <li><span>最后还款日：</span><i>{{dDebtorInfo2.monthlydeadline| toLine}} </i></li>
                            <li><span>已还期数：</span><i>{{dDebtorInfo2.hasAlsoNper| toLine}} </i></li>
                            <li><span>未结清总额：</span><i>{{dDebtorInfo2.outstandingAmount | toLine2}} </i></li>
                            <li><span>未结清期数：</span><i>{{dDebtorInfo2.outstandingNper| toLine}} </i></li>
                            <li><span>剩余本金：</span><i>{{dDebtorInfo2.remainingPrincipal | toLine2}} </i></li>
                            <li><span>逾期本金：</span><i>{{dDebtorInfo2.principal | toLine2}} </i></li>
                            <li><span>逾期期数：</span><i>{{dDebtorInfo2.overdueNper| toLine}} </i></li>
                            <li><span>逾期天数：</span><i>{{dDebtorInfo2.overdueDaysStr| toLine}} </i></li>
                            <li><span>逾期利息：</span><i>{{dDebtorInfo2.interest  | toLine2}} </i></li>
                            <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo2.penalty | toLine2}} </i></li>
                            <li><span>手续费（罚息）：</span><i>{{dDebtorInfo2.otherCost | toLine2}} </i></li>
                            <li><span>逾期日期：</span><i>{{dDebtorInfo2.overdueDateStr | toLine}}</i></li>
                            <li><span>客服电话：</span><i>{{dDebtorInfo2.servicePhone | toLine}}</i></li>
                            <li><span>末次还款时间：</span><i>{{dDebtorInfo2.finalPaymentTimeStr | toLine}} </i></li>
                            <li><span>末次还款金额：</span><i>{{dDebtorInfo2.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo2.debtType1=='大额现金贷款'">
                            <li><span>委案总额：</span><i>{{dDebtorInfo2.totalAmount | toLine2}}</i></li>
                            <li><span>贷款名称：</span><i :title="dDebtorInfo2.debtType2">{{dDebtorInfo2.debtType2 | toLine}}</i></li>
                            <li><span>商品名称/型号：</span><i :title="dDebtorInfo2.debtType3">{{dDebtorInfo2.debtType3 | toLine}}</i></li>
                            <li><span>合同号：</span><i>{{dDebtorInfo2.contractNum | toLine}}</i></li>
                            <li><span>合同日期：</span><i>{{dDebtorInfo2.contractDateStr| toLine}}</i></li>
                            <li><span>合同金额：</span><i>{{dDebtorInfo2.contractAmount | toLine2}}</i></li>
                            <li><span>贷款期数：</span><i>{{dDebtorInfo2.loanNper | toLine}}</i></li>
                            <li><span>每期金额：</span><i>{{dDebtorInfo2.eachAmount | toLine2}}</i></li>
                            <li><span>已还期数：</span><i>{{dDebtorInfo2.hasAlsoNper | toLine}} </i></li>
                            <li><span>未结清总额：</span><i>{{dDebtorInfo2.outstandingAmount | toLine2}} </i></li>
                            <li><span>未结清期数：</span><i>{{dDebtorInfo2.outstandingNper | toLine}} </i></li>
                            <li><span>剩余本金：</span><i>{{dDebtorInfo2.remainingPrincipal | toLine2}} </i></li>
                            <li><span>逾期本金：</span><i>{{dDebtorInfo2.principal | toLine2}} </i></li>
                            <li><span>逾期期数：</span><i>{{dDebtorInfo2.overdueNper | toLine}} </i></li>
                            <li><span>逾期天数：</span><i>{{dDebtorInfo2.overdueDaysStr | toLine}} </i></li>
                            <li><span>逾期利息：</span><i>{{dDebtorInfo2.interest | toLine2}} </i></li>
                            <li><span>违约金：</span><i>{{dDebtorInfo2.penalty | toLine2}} </i></li>
                            <li><span>手续费：</span><i>{{dDebtorInfo2.otherCost | toLine2}} </i></li>
                            <li><span>逾期日期：</span><i>{{dDebtorInfo2.overdueDateStr | toLine}} </i></li>
                            <li><span>客服电话：</span><i>{{dDebtorInfo2.servicePhone | toLine}}</i></li>
                            <li><span>末次还款时间：</span><i>{{dDebtorInfo2.finalPaymentTimeStr | toLine}} </i></li>
                            <li><span>末次还款金额：</span><i>{{dDebtorInfo2.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo2.debtType1=='汽车抵押贷款'">
                            <li><span>委案总额：</span><i>{{dDebtorInfo2.totalAmount | toLine2}}</i></li>
                            <li><span>产品名称：</span><i :title="dDebtorInfo2.productName">{{dDebtorInfo2.productName | toLine}} </i></li>
                            <li><span>车辆型号：</span><i>{{dDebtorInfo2.cartype | toLine}}</i></li>
                            <li><span>发动机号：</span><i>{{dDebtorInfo2.carenginenumber | toLine}}</i></li>
                            <li><span>车架号：</span><i>{{dDebtorInfo2.carehicleframe | toLine}}</i></li>
                            <li><span>合同号：</span><i>{{dDebtorInfo2.contractNum | toLine}}</i></li>
                            <li><span>合同日期：</span><i>{{dDebtorInfo2.contractDateStr | toLine}}</i></li>
                            <li><span>合同金额：</span><i>{{dDebtorInfo2.contractAmount | toLine2}}</i></li>
                            <li><span>贷款期数：</span><i>{{dDebtorInfo2.loanNper | toLine}}</i></li>
                            <li><span>每期金额：</span><i>{{dDebtorInfo2.eachAmount | toLine2}}</i></li>
                            <li><span>已还期数：</span><i>{{dDebtorInfo2.hasAlsoNper | toLine}} </i></li>
                            <li><span>未结清总额：</span><i>{{dDebtorInfo2.outstandingAmount | toLine2}} </i></li>
                            <li><span>未结清期数：</span><i>{{dDebtorInfo2.outstandingNper | toLine}} </i></li>
                            <li><span>剩余本金：</span><i>{{dDebtorInfo2.remainingPrincipal | toLine2}} </i></li>
                            <li><span>逾期本金：</span><i>{{dDebtorInfo2.principal | toLine2}} </i></li>
                            <li><span>逾期期数：</span><i>{{dDebtorInfo2.overdueNper | toLine}} </i></li>
                            <li><span>逾期天数：</span><i>{{dDebtorInfo2.overdueDaysStr | toLine}} </i></li>
                            <li><span>逾期利息：</span><i>{{dDebtorInfo2.interest | toLine2}} </i></li>
                            <li><span>手续费：</span><i>{{dDebtorInfo2.otherCost | toLine2}} </i></li>
                            <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo2.penalty | toLine2}} </i></li>
                            <li><span>逾期日期：</span><i>{{dDebtorInfo2.overdueDateStr | toLine}}</i></li>
                            <li><span>客服电话：</span><i>{{dDebtorInfo2.servicePhone | toLine}}</i></li>
                            <li><span>末次还款时间：</span><i>{{dDebtorInfo2.finalPaymentTimeStr | toLine}} </i></li>
                            <li><span>末次还款金额：</span><i>{{dDebtorInfo2.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                        <ul v-else-if="dDebtorInfo2.debtType1=='房产抵押贷款'">
                            <li><span>委案总额：</span><i>{{dDebtorInfo2.totalAmount | toLine2}}</i></li>
                            <li><span>房抵评估金额：</span><i>{{dDebtorInfo2.homeappraisal | toLine2}}</i></li>
                            <li><span>房屋是否有贷款：</span><i>{{dDebtorInfo2.homeloansis | toLine}}</i></li>
                            <li><span>房屋是否为一抵：</span><i>{{dDebtorInfo2.homeoneisone | toLine}}</i></li>
                            <li><span>房抵手续是否齐全（包含建委）：</span><i>{{dDebtorInfo2.homeprocedure | toLine}}</i></li>
                            <li><span>合同号：</span><i>{{dDebtorInfo2.contractNum | toLine}}</i></li>
                            <li><span>合同日期：</span><i>{{dDebtorInfo2.contractDateStr | toLine}}</i></li>
                            <li><span>合同金额：</span><i>{{dDebtorInfo2.contractAmount | toLine2}}</i></li>
                            <li><span>贷款期数：</span><i>{{dDebtorInfo2.loanNper | toLine}}</i></li>
                            <li><span>每期金额：</span><i>{{dDebtorInfo2.eachAmount | toLine2}}</i></li>
                            <li><span>已还期数：</span><i>{{dDebtorInfo2.hasAlsoNper | toLine}} </i></li>
                            <li><span>未结清总额：</span><i>{{dDebtorInfo2.outstandingAmount | toLine2}} </i></li>
                            <li><span>未结清期数：</span><i>{{dDebtorInfo2.outstandingNper | toLine}} </i></li>
                            <li><span>剩余本金：</span><i>{{dDebtorInfo2.remainingPrincipal | toLine2}} </i></li>
                            <li><span>逾期本金：</span><i>{{dDebtorInfo2.principal | toLine2}} </i></li>
                            <li><span>逾期期数：</span><i>{{dDebtorInfo2.overdueNper | toLine}} </i></li>
                            <li><span>逾期天数：</span><i>{{dDebtorInfo2.overdueDaysStr | toLine}} </i></li>
                            <li><span>逾期利息：</span><i>{{dDebtorInfo2.interest | toLine2}} </i></li>
                            <li><span>手续费：</span><i>{{dDebtorInfo2.otherCost | toLine2}} </i></li>
                            <li><span>违约金（滞纳金）：</span><i>{{dDebtorInfo2.penalty | toLine2}} </i></li>
                            <li><span>逾期日期：</span><i>{{dDebtorInfo2.overdueDateStr | toLine}}</i></li>
                            <li><span>客服电话：</span><i>{{dDebtorInfo2.servicePhone | toLine}}</i></li>
                            <li><span>末次还款时间：</span><i>{{dDebtorInfo2.finalPaymentTimeStr | toLine}} </i></li>
                            <li><span>末次还款金额：</span><i>{{dDebtorInfo2.finalPaymentAmount | toLine2}} </i></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="middleBox notChecked2">
                <ul>
                    <li v-for="item in list12">
                        <div v-if="item.role=='客户'" class="leftInfo">
                            <img class="leftImg" src="<%=basePath%>/newImg/3.2.7/right.svg" alt=""/>
                            <span>债务人</span>
                            <div v-html="$options.filters.redColor2(item.words)"></div>
                        </div>
                        <div v-if="item.role=='客服'" class="rightInfo">
                            <img class="rightImg" src="<%=basePath%>/newImg/3.2.7/left.svg" alt=""/>
                            <span>催收员</span>
                            <div v-html="$options.filters.redColor2(item.words)"></div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="rigthBox rigthBoxContent">
                <div v-show="modify">
                   <div v-if="detailList2.length>0" v-for="item in detailList2">
                       <div class="lineTilte" style="margin-top:20px;">复检结果</div>
                       <ul>
                           <li >
                               <div>
                                   <span class="titleName marTB">质检结果</span>
                                   <div v-if="item.qualityResult=='合规'" style="color:#6DD230;">{{item.qualityResult}}</div>
                                   <div v-else-if="item.qualityResult=='提醒'" style="color:#FFAB2B">{{item.qualityResult}}</div>
                                   <div  v-else class="fontS"><div style="color:#FF7687;">{{item.qualityResult}}</div>
                                       <span v-if="item.qualityResultDetail!=''" :title="item.remark1 +'| '+ item.qualityResultDetail">{{item.remark1}} | {{item.qualityResultDetail}}</span>
                                   </div>
                               </div>
                               <div>
                                   <span class="titleName marTB">备注</span>
                                   <div class="fontS">
                                       {{item.remark}}
                                   </div>
                               </div>
                           </li>
                       </ul>
                   </div>
                </div>
                <div class="recheckResult" v-show="!modify">
                    <div class="lineTilte">复检结果</div>
                    <div>
                        <div class="titleName"><i>*</i>质检结果</div>
                        <div class="selectBox3 disInline"  style="display:inline-block;width:120px;position:relative">
                            <input type="text" class="inpNew dropDown cursorP classification2" data-title="" data-id="" placeholder="请选择" readonly/>
                            <ul class="selList3" style="width:120px;top:35px;left:0;">
                                <li data-id="1" data-title="1">合规</li>
                                <li data-id="2" data-title="2">提醒</li>
                                <c:forEach items="${VoiceResultList}" var="data">
                                    <li data-id="${data.id}" data-title="3" title="${data.typeName}">${data.typeName}</li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="disInline"  style="display:inline-block;width:160px;position:relative">
                            <input type="text" class="inpNew dropDown cursorP classificationDetails2" data-id="" data-title="" data-name="" placeholder="请选择分类明细" readonly disabled/>
                            <ul class="selList4" style="width:160px;top:35px;left:10px;">
                                <li v-for="item in list32" :data-id="item.detailName" :data-name="item.detailCode" :title="item.detailCode+' '+item.detailName">{{item.detailCode}} {{item.detailName}}</li>
                            </ul>
                        </div>
                    </div>
                    <div class="remarks">
                        <div class="titleName">备注</div>
                        <textarea name="" id="remarks2" maxlength="1000"></textarea>
                    </div>
                </div>
            </div>
        </div>
        <div class="footerBox2">
            <div>
                <audio :src="callRecordQualityByKey2.listenFilepath" preload="auto" controls id="audio2"></audio>
                <%--<a :href="callRecordQualityByKey2.filepath" id="downAudio2">下载录音</a>--%>
            </div>
            <div v-if="modify">
                <button class="submitNextBtn2">下一条</button>
                <button class="submitBtn2">修改</button>
            </div>
            <div v-else="!modify">
                <button class="keepBtn2">保存</button>
                <button class="cancelBtn">取消</button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var appThat;
    var mapList=[]
    var mapList2=[]
    var app = new Vue({
        el:'#main',
        data:{
            modify:true,
            list2:[],
            list3:{},
            list:[],
           	isHitTemplate:0,
			hitAbusive:0,
			hitComplaint:0,
			hitRidicule:0,
			isHitQuality:0,
			isQuality:0,
			callRecordQualityByKey:{},
            hitTemplate:[],
			dDebtorInfo:{},
			VoiceResultList:[],
            callRecordQualityByKey2:{},
            dDebtorInfo2:{},
            VoiceResultList2:[],
            mapList2:[],
            list32:{},
            list12:[],
            detailList2:[],
        },
        beforeCreate: function () {
            appThat = this;
        },
        filters:{
            redColor:function(val){
                var tokens = mapList
                var l = new Array();
                $.each(tokens, function (k, v) {
                    l.push(new RegExp(v, "g"))
                });
                var result = '';  // 用于接收每次循环匹配的结果
                var result1 = '';  // 收集多个匹配结果，用于后续的展示等
                var new_doc = val;  // 用于返回匹配后的新的字符串
                for (var i = 0; i < l.length; i++) {
                    while ((result = l[i].exec(val)) != null) {
                        result1 += result + ' . ';  // 我这里是拼接为字符串，也可以替换为数组
                        // 将匹配到结果替换到传过来的字符串
                        var reg = new RegExp(result, 'g');
                        new_doc = new_doc.replace(reg, '<i style="color:red;display:inline;">' + result + '</i>');
                    }
                }
                // 根据需要返回内容
                return new_doc;
            },
            redColor2:function(val){
                var tokens = mapList2
                var l = new Array();
                $.each(tokens, function (k, v) {
                    l.push(new RegExp(v, "g"))
                });
                var result = '';  // 用于接收每次循环匹配的结果
                var result1 = '';  // 收集多个匹配结果，用于后续的展示等
                var new_doc = val;  // 用于返回匹配后的新的字符串
                for (var i = 0; i < l.length; i++) {
                    while ((result = l[i].exec(val)) != null) {
                        result1 += result + ' . ';  // 我这里是拼接为字符串，也可以替换为数组
                        // 将匹配到结果替换到传过来的字符串
                        var reg = new RegExp(result, 'g');
                        new_doc = new_doc.replace(reg, '<i style="color:red;display:inline;">' + result + '</i>');
                    }
                }
                // 根据需要返回内容
                return new_doc;
            },
            toLine2:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0.00';
                }else{
                    return (parseFloat(value).toFixed(2)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toNumber0:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0';
                }else{
                    return (parseFloat(value).toFixed(0)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toLine:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '- -';
                }else{
                    return value;
                }
            }
        }
    })
    $('.selectBox5').on('click',function(e){
        $(".selList5").hide()
        $(".selList5 li").each(function(index,ele){
            $(ele).removeClass("selected")
        })
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList').not($(this).children('.selList')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList').toggle();
    });
    $('.checkResult2 li').on('click',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id"));
        $(this).addClass('selected').siblings().removeClass('selected');
//        alert( $(this).parents(".selectBox1").siblings(".disInline").html())
        $("#checkListName2").val("")
        $("#checkListName2").attr("data-id","")
        if($(this).text()=="合规" || $(this).text()=="提醒" ||$(this).text()=="优质"){
            $(this).parents("td").siblings(".box6").find(".disInline").removeClass('selectBox6')
            $("#checkListName2").attr("disabled",true)
        }else{
            $(this).parents("td").siblings(".box6").find(".disInline").addClass('selectBox6')
            $("#checkListName2").attr("disabled",true)
            app.list2=[];
            $.ajax({
                type:"post",
                async: false,
                url:"<%=basePath%>manageBg/callRecordQuality/voiceResultDetail.do?id="+$(this).attr("data-id"),
                dataType:"json",
                success:function(data){
//                    console.log(data);
                    app.list2=data.resultDetailList;
                }
            })
        }
    });
    /*点击模型名称定位*/
    function modelNameListLiCheck(obj){
        $(obj).addClass('modelNameListLiCheck').siblings().removeClass('modelNameListLiCheck');
        $(".speechList").each(function(index,ele){
            $(ele).removeClass('speech1Bor speech2Bor speech3Bor')
        })
        $(".item_begin").each(function(index,ele){
            if($(ele).val()=='27200'){
                var divBgheight=0
                $(".divBg").each(function(i,ele){
                    if(i<index){
                        divBgheight+=parseInt($(this).height())
                    }
                })
                console.log(divBgheight)
                $(".middleBox").scrollTop(divBgheight);
            }
        })
    }
    function speechCheck(obj,num){
        $(".item_begin").each(function(index,ele){
            if($(ele).val()=='27200'){
                var divBgheight=0
                $(".divBg").each(function(i,ele){
                    if(i<index){
                        divBgheight+=parseInt($(this).height())
                    }
                })
                console.log(divBgheight)
                $(".middleBox").scrollTop(divBgheight);
            }
        })
        $(".modelNameListLi").each(function(index,ele){
            $(ele).removeClass('modelNameListLiCheck')
        })
        if(num==1){
            $(obj).addClass('speech1Bor').parent('i').siblings().find('span').removeClass('speech2Bor speech3Bor')
        }else if(num==2){
            $(obj).addClass('speech2Bor').parent('i').siblings().find('span').removeClass('speech1Bor speech3Bor')
        }else if(num==3){
            $(obj).addClass('speech3Bor').parent('i').siblings().find('span').removeClass('speech2Bor speech1Bor')
        }
    }
    $(document).on('click','.selectBox6',function(e){
        $(".checkResult2").hide()
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList5').not($(this).children('.selList5')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList5').toggle();
    });
    $(document).on('click','.selList5 li',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id"));
        $(this).addClass('selected').siblings().removeClass('selected');
    });
    $('.selectBox').on('click',function(e){
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList').not($(this).children('.selList')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList').toggle();
    });
    $('.selList li').on('click',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id"));
        $(this).addClass('selected').siblings().removeClass('selected');
    });
    $('.selectBox1').on('click',function(e){
        $(".selList2 li").each(function(index,ele){
            $(ele).removeClass("selected")
        })
        $(".selList2").hide()
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList1').not($(this).children('.selList1')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList1').toggle();
    });
    $('.selList1 li').on('click',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id")).attr("data-title",$(this).attr("data-title"));
        $(this).addClass('selected').siblings().removeClass('selected');
        $(".classificationDetails").val("")
        $(".classificationDetails").attr("data-id","")
        $(".classificationDetails").attr("data-title","")
        $(".classificationDetails").attr("data-name","")
        if($(this).text()=="合规" || $(this).text()=="提醒"){
            $(this).parents(".selectBox1").siblings(".disInline").removeClass('selectBox2')
        }else{
            $(this).parents(".selectBox1").siblings(".disInline").addClass('selectBox2')
            $.ajax({
                type:"post",
                async: false,
                url:"<%=basePath%>manageBg/callRecordQuality/voiceResultDetail.do?id="+$(this).attr("data-id"),
                dataType:"json",
                success:function(data){
//                    console.log(data);
                    app.list3=data.resultDetailList;
                }
            })
        }

    });
    $(document).on('click','.selectBox2',function(e){
        $(".selList1").hide()
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList2').not($(this).children('.selList2')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList2').toggle();
    });
    $(document).on('click','.selList2 li',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id")).attr("data-title",$(this).text()).attr("data-name",$(this).attr("data-name"));
        $(this).addClass('selected').siblings().removeClass('selected');
    });
    $(document).on('click',function(){
        $('.selList').hide();
        $('.selList1').hide();
        $('.selList2').hide();
        $('.selList3').hide();
        $('.selList4').hide();
        $('.selList5').hide();
    });
    //展开委单方下拉列表
    function showNickList(){
        if($('#nameBox').is(':hidden')){
            $('#nameBox').show();
            $('#nickNameTemp').val('');
            $('#sul .whiteBc').show();
            $('#sul .redBc').hide();
            $('#sul').show();
            $('#masking').show();
        }else{
            $('#nameBox').hide();
        }
    }
    //查询委单方
    function searchname(){
        var inpVal = $('#nickNameTemp').val();
        if(inpVal!=''){
            $('#sul .redBc').hide();
            var biaoji=0;
            $('#sul li').css('display','none');
            $('#sul .whiteBc').each(function(){
                if($(this).text().indexOf(inpVal)>-1){
                    $(this).show();
                    biaoji=1;
                }else{
                    return;
                }
            });
            if (biaoji<1){
                $('#sul li').css('display','none');
                $('#sul .redBc').show();
            }
            $('#sul').show();
        } else{
            $('#sul .redBc').hide();
            $('#sul .whiteBc').show();
        }
    }
    $('#sul').on('click','.whiteBc',function(event){
        event.stopPropagation();
        var idandname = $(this).attr('data-title');
        var id=$(this).attr('data-id');
        $(this).addClass('selected').siblings().removeClass('selected');
        $("#nickName").val($.trim($(this).text()));
        $("#nickName").attr('data-id', $.trim($(this).attr('data-id')));
        $('#nameBox').hide();
        $('#masking').hide();
    });
    //催收机构
    function showNickList1(){
        if($('#nameBox1').is(':hidden')){
            $('#nameBox1').show();
            $('#nickNameTemp1').val('');
            $('#sul1 .whiteBc').show();
            $('#sul1 .redBc').hide();
            $('#sul1').show();
            $('#masking').show();
        }else{
            $('#nameBox1').hide();
        }
    }
    //查询委单方
    function searchname1(){
        var inpVal = $('#nickNameTemp1').val();
        if(inpVal!=''){
            $('#sul1 .redBc').hide();
            var biaoji=0;
            $('#sul1 li').css('display','none');
            $('#sul1 .whiteBc').each(function(){
                if($(this).text().indexOf(inpVal)>-1){
                    $(this).show();
                    biaoji=1;
                }else{
                    return;
                }
            });
            if (biaoji<1){
                $('#sul1 li').css('display','none');
                $('#sul1 .redBc').show();
            }
            $('#sul1').show();
        } else{
            $('#sul1 .redBc').hide();
            $('#sul1 .whiteBc').show();
        }
    }
    $('#sul1').on('click','.whiteBc',function(event){
        event.stopPropagation();
        var idandname = $(this).attr('data-title');
        var id=$(this).attr('data-id');
        $(this).addClass('selected').siblings().removeClass('selected');
        $("#collecteAgency").val($.trim($(this).text()));
        $("#collecteAgency").attr('data-id', $.trim($(this).attr('data-id')));
        $('#nameBox1').hide();
        $('#masking').hide();
    });
    $(document).on('click','.tabLi',function(){
        if($(this).text()=='待检录音'){
            $(this).addClass('tabOn').siblings().removeClass('tabOn');
            $(".tabBox1").show()
            $(".tabBox2").hide();
            initTable()
        }else if($(this).text()=='已检录音'){
            $(this).addClass('tabOn').siblings().removeClass('tabOn');
            $(".tabBox1").hide();
            $(".tabBox2").show();
            initTable2()
        }
    })
    function searchDate(type,obj){
        var liNum=$(obj).find('.liNum').text();
        if(liNum!=0){
            resetBtn();
            $(obj).find('p').addClass('colorBlue').parent('div').siblings().find('p').removeClass('colorBlue');
            $(obj).addClass('onLine').siblings().removeClass('onLine');
            initTable(type);
            if(type==1){
                _czc.push(["_trackEvent","模型命中","点击模型命中次数"]);
            }else if(type==2){
                _czc.push(["_trackEvent","辱骂威胁","点击辱骂威胁次数"]);
            }else if(type==3){
                _czc.push(["_trackEvent","客户投诉","点击客户投诉次数"]);
            }else if(type==4){
                _czc.push(["_trackEvent","嘲讽客户","点击嘲讽客户次数"]);
            }else if(type==5){
                _czc.push(["_trackEvent","智能质检未命中","点击智能质检未命中次数"]);
            }else if(type==6){
                _czc.push(["_trackEvent","未送检","点击未送检次数"]);
            }
        }
    }

    //循环表头查看属性
    function tableHeader(){
//        console.log("1111")
        var customArray=[];
        $(".layui-table-box .layui-table-header table thead tr th").each(function(){
            $(this).hasClass("layui-hide");
            var customName=$(this).text();
            var customValue=$(this).hasClass("layui-hide");
            var obj={name:customName,value:customValue};
            customArray.push(obj)
        })
        var cuishoufang="待检录音"
//        console.log(customArray)
        $.ajax({
            type:"post",
            async: false,
            url:"<%=basePath%>" +"sys/columns/saveBg.do?menu="+cuishoufang+"&columnTxt="+JSON.stringify(customArray),
            dataType:"json",
            success:function(data){
            }
        })
    }
    //页面加载完动作
    var nowTime="${now}".split(" - ")[0]
    var minDate=GetDateStrMin(-14)
    //高级筛选
    var stateBtn=null;//高级筛选状态
    $('.advQuery1').on('click',function(){
        if(getComputedStyle($('.advQueryItem1')[0]).display=='none'){
            _czc.push(["_trackEvent","高级筛选","点击高级筛选的次数"]);
            $(this).find('img').attr('src','<%=basePath%>newImg/dateUp.png');
            stateBtn=0;
//            initTable();
            $(".searchBtnOne1").hide()
            $(".searchBtnTwo1").show()
            $(".advQueryNext1").text("收起筛选");
        }else{
            $(this).find('img').attr('src','<%=basePath%>newImg/dateDown.png');
            $(".searchBtnOne1").show()
            $(".searchBtnTwo1").hide()
            stateBtn=1
//            initTable();
            $(".advQueryNext1").text("高级筛选");
        }
        $('.advQueryItem1').toggle();
    });
    $(document).ready(function(){
    	initSixNum();
        initTable();
        $(document).on('click','.searchTable',function(){
            var dateTime=nowTime +' - '+ nowTime
            if($("#dateTime").val()!=dateTime){
                if($("#obligorName").val()=="" && $("#phoneNumber").val()==""){
                    layer.msg("查询非今日数据时债务人姓名、被叫号码必填");
                }else{
                    initTable()
                }
            }else{
                initTable()
            }
        })
        $(document).on('click','.searchTable2',function(){
//            var dateTime=nowTime +' - '+ nowTime
//            if($("#dateTime2").val()!=dateTime){
//                if($("#obligorName2").val()=="" && $("#phoneNumber2").val()==""){
//                    layer.msg("查询非今日数据时债务人姓名、被叫号码必填");
//                }else{
//                    initTable2()
//                }
//            }else{
                initTable2()
//            }
        })
        //树状图
        var tree = layui.tree
        <%--var defaultData =${deptNameList};--%>
//        tree.render({
//            elem:'#test13',
//            data:defaultData
//            ,showLine: false , //是否开启连接线
//            click: function(obj){
//                console.log(obj.data); //得到当前点击的节点数据
//                console.log(obj.state); //得到当前节点的展开状态：open、close、normal
//                console.log(obj.elem); //得到当前节点元素
//                $("#departName").val(obj.data.title)
//                $("#departId").val(obj.data.id)
//                console.log(obj.data.children); //当前节点下是否有子节点
//                $("#treeBox").hide();
//                $("#masking").hide();
//            }
//        });
    });
    /*判断列表是否展示*/
    function tryCeach(list,e){
        console.log("每一项的数据",list)
        var flag=false
        for(var i=0;i<list.length;i++){
            if(list[i].name==e){
                flag=true
                return list[i].value;
            }
        }
        if(!flag) {
            return false
        }
    }
    function initTable(type){
        var theHeight= ''
        if(stateBtn==0){
            theHeight= "full-360"
        }else if(stateBtn==1){
            theHeight= "full-270"
        }else if(stateBtn==null){
            theHeight= "full-270"
        }
        var callingTimeStart=""
        var callingTimeEnd=""
        var dateTime=$("#dateTime").val() || nowTime + " - " +nowTime;
        if(type ==undefined || type=="" || type== null){
            callingTimeStart=ConverToDate2(dateTime.split(" - ")[0])
            callingTimeEnd=ConverToDate2(dateTime.split(" - ")[1])
        }else{
            callingTimeStart=""
            callingTimeEnd=""
        }
//        console.log(dateTime+"---------"+callingTimeStart+"1111"+callingTimeEnd+"-------"+type)
        var dataList="";
        
        var checkResultStr=$("#checkResult").val();
        if(checkResultStr=='全部'){
        	checkResultStr='';
        }
        var nickName_param=$.trim($("#nickName").val());
        if(nickName_param=='全部'){
        	nickName_param='';
        }
        $.ajax({
            type:"post",
            async: false,
            url:"<%=basePath%>" +"sys/columns/listBg.do?menu="+'待检录音',
            dataType:"json",
            success:function(data){
                console.log(data)
//                var data=JSON.parse(data)
                var cTxt = data.columnTxt;
                if(cTxt==''){
                    cTxt = "[" +
                            "{\"name\":\"\",\"value\":false}," +
                            "{\"name\":\"委单方\",\"value\":true}," +
                            "{\"name\":\"催收机构\",\"value\":false}," +
                            "{\"name\":\"部门\",\"value\":false}," +
                            "{\"name\":\"催收员\",\"value\":false}," +
                            "{\"name\":\"被叫号码\",\"value\":false}," +
                            "{\"name\":\"呼叫时间\",\"value\":false}," +
                            "{\"name\":\"录音时长\",\"value\":false}," +
                            "{\"name\":\"是否命中\",\"value\":false}," +
                            "{\"name\":\"命中模型\",\"value\":false}," +
                            "{\"name\":\"关键词\",\"value\":false}," +
                            "{\"name\":\"辱骂威胁\",\"value\":true}," +
                            "{\"name\":\"客户投诉\",\"value\":true}," +
                            "{\"name\":\"嘲讽客户\",\"value\":true}," +
                            "{\"name\":\"操作\",\"value\":false}" +
                            "]";
                    cTxt = JSON.parse(cTxt);
                }
                console.log(cTxt)
                dataList= cTxt;
            }
        });

        var table = layui.table;
        var layer = layui.layer;
        //打开遮罩
        var index = layer.load(1, {
            shade: [0.1,'#000']
        });
        //第一个实例
        table.render({
            elem: '#demo',
            id:"demos",
            loading:false,
            toolbar: '#toolbarDemo',
            where: {
                inspectionFalg : "0", //0待质检页面-固定存在
                callingTimeStart:callingTimeStart,//呼叫开始时间
                callingTimeEnd:callingTimeEnd,//呼叫结束时间
                debtorName: $.trim($("#obligorName").val()),//债务人姓名
                passtiveNum:$.trim($("#phoneNumber").val()),//被叫号码
                nickname:nickName_param,//委单方昵称
                empName: $.trim($("#collector").val()),//催收员
                collectionInfoId:$("#collecteAgency").attr("data-id"),//催收机构id
                callDurationStart: $.trim($("#callDurationMin").val()),//最小呼叫时长
                callDurationEnd: $.trim($("#callDurationMax").val()),//最大呼叫时间
                hitTemplate:checkResultStr,//命中模板
                assginType:type//顶部选中的类型
            },
            request: {
                pageName: 'pageNumber' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            },
            sort:true,
            url: "<%=basePath%>manageBg/callRecordQuality/stayQualityList.do",//数据接口
            height: theHeight,
            page:true,
            limit:20,
            cols: [[ //表头
                {
                    field: 'nickname',
                    title: '委单方',
                    width: '120',
                    align: 'left',
                    hide:tryCeach(dataList,"委单方"),
                    totalRow:true,
                    unresize: true,
                    templet: function(d){
                        return isNullCheck(d.nickname);
                    }
                },
                {
                    field: 'collectionName',
                    title: '催收机构',
                    width: '270',
                    unresize: true,
                    align: 'left',
                    hide:tryCeach(dataList,"催收机构"),
                    templet: function(d){
                        return isNullCheck(d.collectionName);
                    }
                },
                {
                    field: 'empName',
                    title: '催收员',
                    width: '100',
                    unresize: true,
                    hide:tryCeach(dataList,"催收员"),
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.empName);
                    }
                },
                {
                    field: 'passtiveNum',
                    title: '被叫号码',
                    hide:tryCeach(dataList,"被叫号码"),
                    width: '160',
                    align: 'left',
                    unresize: true,
                    templet: function(d){
                        return d.passtiveNum;
                    }
                },
                {
                    field: 'callingTimeStr',
                    title: '呼叫时间',
                    width: '190',
                    align: 'left',
                    hide:tryCeach(dataList,"呼叫时间"),
                    unresize: true,
                    templet: function(d){
                        return isNullCheck(d.callingTimeStr);
                    }
                },
                {
                    field: 'callDuration',
                    title: '录音时长',
                    width: '120',
                    hide:tryCeach(dataList,"录音时长"),
                    unresize: true,
                    align: 'right',
                    templet: function(d){
                        return formatSeconds(d.callDuration);
                    }
                },
                {
                    field: 'isHitQuality',
                    title: '是否命中',
                    width: '160',
                    hide:tryCeach(dataList,"是否命中"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNo(d.isHitQuality);
                    }
                },
                {
                    field: 'hitTemplate',
                    title: '命中模型',
                    width: '120',
                    hide:tryCeach(dataList,"命中模型"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.hitTemplate)
                    }
                },
                {
                    field: 'hitKeyword',
                    title: '关键词',
                    width: '140',
                    hide:tryCeach(dataList,"关键词"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.hitKeyword)
                    }
                },
                {
                    field: 'hitAbusive',
                    title: '辱骂威胁',
                    width: '100',
                    hide:tryCeach(dataList,"辱骂威胁"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNo(d.hitAbusive);
                    }
                },
                {
                    field: 'hitComplaint',
                    title: '客户投诉',
                    width: '100',
                    hide:tryCeach(dataList,"客户投诉"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNo(d.hitComplaint);
                    }
                },
                {
                    field: 'hitRidicule',
                    title: '嘲讽客户',
                    width: '100',
                    hide:tryCeach(dataList,"嘲讽客户"),
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNo(d.hitRidicule);
                    }
                },
                {
                    field: '',
                    title: '操作',
                    width: '70',
                    unresize: true,
                    hide:false,
                    fixed:  'right',
                    align: 'left',
                    templet: function(d) {
                        var _str='<div  class="ellipsis cursorP" style="color:#4DA1FE;" onclick="details('+ d.isQuality+','+ d.id+')">复检</div>'
                        return _str;
                    }
                }
            ]],
            done: function(res, curr, count){
                layer.close(index);
                $(document).unbind('mousewheel');
                $('.layui-table-tool .layui-table-tool-self .layui-inline[lay-event="LAYTABLE_COLS"]').text("自定义列");
                $('.layui-table-tool .layui-table-tool-self .layui-inline[lay-event="LAYTABLE_COLS"]').css({"visibility":"visible","font-size":"12px","padding-right":"12px"})
                $('.layui-table-tool .layui-table-tool-self .layui-inline[lay-event="LAYTABLE_COLS"]').prepend("<i style='background:url(<%=basePath%>newImg/customCol.png);display: inline-block;width: 14px;height: 14px;margin-right:5px;vertical-align:middle;margin-bottom: 4px'></i>")
                $(".layui-table-tool-panel li:last-child").css("display","none");
                $(".laytable-cell-checkbox").css("padding-top","10px");
            }
        });
    }
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#dateTime',
            trigger: 'click',
            range: true,
            format: 'yyyy.MM.dd',
            btns: ['confirm'],
            min:minDate,
            max:nowTime,
            value:nowTime +" - "+ nowTime,
            done:function(date){
//                console.log()
            },
            change: function(value, date, endDate){
                $(".btnList").each(function(index,ele){
                    $(ele).removeClass("cheacked")
                })
            }
        });
        laydate.render({
            elem: '#dateTime2',
            trigger: 'click',
            range: true,
            format: 'yyyy.MM.dd',
            btns: ['confirm'],
            min:minDate,
            max:nowTime,
            value:nowTime +" - "+ nowTime,
            done:function(date){
//                console.log()
            },
            change: function(value, date, endDate){
                $(".btnList2").each(function(index,ele){
                    $(ele).removeClass("cheacked")
                })
            }
        });
    });
    //待检录音重置
    function resetBtn(){
        $("#obligorName").val("")
        $("#phoneNumber").val("")
        $("#dateTime").val(nowTime +" - "+ nowTime)
        $('.btnList').each(function(index,ele){
            $(this).removeClass('cheacked')
        })
        $('.btnList').eq(0).addClass("cheacked")
        $("#collector").val("")
        $("#nickName").attr("data-id",'')
        $("#nickName").val('')
        $('#sul .whiteBc').each(function(index,ele){
            $(this).removeClass('selected')
        })
        $('#sul .whiteBc').eq(0).addClass("selected")
        $("#collecteAgency").attr("data-id",'0')
        $("#collecteAgency").val('')
        $('#sul1 .whiteBc').each(function(index,ele){
            $(this).removeClass('selected')
        })
        $('#sul1 .whiteBc').eq(0).addClass("selected")
        $("#callDurationMin").val("")
        $("#callDurationMax").val("")
        $("#checkResult").val("全部")
        $("#checkResult").attr("data-id","")
        $('.checkResult li').each(function(index,ele){
            $(this).removeClass('selected')
        })
        $('.checkResult li').eq(0).addClass("selected")
    }
    var audiotime=0
    var timer;
    var callDuration=0;
    function details(isQuality,_id){
        audiotime=0
        callDuration=0;
        var loadIngOpen=layer.load(1,{shade: [0.5,'#000'],});
        $(".classification").val("");
        $("#remarks1").val("");
        $(".classificationDetails").val("");
        $(".classificationDetails").attr("data-id","");
        $(".classificationDetails").attr("data-title","");
        $(".classificationDetails").attr("data-name","");
        $(".classification").attr("data-id","");
        $(".classification").attr("data-title","");
        $(".selectBox2").removeClass("selectBox2");
        app.list3={};
        app.list=[];
        mapList=[];
        app.callRecordQualityByKey={};
        app.hitTemplate=[];
        app.dDebtorInfo={};
        app.VoiceResultList=[];
        $("#isQuality").val(isQuality)
        $("#_id").val(_id)
    	$.ajax( {
			type : "POST",
			url : "<%=basePath%>manageBg/callRecordQuality/stayQualityOperation.do?id="+_id+"&falg=0",
			data : null,
			async: true,
			dataType : "json",
			success : function(data) {
                layer.close(loadIngOpen)
                timer=setInterval(function(){ audiotime++},1000);
				app.callRecordQualityByKey=data.callRecordQuality;
                var hitBegin=0
                if(data.callRecordQuality.hitBegin==null || data.callRecordQuality.hitBegin =="" || data.callRecordQuality.hitBegin==undefined){
                    hitBegin=0
                }else{
                    hitBegin=Math.floor(data.callRecordQuality.hitBegin/1000)
                }
                callDuration=data.callRecordQuality.callDuration;
                function play() {
                    var music = document.getElementById("audio");
                    music.src=data.callRecordQuality.listenFilepath;
                    //判断如果音乐停止播放中，就让他播放。。。
                    if (music.paused) {
                        music.currentTime=hitBegin;
                        music.play();
                    }
                }
//                调用函数
                setInterval(play(), 1);
                app.dDebtorInfo=data.debtorInfo;
//                console.log("--------------------",app.dDebtorInfo)
                app.VoiceResultList=data.VoiceResultList;
                if(data.callRecordQuality.hitTemplate=="" || data.callRecordQuality.hitTemplate==null || data.callRecordQuality.hitTemplate==""){
                    app.hitTemplate=[];
                }else{
                    app.hitTemplate=data.callRecordQuality.hitTemplate.split(',')
                }
//                console.log("-------------",data.callRecordQuality.recordingDocument)
//                app.list=data.callRecordQuality.recordingDocument
                if(data.callRecordQuality.recordingDocument == "" || data.callRecordQuality.recordingDocument == undefined || data.callRecordQuality.recordingDocument== null){
                    $(".notChecked").hide()
                }else{
                    app.list = data.callRecordQuality.recordingDocument
                    $(".notChecked").show()
                }
                if(data.callRecordQuality.hitKeyword=="" || data.callRecordQuality.hitKeyword==undefined || data.callRecordQuality.hitKeyword==null){
                }else{
                    mapList=data.callRecordQuality.hitKeyword.split(',')
                }
                indexOpen=layer.open({
                    id: 'layerDemo', //防止重复弹出
                    title: "人工复检"
                    ,type:1
                    ,resize:false
                    ,move:false
                    ,area:['1000px','580px']
                    ,shade: 0.5//不显示遮罩
                    ,content: $("#recheckBox")
                    ,cancel: function(index){
                        clearInterval(timer);//停止
                        audiotime=0
                        callDuration=0;
                        $(".selList1 li").each(function(index,ele){
//                            console.log("hahahaaaaaaaaaaaaaaaaaa")
                            $(ele).removeClass("selected")
                        })
                        $(".selList2 li").each(function(index,ele){
                            $(ele).removeClass("selected")
                        })
                        var music = document.getElementById("audio");
                        music.pause()
                        layer.close(index)
                        initTable();
                        initSixNum()
                    }
                });
			},
			error : function() {
				layer.msg('消息', '数据加载失败,请联系系统管理员！');
			}
		});
    }
    function getToday(obj){
        $("#dateTime").val(GetDateStr(0))
        $(obj).addClass('cheacked');
        $(obj).siblings().removeClass('cheacked');
    }

    function getYestoday(obj){
        $("#dateTime").val(GetDateStr2(-1))
        $(obj).addClass('cheacked');
        $(obj).siblings().removeClass('cheacked');
    }
    function GetDateStr(AddDayCount) {
        var dd=new Date(nowTime)
        dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
        var y = dd.getFullYear();
        var m = dd.getMonth()+1;//获取当前月份的日期
        m = (m<=9) ? "0"+m : m;
        var d = dd.getDate();
        d = (d<=9) ? "0"+d : d;
        return y+"."+m+"."+d+' - '+nowTime;
    }
    function GetDateStr2(AddDayCount) {
        var dd=new Date(nowTime)
        dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
        var y = dd.getFullYear();
        var m = dd.getMonth()+1;//获取当前月份的日期
        m = (m<=9) ? "0"+m : m;
        var d = dd.getDate();
        d = (d<=9) ? "0"+d : d;
        return y+"."+m+"."+d+' - '+y+"."+m+"."+d;
    }
    function GetDateStrMin(AddDayCount) {
        var dd=new Date(nowTime)
        dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
        var y = dd.getFullYear();
        var m = dd.getMonth()+1;//获取当前月份的日期
        m = (m<=9) ? "0"+m : m;
        var d = dd.getDate();
        d = (d<=9) ? "0"+d : d;
        return y+"-"+m+"-"+d;
    }


    /*弹框信息*/
    $(document).on('click','.marRight',function(){
        if($(this).text()=="展开"){
            $(".showHide").show()
            $(this).removeClass('show')
            $(this).addClass('hide')
            $(this).text("收起")
        }else if($(this).text()=="收起"){
            $(".showHide").hide()
            $(this).removeClass('hide')
            $(this).addClass('show')
            $(this).text("展开")
        }
    })
    $(document).on('click','.submitNextBtn',function(){
        _czc.push(["_trackEvent","下一条","点击下一条次数"]);
//        console.log("audiotime================",audiotime,callDuration)
        var classification=$(".classification").val()
        var classificationType=$(".classification").attr("data-title")
        var classificationDetails=$(".classificationDetails").attr('data-id');
        var inspectionResultCodeDetail=$(".classificationDetails").attr("data-name");
        var remarks1=$("#remarks1").val();
        var _id=$("#_id").val();
        var isQuality=$("#isQuality").val()
        if(classification==""){
            layer.msg("请选择质检结果后再保存");
            return;
        }
        if(classification!='合规' && classification!='提醒'){
            if(classificationDetails==""){
                layer.msg("请选择质检结果后再保存")
                return;
            }
        }

        console.log("callDuration,audiotimecallDuration,audiotimecallDuration,audiotimecallDuration,audiotime",callDuration,audiotime)
        var audioLengthTime=0
        clearInterval(timer);//停止
        if(callDuration>audiotime){
            audioLengthTime=audiotime
        }else{
            audioLengthTime=callDuration
        }
        console.log("-------------",callDuration,audiotime,audioLengthTime)
        sibmitInfo(inspectionResultCodeDetail,classification,classificationDetails,remarks1,_id,classificationType,audioLengthTime,1,isQuality,1,0)
    });
    $(document).on("click",'.submitBtn',function(){
        console.log("audiotime================",audiotime)
        var classification=$(".classification").val()
        var classificationType=$(".classification").attr("data-title")
        var classificationDetails=$(".classificationDetails").attr('data-id');
        var inspectionResultCodeDetail=$(".classificationDetails").attr("data-name");
        var remarks1=$("#remarks1").val();
        var _id=$("#_id").val();
        var isQuality=$("#isQuality").val()
        if(classification==""){
            layer.msg("请选择质检结果后再保存");
            return;
        }
        if(classification!='合规' && classification!='提醒'){
            if(classificationDetails==""){
                layer.msg("请选择质检结果后再保存")
                return;
            }
        }
        clearInterval(timer);//停止
        console.log("callDuration,audiotimecallDuration,audiotimecallDuration,audiotimecallDuration,audiotime",callDuration)
        var audioLengthTime=0;
        if(callDuration>audiotime){
            audioLengthTime=audiotime
        }else{
            audioLengthTime=callDuration
        }
        console.log("-------------",callDuration,audiotime,audioLengthTime)
//        alert(audioLengthTime)
        sibmitInfo(inspectionResultCodeDetail,classification,classificationDetails,remarks1,_id,classificationType,audioLengthTime,1,isQuality,0,0)
    })
    /*下一条提交数据*/
    function sibmitInfo(inspectionResultCodeDetail,classification,classificationDetails,remarks1,_id,classificationType,auditionDuration,num,isQuality,type,numlist){
        var data={
            id:_id,
            inspectionStatus:classificationType,
            inspectionResult:classification,
            inspectionResultDetail:classificationDetails,
            inspectionRemark:remarks1,
            auditionDuration:auditionDuration,
            inspectionResultCodeDetail:inspectionResultCodeDetail,
            falg:num
        };
//        console.log(data);
        $.ajax({
            type : "POST",
            url : "<%=basePath%>manageBg/callRecordQuality/stayQualitySave.do?",
            data : data,
            async: true,
            dataType : "json",
            success : function(data) {
                audiotime=0;
                callDuration=0;
                if(data.success=="true"){
                    $(".selList1 li").each(function(index,ele){
//                        console.log("hahahaaaaaaaaaaaaaaaaaa")
                        $(ele).removeClass("selected")
                    })
                    $(".selList2 li").each(function(index,ele){
                        $(ele).removeClass("selected")
                    })
                    layer.msg("保存成功");
                    if(numlist==0){
                        if(type==1){
                            getNextid(isQuality,_id,0,0);
                        }else if(type==0){
                            setTimeout(function(){
                                var music = document.getElementById("audio");
                                music.pause()
                                layer.closeAll();
                                initSixNum()
                                initTable();
                            },1000)
                        }
                    }else{
                        queryTopNumberForStayQuality(_id);
                    }

                }else{
                    layer.msg("保存失败");
                }

            },
            error : function() {
            }
        });
    }
    function getNextid(isQuality,_id,type,num){
        $.ajax({
            type : "POST",
            url : "<%=basePath%>manageBg/callRecordQuality/getNext.do?id="+_id+"&type="+type,
            async: true,
            dataType : "json",
            success : function(data) {
                audiotime=0;
                callDuration=0;
                if(data.onclickNum==-1){
                        setTimeout(function(){
                            layer.msg("当前录音为最后一条",{icon: -1,time:1000},function(){
                                if(num==0){
                                    var music = document.getElementById("audio");
                                    music.pause()
                                    layer.closeAll();
                                    initSixNum()
                                    initTable();
                                }else{
                                    var music2 = document.getElementById("audio2");
                                    music2.pause()
                                    layer.closeAll();
                                    initTable2()
                                }
                            })
                        },1000)
                }else if(data.onclickNum==-2){
                    layer.msg("请刷新页面，获取最新数据")
                }else{
                    if(num==0){
                        details(data.isQuality,data.onclickNum)
                    }else if(num==1){
                        lookDetails(data.isQuality,data.onclickNum)
                    }
                }
            },
            error : function() {
            }
        });
    }
    /*人工质检页面js-----------------------------------------------------------------------------*/
    function getToday2(obj){
        $("#dateTime2").val(GetDateStr(0))
        $(obj).addClass('cheacked');
        $(obj).siblings().removeClass('cheacked');
    }
    function getYestoday2(obj){
        $("#dateTime2").val(GetDateStr2(-1))
        $(obj).addClass('cheacked');
        $(obj).siblings().removeClass('cheacked');
    }
    function resetBtn2(){
        $("#obligorName2").val("")
        $("#phoneNumber2").val("")
        $("#dateTime2").val(nowTime +" - "+ nowTime)
        $('.btnList2').each(function(index,ele){
            $(this).removeClass('cheacked')
        })
        $('.checkResult2 li').each(function(index,ele){
            $(ele).removeClass('selected')
        })
        $('.selList5 li').each(function(index,ele){
            $(ele).removeClass('selected')
        })
        $(".selectBox6").removeClass('selectBox6')
        $('.btnList2').eq(0).addClass("cheacked")
        $("#collector2").val("")
        $("#nickName2").attr("data-id",'')
        $("#nickName2").val('')
        $('#sul2 .whiteBc').each(function(index,ele){
            $(this).removeClass('selected')
        })
        $('#sul2 .whiteBc').eq(0).addClass("selected")
        $("#collecteAgency2").attr("data-id",'0')
        $("#collecteAgency2").val('')
        $('#sul3 .whiteBc').each(function(index,ele){
            $(this).removeClass('selected')
        })
        $('#sul3 .whiteBc').eq(0).addClass("selected")
        $("#callDurationMin2").val("")
        $("#callDurationMax2").val("")
        $("#checkResult2").val("")
        $("#checkResult2").attr("data-id","")
        $("#checkListName2").val("")
        $("#checkListName2").attr("data-id","")
    }
    var stateBtn2=null;
    $('.advQuery2').on('click',function(){
        if(getComputedStyle($('.advQueryItem2')[0]).display=='none'){
            $(this).find('img').attr('src','<%=basePath%>newImg/dateUp.png');
            stateBtn2=0
            $(".searchBtnOne2").hide()
            $(".searchBtnTwo2").show()
            initTable2();
            $(".advQueryNext2").text("收起筛选");
        }else{
            $(this).find('img').attr('src','<%=basePath%>newImg/dateDown.png');
            $(".searchBtnOne2").show()
            $(".searchBtnTwo2").hide()
            stateBtn2=1
            initTable2();
            $(".advQueryNext2").text("高级筛选");
        }
        $('.advQueryItem2').toggle();
    });
    function initTable2(){
        var theHeight= ''
        if(stateBtn2==0){
            theHeight= "full-275"
        }else if(stateBtn2==1){
            theHeight= "full-180"
        }else if(stateBtn2==null){
            theHeight= "full-180"
        }
        var dateTime=$("#dateTime2").val() || nowTime + " - " +nowTime;
        var callingTimeStart=ConverToDate2(dateTime.split(" - ")[0])
        var callingTimeEnd=ConverToDate2(dateTime.split(" - ")[1])
        var table = layui.table;
        var layer = layui.layer;
        //打开遮罩
        var index = layer.load(1, {
            shade: [0.1,'#000']
        });
        var nickName_param=$.trim($("#nickName2").val());
        if(nickName_param=='全部'){
        	nickName_param='';
        }
        
        //第一个实例
        table.render({
            elem: '#demo2',
            id:"demos",
            loading:false,
//            toolbar: '#toolbarDemo',
            where: {
                inspectionFalg : "1", //0待质检页面-固定存在
                qualityTimeStart:callingTimeStart,//呼叫开始时间
                qualityTimeEnd:callingTimeEnd,//呼叫结束时间
                debtorName:$.trim($("#obligorName2").val()),//债务人姓名
                passtiveNum:$.trim($("#phoneNumber2").val()),//被叫号码
                nickname:nickName_param,//委单方昵称
                empName:$.trim($("#collector2").val()),//催收员
                collectionInfoId:$("#collecteAgency2").attr("data-id"),//催收机构id
                callDurationStart:$.trim($("#callDurationMin2").val()),//最小呼叫时长
                callDurationEnd:$.trim($("#callDurationMax2").val()),//最大呼叫时间
                inspectionResult:$("#checkResult2").val(),//质检结果
                inspectionResultDetail:$("#checkListName2").val()//	质检结果明细

//                hitTemplate:$("#checkResult").val(),//命中模板
            },
            request: {
                pageName: 'pageNumber' //页码的参数名称，默认：page
                ,limitName: 'pageSize' //每页数据量的参数名，默认：limit
            },
            sort:true,
            url: "<%=basePath%>manageBg/callRecordQuality/stayQualityList.do",//数据接口
            height: theHeight,
            page:true,
            limit:20,
            cols: [[ //表头
                {
                    field: 'nickname',
                    title: '委单方',
                    width: '120',
                    align: 'left',
                    totalRow:true,
                    unresize: true,
                    templet: function(d){
                        return isNullCheck(d.nickname);
                    }
                },
                {
                    field: 'collectionName',
                    title: '催收机构',
                    width: '270',
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.collectionName);
                    }
                },
                {
                    field: 'empName',
                    title: '催收员',
                    width: '100',
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.empName);
                    }
                },
                {
                    field: 'passtiveNum',
                    title: '被叫号码',
                    width: '160',
                    align: 'left',
                    unresize: true,
                    templet: function(d){
                        return isNullCheck(d.passtiveNum);
                    }
                },
                {
                    field: 'callingTimeStr',
                    title: '呼叫时间',
                    width: '190',
                    align: 'left',
                    unresize: true,
                    templet: function(d){
                        return isNullCheck(d.callingTimeStr);
                    }
                },
                {
                    field: 'callDuration',
                    title: '录音时长',
                    width: '120',
                    unresize: true,
                    align: 'right',
                    templet: function(d){
                        return formatSeconds(d.callDuration);
                    }
                },
                {
                    field: 'inspectionResult',
                    title: '质检结果',
                    width: '100',
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.inspectionResult);
                    }
                },
                {
                    field: 'inspectionResultDetail',
                    title: '明细分类',
                    width: '140',
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.inspectionResultDetail);
                    }
                },
                {
                    field: 'inspectionTimeStr',
                    title: '质检时间',
                    width: '190',
                    unresize: true,
                    align: 'left',
                    templet: function(d){
                        return isNullCheck(d.inspectionTimeStr);
                    }
                },
                {
                    field: '',
                    title: '操作',
                    width: '70',
                    unresize: true,
                    hide:false,
                    fixed:  'right',
                    align: 'left',
                    templet: function(d) {
                        var _str='<div  class="ellipsis cursorP" style="color:#4DA1FE;" onclick="lookDetails('+ d.isQuality+','+ d.id+')">查看</div>'
                        return _str;
                    }
                }
            ]],
            done: function(res, curr, count){
                layer.close(index);
            }
        });
    }
    function showNickList2(){
        if($('#nameBox2').is(':hidden')){
            $('#nameBox2').show();
            $('#nickNameTemp2').val('');
            $('#sul2 .whiteBc').show();
            $('#sul2 .redBc').hide();
            $('#sul2').show();
            $('#masking').show();
        }else{
            $('#nameBox2').hide();
        }
    }
    //查询委单方
    function searchname2(){
        var inpVal = $('#nickNameTemp2').val();
        if(inpVal!=''){
            $('#sul2 .redBc').hide();
            var biaoji=0;
            $('#sul2 li').css('display','none');
            $('#sul2 .whiteBc').each(function(){
                if($(this).text().indexOf(inpVal)>-1){
                    $(this).show();
                    biaoji=1;
                }else{
                    return;
                }
            });
            if (biaoji<1){
                $('#sul2 li').css('display','none');
                $('#sul2 .redBc').show();
            }
            $('#sul2').show();
        } else{
            $('#sul2 .redBc').hide();
            $('#sul2 .whiteBc').show();
        }
    }
    $('#sul2').on('click','.whiteBc',function(event){
        event.stopPropagation();
        var idandname = $(this).attr('data-title');
        var id=$(this).attr('data-id');
        $(this).addClass('selected').siblings().removeClass('selected');
        $("#nickName2").val($.trim($(this).text()));
        $("#nickName2").attr('data-id', $.trim($(this).attr('data-id')));
        $('#nameBox2').hide();
        $('#masking').hide();
    });

    function showNickList12(){
        if($('#nameBox3').is(':hidden')){
            $('#nameBox3').show();
            $('#nickNameTemp3').val('');
            $('#sul3 .whiteBc').show();
            $('#sul3 .redBc').hide();
            $('#sul3').show();
            $('#masking').show();
        }else{
            $('#nameBox3').hide();
        }
    }
    //查询委单方
    function searchname3(){
        var inpVal = $('#nickNameTemp3').val();
        if(inpVal!=''){
            $('#sul3 .redBc').hide();
            var biaoji=0;
            $('#sul3 li').css('display','none');
            $('#sul3 .whiteBc').each(function(){
                if($(this).text().indexOf(inpVal)>-1){
                    $(this).show();
                    biaoji=1;
                }else{
                    return;
                }
            });
            if (biaoji<1){
                $('#sul3 li').css('display','none');
                $('#sul3 .redBc').show();
            }
            $('#sul3').show();
        } else{
            $('#sul3 .redBc').hide();
            $('#sul3 .whiteBc').show();
        }
    }
    $('#sul3').on('click','.whiteBc',function(event){
        event.stopPropagation();
        var idandname = $(this).attr('data-title');
        var id=$(this).attr('data-id');
        $(this).addClass('selected').siblings().removeClass('selected');
        $("#collecteAgency2").val($.trim($(this).text()));
        $("#collecteAgency2").attr('data-id', $.trim($(this).attr('data-id')));
        $('#nameBox3').hide();
        $('#masking').hide();
    });

    function lookDetails(isQuality,_id){
//        layer.closeAll()
        var loadIngOpen=layer.load(1,{shade: [0.5,'#000'],});
        $(".classification2").val("");
        $(".classification2").attr("data-id");
        $(".classification2").attr("data-title");
        $("#remarks2").val("");
        $(".classificationDetails2").val("");
        $(".classificationDetails2").attr("data-id","");
        $(".classificationDetails2").attr("data-title","");
        $(".classificationDetails2").attr("data-name","");
        $(".selectBox2").removeClass("selectBox2");
        app.list32={};
        app.list12=[];
        mapList2=[];
        app.callRecordQualityByKey2={};
        app.hitTemplate2=[];
        app.dDebtorInfo2={};
        app.VoiceResultList2=[];
        $("#isQuality2").val(isQuality)
        $("#_id2").val(_id)
        $.ajax({
            type : "POST",
            url : "<%=basePath%>manageBg/callRecordQuality/stayQualityOperation.do?id="+_id+"&falg=1",
            data : null,
            async: true,
            dataType : "json",
            success : function(data) {
                layer.close(loadIngOpen)
                app.callRecordQualityByKey2 = data.callRecordQuality;
                app.dDebtorInfo2 = data.debtorInfo;
//                console.log("--------------------", app.dDebtorInfo)
                app.VoiceResultList2 = data.VoiceResultList;
//                console.log("-------------", data.callRecordQuality.recordingDocument)
                if(data.callRecordQuality.recordingDocument == "" || data.callRecordQuality.recordingDocument == undefined || data.callRecordQuality.recordingDocument== null){
                    $(".notChecked2").hide()
                }else{
                    app.list12 = data.callRecordQuality.recordingDocument
                    $(".notChecked2").show()
                }
                app.detailList2 = data.detailList
                if (data.callRecordQuality.hitKeyword == "" || data.callRecordQuality.hitKeyword == undefined || data.callRecordQuality.hitKeyword == null) {
                } else {
                    mapList2 = data.callRecordQuality.hitKeyword.split(',')
                }
                indexBox=layer.open({
                    id: 'layerDemo', //防止重复弹出
                    title: "人工复检"
                    , type: 1
                    , resize: false
                    , move: false
                    , area:  ['1000px', '580px']
                    , shade: 0.5//不显示遮罩
                    , content: $("#seeBox")
                    , cancel: function (index) {
                        $(".selList3 li").each(function(index,ele){
//                            console.log("hahahaaaaaaaaaaaaaaaaaa")
                            $(ele).removeClass("selected")
                        })
                        $(".selList4 li").each(function(index,ele){
                            $(ele).removeClass("selected")
                        })
                        var music = document.getElementById("audio2");
                        music.pause()
                        layer.close(index)
                        app.modify=true;
                        initTable2()
                    }
                })
            },
            error : function() {
                layer.msg('消息', '数据加载失败,请联系系统管理员！');
            }
       });
    }
    $(document).on('click','.selectBox3',function(e){
        $(".selList4 li").each(function(index,ele){
            $(ele).removeClass("selected")
        })
        $(".selList4").hide()
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList3').not($(this).children('.selList3')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList3').toggle();
    });
    $(document).on('click','.selList3 li',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id")).attr("data-title",$(this).attr('data-title'));
        $(this).addClass('selected').siblings().removeClass('selected');
//        alert( $(this).parents(".selectBox1").siblings(".disInline").html())
        $(".classificationDetails2").val("")
        $(".classificationDetails2").attr("data-id","")
        $(".classificationDetails2").attr("data-title","");
        $(".classificationDetails2").attr("data-name","");
        if($(this).text()=="合规" || $(this).text()=="提醒"){
            $(this).parents(".selectBox3").siblings(".disInline").removeClass('selectBox4')
        }else{
            $(this).parents(".selectBox3").siblings(".disInline").addClass('selectBox4')
            $.ajax({
                type:"post",
                async: false,
                url:"<%=basePath%>manageBg/callRecordQuality/voiceResultDetail.do?id="+$(this).attr("data-id"),
                dataType:"json",
                success:function(data){
//                    console.log(data);
                    app.list32=data.resultDetailList;
                }
            })
        }

    });
    $(document).on('click','.selectBox4',function(e){
        $(".selList3").hide()
        e.stopPropagation();
        /* $('.selList').hide(); */
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList4').not($(this).children('.selList4')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList4').toggle();
    });
    $(document).on('click','.selList4 li',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id")).attr("data-title",$(this).text()).attr("data-name",$(this).attr('data-name'));
        $(this).addClass('selected').siblings().removeClass('selected');
    });
    $(document).on('click',function(){
        $('.selList').hide();
        tableHeader()
    });
    $(document).on("click",'.submitBtn2',function(){
        app.modify=false;
    })
    $(document).on("click",'.cancelBtn',function(){
        app.modify=true;
        $(".classification2").val("")
        $(".classification2").attr("data-title","")
        $(".classification2").attr("data-id","")
        $(".classificationDetails2").val("")
        $(".classificationDetails2").attr("data-id","")
        $(".classificationDetails2").attr("data-name","")
        $(".classificationDetails2").attr("data-title","")
        $("#remarks2").val("")
        $(".selList3 li").each(function(index,ele){
//                            console.log("hahahaaaaaaaaaaaaaaaaaa")
            $(ele).removeClass("selected")
        })
        $(".selList4 li").each(function(index,ele){
            $(ele).removeClass("selected")
        })
    })
    $(document).on("click",'.keepBtn2',function(){
        _czc.push(["_trackEvent","保存","点击保存次数"]);
        var classification=$(".classification2").val()
        var classificationType=$(".classification2").attr("data-title")
        var classificationDetails=$(".classificationDetails2").attr("data-id")
        var inspectionResultCodeDetail=$(".classificationDetails2").attr("data-name")
        var remarks1=$("#remarks2").val();
        var _id=$("#_id2").val();
        var isQuality=$("#isQuality2").val()
        if(classification==""){
            layer.msg("请选择质检结果后再保存");
            return;
        }
        if(classification!='合规' && classification!='提醒'){
            if(classificationDetails==""){
                layer.msg("请选择质检结果后再保存")
                return;
            }
        }
        sibmitInfo(inspectionResultCodeDetail,classification,classificationDetails,remarks1,_id,classificationType,"",2,isQuality,"",1)
    })
    function queryTopNumberForStayQuality(_id) {
        app.detailList2=[];
        app.modify=true;
        $.ajax({
            type: "POST",
            url: "<%=basePath%>manageBg/callRecordQuality/getManualQualityDetails.do?id="+_id,
            data: null,
            async: true,
            dataType: "json",
            success: function (data) {
                app.detailList2=data.detailList;
                $(".classification2").val("")
                $(".classification2").attr("data-title","")
                $(".classification2").attr("data-id","")
                $(".classificationDetails2").val("")
                $(".classificationDetails2").attr("data-id","")
                $(".classificationDetails2").attr("data-name","")
                $(".classificationDetails2").attr("data-title",'')
                $("#remarks2").val("")
            },
            error: function () {
                layer.msg('消息', '数据加载失败,请联系系统管理员！');
            }

        })
    }
    $(document).on("click",'.submitNextBtn2',function(){
        var _id=$("#_id2").val();
        var isQuality=$("#isQuality2").val()
        getNextid(isQuality,_id,1,1)
    });
//    $(document).on("click",'#downAudio',function(){
//        _czc.push(["_trackEvent","下载录音","点击下载录音次数"]);
//        var src=$(this).siblings('#audioSrc').val();
//        $(this).attr("href",src)
//    })
	//顶栏统计数据
	function initSixNum(){
        app.isHitTemplate=0
        app.hitAbusive=0
        app.hitComplaint=0
        app.hitRidicule=0
        app.isHitQuality=0
        app.isQuality=0
		$.ajax( {
			type : "POST",
			url : "<%=basePath%>manageBg/callRecordQuality/queryTopNumberForStayQuality.do",
			data : null,
			async: true,
			dataType : "json",
			success : function(data) {
		       	if(data.caQualityAll!=null&&data.caQualityAll!=undefined){
	        		app.isHitTemplate=data.caQualityAll.isHitTemplate;
	                app.hitAbusive=data.caQualityAll.hitAbusive;
	                app.hitComplaint=data.caQualityAll.hitComplaint;
	                app.hitRidicule=data.caQualityAll.hitRidicule;
	        	}
	        	if(data.caQualityNow!=null&&data.caQualityNow!=undefined){
	        		app.isHitQuality=data.caQualityNow.isHitQuality;
	                app.isQuality=data.caQualityNow.isQuality;
	        	}
			},
			error : function() {
				layer.msg('消息', '数据加载失败,请联系系统管理员！');
			}
		});
	}
</script>
</html>
