<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/sys/include.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <base href="<%=basePath%>"/>
    <meta charset="utf-8">
    <title>催收前台-新催收页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>layui-v2.5.4/layui/css/layui.css">
    <link href="<%=basePath%>css/animate-custom.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/systemStyle.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>css/newVersion.css" type="text/css" rel="stylesheet"/>
    <link href="<%=basePath%>css/newStyle.css" rel="stylesheet" type="text/css">
    <link href="<%=basePath%>css/newPlugStyle.css" type="text/css" />
    <link href="<%=basePath%>css/collectNew.css?time=202005251338"  rel="stylesheet" type="text/css"/>
    <script src="<%=basePath%>js/Jquery3.1.1.min.js"></script>
    <script src="<%=basePath%>js/jquery-1.8.2.min.js"></script>
    <script src="<%=basePath%>js/jquery.form.js" type="text/javascript"></script>
    <script src="<%=basePath%>layui-v2.5.4/layui/layui.all.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/vue.js"></script>
    <style></style>
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
<div id="app" v-cloak>
    <div class="header">
        <div class="back">
            <span class="goBack" onclick="backto();">返回</span>
            <span>
                <span class="line1"></span>
            </span>
            <div class="backNum">
                <p>当前已催收<span class="collectionNum">${collectedNum}</span><span>共<i>${collectNum}</i>人</span></p>
                <p>
                    <span class="progress"></span>
                </p>
            </div>
        </div>
        <div class="message">
            <span><img src="<%=basePath%>/newImg/3.2.5.1/horn.svg" alt=""/></span>
            <div class="scrollNews"  style="position: static;float: right;">
                <ul style="display:inline-block">
                    <li v-for="message in messages"><span class="moneyNumber moneyNumberOld" :title="message.keyValue | read" v-html="message.keyValue"></span></li>
                    <%--                    <li v-for="message in messages"><span class="moneyNumber moneyNumberOld" :title="message.keyValue">{{message.keyValue}}</span></li>--%>
                </ul>
            </div>
        </div>
        <div class="helpRank">
            <span onclick="helpOpen()"><img src="<%=basePath%>/newImg/3.2.5.1/help.svg" alt=""/>帮助</span>
            <span onclick="rankOpen()"><img src="<%=basePath%>/newImg/3.2.5.1/ranking.svg" alt=""/></span>
        </div>
    </div>
    <div class="collectionBody">
        <div class="collectionLeft">
            <div class="personInfo">
                <div class="fixedInfo">
                    <img :src="imgIcon[customLabel-1]" alt=""/>
                    <span class="personName"><strong title="${dDebtorInfo.debtorName}">${dDebtorInfo.debtorName}</strong><i v-if="!isCollected"></i>
                        <%--<span class="meanwhileRush" v-if="otherDebtors.length>0">同时在催{{otherDebtors.length}}笔</span>--%>
                        <span :class="color1" v-if="lastResult=='投诉倾向'">投诉倾向</span>
                        <span :class="color2" v-else-if="lastResult=='多次跳票'">多次跳票</span>
                        <span :class="color3" v-else-if="lastResult=='否认身份'">否认身份</span>
                        <span :class="color4" v-else-if="lastResult=='待对账'">待对账</span>
                        <span :class="color5" v-else-if="lastResult=='承诺还款'">承诺还款</span>
                        <span :class="color6" v-else-if="lastResult=='谈判中'">谈判中</span>
                        <span :class="color7" v-else-if="lastResult=='恶意拖欠'">恶意拖欠</span>
                        <span :class="color8" v-else-if="lastResult=='失联'">失联</span>
                        <%--<img class="repair" v-show="isShowRepair=='1'" src="<%=basePath%>/newImg/3.2.5.4/repair.svg" alt=""/>--%>
                    </span>
                    <span class="moreClick"></span>
                </div>
                <div class="telInfo">
                    <div class="allList">
                        <ul>
                            <c:if test="${dDebtorInfo.afterReductionMoney>0}">
                                <li><span>减免后应还金额</span><i>{{${dDebtorInfo.afterReductionMoney} | toNumber3}}</i></li>
                            </c:if>
                            <li><span>当前应还金额</span><i>{{${dDebtorInfo.currentAmount} | toNumber3}}</i></li>
                            <c:if test="${dDebtorInfo.overdueDaysStr==''|| dDebtorInfo.overdueDaysStr== null || dDebtorInfo.overdueDaysStr==undefined}">
                                <li><span>逾期天数</span><i>- -</i></li>
                            </c:if>
                            <c:if test="${dDebtorInfo.overdueDaysStr!=''&& dDebtorInfo.overdueDaysStr!= null && dDebtorInfo.overdueDaysStr!=undefined}">
                                <li><span>逾期天数</span><i>${dDebtorInfo.overdueDaysStr}</i></li>
                            </c:if>
                            <li><span>逾期利息</span><i>{{${dDebtorInfo.interest} | toLine2}}</i></li>
                            <li><span>逾期本金</span><i>{{${dDebtorInfo.principal} | toLine2}}</i></li>
                            <li><span>违约金</span><i>{{${dDebtorInfo.penalty} | toLine2}}</i></li>
                            <li><span>手续费</span><i>{{${dDebtorInfo.otherCost} | toLine2}}</i></li>
                            <li><span>身份证号</span><i>${dDebtorInfo.debtorIdNum}</i></li>
                            <c:if test="${dDebtorInfo.lastRecodRemark==''|| dDebtorInfo.lastRecodRemark== null || dDebtorInfo.lastRecodRemark==undefined}">
                                <li><span>最后催收备注</span><i>- -</i></li>
                            </c:if>
                            <c:if test="${dDebtorInfo.lastRecodRemark!='' && dDebtorInfo.lastRecodRemark!=null &&  dDebtorInfo.lastRecodRemark!=undefined}">
                                <li><span>最后催收备注</span><i>${dDebtorInfo.lastRecodRemark}</i></li>
                            </c:if>
                        </ul>
                    </div>
                    <div class="inRush" v-show="otherDebtors.length>0">
                        <ul>
                            <li v-for="(items,index) in otherDebtors">
                                <p>
                                    <span>第{{index+1}}笔</span>
                                    <span class="moneyNum">当前应还金额：<i>{{items.currentAmount | toNumber3}}</i></span>
                                <span onclick="showHide(this)">
                                    <img src="<%=basePath%>/newImg/3.2.5.1/showhide.png" name="show" alt="" style="width:50px;height:16px;"/>
                                </span>
                                </p>
                                <div class="inRushInfo">
                                    <ul>
                                        <li><span>当前应还金额</span><i>{{items.currentAmount | toNumber3}}</i></li>
                                        <li><span>逾期天数</span><i>{{items.overdueDaysStr | toLine0}}</i></li>
                                        <li><span>逾期利息</span><i>{{items.interest | toLine2}}</i></li>
                                        <li><span>逾期本金</span><i>{{items.principal | toLine2}}</i></li>
                                        <li><span>违约金</span><i>{{items.penalty | toLine2}}</i></li>
                                        <li><span>手续费</span><i>{{items.otherCost | toLine2}}</i></li>
                                        <li><span style="overflow: hidden">产品名称</span><i :title="items.productName">{{items.productName | toLine}}</i></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div v-show="isShowContact" class="telList">
                        <div style="width:272px">
                            <span class="contacts"><img src="<%=basePath%>/newImg/3.2.5.1/contacts.svg" alt=""/>紧急联系人</span>
                            <span class="addContacts" onclick="addContacts()"><img src="<%=basePath%>/newImg/3.2.5.1/addContacts.svg" alt=""/>新增联系人</span>
                        </div>
                        <div>
                            <ul class="telLi">
                                <%--<li v-if="isShowRepair=='1'" v-for="items in isShowRepairData">--%>
                                <%--<input type="hidden" :value="items.id"/>--%>
                                <%--<input type="hidden" :value="items.contactsName"/>--%>
                                <%--<input type="hidden" :value="items.contactsTelephone"/>--%>
                                <%--<div v-if="seatNum!=''" onclick="clickContacts(2,${dDebtorInfo.id},this,event)">--%>
                                <%--<p>--%>
                                <%--<span :title="items.contactsName">{{items.contactsName}}</span>--%>
                                <%--<i class="redDot"></i>--%>
                                <%--<span class="collectionTimes">催收<i>{{items.cushu}}</i>次</span>--%>
                                <%--<img v-if="items.source==1" src="<%=basePath%>newImg/3.2.5.1/added.svg" alt=""/>--%>
                                <%--</p>--%>
                                <%--<p class="remarkList">--%>
                                <%--<span>备注：</span><span title="哈哈哈">哈哈哈</span>--%>
                                <%--</p>--%>
                                <%--<p>--%>
                                <%--<span>--%>
                                <%--&lt;%&ndash;电话状态：&ndash;%&gt;--%>
                                <%--<i title="空号" v-if="items.telStatus==0">空号</i>--%>
                                <%--<i title="呼叫正常" v-else-if="items.telStatus==1">呼叫正常</i>--%>
                                <%--<i title="停机" v-else-if="items.telStatus==2">停机</i>--%>
                                <%--<i title="未知" v-else-if="items.telStatus==3">未知</i>--%>
                                <%--<i title="沉默" v-else-if="items.telStatus==4">沉默</i>--%>
                                <%--<i title="暂时无法接通" v-else-if="items.telStatus==5">暂时无法接通</i>--%>
                                <%--<i title="关机" v-else-if="items.telStatus==6">关机</i>--%>
                                <%--<i title="空号、停机" v-else-if="items.telStatus==7">空号、停机</i>--%>
                                <%--<i title="关机、无法接通" v-else-if="items.telStatus==8">关机、无法接通</i>--%>
                                <%--<i title="无人接听" v-else-if="items.telStatus==9">无人接听</i>--%>
                                <%--<i title="接听本人/有关联" v-else-if="items.telStatus==10">接听本人/有关联</i>--%>
                                <%--<i title="接听非本人/无关联" v-else-if="items.telStatus==11">接听非本人/无关联</i>--%>
                                <%--</span>--%>
                                <%--<span class="call" onclick="clickContacts(1,${dDebtorInfo.id},this,event)">--%>
                                <%--<i :title="items.contactsTelephone">{{items.contactsTelephone}}</i>--%>
                                <%--<span class="callPhone"><img src="<%=basePath%>newImg/3.2.5.1/call.svg" alt=""/>呼叫</span>--%>
                                <%--</span>--%>
                                <%--</p>--%>
                                <%--</div>--%>
                                <%--<div v-else onclick="clickContacts(2,${dDebtorInfo.id},this)">--%>
                                <%--<p>--%>
                                <%--<span :title="items.contactsName">{{items.contactsName}}</span>--%>
                                <%--<span class="collectionTimes">催收<i>{{items.cushu}}</i>次</span>--%>
                                <%--<img v-if="items.source==1" src="<%=basePath%>newImg/3.2.5.1/added.svg" alt=""/>--%>
                                <%--</p>--%>
                                <%--<p class="remarkList">--%>
                                <%--<span>备注：</span>请问请问请问请问请问请问请问123123123123--%>
                                <%--</p>--%>
                                <%--<p>--%>
                                <%--<span>--%>
                                <%--&lt;%&ndash;电话状态：&ndash;%&gt;--%>
                                <%--<i title="空号" v-if="items.telStatus==0">空号</i>--%>
                                <%--<i title="呼叫正常" v-else-if="items.telStatus==1">呼叫正常</i>--%>
                                <%--<i title="停机" v-else-if="items.telStatus==2">停机</i>--%>
                                <%--<i title="未知" v-else-if="items.telStatus==3">未知</i>--%>
                                <%--<i title="沉默" v-else-if="items.telStatus==4">沉默</i>--%>
                                <%--<i title="暂时无法接通" v-else-if="items.telStatus==5">暂时无法接通</i>--%>
                                <%--<i title="关机" v-else-if="items.telStatus==6">关机</i>--%>
                                <%--<i title="空号、停机" v-else-if="items.telStatus==7">空号、停机</i>--%>
                                <%--<i title="关机、无法接通" v-else-if="items.telStatus==8">关机、无法接通</i>--%>
                                <%--<i title="无人接听" v-else-if="items.telStatus==9">无人接听</i>--%>
                                <%--<i title="接听本人/有关联" v-else-if="items.telStatus==10">接听本人/有关联</i>--%>
                                <%--<i title="接听非本人/无关联" v-else-if="items.telStatus==11">接听非本人/无关联</i>--%>
                                <%--</span>--%>
                                <%--<span class="noCall" >--%>
                                <%--&lt;%&ndash;<img src="<%=basePath%>newImg/3.2.5.1/noCall.svg" alt=""/>&ndash;%&gt;--%>
                                <%--<i :title="items.contactsTelephone">{{items.contactsTelephone}}</i>--%>
                                <%--</span>--%>
                                <%--</p>--%>
                                <%--</div>--%>
                                <%--</li>--%>
                                <li v-for="items in collectReadContactNew">
                                    <input type="hidden" :value="items.id"/>
                                    <input type="hidden" :value="items.contactsName"/>
                                    <input type="hidden" :value="items.contactsTelephone"/>
                                    <input type="hidden" :value="items.contactsRelationship"/>
                                    <div v-if="seatNum!=''" onclick="clickContacts(2,${dDebtorInfo.id},this,event)">
                                        <p>
                                            <span :title="items.contactsName+'('+items.contactsRelationship+')'" v-if="items.contactsRelationship">{{items.contactsName}}({{items.contactsRelationship}})</span>
                                            <span :title="items.contactsName" v-else>{{items.contactsName}}</span>
                                            <span class="collectionTimes">催收<i>{{items.cushu}}</i>次</span>
                                            <img v-if="items.source==1" src="<%=basePath%>newImg/3.2.5.1/added.svg" alt=""/>
                                        </p>
                                        <p class="remarkList" v-if="items.contactRemark!='' && items.contactRemark!=null && items.contactRemark!=undefined">
                                            <span>备注：</span><span :title="items.contactRemark">{{items.contactRemark}}</span>
                                        </p>
                                        <p>
                                       <span>
                                           <%--电话状态：--%>
                                           <i title="空号" v-if="items.telStatus==0">空号</i>
                                           <i title="呼叫正常" v-else-if="items.telStatus==1">呼叫正常</i>
                                           <i title="停机" v-else-if="items.telStatus==2">停机</i>
                                           <i title="未知" v-else-if="items.telStatus==3">未知</i>
                                           <i title="沉默" v-else-if="items.telStatus==4">沉默</i>
                                           <i title="暂时无法接通" v-else-if="items.telStatus==5">暂时无法接通</i>
                                           <i title="关机" v-else-if="items.telStatus==6">关机</i>
                                           <i title="空号、停机" v-else-if="items.telStatus==7">空号、停机</i>
                                           <i title="关机、无法接通" v-else-if="items.telStatus==8">关机、无法接通</i>
                                           <i title="无人接听" v-else-if="items.telStatus==9">无人接听</i>
                                           <i title="接听本人/有关联" v-else-if="items.telStatus==10">接听本人/有关联</i>
                                           <i title="接听非本人/无关联" v-else-if="items.telStatus==11">接听非本人/无关联</i>
                                       </span>
                                   <span class="call">
                                       <i :title="items.contactsTelephone">{{items.contactsTelephone}}</i>
                                       <span class="callPhone" onclick="clickContacts(1,${dDebtorInfo.id},this,event)"><img src="<%=basePath%>newImg/3.2.5.1/call.svg" alt=""/>呼叫</span>
                                   </span>
                                        </p>
                                    </div>
                                    <div v-else onclick="clickContacts(2,${dDebtorInfo.id},this,event)">
                                        <p>
                                            <span :title="items.contactsName+'('+items.contactsRelationship+')'" v-if="items.contactsRelationship">{{items.contactsName}}({{items.contactsRelationship}})</span>
                                            <span :title="items.contactsName" v-else>{{items.contactsName}}</span>
                                            <span class="collectionTimes">催收<i>{{items.cushu}}</i>次</span>
                                            <img v-if="items.source==1" src="<%=basePath%>newImg/3.2.5.1/added.svg" alt=""/>
                                        </p>
                                        <p class="remarkList" v-if="items.contactRemark!='' && items.contactRemark!=null && items.contactRemark!=undefined">
                                            <span>备注：</span><span :title="items.contactRemark">{{items.contactRemark}}</span>
                                        </p>
                                        <p>
                                       <span>
                                           <%--电话状态：--%>
                                           <i title="空号" v-if="items.telStatus==0">空号</i>
                                           <i title="呼叫正常" v-else-if="items.telStatus==1">呼叫正常</i>
                                           <i title="停机" v-else-if="items.telStatus==2">停机</i>
                                           <i title="未知" v-else-if="items.telStatus==3">未知</i>
                                           <i title="沉默" v-else-if="items.telStatus==4">沉默</i>
                                           <i title="暂时无法接通" v-else-if="items.telStatus==5">暂时无法接通</i>
                                           <i title="关机" v-else-if="items.telStatus==6">关机</i>
                                           <i title="空号、停机" v-else-if="items.telStatus==7">空号、停机</i>
                                           <i title="关机、无法接通" v-else-if="items.telStatus==8">关机、无法接通</i>
                                           <i title="无人接听" v-else-if="items.telStatus==9">无人接听</i>
                                           <i title="接听本人/有关联" v-else-if="items.telStatus==10">接听本人/有关联</i>
                                           <i title="接听非本人/无关联" v-else-if="items.telStatus==11">接听非本人/无关联</i>
                                       </span>
                                   <span class="noCall" >
                                       <%--<img src="<%=basePath%>newImg/3.2.5.1/noCall.svg" alt=""/>--%>
                                       <i :title="items.contactsTelephone">{{items.contactsTelephone}}</i>
                                   </span>
                                        </p>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="moreInfo" v-show="moreBtnShowType">
                <span class="hide"></span>
                <div class="tabInfo">
                    <span class="tabListText tabListTextOn">资料</span>
                    <i></i>
                    <span class="tabListText">历史信息</span>
                    <div class="tab1">
                        <span class="tab1Li tab1On">贷款信息</span>
                        <i class="line"></i>
                        <span class="tab1Li">基本信息</span>
                        <i class="line"></i>
                        <span class="tab1Li">还款方式</span>
                        <i class="line"></i>
                        <span class="tab1Li">催收要求</span>
                        <i class="line"></i>
                        <span class="tab1Li">备注</span>
                        <div class="tab1List tab1ListOn loanInfo">
                            <ul v-if="dDebtorInfo.debtType1=='小额现金贷款'">
                                <li><span>贷款名称</span><i>{{dDebtorInfo.debtType2 | toLine}}</i></li>
                                <li><span>商品名称/型号</span><i>{{dDebtorInfo.debtType3 | toLine}}</i></li>
                                <li><span>合同号</span><i>{{dDebtorInfo.contractNum}}</i></li>
                                <li><span>合同金额</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                                <li><span>合同日期</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                                <li><span>委托金额</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                                <li><span>贷款期数</span><i>{{dDebtorInfo.loanNper | toLine0}}</i></li>
                                <li><span>每期金额</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                                <li><span>逾期利息</span><i>{{dDebtorInfo.interest | toLine2}}</i></li>
                                <li><span>逾期期数</span><i>{{dDebtorInfo.overdueNper}}</i></li>
                                <li><span>逾期本金</span><i>{{dDebtorInfo.principal | toLine2}}</i></li>
                                <li><span>逾期天数</span><i>{{dDebtorInfo.overdueDaysStr | toLine0}}</i></li>
                                <li><span>剩余本金</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}}</i></li>
                                <li><span>违约金</span><i>{{dDebtorInfo.penalty | toLine2}}</i></li>
                                <li><span>手续费</span><i>{{dDebtorInfo.otherCost | toLine2}}</i></li>
                                <li><span>已还期数</span><i>{{dDebtorInfo.hasAlsoNper | toLine0}}</i></li>
                                <li><span>未结清期数</span><i>{{dDebtorInfo.outstandingNper | toLine0}}</i></li>
                                <li><span>末次还款时间</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}}</i></li>
                                <li><span>产品名称</span><i>{{dDebtorInfo.productName | toLine}}</i></li>
                            </ul>
                            <ul v-else-if="dDebtorInfo.debtType1=='消费分期'">
                                <li><span>合同号</span><i>{{dDebtorInfo.contractNum}}</i></li>
                                <li><span>合同金额</span><i>{{dDebtorInfo.contractAmount | toLine2}} </i></li>
                                <li><span>商品名称</span><i>{{dDebtorInfo.debtType3 | toLine}}</i></li>
                                <li><span>订单日期</span><i>{{dDebtorInfo.contractDateStr | toLine}} </i></li>
                                <li><span>商品价格</span><i>{{dDebtorInfo.stugoodprice | toLine2}}</i></li>
                                <li><span>商品分期价格</span><i>{{dDebtorInfo.instalmentsprice | toLine2}} </i></li>
                                <li><span>首付价格</span><i>{{dDebtorInfo.firstpaymoney | toLine2}} </i></li>
                                <li><span>分期期数</span><i>{{dDebtorInfo.loanNper | toLine0}} </i></li>
                                <li><span>委托金额</span><i>{{dDebtorInfo.totalAmount | toLine2}} </i></li>
                                <li><span>每期还款金额</span><i>{{dDebtorInfo.eachAmount | toLine2}} </i></li>
                                <li><span>账单日</span><i>{{dDebtorInfo.statementDateStr | toLine}} </i></li>
                                <li><span>已还期数</span><i>{{dDebtorInfo.hasAlsoNper | toLine0}} </i></li>
                                <li><span>未结清总额</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                                <li><span>未结清期数</span><i>{{dDebtorInfo.outstandingNper | toLine0}} </i></li>
                                <li><span>剩余本金</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                                <li><span>逾期本金</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                                <li><span>逾期期数</span><i>{{dDebtorInfo.overdueNper}} </i></li>
                                <li><span>逾期天数</span><i>{{dDebtorInfo.overdueDaysStr | toLine0}} </i></li>
                                <li><span>逾期利息</span><i>{{dDebtorInfo.interest | toLine2}} </i></li>
                                <li><span>违约金</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                                <li><span>手续费</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                                <li><span>末次还款时间</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                                <li><span>末次还款金额</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                                <li><span>产品名称</span><i>{{dDebtorInfo.productName | toLine}} </i></li>
                            </ul>
                            <ul v-else-if="dDebtorInfo.debtType1=='大额现金贷款'">
                                <li><span>贷款名称</span><i>{{dDebtorInfo.debtType2 | toLine}}</i></li>
                                <li><span>合同号</span><i>{{dDebtorInfo.contractNum}}</i></li>
                                <li><span>商品名称/型号</span><i>{{dDebtorInfo.debtType3 | toLine}}</i></li>
                                <li><span>合同日期</span><i>{{dDebtorInfo.contractDateStr | toLine}}</i></li>
                                <li><span>合同金额</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                                <li><span>委托金额</span><i>{{dDebtorInfo.totalAmount | toLine2}}</i></li>
                                <li><span>贷款期数</span><i>{{dDebtorInfo.loanNper | toLine0}}</i></li>
                                <li><span>每期金额</span><i>{{dDebtorInfo.eachAmount | toLine2}}</i></li>
                                <li><span>已还期数</span><i>{{dDebtorInfo.hasAlsoNper | toLine0}} </i></li>
                                <li><span>未结清总额</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                                <li><span>未结清期数</span><i>{{dDebtorInfo.outstandingNper | toLine0}} </i></li>
                                <li><span>剩余本金</span><i>{{dDebtorInfo.remainingPrincipal | toLine2}} </i></li>
                                <li><span>逾期本金</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                                <li><span>逾期期数</span><i>{{dDebtorInfo.overdueNper}} </i></li>
                                <li><span>逾期天数</span><i>{{dDebtorInfo.overdueDaysStr | toLine0}} </i></li>
                                <li><span>逾期利息</span><i>{{dDebtorInfo.interest | toLine2}} </i></li>
                                <li><span>违约金</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                                <li><span>手续费</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                                <li><span>末次还款时间</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                                <li><span>末次还款金额</span><i>{{dDebtorInfo.finalPaymentAmount | toLine2}} </i></li>
                                <li><span>地域</span><i>{{dDebtorInfo.loanCity | toLine}} </i></li>
                                <li><span>产品名称</span><i>{{dDebtorInfo.productName | toLine}} </i></li>
                            </ul>
                            <ul v-else-if="dDebtorInfo.debtType1=='汽车抵押贷款'">
                                <li><span>贷款名称</span><i>{{dDebtorInfo.debtType2 | toLine}}</i></li>
                                <li><span>合同号</span><i>{{dDebtorInfo.contractNum}}</i></li>
                                <li><span>合同金额</span><i>{{dDebtorInfo.contractAmount | toLine2}}</i></li>
                                <li><span>委案总额</span><i>{{dDebtorInfo.totalAmount | toNumber3}}</i></li>
                                <li><span>车辆型号</span><i>{{dDebtorInfo.cartype | toLine}}</i></li>
                                <li><span>发动机号</span><i>{{dDebtorInfo.carenginenumber | toLine}}</i></li>
                                <li><span>车架号</span><i>{{dDebtorInfo.carehicleframe | toLine}}</i></li>
                                <li><span>未结清总额</span><i>{{dDebtorInfo.outstandingAmount | toLine2}} </i></li>
                                <li><span>未结清期数</span><i>{{dDebtorInfo.outstandingNper | toLine0}} </i></li>
                                <li><span>已还期数</span><i>{{dDebtorInfo.hasAlsoNper | toLine0}} </i></li>
                                <li><span>逾期期数</span><i>{{dDebtorInfo.overdueNper}} </i></li>
                                <li><span>逾期天数</span><i>{{dDebtorInfo.overdueDaysStr | toLine0}} </i></li>
                                <li><span>逾期本金</span><i>{{dDebtorInfo.principal | toLine2}} </i></li>
                                <li><span>手续费（罚息）</span><i>{{dDebtorInfo.otherCost | toLine2}} </i></li>
                                <li><span>末次还款时间</span><i>{{dDebtorInfo.finalPaymentTimeStr | toLine}} </i></li>
                                <li><span>违约金</span><i>{{dDebtorInfo.penalty | toLine2}} </i></li>
                                <li><span>地域</span><i>{{dDebtorInfo.loanCity | toLine}} </i></li>
                                <li><span>产品名称</span><i>{{dDebtorInfo.productName | toLine}} </i></li>
                            </ul>
                            <div v-else="dDebtorInfo.debtType1=='房产抵押贷款'">
                                <img src="<%=basePath%>/newImg/3.2.5.1/noData.png" alt="" class="noData"/>
                            </div>
                        </div>
                        <div class="tab1List basicInfo">
                            <ul>
                                <li><span>婚姻状况</span><i>{{dDebtorInfo.debtorMarrige | toLine}}</i></li>
                                <li><span>职业</span><i>{{dDebtorInfo.professional | toLine}}</i></li>
                                <li><span>学历</span><i>{{dDebtorInfo.qualifications | toLine}} </i></li>
                                <li><span>家庭住址</span><i>{{dDebtorInfo.homeoneisone | toLine}}</i></li>
                                <li><span>户籍地址</span><i>{{dDebtorInfo.homeprocedure | toLine}}</i></li>
                                <li><span>单位名称</span><i>{{dDebtorInfo.debtorWorkUnit | toLine}}</i></li>
                                <li><span>单位电话</span><i>{{dDebtorInfo.workTelephone | toLine}}</i></li>
                                <li><span>单位地址</span><i>{{dDebtorInfo.workUnitProvince | toLine}}</i></li>
                            </ul>
                        </div>
                        <div class="tab1List repaymentInfo">
                            <ul>
                                <li v-show="eClientTarget.typeCount3"><span><img src="<%=basePath%>/newImg/3.2.5.1/App.svg" alt=""/>app还款</span></li>
                                <li v-show="eClientTarget.typeCount1"><span><img src="<%=basePath%>/newImg/3.2.5.1/weixin.svg" alt=""/>微信还款</span>
                                    <i>
                                        <p>微信昵称：{{eClientTarget.typeCountName1}}</p>
                                        <p>微信号：{{eClientTarget.typeCount1}}</p>
                                    </i>
                                </li>
                                <li v-show="eClientTarget.typeCount2"><span><img src="<%=basePath%>/newImg/3.2.5.1/zhifubao.svg" alt=""/>支付宝还款</span>
                                    <i>
                                        <p>支付宝户名：{{eClientTarget.typeCountName2}}</p>
                                        <p>支付宝账户：{{eClientTarget.typeCount2}}</p>
                                    </i>
                                </li>
                                <li v-show="eClientTarget.bankCardDebit"><span><img src="<%=basePath%>/newImg/3.2.5.1/yinhangkahuakou.svg" alt=""/>银行卡划扣</span>
                                </li>
                                <li v-show="accountSize>0"><span><img src="<%=basePath%>/newImg/3.2.5.1/yinhangzhuanzhang.svg" alt=""/>银行转账</span>
                                    <i>
                                        <div v-for="items in bankInfo">
                                            <p><span>开户行名称：</span><i>{{items.bankNames}}</i></p>
                                            <p><span>开户名：</span><i>{{items.accountNames}}</i></p>
                                            <p><span>银行卡号：</span><i>{{items.accounts}}</i></p>
                                        </div>
                                    </i>
                                </li>
                                <li v-if="eClientTarget.typeCount4">
                                    <span><img src="<%=basePath%>/newImg/3.2.5.1/dianmianhuankuan.svg" alt=""/>店面还款</span>
                                </li>
                            </ul>
                        </div>
                        <div class="tab1List collectionAskInfo">
                            <ul>
                                <li><span>产品说明</span><i>{{eClientTarget.productdescription | toLine}}</i></li>
                                <li><span>减免政策</span><i>{{eClientTarget.relief | toLine}}</i></li>
                                <li><span>禁言禁行</span><i>{{eClientTarget.silenced | toLine}}</i></li>
                                <li><span>催收短信模板</span><i>{{eClientTarget.smstemplate | toLine}}</i></li>
                                <li><span>备注信息</span><i>{{eClientTarget.remark | toLine}}</i></li>
                            </ul>
                        </div>
                        <div class="tab1List remarksInfo">
                            <ul>
                                <li><span>自定义1</span><i>{{dDebtorInfo.customize1 | toLine}}</i></li>
                                <li><span>自定义2</span><i>{{dDebtorInfo.customize2 | toLine}}</i></li>
                                <li><span>自定义3</span><i>{{dDebtorInfo.customize3 | toLine}}</i></li>
                                <li><span>自定义4</span><i>{{dDebtorInfo.customize4 | toLine}}</i></li>
                                <li><span>备注</span><i>{{dDebtorInfo.remark | toLine}}</i></li>
                                <li><span>备注1</span><i>{{dDebtorInfo.remark1 | toLine}}</i></li>
                                <li><span>备注2</span><i>{{dDebtorInfo.remark2 | toLine}}</i></li>
                                <li><span>备注3</span><i>{{dDebtorInfo.remark3 | toLine}}</i></li>
                                <li><span>备注4</span><i>{{dDebtorInfo.remark4 | toLine}}</i></li>
                                <li><span>备注5</span><i>{{dDebtorInfo.remark5 | toLine}}</i></li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab2">
                        <span class="tab2Li tab1On">催收记录</span>
                        <i class="line"></i>
                        <span class="tab2Li">对账记录</span>
                        <i class="line"></i>
                        <span class="tab2Li">减免记录</span>
                        <i class="line"></i>
                        <span class="tab2Li">通话记录</span>
                        <div class="tab2List tab2ListOn">
                            <div v-if="collectReadRecordNew.length>0">
                                <div  class="collectionRecord" v-for="item1 in collectReadRecordNew">
                                    <ul>
                                        <li><span>催收时间</span><i>{{item1.collectionTimeStr}}</i></li>
                                        <li><span>催收对象</span><i>{{item1.contectName}}</i></li>

                                        <li v-if="item1.telStatus==0"><span>电话状态</span><i>空号</i></li>
                                        <li v-else-if="item1.telStatus==1"><span>电话状态</span><i>呼叫正常</i></li>
                                        <li v-else-if="item1.telStatus==2"><span>电话状态</span><i>停机</i></li>
                                        <li v-else-if="item1.telStatus==3"><span>电话状态</span><i>未知</i></li>
                                        <li v-else-if="item1.telStatus==4"><span>电话状态</span><i>沉默</i></li>
                                        <li v-else-if="item1.telStatus==5"><span>电话状态</span><i>暂时无法接通</i></li>
                                        <li v-else-if="item1.telStatus==6"><span>电话状态</span><i>关机</i></li>
                                        <li v-else-if="item1.telStatus==7"><span>电话状态</span><i>空号、停机</i></li>
                                        <li v-else-if="item1.telStatus==8"><span>电话状态</span><i>关机、无法接通</i></li>
                                        <li v-else-if="item1.telStatus==9"><span>电话状态</span><i>无人接听</i></li>
                                        <li v-else-if="item1.telStatus==10"><span>电话状态</span><i>接听本人/有关联</i></li>
                                        <li v-else-if="item1.telStatus==11"><span>电话状态</span><i>接听非本人/无关联</i></li>
                                        <li><span>联系方式</span><i>{{item1.phoneNum}}</i></li>
                                        <li><span>备注</span><i>{{item1.record | toLine}}</i></li>
                                        <li><span>沟通方式</span><i>{{item1.collectionState | toLine}}</i></li>
                                        <li><span>承诺还款金额</span><i>{{item1.balancemoney | toNumber3}}</i></li>
                                        <li><span>承诺还款日期</span><i>{{item1.balanceTimeStr | toLine}}</i></li>
                                        <li><span>下次跟进时间</span><i>{{item1.followupTimeStr | dateFmt}}</i></li>
                                        <li><span>案件状态</span><i>{{item1.result}}</i></li>
                                    </ul>
                                </div>
                            </div>
                            <img src="<%=basePath%>newImg/3.2.5.1/noData.png" class="noData" v-else="" alt=""/>
                        </div>
                        <div class="tab2List">
                            <div v-if="collectReadCommitNew.length>0">
                                <div class="reconciliationRecord" v-for="item2 in collectReadCommitNew">
                                    <ul>
                                        <li><span>发起时间</span><i>{{item2.starttime}}</i></li>
                                        <li><span>还款金额</span><i>{{item2.applyMoney | toNumber3}}</i></li>
                                        <li v-if="item2.status==1"><span>上游确认金额</span><i> {{item2.money | toNumber3}}</i></li>
                                        <li v-else><span>上游确认金额</span><i>0.00</i></li>
                                        <li><span>还款时间</span><i>{{item2.recordtime |dateFmt}}</i></li>
                                        <li><span>还款方式</span><i>{{item2.BMStatus}}</i></li>
                                        <li><span>还款人</span><i>{{item2.BMPerson | toLine}}</i></li>
                                        <li><span>还款账户</span><i>{{item2.BANum  | toLine}}</i></li>
                                        <li v-if="item2.status==0"><span>对账状态</span><i>待审核</i></li>
                                        <li v-else-if="item2.status==1"><span>对账状态</span><i>对账成功</i></li>
                                        <li v-else-if="item2.status==2"><span>对账状态</span><i>拒绝对账</i></li>
                                        <li v-else-if="item2.status==3"><span>对账状态</span><i></i></li>
                                        <li v-else-if="item2.status==4"><span>对账状态</span><i>对账失败</i></li>
                                        <li v-else-if="item2.status==5"><span>对账状态</span><i>待同步</i></li>
                                        <li v-else-if="item2.status==6"><span>对账状态</span><i>作废</i></li>
                                        <li><span>失败原因</span><i>{{item2.instruction | toLine}}</i></li>
                                        <li><span>反馈时间</span><i>{{item2.confirmtimeStr | toLine}}</i></li>
                                        <li><span>同步时间</span><i>{{item2.inTimeStr | toLine}}</i></li>
                                        <li><span>废弃时间</span><i>{{item2.abandonTimeStr | toLine}}</i></li>
                                    </ul>
                                </div>
                            </div>
                            <img src="<%=basePath%>newImg/3.2.5.1/noData.png" class="noData" v-else="" alt=""/>
                        </div>
                        <div class="tab2List">
                            <div  v-if="collectReadApplyNew.length>0">
                                <div class="reliefRecord" v-for="item3 in collectReadApplyNew">
                                    <ul>
                                        <li><span>申请时间</span><i>{{item3.createDateStr}}</i></li>
                                        <li><span>减免原因</span><i>{{item3.reasonRejection}}</i></li>
                                        <li v-if="item3.auditStatus==1"><span>减免状态</span><i>已通过</i></li>
                                        <li v-else-if="item3.auditStatus==2"><span>减免状态</span><i>部分减免</i></li>
                                        <li v-else-if="item3.auditStatus==3"><span>减免状态</span><i>未通过</i></li>
                                        <li v-else-if="item3.auditStatus==4"><span>减免状态</span><i>待审核</i></li>
                                        <li v-else-if="item3.auditStatus==5"><span>减免状态</span><i>待同步</i></li>
                                        <li v-else-if="item3.auditStatus==6"><span>减免状态</span><i>作废</i></li>
                                        <li><span>审核时间</span><i>{{item3.updateDateStr | toLine}}</i></li>
                                        <li><span>同步时间</span><i>{{item3.inTimeStr  | toLine}}</i></li>
                                        <li><span>废弃时间</span><i>{{item3.cancletimeStr  | toLine}}</i></li>
                                        <li><span>减免后应还金额</span><i>{{item3.later_money | toNumber3}}</i></li>
                                        <li><span>批复还款金额</span><i>{{item3.approvedMoney | toNumber3}}</i></li>
                                        <li><span>批复说明</span><i>{{item3.approvedDesc | toLine}}</i></li>
                                    </ul>
                                </div>
                            </div>
                            <img src="<%=basePath%>newImg/3.2.5.1/noData.png" class="noData" v-else="" alt=""/>
                        </div>
                        <div class="tab2List">
                            <div v-if="collectReadCallRecordNew.length>0">
                                <div class="callRecord" v-for="item4 in collectReadCallRecordNew">
                                    <ul>
                                        <li><span>呼叫时间</span><i>{{item4.startTimeStr}}</i></li>
                                        <li><span>通话时长</span><i>{{item4.talkTime | toNumber2}}</i></li>
                                        <li><span>主叫号码</span><i>{{item4.callingNum}}</i></li>
                                        <li><span>被叫号码</span><i>{{item4.passtiveNum}}</i></li>
                                        <li><span>通话状态</span><i>{{item4.callResult}}</i></li>
                                    </ul>
                                </div>
                            </div>
                            <img src="<%=basePath%>newImg/3.2.5.1/noData.png" class="noData" v-else="" alt=""/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="collectionRight">
            <div class="timeAxis">
                <div class="timeListNoData">
                    <div class="timeTitle">催收历史</div>
                    <div class="listInfo">
                        <span class="allInfo listInfoOn allListInfo1" onclick="getTimeInfo(this,'',1)">全部</span>
                        <span class="oneselfInfo allListInfo1" onclick="getTimeInfo(this,1,2)">本人</span>
                        <span class="noOneselfInfo allListInfo1" onclick="getTimeInfo(this,2,3)">非本人</span>
                    </div>
                    <div class="noData">
                        <img src="<%=basePath%>/newImg/3.2.5.4/timeListNoData.svg" style="display:block;margin:70px auto;" alt=""/>
                    </div>
                </div>
                <div class="timeListHasData">
                    <div class="leftOpacity"></div>
                    <div class="rightOpacity"></div>
                    <div class="timeTitle">催收历史</div>
                    <div class="listInfo">
                        <span class="allInfo listInfoOn allListInfo2" onclick="getTimeInfo(this,'',1)">全部</span>
                        <span class="oneselfInfo allListInfo2" onclick="getTimeInfo(this,1,2)">本人</span>
                        <span class="noOneselfInfo allListInfo2" onclick="getTimeInfo(this,2,3)">非本人</span>
                    </div>
                    <div v-show="timerListSureList==false">
                        <div class="noData">
                            <img src="<%=basePath%>/newImg/3.2.5.4/timeListNoData1.svg" style="display:block;margin:70px auto;" alt=""/>
                        </div>
                    </div>
                    <div v-show="timerListSureList" class="timeList">
                        <ul v-show="timerListSure==false" class="layui-timeline ul1">
                            <li class="layui-timeline-item"></li>
                            <li class="layui-timeline-item" v-for="(item,index) in timerList" :key="index">
                                <div v-if="index%2==0 && index!=(timerList.length-1)">
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/valuable.svg" alt="" v-if="item.contectName"/>
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/novalue.svg" alt="" v-else-if="item.contectName==''"/>
                                    <div class="layui-timeline-content layui-text" v-if="item.contectName">
                                        <input type="hidden" value="${dDebtorInfo.id}"/>
                                        <input type="hidden" :value="item.queryDate"/>
                                        <div onclick="timeRecord(this)">
                                            <div class="statusBgUp topBg1"  v-if="item.result=='投诉倾向'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg2"  v-else-if="item.result=='多次跳票'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg3"  v-else-if="item.result=='否认身份'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg4"  v-else-if="item.result=='待对账'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg5"  v-else-if="item.result=='承诺还款'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg6"  v-else-if="item.result=='谈判中'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg7"  v-else-if="item.result=='恶意拖欠'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg8"  v-else-if="item.result=='失联'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <p class="timeBorders">{{item.queryDate | dateFmt1}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div v-if="index%2!=0 && index!=(timerList.length-1)">
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/valuable.svg" alt="" v-if="item.contectName"/>
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/novalue.svg" alt="" v-else-if="item.contectName==''"/>
                                    <div class="layui-timeline-content layui-text" v-if="item.contectName">
                                        <%--<div @click="timeRecord(${dDebtorInfo.id},item.queryDate)">--%>
                                        <input type="hidden" value="${dDebtorInfo.id}"/>
                                        <input type="hidden" :value="item.queryDate"/>
                                        <div onclick="timeRecord(this)">
                                            <p class="timeBorders">{{item.queryDate | dateFmt1}}</p>
                                            <div class="statusBgDown downBg1" v-if="item.result=='投诉倾向'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg2" v-else-if="item.result=='多次跳票'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg3" v-else-if="item.result=='否认身份'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg4" v-else-if="item.result=='待对账'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg5" v-else-if="item.result=='承诺还款'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg6" v-else-if="item.result=='谈判中'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg7" v-else-if="item.result=='恶意拖欠'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg8" v-else-if="item.result=='失联'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div v-if="index==(timerList.length-1)">
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/today.svg" alt=""/>
                                    <div class="layui-timeline-content layui-text" v-if="item.queryDate">
                                        <div>
                                            <p class="timeBorders">{{item.queryDate | dateFmt1}}</p>
                                            <p style="word-wrap: break-word;word-break: normal;">今日尚未催收</p>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <ul v-show="timerListSure" class="layui-timeline ul2">
                            <li class="layui-timeline-item"></li>
                            <li class="layui-timeline-item" v-for="(item,index) in timerList" :key="index">
                                <div v-if="index%2==0">
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/valuable.svg" alt="" v-if="item.contectName"/>
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/novalue.svg" alt="" v-else-if="item.contectName==''"/>
                                    <div class="layui-timeline-content layui-text" v-if="item.contectName">
                                        <input type="hidden" value="${dDebtorInfo.id}"/>
                                        <input type="hidden" :value="item.queryDate"/>
                                        <div onclick="timeRecord(this)">
                                            <%--<div class="statusBgUp">--%>
                                            <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            <%--<p>--%>
                                            <%--{{item.result}}--%>
                                            <%--<img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>--%>
                                            <%--</p>--%>
                                            <%--</div>--%>
                                            <div class="statusBgUp topBg1"  v-if="item.result=='投诉倾向'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg2"  v-else-if="item.result=='多次跳票'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg3"  v-else-if="item.result=='否认身份'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg4"  v-else-if="item.result=='待对账'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg5"  v-else-if="item.result=='承诺还款'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg6"  v-else-if="item.result=='谈判中'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg7"  v-else-if="item.result=='恶意拖欠'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <div class="statusBgUp topBg8"  v-else-if="item.result=='失联'">
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                    <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                            </div>
                                            <p class="timeBorders">{{item.queryDate | dateFmt1}}</p>
                                        </div>
                                    </div>
                                </div>
                                <div v-if="index%2!=0">
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/valuable.svg" alt="" v-if="item.contectName"/>
                                    <img class="layui-timeline-axis" src="<%=basePath%>/newImg/3.2.5.1/novalue.svg" alt="" v-else-if="item.contectName==''"/>
                                    <div class="layui-timeline-content layui-text" v-if="item.contectName">
                                        <%--<div @click="timeRecord(${dDebtorInfo.id},item.queryDate)">--%>
                                        <input type="hidden" value="${dDebtorInfo.id}"/>
                                        <input type="hidden" :value="item.queryDate"/>
                                        <div onclick="timeRecord(this)">
                                            <p class="timeBorders" :title="item.queryDate">{{item.queryDate | dateFmt1}}</p>
                                            <%--<div class="statusBgDown">--%>
                                            <%--<p>--%>
                                            <%--{{item.result}}--%>
                                            <%--<img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>--%>
                                            <%--</p>--%>
                                            <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            <%--</div>--%>
                                            <div class="statusBgDown downBg1" v-if="item.result=='投诉倾向'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg2" v-else-if="item.result=='多次跳票'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg3" v-else-if="item.result=='否认身份'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg4" v-else-if="item.result=='待对账'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg5" v-else-if="item.result=='承诺还款'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg6" v-else-if="item.result=='谈判中'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg7" v-else-if="item.result=='恶意拖欠'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'" v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                            <div class="statusBgDown downBg8" v-else-if="item.result=='失联'">
                                                <p>
                                                    {{item.result}}
                                                    <img src="<%=basePath%>/newImg/3.2.5.1/leftArrow.svg" alt=""/>
                                                </p>
                                                <p :title="item.contectName+'('+item.relation+')'"  v-if="item.relation!=''">{{item.contectName}}({{item.relation}})</p>
                                                <p :title="item.contectName" v-else>{{item.contectName}}</p>
                                                <%--<p :title="item.contectName">{{item.contectName}}</p>--%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="timeListOpen">
                    <p>
                        <%--<span style="display:inline-block;width:80px;">--%>
                            <%--<input type="hidden" value="${dDebtorInfo.id}"/>--%>
                            <%--<input type="hidden" :value="lastDate"/>--%>
                            <%--&lt;%&ndash;<button class="leftIcon" onclick="timeRecord(this,1)" v-if="lastDate==-1" disabled>上一条</button>&ndash;%&gt;--%>
                            <%--<button class="leftIcon" onclick="timeRecord(this,1)" v-show="lastDate!=-1">上一条</button>--%>
                        <%--</span>--%>
                        <%--<i class="selectedDate"></i>--%>
                        <%--<span style="display:inline-block;width:80px;">--%>
                             <%--<input type="hidden" value="${dDebtorInfo.id}"/>--%>
                            <%--<input type="hidden" :value="nextDate"/>--%>
                            <%--&lt;%&ndash;<button class="rightIcon" onclick="timeRecord(this,2)" v-if="nextDate==-1" disabled>下一条</button>&ndash;%&gt;--%>
                            <%--<button class="rightIcon" onclick="timeRecord(this,2)" v-show="nextDate!=-1">下一条</button>--%>
                        <%--</span>--%>
                        <img src="<%=basePath%>/newImg/3.2.5.1/closeTimeList.svg" class="closeTimeList" @click="closeTimeList" alt=""/>
                    </p>
                    <div class="topjianbian"></div>
                    <div class="timerContent">
                        <ul class="layui-timeline">
                            <div v-for="(list,key) in timerContent" :key="key" class="divBg">
                               <div style="z-index:12;position: relative;left: -125px;top: 28px;">
                                   <span class="dateList" v-if="key=='${today}'">今天</span>
                                   <span class="dateList" v-else-if="key=='${yesterday}'">昨天</span>
                                   <span class="dateList" v-else-if="key=='${beforeYesterday}'">前天</span>
                                   <span class="dateList" v-else>{{key | dateFmt1}}</span>
                                   <input type="hidden" :value="key" class="collectionDate"/>
                               </div>
                            <li class="layui-timeline-item" v-for="(item,i) in list" :key="i" >
                                <a href="" name="item.queryDate"></a>
                                <i class="iconAxis"></i>
                                <div class="layui-timeline-content layui-text">
                                        <span class="timer">{{item.queryDate | changeTime}}</span>
                                        <p class="nameTitle">{{item.contectName}}
                                            <span class="guanxi" v-if="item.relation">({{item.relation}})</span>
                                            <span v-if="item.result=='投诉倾向'" class="color1 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='多次跳票'" class="color2 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='否认身份'" class="color3 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='待对账'" class="color4 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='承诺还款'" class="color5 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='谈判中'" class="color6 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='恶意拖欠'" class="color7 colortext">{{item.result}}</span>
                                            <span v-else-if="item.result=='失联'" class="color8 colortext">{{item.result}}</span>
                                        </p>
                                        <p class="timerText">备注：{{item.record | toLine}}</p>
                                </div>
                            </li>
                            </div>
                        </ul>
                    </div>
                    <div class="bottomjianbian"></div>
                </div>
            </div>
            <div class="addInfo">
                <div class="formContent">
                    <%--<span class="prev" onclick="getNextNew('${dDebtorInfo.id}',1)"></span>--%>
                    <%--<span class="next" onclick="getNextNew('${dDebtorInfo.id}',2)"></span>--%>
                    <div class="formTab">
                        <span class="formTabList onSpan" onclick="formTabList(this)">新增催记
                            <img v-if="noEmpty==1" src="<%=basePath%>/newImg/3.2.5.1/noEmpty.svg" alt=""/>
                        </span>
                        <span class="formTabList" onclick="formTabList(this)">发起对账
                             <img v-if="noEmpty1==1" src="<%=basePath%>/newImg/3.2.5.1/noEmpty.svg" alt=""/>
                        </span>
                        <span class="formTabList" onclick="formTabList(this)">发起减免
                            <img v-if="noEmpty2==1" src="<%=basePath%>/newImg/3.2.5.1/noEmpty.svg" alt=""/>
                        </span>
                    </div>
                    <div class="formToast" v-show="changeLableTip==0">
                        <img src="<%=basePath%>/newImg/3.2.5.1/tips.svg" alt=""/>切换标签后，您之前填写的内容也会被保留，请放心操作。<span class="closeToast" onclick="closeChangeLableTip()">不再提示</span>
                    </div>
                    <div class="tabContent">
                        <div class="newAdd">
                            <table>
                                <tr>
                                    <td class="padT15">
                                        <div class="selectBox disInline"  style="width:160px;margin-right: 10px;">
                                            <span><i>*</i>姓名</span>
                                            <input type="text" class="inpNew cursorP linkManName addInput" maxlength="11" data-id="" onfocus="focusFun(this)" onblur="blurFun(this)" onkeyup="this.value=this.value.replace(/[^\u4e00-\u9fa5]/g,'');$(this).attr('data-id',this.value);notEmpty(0,this);$('#linkName').val(this.value)"/>
                                            <input type="hidden" value="" id="guanxi"/>
                                        </div>
                                    </td>
                                    <td class="padT15">
                                        <div class="selectBox disInline"  style="width:160px;margin-right: 10px;">
                                            <span><i>*</i>电话</span>
                                            <input type="hidden" id="linkName" value=""/>
                                            <input type="hidden" id="linkPhone" value=""/>
                                            <input type="hidden" id="linkId" value=""/>
                                            <input type="text" class="inpNew cursorP callTel addInput" style="padding-right:25px;" maxlength="20" data-id="" onfocus="focusFun(this)" onblur="blurFun(this)" onkeyup="this.value=this.value.replace(/[^\d]/g,'');$(this).attr('data-id',this.value);notEmpty(0,this);$('#linkPhone').val(this.value)"/>
                                            <img v-if="seatNum!=''" src="<%=basePath%>newImg/3.2.5.1/call.svg" onclick="callQueryImg(this,'${dDebtorInfo.id}')" alt="" class="callBg"/>
                                            <img v-else-if="seatNum!=''" src="<%=basePath%>newImg/3.2.5.1/noCall.svg" alt="" class="callBg"/>
                                        </div>
                                    </td>
                                    <td class="padT15">
                                        <div class="selectBox disInline"  style="width:160px;">
                                            <span><i>*</i>电话状态</span>
                                            <input type="text" class="inpNew dropDown cursorP telState addInput" onfocus="focusFun(this)" onblur="blurFun(this)" onchange="notEmpty(0,this)" style="margin-right:0;" data-id="" value="请选择" readonly/>
                                            <ul class="selList">
                                                <li data-id="">请选择</li>
                                                <li data-id="7">空号、停机</li>
                                                <li data-id="8">关机、无法接通</li>
                                                <li data-id="9">无人接听</li>
                                                <li data-id="10">接听本人/有关联</li>
                                                <li data-id="11">接听非本人/无关联</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="padT15">
                                        <div class="selectBox1 disInline"  style="width:160px;">
                                            <span class="nextTime">下次跟进时间 <span class="theToday" onclick="acquisitionTime(this,1)">今天</span><span class="theTomorrow" onclick="acquisitionTime(this,2)">明天</span><span class="afterTomorrow" onclick="acquisitionTime(this,3)">后天</span></span>
                                            <input type="text" class="inpNew rangeDate cursorP addInput" readonly autocomplete="off" id="flollowTime" data-id="" onchange="notEmpty(0,this)"/>
                                        </div>
                                    </td>
                                    <td class="padT15">
                                        <div class="selectBox disInline"  style="width:160px;">
                                            <span>沟通方式</span>
                                            <input type="text" class="inpNew dropDown cursorP solveMode addInput" data-id="" value="请选择" onchange="notEmpty(0,this)" readonly/>
                                            <ul class="selList">
                                                <li data-id="">请选择</li>
                                                <li data-id="电催">电催</li>
                                                <li data-id="短信">短信</li>
                                                <li data-id="微信">微信</li>
                                                <li data-id="qq">qq</li>
                                                <li data-id="其他">其他</li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="padT15">
                                        <div class="selectBox disInline"  style="width:160px;">
                                            <span><i>*</i>案件状态</span>
                                            <input type="text" class="inpNew dropDown cursorP addInput" id="caseStatus" onfocus="focusFun(this)" onblur="blurFun(this)" onchange="notEmpty(0,this)" data-id="" value="请选择" readonly/>
                                            <ul class="selList caseStatus">
                                                <li data-id="" class="selected">请选择</li>
                                                <li data-id="1">承诺还款</li>
                                                <li data-id="3">待对账</li>
                                                <li data-id="4">谈判中</li>
                                                <li data-id="8">恶意拖欠</li>
                                                <li data-id="9">失联</li>
                                                <li data-id="10">多次跳票</li>
                                                <li data-id="12">投诉倾向</li>
                                                <li data-id="13">否认身份</li>
                                            </ul>
                                        </div>
                                    </td>
                                    <td class="padT15" v-show="repayment">
                                        <div class="selectBox disInline"  style="width:160px;">
                                            <span><i>*</i>承诺还款金额</span>
                                            <input type="text" class="inpNew cursorP backMoney addInput" data-id="" onfocus="focusFun(this)" onblur="blurFun(this);changeNum(this)" onkeyup="$(this).attr('data-id',this.value);clearNoNum(this);notEmpty(0,this)"/>
                                        </div>
                                    </td>
                                    <td class="padT15" v-show="repayment">
                                        <div class="selectBox1 disInline"  style="width:160px;">
                                                <span class="promiseTime"><i>*</i>承诺还款日期<span class="theToday" onclick="acquisitionTime(this,1)">今天</span><span class="theTomorrow" onclick="acquisitionTime(this,2)">明天</span><span class="afterTomorrow" onclick="acquisitionTime(this,3)">后天</span>
                                                </span>
                                            <input type="text" class="inpNew rangeDate cursorP addInput" readonly autocomplete="off" id="commitmentTime" data-id="" style="margin-right:0;" onfocus="focusFun(this)" onblur="blurFun(this)" onchange="notEmpty(0,this)"/>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="padT15">
                                        <div class="selectBox disInline"  style="width:530px;">
                                            <span>备注</span>
                                            <textarea name="" class="newAddRemarks addInput" maxlength="200" data-id="" onkeyup="this.value=this.value.replace(/\s+/g,'');$(this).attr('data-id',this.value);" onchange="notEmpty(0,this)"></textarea>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="verify">
                            <!--ableCommit==1 不可发起对账   ableCommit==2 撤标-->
                            <img v-show="ableCommit==1" src="<%=basePath%>/newImg/3.2.5.1/noData2.png" class="noData2" alt=""/>
                            <img v-show="ableCommit==2" src="<%=basePath%>/newImg/3.2.5.1/noData3.png" class="noData3" alt=""/>
                            <div v-show="ableCommit==0">
                                <div class="billBasicsInfo">
                                    <p class="infoTitle infoTitle1">基础信息</p>
                                    <div class="infoList">
                                        <p>
                                            <span>姓名</span>
                                            <i title="${dDebtorInfo.debtorName}">${dDebtorInfo.debtorName}</i>
                                        </p>
                                        <p>
                                            <span>身份证号</span>
                                            <i title="${dDebtorInfo.debtorIdNum}">
                                                <c:if test="${dDebtorInfo.debtorIdNum==''|| dDebtorInfo.debtorIdNum==null}">
                                                    - -
                                                </c:if>
                                                <c:if test="${dDebtorInfo.debtorIdNum!=''&& dDebtorInfo.debtorIdNum!=null}">
                                                    ${dDebtorInfo.debtorIdNum}
                                                </c:if>
                                            </i>
                                        </p>
                                    </div>
                                    <div class="infoList">
                                        <p>
                                            <span>合同号</span>
                                            <i title="${dDebtorInfo.contractNum}">${dDebtorInfo.contractNum}</i>
                                        </p>
                                        <p>
                                            <span>当前应还金额</span>
                                            <i :title="${dDebtorInfo.currentAmount} | toNumber3">{{${dDebtorInfo.currentAmount} | toNumber3}}</i>
                                        </p>
                                    </div>
                                    <c:if test="${dDebtorInfo.afterReductionMoney>0}">
                                        <div class="infoBottom">
                                            <span>减免应还金额：<i :title="${dDebtorInfo.afterReductionMoney} | toNumber3">{{${dDebtorInfo.afterReductionMoney} | toNumber3}}</i></span>
                                            <span>批复日期：<i title="${dDebtorInfo.reductionAfterApplyTimeStr}">${dDebtorInfo.reductionAfterApplyTimeStr}</i></span>
                                            <span>批复说明：<i :title="'${dDebtorInfo.reductionApprovedDesc}'| toLine">{{"${dDebtorInfo.reductionApprovedDesc}" | toLine}}</i></span>
                                        </div>
                                    </c:if>
                                </div>
                                <div class="billBackInfo">
                                    <p class="infoTitle">还款方式</p>
                                    <table>
                                        <table>
                                            <tr>
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span><i>*</i>还款方式</span>
                                                        <input type="text" class="inpNew dropDown cursorP verifyInput" id="backType" data-id="" value="请选择" style="margin-right:0;" readonly onfocus="focusFun(this)" onblur="blurFun(this)" onchange="notEmpty(1,this)"/>
                                                        <ul class="selList">
                                                            <li data-id="" class="selected">请选择</li>
                                                            <li :data-id="items.name"  v-for="items in backMoneyType">{{items.name}}<input type="hidden" :value="items.val"/>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td class="padT15" v-show="backType">
                                                    <div class="selectBox disInline" v-show="backTypeName==false" style="width:160px;margin-right:20px;">
                                                        <span class="backTypeName"></span>
                                                        <input type="text" class="inpNew cursorP" id="backTypeInfo" readonly/>
                                                    </div>
                                                    <div class="selectBox disInline" v-show="backTypeName" style="width:160px;margin-right:20px;">
                                                        <span class="backTypeName"></span>
                                                        <input type="text" class="inpNew dropDown cursorP" id="backTypeInfo1" readonly/>
                                                        <ul class="selList" id="backMoneyType1">

                                                        </ul>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="padT15">
                                                    <div class="selectBox1 disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="backTime"><i>*</i>还款日期 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="theToday" onclick="backMoneyTime(this,1)">前天</span><span class="theTomorrow" onclick="backMoneyTime(this,2)">昨天</span><span class="afterTomorrow" onclick="backMoneyTime(this,3)">今天</span></span>
                                                        <input type="text" class="inpNew rangeDate cursorP verifyInput" readonly autocomplete="off" id="backMoneyTime" data-id="" onchange="notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    </div>
                                                </td>
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span><i>*</i>还款金额</span>
                                                        <input type="text" class="inpNew cursorP verifyInput backMoneyNum" min="0" data-id="" onfocus="focusFun(this)" oninput="changeN(this);notEmpty(1,this)" onblur="backMoney(this);"/>
                                                    </div>
                                                </td>
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span>还款人姓名</span>
                                                        <input type="text" class="inpNew cursorP backMoneyName verifyInput" data-id="" style="margin-right:0;" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'');$(this).attr('data-id',this.value);notEmpty(1,this)" onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))" maxlength="11"/>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span>还款账户</span>
                                                        <input type="text" class="inpNew cursorP verifyInput backBank" maxlength="19" data-id="" onkeyup = "value=value.replace(/[^\d]/g,'');$(this).attr('data-id',this.value);notEmpty(1,this)"/>
                                                    </div>
                                                </td>
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span>是否结清</span>
                                                        <input type="text" class="inpNew dropDown cursorP verifyInput settle" data-id="" value="请选择" readonly onchange="notEmpty(1,this)"/>
                                                        <ul class="selList">
                                                            <li data-id="">请选择</li>
                                                            <li data-id="全额结清">全额结清</li>
                                                            <li data-id="减免结清">减免结清</li>
                                                            <li data-id="部分还款">部分还款</li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td class="padT15" v-if="customTitle>=1">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="customTitle"><i v-if="com_ct_list[0].fieldValue==1">*</i><span class="customKey" :title="com_ct_list[0].fieldName">{{com_ct_list[0].fieldName}}</span></span>
                                                        <input v-if="com_ct_list[0].fieldValue==1" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks1" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                        <input v-else="com_ct_list[0].fieldValue==2" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks1" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)"/>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr v-if="customTitle>=2">
                                                <td class="padT15" v-if="customTitle>=2">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="customTitle"><i v-if="com_ct_list[1].fieldValue==1">*</i><span class="customKey" :title="com_ct_list[1].fieldName">{{com_ct_list[1].fieldName}}</span></span>
                                                        <input v-if="com_ct_list[1].fieldValue==1" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks2" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                        <input v-else="com_ct_list[1].fieldValue==2" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks2" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)"/>
                                                    </div>
                                                </td>
                                                <td class="padT15" v-if="customTitle>=3">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="customTitle"><i v-if="com_ct_list[2].fieldValue==1">*</i><span class="customKey" :title="com_ct_list[2].fieldName">{{com_ct_list[2].fieldName}}</span></span>
                                                        <input v-if="com_ct_list[2].fieldValue==1" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks3" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                        <input v-else="com_ct_list[2].fieldValue==2" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks3" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)"/>
                                                    </div>
                                                </td>
                                                <td class="padT15" v-if="customTitle>=4">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="customTitle"><i v-if="com_ct_list[3].fieldValue==1">*</i><span class="customKey" :title="com_ct_list[3].fieldName">{{com_ct_list[3].fieldName}}</span></span>
                                                        <input v-if="com_ct_list[3].fieldValue==1" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks4" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                        <input v-else="com_ct_list[3].fieldValue==2" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks4" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" />
                                                    </div>

                                                </td>
                                            </tr>
                                            <tr v-if="customTitle==5">
                                                <td class="padT15">
                                                    <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                        <span class="customTitle"><i v-if="com_ct_list[4].fieldValue==1">*</i><span class="customKey" :title="com_ct_list[4].fieldName">{{com_ct_list[4].fieldName}}</span></span>
                                                        <input v-if="com_ct_list[4].fieldValue==1" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks5" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                        <input v-else="com_ct_list[4].fieldValue==2" type="text" maxlength="50" data-id="" class="inpNew cursorP verifyInput remarks5" onkeyup="$(this).attr('data-id',this.value);notEmpty(1,this)"/>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </table>
                                </div>
                                <div class="billImgInfo">
                                    <p class="infoTitle"><i class="padt15I" v-show="com_photo==1">*</i>上传图片凭证</p>
                                    <input type="hidden" class="verifyInput verifyImgList" data-id="" onchange="notEmpty(1,this)"/>
                                    <input type="hidden" class="verifyImgListName" data-id=""/>
                                    <div class="uploadFile" style="margin-top: 6px">
                                        <div class="falseImg1 marR10 verifyImg">上传图片</div>
                                        <form id="uploadImg1" class="fileForm" method="post" enctype="multipart/form-data">
                                            <input type="hidden" id="fieldImg1" name="fieldName" value="uploadImgName1"/>
                                            <input type="hidden" id="uploadImgAddress1"  value=""/>
                                            <span class="btnOne"><input type="file" name="uploadImgName1" id="uploadImgName1" class="myFile" title="" value="" accept="image/gif,image/png,image/jpg" onchange="ImgFunction1(this)"/></span>
                                        </form>
                                        <div class="imgBox1">

                                        </div>
                                    </div>
                                </div>
                                <div class="billVideoInfo">
                                    <p class="infoTitle"><i class="padt15I" v-show="com_redio==1">*</i>上传录音凭证</p>
                                    <input type="hidden" class="verifyInput verifyVideoList" data-id="" onchange="notEmpty(1,this)"/>
                                    <input type="hidden" class="verifyVideoListName" data-id=""/>
                                    <div class="uploadFile" style="margin-top: 6px">
                                        <div class="falseVideo1 marR10 verifyVideo">上传录音</div>
                                        <form id="videoBox1" class="fileForm" method="post" enctype="multipart/form-data">
                                            <input type="hidden" id="fieldVideo1" name="fieldName" value="uploadVideoName1"/>
                                            <input type="hidden" id="uploadVideoAddress1"  value=""/>
                                            <span class="btnOne"><input type="file" name="uploadVideoName1" id="uploadVideoName1" class="myFile" title="" value="" accept="audio/Mp3,audio/mp3,,audio/wav,audio/arm,audio/wma,audio/ava,audio/act" onchange="VideoFunction1(this)"/></span>
                                        </form>
                                        <div class="videoBox1"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="reduction">
                            <!-- ableReduction==2 撤标  ableReduction==1 有待审核的减免-->
                            <img v-show="ableReduction==2" src="<%=basePath%>/newImg/3.2.5.1/noData3.png" class="noData3" alt=""/>
                            <img v-show="ableReduction==1" src="<%=basePath%>/newImg/3.2.5.1/noData1.png" class="noData1" alt=""/>
                            <div v-show="ableReduction==0">
                                <div class="reductionBasicsInfo">
                                    <p class="infoTitle infoTitle1">基础信息</p>
                                    <div class="infoList">
                                        <p>
                                            <span>姓名</span>
                                            <i title="${dDebtorInfo.debtorName}">${dDebtorInfo.debtorName}</i>
                                        </p>
                                        <p>
                                            <span>身份证号</span>
                                            <i title="${dDebtorInfo.debtorIdNum}">
                                                <%--${dDebtorInfo.debtorIdNum}--%>
                                                <c:if test="${dDebtorInfo.debtorIdNum==''|| dDebtorInfo.debtorIdNum==null}">
                                                    - -
                                                </c:if>
                                                <c:if test="${dDebtorInfo.debtorIdNum!=''&& dDebtorInfo.debtorIdNum!=null}">
                                                    ${dDebtorInfo.debtorIdNum}
                                                </c:if>
                                            </i>
                                        </p>
                                    </div>
                                    <div class="infoList">
                                        <p>
                                            <span>合同号</span>
                                            <i title="${dDebtorInfo.contractNum}">${dDebtorInfo.contractNum}</i>
                                        </p>
                                        <p>
                                            <span>委托金额</span>
                                            <i :title="${dDebtorInfo.totalAmount} | toNumber3">{{${dDebtorInfo.totalAmount} | toNumber3}}</i>
                                        </p>
                                    </div>
                                    <div class="infoBottom1">
                                        <span>逾期本金：<i :title="${dDebtorInfo.principal} | toNumber3">{{${dDebtorInfo.principal} | toNumber3}}</i></span>
                                        <span>逾期利息：<i :title="${dDebtorInfo.interest} | toNumber3">{{${dDebtorInfo.interest} | toNumber3}}</i></span>
                                        <span>违约金：<i :title="${dDebtorInfo.penalty} | toNumber3">{{${dDebtorInfo.penalty} | toNumber3}}</i></span>
                                        <span>手续费：<i :title="${dDebtorInfo.otherCost} | toNumber3">{{${dDebtorInfo.otherCost} | toNumber3}}</i></span>
                                    </div>
                                </div>
                                <div class="reductionBackInfo">
                                    <p class="infoTitle">减免信息</p>
                                    <table style="font-size:12px;">
                                        <tr v-if="maxAppAoumt_on_off=='on'">
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span>减免前应还金额</span>
                                                    <input type="text" data-id="" class="inpNew cursorP reductionMb" :value="$options.filters.toNumber3(applyBeforeMoney)" style="margin-right:0;background:#E0E7ED;" disabled/>
                                                </div>
                                            </td>
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span>减免上限</span>
                                                    <input type="text" data-id="" class="inpNew cursorP maxAppAoumt" :value="$options.filters.toNumber3(maxAppAoumt)" style="margin-right:0;background:#E0E7ED;" disabled/>
                                                </div>
                                            </td>
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span><i>*</i>减免后应还金额</span>
                                                    <input type="text" data-id="" class="inpNew cursorP reductionInput reductionMa" style="margin-right:0;" onfocus="focusFun(this)" onblur="blurFun(this);changeNumjigou(this)" onkeyup="this.value=this.value.replace(/[^\d.]/g,'');$(this).attr('data-id',this.value.replace(/[^\d.]/g,''));notEmpty(2,this);"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr v-else-if="maxAppAoumt_on_off=='off'">
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span><i>*</i>减免前应还金额</span>
                                                    <input type="text" data-id="" class="inpNew cursorP reductionInput reductionMb" style="margin-right:0;" onfocus="focusFun(this)" onblur="blurFun(this);changeNum1(this)" oninput="changeN(this);notEmpty(2,this);"/>
                                                </div>
                                            </td>
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span><i>*</i>减免后应还金额</span>
                                                    <input type="text" data-id="" class="inpNew cursorP reductionInput reductionMa" style="margin-right:0;" onfocus="focusFun(this)" onblur="blurFun(this);changeNum1(this)" oninput="changeN(this);notEmpty(2,this);"/>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="padT15" colspan="3">
                                                <div class="selectBox1 disInline"  style="width:160px;margin-right:20px;">
                                                    <span><i>*</i>减免理由</span>
                                                    <textarea name="" class="reductionReasons reductionInput" data-id="" maxlength="200" onfocus="focusFun(this)" onblur="blurFun(this)" onkeyup="this.value=this.value.replace(/\s+/g,'');$(this).attr('data-id',this.value);notEmpty(2,this);"></textarea>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr v-if="reductionReasons>=1">
                                            <td class="padT15">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span class="customTitle"><i v-if="red_ct_list[0].fieldValue==1">*</i><span class="customlist" :title="red_ct_list[0].fieldName">{{red_ct_list[0].fieldName}}</span></span>
                                                    <input v-if="red_ct_list[0].fieldValue==1" maxlength="50" data-id="" type="text" class="inpNew cursorP remark1 reductionInput" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    <input v-else="red_ct_list[0].fieldValue==2" maxlength="50" data-id="" type="text" class="inpNew cursorP remark1 reductionInput" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)"/>
                                                </div>
                                            </td>
                                            <td class="padT15" v-if="reductionReasons>=2">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span class="customTitle"><i v-if="red_ct_list[1].fieldValue==1">*</i><span class="customlist" :title="red_ct_list[1].fieldName">{{red_ct_list[1].fieldName}}</span></span>
                                                    <input v-if="red_ct_list[1].fieldValue==1" maxlength="50" data-id="" type="text" class="inpNew remark2 cursorP reductionInput" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    <input v-else="red_ct_list[1].fieldValue==2" maxlength="50" data-id="" type="text" class="inpNew remark2 cursorP reductionInput" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)"/>
                                                </div>
                                            </td>
                                            <td class="padT15" v-if="reductionReasons>=3">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span class="customTitle"><i v-if="red_ct_list[2].fieldValue==1">*</i><span class="customlist" :title="red_ct_list[2].fieldName">{{red_ct_list[2].fieldName}}</span></span>
                                                    <input v-if="red_ct_list[2].fieldValue==1" maxlength="50" data-id="" type="text" class="inpNew remark3 cursorP reductionInput" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    <input v-else="red_ct_list[2].fieldValue==2" maxlength="50" data-id="" type="text" class="inpNew remark3 cursorP reductionInput" style="margin-right:0;"onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)"/>
                                                </div>

                                            </td>
                                        </tr>
                                        <tr v-if="reductionReasons>=4">
                                            <td class="padT15" v-if="reductionReasons>=4">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span class="customTitle"><i v-if="red_ct_list[3].fieldValue==1">*</i><span class="customlist" :title="red_ct_list[3].fieldName">{{red_ct_list[3].fieldName}}</span></span>
                                                    <input v-if="red_ct_list[3].fieldValue==1" maxlength="50" data-id="" type="text" class="inpNew remark4 reductionInput cursorP" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    <input v-else="red_ct_list[3].fieldValue==2" maxlength="50" data-id="" type="text" class="inpNew remark4 cursorP reductionInput" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" />
                                                </div>
                                            </td>
                                            <td class="padT15" v-if="reductionReasons>=5">
                                                <div class="selectBox disInline"  style="width:160px;margin-right:20px;">
                                                    <span class="customTitle"><i v-if="red_ct_list[4].fieldValue==1">*</i><span class="customlist" :title="red_ct_list[4].fieldName">{{red_ct_list[4].fieldName}}</span></span>
                                                    <input v-if="red_ct_list[4].fieldValue==1" maxlength="50" type="text" data-id="" class="inpNew remark5 cursorP reductionInput" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)" onfocus="focusFun(this)" onblur="blurFun(this)"/>
                                                    <input v-else="red_ct_list[4].fieldValue==2" maxlength="50" type="text" data-id="" class="inpNew remark5 cursorP reductionInput" style="margin-right:0;" onkeyup="$(this).attr('data-id',this.value);notEmpty(2,this)"/>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="reductionImgInfo">
                                    <p class="infoTitle"><i class="padt15I" v-show="red_photo==1">*</i>上传图片凭证</p>
                                    <input type="hidden" class="reductionInput reductionImgList" data-id="" onchange="notEmpty(2,this)"/>
                                    <input type="hidden" class=" reductionImgListName" data-id=""/>
                                    <div class="uploadFile" style="margin-top: 6px">
                                        <div class="falseImg1 marR10 reductionImg">上传图片</div>
                                        <form id="uploadImg2" class="fileForm" method="post" enctype="multipart/form-data">
                                            <input type="hidden" id="fieldImg2" name="fieldName" value="uploadImgName2"/>
                                            <input type="hidden" id="uploadImgAddress2"  value=""/>
                                            <span class="btnOne"><input type="file" name="uploadImgName2" id="uploadImgName2" class="myFile" title="" value="" accept="image/gif,image/png,image/jpg" onchange="ImgFunction2(this)"/></span>
                                        </form>
                                        <div class="imgBox2">

                                        </div>
                                    </div>
                                </div>
                                <div class="reductionVideoInfo">
                                    <p class="infoTitle"><i class="padt15I" v-show="red_redio==1">*</i>上传录音凭证</p>
                                    <input type="hidden" class="reductionInput reductionVideoList" data-id="" onchange="notEmpty(2,this)"/>
                                    <input type="hidden" class=" reductionVideoListName" data-id=""/>
                                    <div class="uploadFile" style="margin-top: 6px">
                                        <div class="falseVideo1 marR10 reductionVideo">上传录音</div>
                                        <form id="uploadVideo2" class="fileForm" method="post" enctype="multipart/form-data">
                                            <input type="hidden" id="fieldVideo2" name="fieldName" value="uploadVideoName2"/>
                                            <input type="hidden" id="uploadVideoAddress2"  value=""/>
                                            <span class="btnOne"><input type="file" name="uploadVideoName1" id="uploadVideoName2" class="myFile" title="" value="" accept="audio/Mp3,audio/mp3,,audio/wav,audio/arm,audio/wma,audio/ava,audio/act" onchange="VideoFunction2(this)"/></span>
                                        </form>
                                        <div class="videoBox2">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="customLabel">
                    <div>
                        <span class="prev" onclick="getNextNew('${dDebtorInfo.id}',1)">上一条</span>
                        <span class="next" onclick="getNextNew('${dDebtorInfo.id}',2)">下一条</span>
                    </div>
                    <div class="customLabelList">
                        自定义标签 <img src="<%=basePath%>/newImg/3.2.5.1/help.svg" title="您可以根据自己的催收经验，为不同债务人打上相应的标签，方便您后续跟进。此外，您可以通过再次点击相同的颜色，取消设置。" alt=""/>
                        <span class="icon1"><i class="iconLabel" data-id="1" onclick="customLabelThis(this)"></i></span>
                        <span class="icon2"><i class="iconLabel" data-id="2" onclick="customLabelThis(this)"></i></span>
                        <span class="icon3"><i class="iconLabel" data-id="3" onclick="customLabelThis(this)"></i></span>
                        <span class="icon4"><i class="iconLabel" data-id="4" onclick="customLabelThis(this)"></i></span>
                    </div>
                    <div class="btnList">
                        <span class="submitBtn" onclick="submitBtn()">一键保存</span>
                        <span class="cancelBtn" onclick="cancelBtn()">清空</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--帮助弹框--%>
    <div id="helpModel">
        <ul class="helpList">
            <li class="on">工作进程</li>
            <li>消息通知</li>
            <li>回款排名</li>
            <li>债务人信息</li>
            <li>催收历史</li>
            <li>工具栏</li>
        </ul>
        <div class="helpImg">
            <img src="<%=basePath%>/newImg/3.2.5.1/helpIcon1.png" width="751px" height="457px" alt=""/>
            <img src="<%=basePath%>/newImg/3.2.5.1/helpIcon2.png" width="751px" height="457px" alt=""/>
            <img src="<%=basePath%>/newImg/3.2.5.1/helpIcon3.png" width="751px" height="457px" alt=""/>
            <img src="<%=basePath%>/newImg/3.2.5.4/helpIcon4.png" width="743px" height="" alt=""/>
            <img src="<%=basePath%>/newImg/3.2.5.4/helpIcon5.png" width="751px" height="457px" alt=""/>
            <img src="<%=basePath%>/newImg/3.2.5.4/helpIcon6.png" width="743" height="672px" alt=""/>
        </div>
    </div>
    <%--回款排名弹框--%>
    <div id="rankModel">
        <div class="rankContent">
            <div class="rankHerder">
                <div>
                    <div><img src="<%=basePath%>/newImg/3.2.5.1/trophy.svg" alt=""/>催收排行榜</div>
                    <div class="rankTab1">
                        <div>我的排名：
                            <i :class="['animated',backMoneyList.rankChange=''?'heartBeat':'']">{{backMoneyList.rank}}</i>
                        </div>
                        <div>今日回款：<i>{{backMoneyList.todayBackMoney | toNumber3}}</i>万元</div>
                    </div>
                    <div class="rankTab2">
                        <div>我的排名：
                            <i :class="['animated',callNumber.rankChange=''?'heartBeat':'']">{{callNumber.rank}}</i>
                        </div>
                        <div>拨打次数：<i>{{callNumber.todayCallNum | toNumber2}}</i>次</div>
                    </div>
                </div>
                <div>
                    <img src="<%=basePath%>/newImg/3.2.5.1/rankingStar.png" alt=""/>
                </div>
                <div>
                    <img src="<%=basePath%>/newImg/3.2.5.1/rankingClose.svg" onclick="rankClose()" alt=""/>
                </div>
            </div>
            <div class="rankTab">
                <span class="tab rankUp">回款排名</span>
                <span class="tab">拨打次数</span>
            </div>
            <div class="tabList">
                <div style="position:relative;">
                    <ul class="rankingBackList" >
                        <li v-for="(item,key) in backMoneyList.data" v-show="backMoneyList.data!=''">
                            <i v-if="item.backMoneyRank==1"><img src="<%=basePath%>/newImg/3.2.5.1/ranking1.svg" alt=""/></i>
                            <i v-else-if="item.backMoneyRank==2"><img src="<%=basePath%>/newImg/3.2.5.1/ranking2.svg" alt=""/></i>
                            <i v-else-if="item.backMoneyRank==3"><img src="<%=basePath%>/newImg/3.2.5.1/ranking3.svg" alt=""/></i>
                            <i v-else-if="item.backMoneyRank>3">{{item.backMoneyRank}}</i>
                            <span>{{item.userName }}</span>
                        <span>
                            {{item.backMoney | toLine2}}
                            <i>万元</i>
                        </span>
                        </li>
                    </ul>
                    <p style="background:#fff" v-show="backMoneyList.diffType!=0">
                        <span class="todayText" v-if="backMoneyList.diffType==1">距离平均值还差{{backMoneyList.diffMoney | toLine2}}元，请继续努力！</span>
                        <span class="todayText" v-else-if="backMoneyList.diffType==2">距离上一名成绩还差{{backMoneyList.diffMoney | toLine2}}元</span>
                        <span class="todayText" v-else-if="backMoneyList.diffType==3">您的回款金额排名第一！请保持优秀！</span>
                    </p>
                </div>
                <div style="position:relative;">
                    <ul class="rankingBackList" >
                        <li v-for="(item,key) in callNumber.data" v-show="callNumber.data!=''">
                            <i v-if="item.callNumRank==1"><img src="<%=basePath%>/newImg/3.2.5.1/ranking1.svg" alt=""/></i>
                            <i v-else-if="item.callNumRank==2"><img src="<%=basePath%>/newImg/3.2.5.1/ranking2.svg" alt=""/></i>
                            <i v-else-if="item.callNumRank==3"><img src="<%=basePath%>/newImg/3.2.5.1/ranking3.svg" alt=""/></i>
                            <i v-else-if="item.callNumRank>3">{{item.callNumRank}}</i>
                            <span>{{item.userName }}</span>
                        <span>
                            {{item.callNum | toLine0}}
                            <i>次</i>
                        </span>
                        </li>
                    </ul>
                    <p style="background:#fff" v-show="callNumber.diffType!=0">
                        <span class="todayText" v-if="callNumber.diffType==1">距离平均值还差{{callNumber.diffNum | toLine0}}次，请继续努力！</span>
                        <span class="todayText" v-else-if="callNumber.diffType==2">距离上一名成绩还差{{callNumber.diffNum | toLine0}}次。</span>
                        <span class="todayText" v-else-if="callNumber.diffType==3">您的拨打次数排名第一！请保持优秀！</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <%--新手引导--%>
    <div class="guide">
        <div class="guide1">
        </div>
        <div class="guideContent">
            <span class="guideText1" onclick="goOn()">继续查看</span>
        </div>
    </div>
    <%--小课堂--%>
    <div class="classRoom">
        <div class="roomImg">
            <div>
                <img :src="classRoom[classRoomRadim]" class="classRoomImg" alt=""/>
                <img src="<%=basePath%>/newImg/3.2.5.1/closeClassRoom.svg" alt="" onclick="closeClassRoom()"/>
            </div>
        </div>
    </div>
    <div id="contactAdd">
        <div>
            <span class="tabBoxList tabBoxon">本人</span> <i class="line" style="top:2px;"></i>
            <span class="tabBoxList">非本人</span>
        </div>
        <div class="tabBox1">
            <i style="color:#FA5151;">*</i>电话号码
            <input type="text" class="inpNew inpNewLong" id="telePhone" onfocus="$(this).css('border','1px solid #4DA1FE');" onblur="$(this).css('border','1px solid rgba(224,231,237,1)')" maxlength="20" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"/>
            备注
            <input type="text" class="inpNew inpNewLong" id="contactRemark" maxlength="100"/>
        </div>
        <div class="tabBox2">
            <i style="color:#FA5151;">*</i>电话号码
            <input type="text" class="inpNew inpNewLong" id="telePhone2" onfocus="$(this).css('border','1px solid #4DA1FE');" onblur="$(this).css('border','1px solid rgba(224,231,237,1)')" maxlength="20" onkeyup="this.value=this.value.replace(/[^\d]/g,'')"/>
            <i style="color:#FA5151;">*</i>姓名
            <input type="text" class="inpNew inpNewLong" id="liaison2" onfocus="$(this).css('border','1px solid #4DA1FE');" onblur="$(this).css('border','1px solid rgba(224,231,237,1)')" maxlength="20"/>
            备注
            <input type="text" class="inpNew inpNewLong" id="contactRemark2" maxlength="100"/>
        </div>
    </div>
</div>
<input type="hidden" id="relationship"/>
</body>
<script>
    <%--alert(${login_user.name})--%>
    var timer=0;
    var today='${today}'
    var tomorrow='${tomorrow}'  //明天
    var afterTomorrow='${afterTomorrow}'
    var Yesterday='${yesterday}'   //昨天
    var beforeYesterday='${beforeYesterday}';  /*前天*/
    var _id='${dDebtorInfo.id}';  //债务人Id
    var verifyType=true;
    var reductionType=true;
    var objList=[];
    var objList1=[];
    var objList2=[];
    var objList3=[];
    var newAddNum=0,reductionNum=0,verifyNum=0;
    var openText1='';
    var openText2='';
    var openText3='';
    var reductionSubmitflag=1;
    var newAddflag=1;
    var verifySubmitflag=1;
    var cuhuaFlag;
    var obj1List={}
    var obj2List={}
    var obj3List={}
    var flagText='';
    var dateList='';
    var loadIngOpen;
    var app=new Vue({
        el:"#app",
        data:{
            color1:'color1',
            color2:'color2',
            color3:'color3',
            color4:'color4',
            color5:'color5',
            color6:'color6',
            color7:'color7',
            color8:'color8',
            jigou:'量化派',
            dateListSelect:'',
//            getTimeInfo:'',
            timerListSureList:false,
            lastResult:'${dDebtorInfo.lastResult}',
            isShowRepair:'${isShowRepair}',
            maxAppAoumt_on_off:'${maxAppAoumt_on_off}',
            maxAppAoumt:'${maxAppAoumt}',
            applyBeforeMoney:'${applyBeforeMoney}',
            hasAlsoMoney:0,
            backMoneyList:{},   //回款排名
            callNumber:{},      //拨打次数
            isCollected:${isCollected},   //红点的显示
            isShowContact:${isShowContact},   //紧急联系人展示
            moreBtnShowType:${moreBtnShowType},//是否展示更多信息
            timeListOpen:false,   //时间轴具体信息展示
            dDebtorInfo:{},   //更多信息
            debtorName:'${dDebtorInfo.debtorName}',
            eClientTarget:{},   //还款方式
            accountSize:0,  //银行转账账号数
            bankInfo:[],      //银行信息
            collectReadRecordNew:[],      //催收记录
            collectReadCommitNew:[],      //对账记录
            collectReadApplyNew:[],      //减免记录
            collectReadCallRecordNew:[],      //通话记录
            collectReadContactNew:[],      //紧急联系人
            seatNum:'${seatNum}',      //坐席状态
            lastDate:'',    //上一天
            nextDate:'',    //下一天
            timerContent:[],   //催收历史详情信息
            messages:[],         //顶部消息
            changeLableTip:'${changeLableTip}',//切换标签提示
            otherDebtors:${otherDebtors},  //同时多笔在催信息
            noEmpty:0,        //判断新增催记是否填写
            noEmpty1:0,       //判断发起对账shifoutianxie
            noEmpty2:0,       //判断发起减免是否填写
            backMoneyType:[],  //还款方式
//            backMoneyType1:[],  //银行还款方式
            ableCommit:0,     //是否能发起对账
            maxRepayMoney:0,     //最大还款金额
            com_photo:0,         //对账上传图片凭证
            com_redio:0,         //对账上传音频凭证
            repayment:false,
            collectionRecord:false,
            customTitle:0,    //发起对账备注长度
            com_ct_list:[],   //发起对账备注数据
            ableReduction:0,  //是否减免
            reductionReasons:0,  //发起减免备注长度
            red_ct_list:[],    //减免备注数据
            red_photo:0,     //减免图片凭证
            red_redio:0,     //减免音频凭证
            customLabel:'${customLabel}',
            backType:false,
            backTypeName:false,
            imgIcon:['<%=basePath%>/newImg/3.2.5.1/redIcon.svg','<%=basePath%>/newImg/3.2.5.1/yellowIcon.svg','<%=basePath%>/newImg/3.2.5.1/greenIcon.svg','<%=basePath%>/newImg/3.2.5.1/ashIcon.svg'],
            classRoom:['<%=basePath%>/newImg/3.2.5.1/classRoom1.png','<%=basePath%>/newImg/3.2.5.1/classRoom2.png','<%=basePath%>/newImg/3.2.5.1/classRoom3.png','<%=basePath%>/newImg/3.2.5.1/classRoom4.png','<%=basePath%>/newImg/3.2.5.1/classRoom5.png','<%=basePath%>/newImg/3.2.5.1/classRoom6.png','<%=basePath%>/newImg/3.2.5.1/classRoom7.png'],
            classRoomRadim:0,
            timerList:[],
            timerListSure:false,
        },
        created:function(){
            var progressWidth=${collectedNum}/${collectNum};
            <%--var progressWidth=100/${collectNum};--%>
            if(progressWidth>0 && progressWidth<0.1){
                $(".progress").css('width','1px')
            }else{
                $(".progress").css('width',progressWidth*100+'%')
            }
            /*获取更多信息*/
            getMoreInfo(_id);
            /*紧急联系人*/
            collectReadContactNew(_id);
//            if(this.isShowRepair=='1'){
//                isShowRepairData(_id);
//            }

            /*催收历史*/
            queryHistoryRecord(_id,'')
            /*顶部消息*/
            getMessages();
            console.log($('.timeList ul').scrollWidth);
            console.log(${otherDebtors})
            this.classRoomRadim=Math.floor(Math.random()*7);
            if(this.customLabel=="" || this.customLabel==null || this.customLabel==undefined){

            }else{
                $(".customLabelList").find('span').eq(this.customLabel-1).children('i').addClass('iconSelected')
            }
        },
        mounted:function(){
//            $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            console.log($('.timeList ul')[0].scrollWidth)
            console.log($('.timeList ul')[1].scrollWidth)
            if($('.timeList ul')[0].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
            }
            if($('.timeList ul')[1].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            }
        },
        watch:{
            timerContent: function() {
                this.$nextTick(function(){
//                    debugger;

                    /*现在数据已经渲染完毕*/
                    $('.collectionDate').each(function(index,ele){
                        if($(this).val()==app.dateListSelect){
                            if($(this).val()==today || $(this).val()==Yesterday || $(this).val()==beforeYesterday){
                                $(this).siblings('div .dateList').addClass('todayPoint')
                            }else{
                                $(this).siblings('div .dateList').addClass('point')
                            }
                            var divBgheight=0
                            $(".divBg").each(function(i,ele){
                                if(i<index){
                                    divBgheight+=parseInt($(this).height())
                                }
                            })
                            console.log(divBgheight)
                            $(".timerContent").scrollTop(divBgheight);

                        }
                    })


                })
            }
        },
        methods:{
            closeTimeList:function(){
                $(".timeListOpen").animate({"height":'0'},function(){
                    $(".timeListOpen").css('display','none')
                })
                $(".dateList").each(function(index,ele){
                    $(ele).removeClass('todayPoint')
                    $(ele).removeClass('point')
                })
            },
        },
        filters:{
            read:function(val){//val就是以获取的msg的值
                return val.replace(/<[^>]*>/g,"");
                return val.replace(/<[^>]*>/g,"");
            },
            toNumber:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0';
                }else{
                    return (parseFloat(value).toFixed(2)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toNumber1:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0.00';
                }else{
                    return (parseFloat(value).toFixed(0)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toNumber2:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0';
                }else{
                    return (parseFloat(value).toFixed(0)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toNumber3:function(value){
                if(value=='' || value==null ||value==undefined){
                    return '0.00';
                }else{
                    return (parseFloat(value).toFixed(2)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toLine:function(value){
                if(value=='' || value==null || value==undefined){
                    return '- -';
                }else{
                    return value
                }
            },
            toLine0:function(value){
                if(value=='' || value==null || value==undefined){
                    return '- -';
                }else{
                    return (parseFloat(value).toFixed(0)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            toLine2:function(value){
                if(value=='' || value==null || value==undefined || value==0){
                    return '- -';
                }else{
                    return (parseFloat(value).toFixed(2)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
                }
            },
            dateFmt:function(value){
                if(null!=value&&""!=value){
                    var date = new Date(value);
                    var y = date.getFullYear();
                    var m = date.getMonth() + 1;
                    if(m<10){
                        m="0"+m;
                    }
                    var d = date.getDate();
                    if(d<10){
                        d="0"+d;
                    }
                    return y + '-' +m + '-' + d;
                }else{
                    return "- -";
                }
            },
            dateFmt1:function(value){
                if(null!=value&&""!=value){
                    var date = new Date(value);
                    var y = date.getFullYear();
                    var m = date.getMonth() + 1;
                    if(m<10){
                        m="0"+m;
                    }
                    var d = date.getDate();
                    if(d<10){
                        d="0"+d;
                    }
                    return y + '.' +m + '.' + d;
                }
            },
            changeTime:function(value){
                var val=value.split(":");
                return val[0]+':'+val[1]
            }
        }
    })
    $(window).resize(function(){
        var boxWidth=parseInt(document.documentElement.clientWidth);
        // console.log(boxWidth)
        if(boxWidth<1284){
            $("#app").css('min-width','1284px')
        }
    })
    $(function(){
        layer.ready(function() {
            loadIngOpen=layer.load(1, {
                shade: [0.1,'#000'],
                time: 3000
            });
        });
        history.pushState(null, null, document.URL);
        window.addEventListener("popstate", function(){
            history.pushState(null, null, document.URL);
        })
        /*获取浏览器宽度*/
//        alert(currentDebtorId)
        var windodWidth=parseInt(document.documentElement.clientWidth-parseInt($('.message').css('width')))/2;
        $(".message").css('left',windodWidth+'px')
        $(".message").css("display",'inline-block');
        /*顶部滚动*/
        function scrollNews(nature) {
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var scroll = nature.find("ul:first");
            var lineHeight = scroll.find("li:first").height();
            scroll.animate({"margin-top": -lineHeight + "px"}, 600, function () {
                scroll.css({'margin-top':0}).find("li:first").appendTo(scroll);
            });
        }
        var settimes = setInterval(function () {
            scrollNews($(".scrollNews"));
        }, 5000);
        if(app.moreBtnShowType){
            console.log("更多信息的展示状态",app.moreBtnShowType)
            $('.moreClick').hide();
            $(".hide").show()
            $(".timeList").css("width","calc(100vw - 694px)");
            if($('.timeList ul')[0].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
            }
            if($('.timeList ul')[1].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            }
            $('.moreInfo').show()
            $('.moreInfo').css('margin-left','0')
            collectReadRecordNew(_id)
            collectReadCommitNew(_id)
            collectReadApplyNew(_id)
            collectReadCallRecordNew(_id)
        }else{
            console.log("更多信息的展示状态",app.moreBtnShowType)
        }
        /*显示更多信息动画*/
        $(document).on('click','.moreClick',function(){
            $(this).hide();
            updateMoreBtnShowType(true)
            $(".moreInfo").css('display','block')
            $(".timeList").css("width","calc(100vw - 694px)")
//            $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            console.log($('.timeList ul')[0].scrollWidth)
            console.log($('.timeList ul')[1].scrollWidth)
            if($('.timeList ul')[0].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
            }
            if($('.timeList ul')[1].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            }
            $(".moreInfo").animate({"margin-left":'0px'},function(){});
            collectReadRecordNew(_id)
            collectReadCommitNew(_id)
            collectReadApplyNew(_id)
            collectReadCallRecordNew(_id)
            _czc.push(["_trackEvent","更多信息","点击更多信息",'${login_user.companyName}'+"/"+'${login_user.name}']);
        })
        /*关闭更多信息动画*/
        $(document).on('click','.hide',function(){
            $(".moreClick").show();
            updateMoreBtnShowType(false)
            $(".moreInfo").animate({"margin-left":'-310px'},function(){
                $(".moreInfo").css('display','none');
                $(".timeList").css("width","calc(100vw - 365px)");
//                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
                console.log($('.timeList ul')[0].scrollWidth)
                console.log($('.timeList ul')[1].scrollWidth)
                if($('.timeList ul')[0].scrollWidth==0){
                    $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
                }
                if($('.timeList ul')[1].scrollWidth==0){
                    $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
                }
            })
            _czc.push(["_trackEvent","收起","点击收起",'${login_user.companyName}'+"/"+'${login_user.name}']);
        })
        /*通过判断更多信息的状态来控制催收历史的宽度*/
        if($(".moreInfo").css('display')=="none"){
            $(".timeList").css("width","calc(100vw - 365px)")
//            $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            console.log($('.timeList ul')[0].scrollWidth)
            console.log($('.timeList ul')[1].scrollWidth)
            if($('.timeList ul')[0].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
            }
            if($('.timeList ul')[1].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            }
        }else if($(".moreInfo").css('display')=="block"){
            $(".timeList").css("width","calc(100vw - 694px)")
            if($('.timeList ul')[0].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
            }
            if($('.timeList ul')[1].scrollWidth==0){
                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
            }
        }
        var newbieGuide="${newbieGuide}";//新手引导
//        var newbieGuide=0;//新手引导
        console.log("新手引导----------------------",newbieGuide)
        if(newbieGuide==0){
            $(".guide").fadeIn();
            setTimeout(function () {
                $(".guide1").fadeOut();
                $(".guideContent").fadeIn().addClass('guide2');
                setTimeout(function(){
                    $(".guideText1").css("display",'block')
                },3000)
            }, 5000);
        }
        var xiaoketangTip=${xiaoketangTip};
        console.log("小课堂================================",xiaoketangTip)
        if(xiaoketangTip && newbieGuide!=0){
            $(".classRoom").fadeIn()
        }
    })
    /*更多信息提交*/
    function updateMoreBtnShowType(type){
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/updateMoreBtnShowType.do?moreBtnShowType='+type,
            async : true,
            success : function(data) {

            },
            error : function() {
            }
        });
    }
    /*新手引导*/
    function goOn(){
        if($(".guideContent").hasClass("guide2")){

            $(".guideContent").removeClass("guide2").addClass("guide3");
            $(".guideContent span").removeClass("guideText1").addClass("guideText2");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText2").show();
            },3000)
        }else if($(".guideContent").hasClass("guide3")){
            $(".guideContent").removeClass("guide3").addClass("guide4")
            $(".guideContent span").removeClass("guideText2").addClass("guideText3");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText3").show();
            },3000)
        }else if($(".guideContent").hasClass("guide4")){
            $(".guideContent").removeClass("guide4").addClass("guide5")
            $(".guideContent span").removeClass("guideText3").addClass("guideText4");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText4").show();
            },3000)
        }else if($(".guideContent").hasClass("guide5")){
            $(".guideContent").removeClass("guide5").addClass("guide6")
            $(".guideContent span").removeClass("guideText4").addClass("guideText5");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText5").show();
            },3000)
        }else if($(".guideContent").hasClass("guide6")){
            $(".guideContent").removeClass("guide6").addClass("guide7")
            $(".guideContent span").removeClass("guideText5").addClass("guideText6");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText6").show();
            },3000)
        }else if($(".guideContent").hasClass("guide7")){
            $(".guideContent").removeClass("guide7").addClass("guide8")
            $(".guideContent span").removeClass("guideText6").addClass("guideText7");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText7").show();
            },3000)
        }else if($(".guideContent").hasClass("guide8")){
            $(".guideContent").removeClass("guide8").addClass("guide9")
            $(".guideContent span").removeClass("guideText7").addClass("guideText8");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText8").show();
            },3000)
        }else if($(".guideContent").hasClass("guide9")){
            $(".guideContent").removeClass("guide9").addClass("guide10")
            $(".guideContent span").removeClass("guideText8").addClass("guideText9");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText9").show();
            },3000)
        }else if($(".guideContent").hasClass("guide10")){
            $(".guideContent").removeClass("guide10").addClass("guide11")
            $(".guideContent span").removeClass("guideText9").addClass("guideText10");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText10").show();
            },3000)
        }else if($(".guideContent").hasClass("guide11")){
            $(".guideContent").removeClass("guide11").addClass("guide12")
            $(".guideContent span").removeClass("guideText10").addClass("guideText11");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText11").show();
            },3000)
        }else if($(".guideContent").hasClass("guide12")){
            $(".guideContent").removeClass("guide12").addClass("guide13")
            $(".guideContent span").removeClass("guideText11").addClass("guideText12");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText12").show();
            },3000)
        }else if($(".guideContent").hasClass("guide13")){
            $(".guideContent").removeClass("guide13").addClass("guide14")
            $(".guideContent span").removeClass("guideText12").addClass("guideText13");
            $(".guideContent span").hide()
            setTimeout(function(){
                $(".guideText13").show();
            },3000)
        }else if($(".guideContent").hasClass("guide14")){
            $(".guideContent").removeClass("guide14").addClass("guide15");
            $(".guideContent span").removeClass("guideText13").addClass("guideText14").text("知道了")
            $(".guideContent span").hide()
            // setTimeout(function(){
            $(".guideText14").show();
            // },3000)
        }else if($(".guideContent").hasClass("guide15")){
            $(".guide").hide();
            $(".classRoom").fadeIn()
            updateNewbieGuide();
        }
    }
    /*每笔催账*/
    function showHide(obj){
        if($(obj).find('img').attr('name')=="show"){
            $(obj).find('img').attr({'name':'hide','src':'<%=basePath%>/newImg/3.2.5.1/hideshow.png'})
            $(obj).siblings('.moneyNum').hide()
            $(obj).parents('li').find('.inRushInfo').show();
            $(obj).parents('li').find('.inRushInfo').animate({'height':'196px'})
            $(obj).parents('li').siblings('li').find('.inRushInfo').animate({'height':'0'},function(){
                $(obj).parents('li').siblings('li').find('.inRushInfo').hide()
            })
            $(obj).parents('li').siblings('li').find('.moneyNum').show()
            $(obj).attr('name','hide');
            $(obj).parents('li').siblings('li').find('img').attr({'name':'show','src':'<%=basePath%>/newImg/3.2.5.1/showhide.png'})
        }else if($(obj).attr('name')=="hide"){
            $(obj).find('img').attr({'name':'show','src':'<%=basePath%>/newImg/3.2.5.1/showhide.png'})
            $(obj).parents('li').find('.inRushInfo').animate({'height':'0'},function(){
                $(obj).parents('li').find('.inRushInfo').hide()
            })
            $(obj).attr('name','show');
            $(obj).siblings('.moneyNum').show()
        }
        _czc.push(["_trackEvent","在催多笔的展开","点击展开",'${login_user.companyName}'+"/"+'${login_user.name}']);
    }
    /*新建联系人*/
    function addContacts(){
        _czc.push(["_trackEvent","新增联系人","点击新增联系人",'${login_user.companyName}'+"/"+'${login_user.name}']);
        layer.open({
            id: 'layerDemo' //防止重复弹出
            ,type: 1
            ,title:'新增联系人'
//            ,content:'<form class="layer-form"><div class="layui-form-item">' +
//            '<div class="layui-input-block">' +
//            '<label class="layui-form-label" style="margin-top:20px;"><i style="color:#FA5151;">*</i>增加联系人</label>' +
//            '<input type="text" name="title" autocomplete="off" class="inputFu liaison inputs" maxlength="11" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,\'\');" onfocus="$(this).css(\'border\',\'1px solid #4DA1FE\');" onblur="$(this).css(\'border\',\'1px solid rgba(224,231,237,1)\')">' +
//            '</div></div>' +
//            '<div class="layui-form-item">' +
//            '<div class="layui-input-block">' +
//           '<label class="layui-form-label"><i style="color:#FA5151;">*</i>联系人电话</label>' +
//            '<input type="text" name="username" placeholder="" autocomplete="off" maxlength="20" class="telePhone inputs" onkeyup="this.value=this.value.replace(/[^0-9]+/,\'\');" onfocus="$(this).css(\'border\',\'1px solid #4DA1FE\');"  onblur="$(this).css(\'border\',\'1px solid rgba(224,231,237,1)\')"/>' +
//            '</div></div></form>'
            ,content:$("#contactAdd")
            ,area:["340px","420px"]
            ,btn:['确定', '取消']
            ,yes:function(index){
                var tabBoxonText=$(".tabBoxon").text()
                if(tabBoxonText=='本人'){
                    var liaison='${dDebtorInfo.debtorName}'
                    var telePhone= $.trim($("#telePhone").val());
                    var contactRemark=$.trim($("#contactRemark").val());
                    var contactsRelationship='本人'
                    if(telePhone==""){
                        layer.msg("请填写*必填项");
                        $("input#telePhone").css("border","1px solid red");
                        return false
                    }else{
                        $("input#telePhone").css("border","1px solid rgba(224,231,237,1)");
                    }
                    contactsSave(_id,liaison,telePhone,contactRemark,contactsRelationship,index)
                }else if(tabBoxonText=='非本人'){
                    var liaison2=$.trim($("#liaison2").val())
                    var telePhone2=$.trim($("#telePhone2").val());
                    var contactRemark2=$.trim($("#contactRemark2").val());
                    var contactsRelationship2=''
                    if(telePhone2==""){
                        layer.msg("请填写*必填项");
                        $('input#telePhone2').css("border","1px solid red");
                        return false
                    }else{
                        $('input#telePhone2').css("border","1px solid rgba(224,231,237,1)");
                    }
                    if(liaison2==""){
                        layer.msg("请填写*必填项");
                        $("input#liaison2").css("border","1px solid red");
                        return false
                    }else{
                        $("input#liaison2").css("border","1px solid rgba(224,231,237,1)");
                    }
                    contactsSave(_id,liaison2,telePhone2,contactRemark2,contactsRelationship2,index)
                }
//                contactsSave(_id,liaison,telePhone,index)
                loadIngAdd= layer.load(1, {
                    shade: [0.1,'#000']
                });
            },btn2:function(){
                $("#telePhone").val('');
                $("#contactRemark").val('')
                $("#telePhone2").val('');
                $("#contactRemark2").val('')
                $("#liaison2").val('');
                $(".tabBoxList").each(function(index,ele){
                    if(index==0){
                        $(this).addClass('tabBoxon');
                        $(this).siblings().removeClass('tabBoxon');
                        $(".tabBox1").show();
                        $(".tabBox2").hide();
                    }
                })
            }
            ,cancel : function(){
                // 你点击右上角 X 取消后要做什么
                $("#telePhone").val('');
                $("#contactRemark").val('')
                $("#telePhone2").val('');
                $("#contactRemark2").val('')
                $("#liaison2").val('')
                $(".tabBoxList").each(function(index,ele){
                    if(index==0){
                        $(this).addClass('tabBoxon');
                        $(this).siblings().removeClass('tabBoxon');
                        $(".tabBox1").show();
                        $(".tabBox2").hide();
                    }
                })
            }
        });
    }
    $(document).on('click','.tabBoxList',function(){
        console.log($(this))
        if($(this).text()=="本人"){
            $(this).addClass('tabBoxon')
            $(".tabBox1").show()
            $(".tabBox2").hide()
            $(this).siblings().removeClass('tabBoxon')
            $("#telePhone2").css("border","1px solid rgba(224,231,237,1")
            $("#liaison2").css("border","1px solid rgba(224,231,237,1")
        }else if($(this).text()=="非本人"){
            $(this).addClass('tabBoxon')
            $(this).siblings().removeClass('tabBoxon')
            $(".tabBox2").show()
            $(".tabBox1").hide()
            $("#telePhone").css("border","1px solid rgba(224,231,237,1")
        }
    })
    /*资料tab切换*/
    $(document).on('click','.tabListText',function(){
        $(this).addClass("tabListTextOn").siblings().removeClass("tabListTextOn");
        console.log($(this).index())
        if($(this).index()==0){
            $(".tab1").css('display',"block")
            $(".tab2").css('display',"none")
        }else if($(this).index()==2){
            $(".tab2").css('display',"block")
            $(".tab1").css('display',"none")
            _czc.push(["_trackEvent","历史信息","点击历史信息",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
    })
    $(document).on('click','.tab1Li',function(){
        $(this).addClass("tab1On").siblings().removeClass("tab1On")
        if($(this).index()==0){
            $(".tab1List").eq(0).show().siblings(".tab1List").hide()
            _czc.push(["_trackEvent","贷款信息","点击贷款信息",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==2){
            $(".tab1List").eq(1).show().siblings(".tab1List").hide()
            _czc.push(["_trackEvent","基本信息","点击基本信息",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==4){
            $(".tab1List").eq(2).show().siblings(".tab1List").hide()
            _czc.push(["_trackEvent","还款方式","点击还款方式",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==6){
            $(".tab1List").eq(3).show().siblings(".tab1List").hide()
            _czc.push(["_trackEvent","催收要求 ","点击催收要求",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==8){
            $(".tab1List").eq(4).show().siblings(".tab1List").hide()
            _czc.push(["_trackEvent","备注","点击备注",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
    })
    $(document).on('click','.tab2Li',function(){
        $(this).addClass("tab1On").siblings().removeClass("tab1On")
        if($(this).index()==0){
            $(".tab2List").eq(0).show().siblings(".tab2List").hide()
            _czc.push(["_trackEvent","催收记录","点击催收记录",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==2){
            $(".tab2List").eq(1).show().siblings(".tab2List").hide()
            _czc.push(["_trackEvent","对账记录","点击对账记录",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==4){
            $(".tab2List").eq(2).show().siblings(".tab2List").hide()
            _czc.push(["_trackEvent","减免记录","点击减免记录",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if($(this).index()==6){
            $(".tab2List").eq(3).show().siblings(".tab2List").hide()
            _czc.push(["_trackEvent","通话记录","点击通话记录",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
    })
    /*帮助弹框*/
    function helpOpen(){
        $("#helpModel").show()
        $(".helpList").show();
        $(".helpImg").show();
        layer.open({
            id: 'layerDemo' //防止重复弹出
            ,type: 1
            ,title:'帮助'
            ,content: $("#helpModel")
            ,area:["900px","500px"]
            ,cancel : function(){
                // 你点击右上角 X 取消后要做什么
                $("#helpModel").hide()
                $(".helpList").hide();
                $(".helpImg").hide();
            }
        });
        _czc.push(["_trackEvent","帮助","点击帮助",'${login_user.companyName}'+"/"+'${login_user.name}']);
    }
    $(document).on('click','.helpList li',function(){
        $(this).addClass('on').siblings('li').removeClass('on');
        $(".helpImg img").eq($(this).index()).show().siblings().hide();
    })
    /*回款排名*/
    function rankOpen(){
        $(".tabList div").eq(0).show()
        $(".tabList div").eq(1).hide()
        $(".rankTab .tab").eq(0).addClass('rankUp').siblings().removeClass('rankUp');
        $(".rankTab1").show();
        $(".rankTab2").hide();
        $("#rankModel").fadeIn();
        _czc.push(["_trackEvent","回款排名","点击回款排名",'${login_user.companyName}'+"/"+'${login_user.name}']);
        personalBackMoneyRankingNew();
        personalCallNumRankingNew();
    }
    function rankClose(){
        $("#rankModel").fadeOut();
    }
    $(document).on('click','.tab',function(){
        if($(this).text()=="回款排名"){
            $(this).addClass('rankUp').siblings().removeClass('rankUp');
            $(".tabList div").eq($(this).index()).show().siblings().hide();
            $(".rankTab1").show();
            $(".rankTab2").hide();
        }else if($(this).text()=="拨打次数"){
            $(this).addClass('rankUp').siblings().removeClass('rankUp');
            $(".tabList div").eq($(this).index()).show().siblings().hide();
            $(".rankTab1").hide();
            $(".rankTab2").show();
        }
    })
    /*返回*/
    function backto(){
        window.localStorage.setItem("type",'goback');
        window.location.href = "<%=basePath%>manage/mydebtor/query.do?type=goback";
        //让左侧导航栏展开
        top.workframeset.cols = "206,*";
        $(parent.frames["leftFrame"].document).find("#title").attr('title','收起');
        $(parent.frames["leftFrame"].document).find("#openList").hide();
        $(parent.frames["leftFrame"].document).find("#closeList").show();
        $(parent.frames["leftFrame"].document).find("#tablePar").css('overflowY','auto');
        $(parent.frames["leftFrame"].document).find("#treeTable").css({left:'0px'});
        $(parent.frames["leftFrame"].document).find(".director").css({left:'0px'});
        $(parent.frames["leftFrame"].document).find(".director").css({'width':'205px','borderRight':'none'});
        $(parent.frames["leftFrame"].document).find("#iconList").hide(20);
    };
    /*关闭小课堂*/
    function closeClassRoom(){
        $('.classRoom').fadeOut()
    }
    /*表单tab切换*/
    function formTabList(obj){
        ($(obj).text())
        if($.trim($(obj).text())=="新增催记"){
            $(obj).addClass("onSpan").siblings().removeClass('onSpan');
            $(".tabContent>div").eq($(obj).index()).show().siblings().hide()
        }else if($.trim($(obj).text())=='发起对账'){
            $(obj).addClass("onSpan").siblings().removeClass('onSpan');
            $(".tabContent>div").eq($(obj).index()).show().siblings().hide();
            checkVerify(_id,verifyType)
        }else if($.trim($(obj).text())=='发起减免'){
            checkReduction(_id,reductionType)
            $(obj).addClass("onSpan").siblings().removeClass('onSpan');
            $(".tabContent>div").eq($(obj).index()).show().siblings().hide();
        }

    }
    /*自定义标签*/
    function customLabelThis(obj){
        if($(obj).hasClass('iconSelected')){
            $(obj).removeClass('iconSelected');
            app.customLabel=''
            saveCustomLabel(_id,'')
            _czc.push(["_trackEvent","为多少债务人切换自定义标签","点击自定义标签",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else{
            $(obj).addClass('iconSelected').parent('span').siblings().find('i').removeClass('iconSelected');
            app.customLabel=($(obj).attr("data-id"));
            saveCustomLabel(_id,$(obj).attr("data-id"))
            _czc.push(["_trackEvent","为多少债务人打上自定义标签","点击自定义标签",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
    }
    /*鼠标移入移出事件*/
    $('.iconLabel').hover(function(){
        if($(this).hasClass('iconSelected')){
            $(this).addClass('iconRemoveHover')
        }else{
            $(this).addClass('iconSelectedHover')
        }
    },function(){
        if($(this).hasClass('iconSelectedHover')){
            $(this).removeClass('iconSelectedHover')
        }else if($(this).hasClass('iconRemoveHover')){
            $(this).removeClass('iconRemoveHover')
        }
    })
    /* 下拉框单选框 */
    $('.selectBox').on('click',function(e){
        e.stopPropagation();
        //除了自己的子元素.selList以外的所有.selList全部隐藏
        $('.selList').not($(this).children('.selList')).hide();
        //自己的子元素.selList在隐藏和显示之间切换
        $(this).children('.selList').toggle();
        //关闭页面中的时间插件框
        $(".layui-laydate").hide();
    });
    $(document).on('click',function(){
        $('.selList').hide();
    });
    $('.selList').on('click','li',function(e){
        e.stopPropagation();
        $(this).parent().hide();
        $(this).parent().siblings('input').val($(this).text()).attr("data-id",$(this).attr("data-id"));
        //当input的value值发生变化时，触发input框的onchange事件
        $(this).parent().siblings('input').change();
        $(this).addClass('selected').siblings().removeClass('selected');
    });
    $("#caseStatus").change(function(){
        if($(this).val()=="承诺还款"){
            app.repayment=true;
        }else{
            app.repayment=false;
            $('.backMoney').attr('data-id','');
            $('.backMoney').val('');
            $('#commitmentTime').attr('data-id','')
            $('#commitmentTime').val('')
        }
    })
    $("#backType").change(function(){
        if($(this).val()=="支付宝还款" || $(this).val()=="微信还款" || $(this).val()=="银行转账"){
            app.backType=true;
            if($(this).val()=="支付宝还款"){
                app.backTypeName=false;
                $(".backTypeName").text('支付宝户名')
                for(var i=0;i<app.backMoneyType.length;i++){
                    if($(this).val()==app.backMoneyType[i].name){
                        $("#backTypeInfo").val(app.backMoneyType[i].val)
                        $("#backTypeInfo").attr('title',app.backMoneyType[i].val)
                        $("#backTypeInfo").attr("data-id",app.backMoneyType[i].val)
                    }
                }
            }
            if($(this).val()=="微信还款"){
                app.backTypeName=false;
                $(".backTypeName").text('微信昵称')
                for(var i=0;i<app.backMoneyType.length;i++){
                    if($(this).val()==app.backMoneyType[i].name){
                        $("#backTypeInfo").val(app.backMoneyType[i].val)
                        $("#backTypeInfo").attr("data-id",app.backMoneyType[i].val)
                        $("#backTypeInfo").attr("title",app.backMoneyType[i].val)
                    }
                }
            }
            if($(this).val()=="银行转账"){
                app.backTypeName=true;
                $(".backTypeName").text('开户行名称-开户行帐号')
                $("#backTypeInfo").attr("title",'')
            }

        }else{
            app.backType=false;
            $("#backTypeInfo").val();
            $("#backTypeInfo").attr("data-id","")
            $("#backTypeInfo").val();
            $("#backTypeInfo").attr("data-id","")
        }
    })

    /*今天明天后天*/
    function acquisitionTime(obj,num){
        $(obj).parent().siblings('input').css('border','1px solid rgb(224, 231, 237')
        if(num==1){
            $(obj).parent().siblings('input').val(today)
            $(obj).parent().siblings('input').attr('data-id',today)
            $('#flollowTime').change()
        }else if(num==2){
            $(obj).parent().siblings('input').val(tomorrow)
            $(obj).parent().siblings('input').attr('data-id',tomorrow)
            $('#flollowTime').change()
        }else if(num==3){
            $(obj).parent().siblings('input').val(afterTomorrow)
            $(obj).parent().siblings('input').attr('data-id',afterTomorrow)
            $('#flollowTime').change()
        }
    }
    /*前天昨天今天*/
    function backMoneyTime(obj,num){
        $(obj).parent().siblings('input').css('border','1px solid rgb(224, 231, 237')
        if(num==1){
            $(obj).parent().siblings('input').val(beforeYesterday)
            $(obj).parent().siblings('input').attr('data-id',beforeYesterday)
            $("#backMoneyTime").change()
        }else if(num==2){
            $(obj).parent().siblings('input').val(Yesterday)
            $(obj).parent().siblings('input').attr('data-id',Yesterday)
            $("#backMoneyTime").change()
        }else if(num==3){
            $(obj).parent().siblings('input').val(today)
            $(obj).parent().siblings('input').attr('data-id',today)
            $("#backMoneyTime").change()
        }
    }
    layui.use('laydate', function(){
        var laydate = layui.laydate;
        //日期范围
        laydate.render({
            elem: '#flollowTime',
            trigger: 'click',
            format: 'yyyy.MM.dd',
            btns: ['clear','confirm'],
            // showBottom: false,
            min: 0,
            done: function(value, date, endDate){
                if(value=="" || value==null || value==undefined){
                    $("#flollowTime").attr('data-id','');
                    $('#flollowTime').change()
                }else{
                    $("#flollowTime").attr('data-id',value);
                    $('#flollowTime').change()
                }

            }
        });
        laydate.render({
            elem: '#commitmentTime',
            format: 'yyyy.MM.dd',
            trigger: 'click',
            btns: ['clear','confirm'],
            min: 0
            ,done: function(value, date, endDate){
                if(value=="" || value==null || value==undefined){
                    $("#commitmentTime").attr('data-id','');
                    $('#commitmentTime').change()
                }else{
                    $("#commitmentTime").attr('data-id',value);
                    $('#commitmentTime').change()
                }
            }
        });
        laydate.render({
            elem: '#backMoneyTime',
            format: 'yyyy.MM.dd',
            trigger: 'click',
            btns: ['clear','confirm'],
            // showBottom: false,
            max: 0,
            done: function(value, date, endDate){
                if(value=="" || value==null || value==undefined){
                    $("#backMoneyTime").attr('data-id','');
                    $('#backMoneyTime').change()
                }else{
                    $("#backMoneyTime").attr('data-id',value);
                    $('#backMoneyTime').change()
                }
            }
        });
    })
    /*还款金额*/
    function backMoney(obj){
        obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/^\.,0/g,"");  //验证第一个字符是数字而不是.
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        if(obj.value==''){
            obj.value=''
            $(obj).attr('data-id','')
            $(obj).css('border','1px solid rgba(224,231,237,1)')
        }else{
            if(obj.value>app.maxRepayMoney || obj.value==0){
                obj.value=''
                $(obj).attr('data-id','')
                $(obj).css('border','1px solid red');
                layer.msg('还款金额必须大于0.01且小于委托金额的两倍')
                app.noEmpty1=0;
            }else{
                obj.value=parseFloat(obj.value).toFixed(2);
                $(obj).css('border','1px solid rgb(224, 231, 237')
            }
        }
    }
    /*承诺还款金额*/
    function clearNoNum(obj){
        obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/^\.,0/g,"");  //验证第一个字符是数字而不是.
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        obj.value = obj.value.replace(/^(\-)*(\d+)\.(\d\d).*$/,'$1$2.$3');//只能输入两个小数
        if(obj.value.indexOf(".")< 0 && obj.value !=""){//以上已经过滤，此处控制的是如果没有小数点，首位不能为类似于 01、02的金额
            obj.value= parseFloat(obj.value);
        }
    }
    function changeNum(obj){
        if(obj.value=='' || obj.value==0){
            obj.value=''
            $(obj).attr('data-id','')
            $(obj).css('border','1px solid rgba(224,231,237,1)')
        }else{
            obj.value=parseFloat(obj.value).toFixed(2);
        }
    }
    function changeN(obj){
        var regStrs = [
            ['^0(\\d+)$', '$1'], //禁止录入整数部分两位以上，但首位为0
            ['[^\\d\\.]+$', ''], //禁止录入任何非数字和点
            ['\\.(\\d?)\\.+', '.$1'], //禁止录入两个以上的点
            ['^(\\d+\\.\\d{2}).+', '$1'] //禁止录入小数点后两位以上
        ];
        for(i=0; i<regStrs.length; i++){
            var reg = new RegExp(regStrs[i][0]);
            obj.value = obj.value.replace(reg, regStrs[i][1]);
        }
//        obj.value=obj.value.replace(/[^\d.]/g,'');
        $(obj).attr('data-id',obj.value.replace(/[^\d.]/g,''))
    }
    function changeNum1(obj){
        obj.value = obj.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符
        obj.value = obj.value.replace(/^\.,0/g,"");  //验证第一个字符是数字而不是.
        obj.value = obj.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的.
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        if(obj.value==''){
            obj.value=''
            $(obj).attr('data-id','')
            $(obj).css('border','1px solid rgba(224,231,237,1)')
        }else{
            var reductionMb=parseFloat($(".reductionMb").attr('data-id'));
            var reductionMa=parseFloat($(".reductionMa").attr('data-id'));
            if(reductionMb<=reductionMa){
                layer.msg('减免后应还金额必须小于减免前应还金额')
                $(".reductionMa").val("");
                $(".reductionMa").attr('data-id','')
                $(".reductionMa").css('border','1px solid rgba(224,231,237,1)')
            }else{
                obj.value=hold2bit(obj.value);
//                obj.value=parseFloat(obj.value).toFixed(2);
                $(obj).css('border','1px solid rgb(224, 231, 237')
            }

        }
    }
    function changeNumjigou(obj){
        if(obj.value=='') {
            obj.value = ''
            $(obj).attr('data-id', '')
            $(obj).css('border', '1px solid rgba(224,231,237,1)')
        }else{
            var reductionMa=parseFloat($(".reductionMa").attr('data-id'));
//            alert(parseFloat(app.applyBeforeMoney-app.maxAppAoumt).toFixed(2))
            console.log("减免上限得",reductionMa<parseFloat(parseFloat(app.applyBeforeMoney)-parseFloat(app.maxAppAoumt)).toFixed(2))
            console.log("减免前减去减免后得",parseFloat(parseFloat(app.applyBeforeMoney)-reductionMa).toFixed(2))
            console.log("应还前减去应还后得",(parseFloat(parseFloat('${dDebtorInfo.currentAmount}')-parseFloat(app.hasAlsoMoney)).toFixed(2)))
            console.log("已还金额",parseFloat(app.hasAlsoMoney))
            console.log("应还金额",parseFloat('${dDebtorInfo.currentAmount}'))
            console.log("减免前减去减免后得是否小于应还前减去应还后得",(parseFloat(parseFloat(app.applyBeforeMoney)-reductionMa).toFixed(2))>(parseFloat(parseFloat(${dDebtorInfo.currentAmount})-parseFloat(app.hasAlsoMoney)).toFixed(2)))
            if((reductionMa>=(parseFloat(parseFloat(app.applyBeforeMoney)-parseFloat(app.maxAppAoumt)).toFixed(2))) && (parseFloat(parseFloat(parseFloat(app.applyBeforeMoney)-reductionMa).toFixed(2))<parseFloat(parseFloat(parseFloat(${dDebtorInfo.currentAmount})-parseFloat(app.hasAlsoMoney)).toFixed(2)))){
                obj.value=hold2bit(obj.value);
            }else{
                layer.msg('申请金额超过最大值，请重新输入');
                $(".reductionMa").val("");
                $(".reductionMa").attr('data-id','')
                $(".reductionMa").css('border','1px solid rgba(224,231,237,1)')
            }
        }
    }
    function hold2bit(theNum) {
        var theNum2bit = String(theNum);
        if(String(theNum).match(/\d{0,}\.\d\d/)){
            theNum2bit = String(theNum).match(/\d{0,}\.\d\d/)[0];
        }else if(String(theNum).match(/\d{0,}\.\d/)){
            theNum2bit += '0';
        }else if(String(theNum).match(/\d{0,}\./)){
            theNum2bit += '00';
        }else if(String(theNum).match(/\d{0,}/)){
            theNum2bit += '.00';
        }
        return theNum2bit;
    }
    //对账上传图片验证
    function ImgFunction1(that) {
        console.log('aaa-------------------',objList);
        console.log('aaa-------------------',objList.length)
        var verifyImgList=$(".verifyImgList").attr('data-id');
        var verifyImgListName=$(".verifyImgListName").attr('data-id');
        //按钮失效防点击
        var oFile=that.files[0].size;
        var fileName=that.files[0].name;
        var nameText = (fileName.substring(fileName.lastIndexOf("."))).toUpperCase();
        if(nameText!=".PNG" && nameText!=".JPG" && nameText!=".GIF"){
            layer.msg("请上传jpg、png、gif格式的图片",{time:3000});
            return false;
        }
        if(oFile>=512000){
            layer.msg("每张图片最大为500KB",{time:3000});
            return false;
        }
        if(objList.length>=3){
            layer.msg("最多只能上传3张图片",{time:3000});
            $("#uploadImgName1").val("");
            return false;
        }
        var open1 = layer.load(1, {
            shade: [0.5,'#000']
        });
        //弹出异步加载 遮罩
        $('#uploadImg1').ajaxSubmit({
            type : "POST",
            contentType:"multipart/form-data",
            url : "<%=basePath%>common/file/collectuploadFile.do?debtorName="+app.debtorName+"&type=duizhang"+ "&timestamp="+(new Date()).getTime(),
            success : function(data2) {
                $(".verifyImg").css('border','1px solid rgb(224, 231, 237)')
                console.log(data2)
                var obj=JSON.parse(data2);
                var data = eval('(' + data2 + ')');
                objList.push({id:"",filePath:data.filePath,fileName:data.fileName});
                console.log('objList------',objList)
                var urlPath=data.filePath;
                var urlName=data.fileName;
                if(verifyImgList==""){
                    $(".verifyImgList").attr('data-id',urlPath)
                }else{
                    $(".verifyImgList").attr('data-id',verifyImgList+','+urlPath)
                }
                if(verifyImgListName==""){
                    $(".verifyImgListName").attr('data-id',urlName)
                }else{
                    $(".verifyImgListName").attr('data-id',verifyImgListName+','+urlName)
                }
                var ids=""
                if(data.success=="true"){
                    var v2='removeFile("'+ urlPath +'",'+'this'+',1,"'+ urlName + '","'+ids+'");event.stopPropagation()';
                    var method2="onclick='"+v2+"'";
                    var context='<div class="fileImg marT10 fileName1" style="display:inline-block;margin-left:10px">';
                    var context1='<div id="myName'+objList.length+'" class="nameBox cursorP" style="display:inline-block" title="'+data.fileName+'">'+data.fileName;
                    var context2='<a  href="javascript:void(0)" mce_href="#" class="removeBtn" '+method2+'></a></div></div>';
                    var a=context+context1+context2;
                    console.log(a);
                    $(".imgBox1").append(a);
                    $("#uploadImgName1").val("");
                    $(".verifyImgList").change();
                }
                layer.close(open1)
            },
            error : function() {
                //关闭遮罩，弹出消息框
                closeMask();
                $.messager.confirm('消息', '数据加载失败,请联系系统管理员！');
                //按钮生效
                $(".btn").removeAttr("disabled");
            }
        });
    }
    /*减免上传图片*/
    function ImgFunction2(that) {
        console.log("objList2.length-----",objList2.length)
        var reductionImgList=$(".reductionImgList").attr('data-id');
        var reductionImgListName=$(".reductionImgListName").attr('data-id');
        //按钮失效防点击
        var oFile=that.files[0].size;
        var fileName=that.files[0].name;
        var nameText = (fileName.substring(fileName.lastIndexOf("."))).toUpperCase();
        if(nameText!=".PNG" && nameText!=".JPG" && nameText!=".GIF"){
            layer.msg("请上传jpg、png、gif格式的图片",{time:3000});
            return false;
        }
        if(oFile>=512000){
            layer.msg("每张图片最大为500KB",{time:3000});
            return false;
        }
        if(objList2.length>=3){
            layer.msg("最多只能上传3张图片",{time:3000});
            $("#uploadImgName2").val("");
            return false;
        }
        var open1 = layer.load(1, {
            shade: [0.5,'#000']
        });
        //弹出异步加载 遮罩
        var datas={
            timestamp:(new Date()).getTime(),
            infoId:"${bean.typeId}"
        };
        $('#uploadImg2').ajaxSubmit({
            type : "POST",
            contentType:"multipart/form-data",
// 			data:datas,
            url : "<%=basePath%>common/file/collectuploadFile.do?debtorName="+app.debtorName+"&type=jianmian"+"&timestamp=" + (new Date()).getTime(),
            success : function(data2) {
                $(".reductionImg").css('border','1px solid rgb(224, 231, 237)')
                var data = eval('(' + data2 + ')');
                objList2.push({id:"",filePath:data.filePath,fileName:data.fileName});
                console.log('objList2------',objList2)
                var urlPath=data.filePath;
                var urlName=data.fileName;
                if(reductionImgList==""){
                    $(".reductionImgList").attr('data-id',urlPath)
                }else{
                    $(".reductionImgList").attr('data-id',reductionImgList+','+urlPath)
                }
                if(reductionImgListName==""){
                    $(".reductionImgListName").attr('data-id',urlName)
                }else{
                    $(".reductionImgListName").attr('data-id',reductionImgListName+','+urlName)
                }
                var ids="";
                if(data.success=="true"){
                    var v2='removeFile("'+ urlPath +'",'+'this'+',2,"'+ urlName + '","'+ids+'");event.stopPropagation()';
                    var method2="onclick='"+v2+"'";
                    var context='<div class="fileImg marT10 fileName1"style="display:inline-block;margin-left:10px">';
                    var context1='<div id="myName'+objList2.length+'" class="nameBox cursorP" style="display:inline-block" title="'+data.fileName+'">'+data.fileName;
                    var context2='<a  href="javascript:void(0)" mce_href="#" class="removeBtn" '+method2+'></a></div></div>';
                    var a=context+context1+context2;
                    console.log(a);
                    $(".imgBox2").append(a);
                    $("#uploadImgName2").val("");
                    $(".reductionImgList").change();
                }
                layer.close(open1)
            },
            error : function() {
                //关闭遮罩，弹出消息框
                closeMask();
                $.messager.confirm('消息', '数据加载失败,请联系系统管理员！');
                //按钮生效
                $(".btn").removeAttr("disabled");
            }
        });
    }
    /*对账上传音频*/
    function VideoFunction1(that) {
        console.log("objList1.length-----",objList1.length)
        var verifyVideoList=$(".verifyVideoList").attr('data-id');
        var verifyVideoListName=$(".verifyVideoListName").attr('data-id');
        //按钮失效防点击
        var oFile=that.files[0].size;
        var fileName=that.files[0].name;
        var nameText = (fileName.substring(fileName.lastIndexOf("."))).toUpperCase();
        if(nameText!=".MP3" && nameText!=".WAV" && nameText!=".ARM"  && nameText!=".WAM"  && nameText!=".AVA"  && nameText!=".ACT"){
            layer.msg("请上传Mp3、wav、arm、wma、ava、act格式的录音",{time:3000});
            return false;
        }
        if(oFile>=2097152){
            layer.msg("每个录音最大为2M",{time:3000});
            return false;
        }
        if(objList1.length>=3){
            layer.msg("最多只能上传3条录音",{time:3000});
            $("#uploadVideoName1").val("");
            return false;
        }
        var open1 = layer.load(1, {
            shade: [0.5,'#000']
        });
        //弹出异步加载 遮罩
        $('#videoBox1').ajaxSubmit({
            type : "POST",
            contentType:"multipart/form-data",
            url : "<%=basePath%>common/file/collectuploadFile.do?debtorName="+app.debtorName+"&type=duizhang"+ "&timestamp="+(new Date()).getTime(),
            success : function(data2) {
                $(".verifyVideo").css('border','1px solid rgba(224,231,237)')
                var data = eval('(' + data2 + ')');
                objList1.push({id:"",filePath:data.filePath,fileName:data.fileName});
                console.log('objList1------',objList1)
                var urlPath=data.filePath;
                var urlName=data.fileName;
                if(verifyVideoList==""){
                    $(".verifyVideoList").attr('data-id',urlPath)
                }else{
                    $(".verifyVideoList").attr('data-id',verifyVideoList+','+urlPath)
                }
                if(verifyVideoListName==""){
                    $(".verifyVideoListName").attr('data-id',urlName)
                }else{
                    $(".verifyVideoListName").attr('data-id',verifyVideoListName+','+urlName)
                }
                var ids=""
                if(data.success=="true"){
                    var v2='removeFile("'+ urlPath +'",'+'this'+',3,"'+ urlName + '","'+ids+'");event.stopPropagation()';
                    var method2="onclick='"+v2+"'";
                    var context='<div class="fileVideo marT10 fileName1" style="display:inline-block;margin-left:10px">';
                    var context1='<div id="myName'+objList1.length+'" class="nameBox cursorP" style="display:inline-block" title="'+data.fileName+'">'+data.fileName;
                    var context2='<a  href="javascript:void(0)" mce_href="#" class="removeBtn" '+method2+'></a></div></div>';
                    var a=context+context1+context2;
                    console.log(a);
                    $(".videoBox1").append(a);
                    $("#uploadVideoName1").val("");
                    $(".verifyVideoList").change();
                }
                layer.close(open1)
            },
            error : function() {
                //关闭遮罩，弹出消息框
                closeMask();
                $.messager.confirm('消息', '数据加载失败,请联系系统管理员！');
                //按钮生效
                $(".btn").removeAttr("disabled");
            }
        });
    }
    /*减免上传音频*/
    function VideoFunction2(that) {
        var reductionVideoList=$(".reductionVideoList").attr('data-id');
        var reductionVideoListName=$(".reductionVideoListName").attr('data-id');
        //按钮失效防点击
        var oFile=that.files[0].size;
        var fileName=that.files[0].name;
        var nameText = (fileName.substring(fileName.lastIndexOf("."))).toUpperCase();
        if(nameText!=".MP3" && nameText!=".WAV" && nameText!=".ARM"  && nameText!=".WAM"  && nameText!=".AVA"  && nameText!=".ACT"){
            layer.msg("请上传Mp3、wav、arm、wma、ava、act格式的录音",{time:3000});
            return false;
        }
        if(oFile>=2097152){
            layer.msg("每个录音最大为2M",{time:3000});
            return false;
        }
        if(objList3.length>=3){
            layer.msg("最多只能上传3条录音",{time:3000});
            $("#uploadVideoName2").val("");
            return false;
        }
        var open1 = layer.load(1, {
            shade: [0.5,'#000']
        });
        //弹出异步加载 遮罩
        $('#uploadVideo2').ajaxSubmit({
            type : "POST",
            contentType:"multipart/form-data",
// 			data:datas,
            url : "<%=basePath%>common/file/collectuploadFile.do?debtorName="+app.debtorName+"&type=jianmian"+"&timestamp=" + (new Date()).getTime(),
            success : function(data2) {
                var data = eval('(' + data2 + ')');
                objList3.push({id:"",filePath:data.filePath,fileName:data.fileName});
                $(".reductionVideo").css('border','1px solid rgb(224, 231, 237)')
                var urlPath=data.filePath;
                var urlName=data.fileName;
                if(reductionVideoList==""){
                    $(".reductionVideoList").attr('data-id',urlPath)
                }else{
                    $(".reductionVideoList").attr('data-id',reductionVideoList+','+urlPath)
                }
                if(reductionVideoListName==""){
                    $(".reductionVideoListName").attr('data-id',urlName)
                }else{
                    $(".reductionVideoListName").attr('data-id',reductionVideoListName+','+urlName)
                }
                var ids=""
                if(data.success=="true"){
                    var v2='removeFile("'+ urlPath +'",'+'this'+',4,"'+ urlName + '","'+ids+'");event.stopPropagation()';
                    var method2="onclick='"+v2+"'";
                    var context='<div class="fileVideo marT10 fileName1" style="display:inline-block;margin-left:10px">';
                    var context1='<div id="myName'+objList3.length+'" class="nameBox cursorP" style="display:inline-block" title="'+data.fileName+'">'+data.fileName;
                    var context2='<a  href="javascript:void(0)" mce_href="#" class="removeBtn" '+method2+'></a></div></div>';
                    var a=context+context1+context2;
                    console.log(a);
                    $(".videoBox2").append(a);
                    $("#uploadVideoName2").val("");
                    $(".reductionVideoList").change();
                }
                layer.close(open1)
            },
            error : function() {
                //关闭遮罩，弹出消息框
                closeMask();
                $.messager.confirm('消息', '数据加载失败,请联系系统管理员！');
                //按钮生效
                $(".btn").removeAttr("disabled");
            }
        });
    }
    //删除
    //点击上传成功文件上的叉号，删除该文件
    function removeFile(e,that,num,f,c){
        if(c==""){
            $(that).parent().parent().remove();
        }else{
            $(that).parent().remove();
        }
        console.log("aaa-------------------",num)
        if(num==1){
            var obj1={id:c,filePath:e,fileName:f};
            console.log("bbb---------------------------------",obj1);
            console.log("bbb---------------------------------",objList);
            var verifyImgList=$('.verifyImgList').attr('data-id');
            var verifyImgListName=$('.verifyImgListName').attr('data-id');
            var tig1=verifyImgList.split(',');
            var tig2=verifyImgListName.split(',');
            for(var i=0;i<tig1.length;i++){
                console.log(tig1[i])
                console.log(e)
                if(tig1[i]==e){
                    tig1.splice(i,1)
                    tig2.splice(i,1)
                }
            }
            console.log("tig1----",tig1)
            console.log("tig2----",tig2)
            for (var i =0;i<objList.length;i++) {
                if (objList[i].filePath== obj1.filePath) {
                    objList.splice(i,1);
                }
            }
            console.log("bbb---------------------------------",objList);
            $('.verifyImgList').attr('data-id',tig1)
            $('.verifyImgListName').attr('data-id',tig2)
            if(objList.length==0){
                console.log("ccc---------------------------------",objList);
                var verifyInputLength=document.getElementsByClassName('verifyInput').length;
                var m=0;
                $('.verifyInput').each(function(index,ele){
                    console.log("verifyInput-data-id",$(".verifyInput").attr("data-id"))
                    if($(this).attr('data-id')==""){
                        ++m
                        console.log('m++第'+index+'个',m)
                    }else{
                        m--;
                        console.log('m--第'+index+'个',m)
                        console.log($(this).attr('data-id'))
                    }
                })
                if(m==verifyInputLength){
                    app.noEmpty1=0;
                    verifySubmitflag=1
                }else{
                    app.noEmpty1=1
                }
            }
            console.log("objList.lnegth",objList.length)
        }else if(num==3){
            var obj3={id:c,filePath:e,fileName:f};
            console.log("obj3--------------",obj3);
            console.log("objList1--------------",objList1);
            var verifyVideoList=$('.verifyVideoList').attr('data-id');
            var verifyVideoListName=$('.verifyVideoListName').attr('data-id');
            var tig3=verifyVideoList.split(',');
            var tig4=verifyVideoListName.split(',');
            for(var i=0;i<tig3.length;i++){
//                console.log(tig3[i])
//                console.log(e)
                if(tig3[i]==e){
                    tig3.splice(i,1)
                    tig4.splice(i,1)
                }
            }

            for (var i =0;i<objList1.length;i++) {
                if (objList1[i].filePath== obj3.filePath) {
                    objList1.splice(i, 1);
                }
            }
            $('.verifyVideoList').attr('data-id',tig3)
            $('.verifyVideoListName').attr('data-id',tig4)
            if(objList1.length==0){
                var verifyInputLength=document.getElementsByClassName('verifyInput').length;
                var j=0;
                $('.verifyInput').each(function(index,ele){
                    console.log("verifyInput-data-id",$(".verifyInput").attr("data-id"))
                    if($(this).attr('data-id')==""){
                        ++j
                        console.log('j++第'+index+'个',j)
                    }else{
                        j--;
                        console.log('j--第'+index+'个',j)
                    }
                })
                if(j==verifyInputLength){
                    app.noEmpty1=0;
                    verifySubmitflag=1
                }else{
                    app.noEmpty1=1
                }
            }
            console.log("objList1.lnegth",objList1.length)
        }else if(num==2){
            var obj2={id:c,filePath:e,fileName:f};
            console.log("obj2--------------",obj2);
            console.log("objList1--------------",objList1);
            var reductionImgList=$('.reductionImgList').attr('data-id');
            var reductionImgListName=$('.reductionImgListName').attr('data-id');
            var tig5=reductionImgList.split(',');
            var tig6=reductionImgListName.split(',');
            for(var i=0;i<tig5.length;i++){
//                console.log(tig5[i])
//                console.log(e)
                if(tig5[i]==e){
                    tig5.splice(i,1)
                    tig6.splice(i,1)
                }
            }
            for (var i =0;i<objList2.length;i++) {
                if (objList2[i].filePath== obj2.filePath) {
                    objList2.splice(i,1);
                }
            }
            $('.reductionImgList').attr('data-id',tig5)
            $('.reductionImgListName').attr('data-id',tig6)
            if(objList2.length==0){
                var reductionInputLength=document.getElementsByClassName('reductionInput').length;
                var o=0;
                $('.reductionInput').each(function(index,ele){
                    if($(this).attr('data-id')==""){
                        ++o
                        console.log('o++第'+index+'个',o)
                    }else{
                        o--;
                        console.log('o--第'+index+'个',o)
                    }
                })
                if(o==reductionInputLength){
                    app.noEmpty2=0;
                    reductionSubmitflag=1
                }else{
                    app.noEmpty2=1
                }
            }
            console.log(objList2)
        }else if(num==4){
            console.log("obj4--------------",obj4);
            var obj4={id:c,filePath:e,fileName:f};
            console.log("objList3--------------",objList3);
            var reductionVideoList=$('.reductionVideoList').attr('data-id');
            var reductionVideoListName=$('.reductionVideoListName').attr('data-id');
            var tig7=reductionVideoList.split(',');
            var tig8=reductionVideoListName.split(',');
            for(var i=0;i<tig7.length;i++){
//                console.log(tig7[i])
//                console.log(e)
                if(tig7[i]==e){
                    tig7.splice(i,1)
                    tig8.splice(i,1)
                }
            }
            $('.reductionVideoList').attr('data-id',tig7)
            $('.reductionVideoListName').attr('data-id',tig8)
            for (var i =0;i<objList3.length;i++) {
                if (objList3[i].filePath== obj4.filePath) {
                    objList3.splice(i,1);
                }
            }
            if(objList3.length==0){
                var reductionInputLength=document.getElementsByClassName('reductionInput').length;
                var m=0;
                $('.reductionInput').each(function(index,ele){
                    if($(this).attr('data-id')==""){
                        ++m
                        console.log('m++第'+index+'个',m)
                    }else{
                        m--;
                        console.log('m--第'+index+'个',m)
                    }
                })
                if(m==reductionInputLength){
                    app.noEmpty2=0;
                    reductionSubmitflag=1
                }else{
                    app.noEmpty2=1
                }
            }
            console.log(objList3)
        }
    }
    <%--//下载--%>
    <%--function downLoads(e,f){--%>
        <%--window.location.href="<%=basePath%>" + "manage/contract/download.do?filePath="+e+"&fileName="+encodeURI(encodeURI(f));--%>
    <%--}--%>

    /*获取数据部分*/
    /*资料*/
    function getMoreInfo(_id){
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/getMoreInfo.do?id='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log(obj)
                app.dDebtorInfo=obj.dDebtorInfo;   //更多信息
                console.log('更多信息的数据---------------',app.dDebtorInfo)
                console.log("还款方式-----------",obj.eClientTarget)
                app.eClientTarget=obj.eClientTarget;  //
                app.accountSize=obj.accountSize;  //银行转账账号数
                console.log('银行转账账号数----------------',obj.accountSize)
                var bankInfo=[];
                if(obj.accountSize==0 || obj.accountSize==null || obj.accountSize=="" || obj.accountSize==undefined){

                }else{
                    if(obj.accountSize==1){
                        bankInfo.push({
                            'bankNames':obj.bankNames[0],
                            'accounts':obj.accounts[0],
                            'accountNames':obj.accountNames[0]
                        })
                    }else if(obj.accountSize==2){
                        bankInfo.push(
                                {
                                    'bankNames':obj.bankNames[0],
                                    'accounts':obj.accounts[0],
                                    'accountNames':obj.accountNames[0]
                                },
                                {
                                    'bankNames':obj.bankNames[1],
                                    'accounts':obj.accounts[1],
                                    'accountNames':obj.accountNames[1]
                                }
                        )
                    }else if(obj.accountSize==3){
                        bankInfo.push(
                                {
                                    'bankNames':obj.bankNames[0],
                                    'accounts':obj.accounts[0],
                                    'accountNames':obj.accountNames[0]
                                },
                                {
                                    'bankNames':obj.bankNames[1],
                                    'accounts':obj.accounts[1],
                                    'accountNames':obj.accountNames[1]
                                },
                                {
                                    'bankNames':obj.bankNames[2],
                                    'accounts':obj.accounts[2],
                                    'accountNames':obj.accountNames[2]
                                }
                        )
                    }
                    app.bankInfo=bankInfo;
                    console.log('银行信息------------',app.bankInfo)
                }
            },
            error : function() {
            }
        });
    }
    /*历史信息*/
    /*催收记录*/
    function collectReadRecordNew(_id){
        $.ajax({
            url : '<%=basePath%>manage/collection/collectionRecord/collectReadRecordNew.do?id='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('催收记录',obj.rows)
                app.collectReadRecordNew=obj.rows
            },
            error : function() {
            }
        });
    }
    /*对账记录*/
    function collectReadCommitNew(_id){
        $.ajax({
            url : '<%=basePath%>manage/commit/collectReadCommitNew.do?id='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('对账记录',obj.rows)
                app.collectReadCommitNew=obj.rows
            },
            error : function() {
            }
        });
    }
    /*减免记录*/
    function collectReadApplyNew(_id){
        $.ajax({
            url : '<%=basePath%>manage/MapplyReduction/collectReadApplyNew.do?id='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('减免记录',obj.rows)
                app.collectReadApplyNew=obj.rows
            },
            error : function() {
            }
        });
    }
    /*通话记录*/
    function collectReadCallRecordNew(_id){
        $.ajax({
            url : '<%=basePath%>manage/callQuery/collectReadCallRecordNew.do?id='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('通话记录',obj.rows)
                app.collectReadCallRecordNew=obj.rows
            },
            error : function() {
            }
        });
    }
    /*消息通知*/
    function getMessages(){
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/getMessages.do',
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('消息通知',obj.messages);
                console.log('消息通知',obj);
                app.messages=obj.messages;
                var messages=Math.ceil(obj.messages.length*5/60);
                timer=60000*messages;
                getTimer(timer)
            },
            error : function() {
            }
        });
    }
    /*定时请求信息*/
    function getTimer(_timer){
        console.log(_timer);

        var timerInfo=setTimeout(function(){
            getMessages()
        },_timer)
    }
    /*紧急联系人*/
    function collectReadContactNew(_id){
        $.ajax({
            url : '<%=basePath%>debtor/contacts/collectReadContactNew.do?debtorId='+_id,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('紧急联系人-------------',obj)
                app.collectReadContactNew=obj.rows
                console.log(obj.rows);
            },
            error : function() {
            }
        });
    }
    /*失恋修复*/
    <%--function isShowRepairData(_id){--%>
        <%--$.ajax({--%>
            <%--url : '<%=basePath%>manage/tRepairRecordDetails/collectReadNewContact.do?id='+_id,--%>
            <%--async : true,--%>
            <%--success : function(data) {--%>
                <%--var obj=JSON.parse(data);--%>
                <%--console.log('紧急联系人-------------',obj)--%>
                <%--app.isShowRepairData=obj.rows--%>
                <%--console.log(obj.rows);--%>
            <%--},--%>
            <%--error : function() {--%>
            <%--}--%>
        <%--});--%>
    <%--}--%>
    /*新建联系人*/
    function contactsSave(_id,contactsName,contactsTelephone,contactRemark,contactsRelationship,index){
        console.log("contactRemark---------",contactRemark)
        console.log("contactsRelationship---------",contactsRelationship)
        var date={
            debtorInfoId:_id,
            contactsName:encodeURI(contactsName),
            contactsTelephone:contactsTelephone,
            contactRemark:encodeURI(contactRemark),
            contactsRelationship:contactsRelationship,
        }
        $.ajax({
            url :'<%=basePath%>debtor/contacts/save.do',
            async : true,
            type:'POST',
            data:date,
            success : function(data) {
                $("#telePhone").val('');
                $("#contactRemark").val('')
                $("#telePhone2").val('');
                $("#contactRemark2").val('')
                $("#liaison2").val('');
                $(".tabBoxList").each(function(index,ele){
                    if(index==0){
                        $(this).addClass('tabBoxon');
                        $(this).siblings().removeClass('tabBoxon');
                        $(".tabBox1").show();
                        $(".tabBox2").hide();
                    }
                })
                if(data.success=="true"){
                    layer.msg("新增联系人成功");
                    layer.close(index)
                    collectReadContactNew(_id);
                    layer.close(loadIngAdd)
                }else{
                    layer.close(index)
                    layer.close(loadIngAdd)
                    layer.msg(data.message)
                }
            },
            error : function(data) {
                layer.msg(data.message);
                layer.close(index)
            }
        });
    }
    /*自定义标签*/
    function saveCustomLabel(_id,customLabels){
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/saveCustomLabel.do?id='+_id+'&customLabel='+customLabels,
            async : true,
            success : function(data) {
                console.log(data);
                layer.msg('设置成功');
            },
            error : function() {
            }
        });
    }
    /*历史记录本人非本人*/
    function getTimeInfo(obj,num,n){
        $("#relationship").val(num)
        $('.allListInfo1').each(function(index,ele){
            $(this).removeClass('listInfoOn')
            if(n==(index+1)){
                $(this).addClass('listInfoOn')
            }
        })
        $('.allListInfo2').each(function(index,ele){
            $(this).removeClass('listInfoOn')
            if(n==(index+1)){
                $(this).addClass('listInfoOn')
            }
        })
        queryHistoryRecord(_id,num)
    }
    /*催收历史*/
    function queryHistoryRecord(_id,relation){
        $.ajax({
            url : '<%=basePath%>manage/collection/collectionRecord/queryHistoryRecord.do?debtorId='+_id+"&relation="+relation,
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('催收历史--------------',obj.data)
                if(relation==1 || relation==2){
                    var todayName=today.split('.').join('-');
                    if(obj.data=="" || obj.data==null || obj.data==undefined){
                        $(".timeListNoData").hide()
                        $(".timeListHasData").show();
                        app.timerListSure=false;
                        app.timerListSureList=false;
                        console.log('app.timerListSureList11111111111111111111111111',app.timerListSureList);
                        $(".leftOpacity").hide()
                        $(".rightOpacity").hide()
                    }else{
                        app.timerListSureList=true;
                        console.log('app.timerListSureList2222222222222222222222222222',app.timerListSureList)
                        for(var j=0;j<obj.data.length;j++){
                            if(todayName==obj.data[j].queryDate && obj.data[j].contectName!=''){
                                app.timerListSure=true;
                            }
                        }
                        var length=obj.data.length;
                        if(length==0){
                            $(".timeListNoData").show()
                            $(".timeListHasData").hide()
                        }else{
                            $(".timeListNoData").hide()
                            $(".timeListHasData").show()
                            app.timerList=obj.data;
                            if(length<18 && length>0){
                                for(var i=(18-length);i>0;i--){
                                    app.timerList.unshift({
                                        contectName:'',
                                        queryDate:'2020.5.'+i,
                                        result:''
                                    })
                                }
                            }
                            console.log("追加的数组--------",app.timerList)
                            var ulLength=80*(app.timerList.length+1)
                            console.log(ulLength)
                            $(".timeList ul").each(function(){
                                $(this).css('width',ulLength+'px')
                            })
                            $(".timeList ul").css('width',ulLength+'px');
                            $(".timeList").show();
                            $(".leftOpacity").show()
                            $(".rightOpacity").show()
                            /*催收历史滚动条定位右侧*/
                            console.log($('.timeList ul')[0].scrollWidth)
                            console.log($('.timeList ul')[1].scrollWidth)
                            if($('.timeList ul')[0].scrollWidth==0){
                                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
                            }
                            if($('.timeList ul')[1].scrollWidth==0){
                                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
                            }
                            console.log($('.timeList').scrollLeft())
                        }
                    }
                }else{
                    app.timerListSureList=true;
                    console.log('app.timerListSureList33333333333333333333333333333',app.timerListSureList)
                    var todayName=today.split('.').join('-');
                    if(obj.data=="" || obj.data==null || obj.data==undefined){
                        $(".timeListNoData").show()
                        $(".timeListHasData").hide();
                        app.timerListSure=false;

                    }else{
                        for(var j=0;j<obj.data.length;j++){
                            if(todayName==obj.data[j].queryDate && obj.data[j].contectName!=''){
                                app.timerListSure=true;
                            }
                        }
                        var length=obj.data.length;
                        if(length==0){
                            $(".timeListNoData").show()
                            $(".timeListHasData").hide()
                        }else{
                            $(".timeListNoData").hide()
                            $(".timeListHasData").show()
                            app.timerList=obj.data;
                            if(length<18 && length>0){
                                for(var i=(18-length);i>0;i--){
                                    app.timerList.unshift({
                                        contectName:'',
                                        queryDate:'2020.5.'+i,
                                        result:''
                                    })
                                }
                            }
                            console.log("追加的数组--------",app.timerList)
                            var ulLength=80*(app.timerList.length+1)
                            console.log(ulLength)
                            $(".timeList ul").each(function(){
                                $(this).css('width',ulLength+'px')
                            })
                            $(".timeList ul").css('width',ulLength+'px');
                            $(".timeList").show();
                            $(".leftOpacity").show()
                            $(".rightOpacity").show()
                            /*催收历史滚动条定位右侧*/
                            console.log($('.timeList ul')[0].scrollWidth)
                            console.log($('.timeList ul')[1].scrollWidth)
                            if($('.timeList ul')[0].scrollWidth==0){
                                $('.timeList').scrollLeft($('.timeList ul')[1].scrollWidth);
                            }
                            if($('.timeList ul')[1].scrollWidth==0){
                                $('.timeList').scrollLeft($('.timeList ul')[0].scrollWidth);
                            }
                            console.log($('.timeList').scrollLeft())
                        }
                    }
                }
            },
            error : function() {
            }
        });
    }
    /*催收明细查询*/
    function timeRecord(obj,typyList){
        _czc.push(["_trackEvent","日期点击","点击日期点击",'${login_user.companyName}'+"/"+'${login_user.name}']);
        var _id=$(obj).siblings('input').eq(0).val();
        var dateList=$(obj).siblings('input').eq(1).val().split('-').join('.');
        $(".timeListOpen").css('display','block');
        $(".timeListOpen").animate({"height":'240px'});
        if(typyList==1){
            _czc.push(["_trackEvent","前一天","点击前一天",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
        if(typyList==2){
            _czc.push(["_trackEvent","后一天","点击后一天",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
        if(dateList==-1){

        }else{
//            $('.leftIcon').attr('disabled',false);
//            $('.rightIcon').attr('disabled',false);
//            $(".selectedDate").text(dateList.split('-').join('.'));
            console.log(_id,dateList)
            $.ajax({
                <%--url : '<%=basePath%>manage/collection/collectionRecord/queryHistoryRecordDetail.do?debtorId='+_id+"&date="+dateList.split('.').join('-'),--%>
                url : '<%=basePath%>manage/collection/collectionRecord/queryHistoryRecordDetail.do?debtorId='+_id+"&date=",
                async : true,
                success : function(data) {
                    app.dateListSelect=dateList;
                    var obj=JSON.parse(data);
                    console.log(obj)
                    app.lastDate=obj.lastDate;
                    app.nextDate=obj.nextDate;
                    app.timerContent=obj.data;
                },
                error : function() {
                }
            });
        }
    }
    /*切换标签提示*/
    function closeChangeLableTip(){
        app.changeLableTip=
                $.ajax({
                    url : '<%=basePath%>manage/user/closeChangeLableTip.do',
                    async : true,
                    success : function(data) {
                        console.log(data)
                    },
                    error : function() {
                    }
                });
    }
    /*新手引导*/
    function updateNewbieGuide(){
        $.ajax({
            url : '<%=basePath%>manage/user/updateNewbieGuide.do',
            async : true,
            success : function(data) {
                console.log(data)
            },
            error : function() {
            }
        });
    }
    /*回款排名*/
    function personalBackMoneyRankingNew(){
        $.ajax({
            url : '<%=basePath%>manage/rankReport/personalBackMoneyRankingNew.do',
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('回款排名------',obj);
                if(obj.data.length==0){
                    for(var i=0;i<3;i++){
                        obj.data.push({
                            username:'--',
                            backMoney:'',
                            backMoneyRank:i+1,
                        })
                    }
                }
                app.backMoneyList=obj;
            },
            error : function() {
            }
        });
    }
    /*拨打次数*/
    function personalCallNumRankingNew(){
        $.ajax({
            url : '<%=basePath%>manage/rankReport/personalCallNumRankingNew.do',
            async : true,
            success : function(data) {
                var obj=JSON.parse(data);
                console.log('拨打次数------',obj);
                if(obj.data.length==0){
                    for(var i=0;i<3;i++){
                        obj.data.push({
                            username:'--',
                            callNum:'',
                            callNumRank:i+1,
                        })
                    }
                }
                app.callNumber=obj;
            },
            error : function() {
            }
        });
    }
    /*上一条，下一条*/
    var changeFunFlag=true;
    function getNextNew(id,type){
        if(type==1){
            _czc.push(["_trackEvent","未保存当前输入内容，点击上一条","点击上一条",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }else if(type==2){
            _czc.push(["_trackEvent","未保存当前输入内容，点击下一条","点击下一条",'${login_user.companyName}'+"/"+'${login_user.name}']);
        }
        if(app.noEmpty==1 || app.noEmpty1==1 || app.noEmpty2==1){
            var str='';
            if(app.noEmpty==1){
                str+="「<span style='color:#4DA1FE'>新增催记</span>」"
            }
            if(app.noEmpty1==1){
                str+="「<span style='color:#4DA1FE'>发起对账</span>」"
            }
            if(app.noEmpty2==1){
                str+="「<span style='color:#4DA1FE'>发起减免</span>」"
            }
            layer.open({
                id: 'layerDemo' //防止重复弹出
                ,type: 1
                ,title:'提示'
                ,content:'<div style="padding:15px 10px;font-size:18px;color:#252631;">您在'+str+'有填写内容，确定离开吗？</div>'
                ,area:["450px","196px"]
                ,btn:['确定','取消']
                ,yes:function(index){
                    layer.close(index)
                    var loadIng= layer.load(1, {
                        shade: [0.1,'#000']
                    });
                    if(changeFunFlag){
                        changeFun(id,type,loadIng);
                    }
                }
                ,cancel : function(index){
                    layer.close(index)
                }
            });
        }else{
            var loadIng= layer.load(1, {
                shade: [0.1,'#000']
            });
            if(changeFunFlag){
                changeFun(id,type,loadIng);
            }
        }
    }
    function changeFun(id,type,loadIng){
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/getNextNew.do?id='+id+'&type='+type,
            async : true,
            success : function(data) {

                var obj=JSON.parse(data);
                console.log('上一条，下一条------',obj.onclickNum);
                console.log('<%=basePath%>manage/mydebtor/tocollect.do?id='+obj.onclickNum)
                if(obj.onclickNum==-1){
                    changeFunFlag=true;
                    layer.close(loadIng)
                    layer.msg('当前债务人已经是最后一个债务人')
                }else{
                    changeFunFlag=false;
                    window.location.href='<%=basePath%>manage/mydebtor/tocollect.do?id='+obj.onclickNum;
                    layer.close(loadIng)
                }
            },
            error : function() {
                layer.close(loadIng)
            }
        });
    }
    /*点击联系人*/
    function clickContacts(type,_id,obj,e){
        e.stopPropagation()
        $(".selList").hide();
        var debtorContactsId=''
        var id=_id;
        var name='';
        var phone='';
        var contactsRelationship=''
        if(type==1){
            console.log("拨打软电话")
            debtorContactsId=$(obj).parents('div').siblings('input').eq(0).val()
            name=$(obj).parents('div').siblings('input').eq(1).val()
            phone=$(obj).parents('div').siblings('input').eq(2).val()
            contactsRelationship=$(obj).parents('div').siblings('input').eq(3).val()
            console.log('debtorContactsId----',debtorContactsId)
            console.log('name----',name)
            console.log('phone----',phone)
            callQuery(name,phone,id,debtorContactsId);
            getCaseLastInfo(name,phone,id,debtorContactsId,contactsRelationship);
        }else if(type==2){
            debtorContactsId=$(obj).siblings('input').eq(0).val();
            name=$(obj).siblings('input').eq(1).val()
            phone=$(obj).siblings('input').eq(2).val();
            contactsRelationship=$(obj).siblings('input').eq(3).val()
            console.log("新增催记回显")
            console.log('debtorContactsId----',debtorContactsId)
            console.log('name----',name)
            console.log('phone----',phone)
            console.log('contactsRelationship----',contactsRelationship)
            getCaseLastInfo(name,phone,id,debtorContactsId,contactsRelationship);
        }
    }
    /*新增催记里打电话*/
    function callQueryImg(obj,_id){
        var name=$(obj).siblings('input').eq(0).val();
        var id=_id;
        var phone=$(obj).siblings('input').eq(1).val();
        var debtorContactsId=$(obj).siblings('input').eq(2).val();
        console.log("name----"+name,"phone-----"+phone,"id------"+id,"debtorContactsId---"+debtorContactsId)
        callQuery(name,phone,id,debtorContactsId);
    }
    /*保存通话记录*/
    function callQuery(_name,_phone,_id,_debtorContactsId){
        $.ajax({
            url : '<%=basePath%>manage/callQuery/save.do?name='+_name+'&phone='+_phone+'&id='+_id+'&debtorContactsId='+_debtorContactsId,
            async : true,
            success : function(data) {
                if(data.success){
                    callQueryCall(_phone,_debtorContactsId)
//                    callThis(_phone,_debtorContactsId)
                }
            },
            error : function() {
            }
        });
    }
    /*调起软电话*/
    function callQueryCall(phone,debtorContactsId){
//    function callThis(phone,debtorContactsId){
        $.ajax({
            url : '<%=basePath%>manage/callQuery/call.do?phone='+phone+'&id='+debtorContactsId+'&timestamp='+(new Date()).getTime(),
            async : true,
            success : function(data) {
                console.log('调起软电话成功')
            },
            error : function() {
            }
        });
    }
    //    function callThis(id,conid,tel,name,guanxi,telStatus,drcId){
    //        callQueryCall(tel,conid)
    //    };
    /*新增催记回显*/
    function getCaseLastInfo(name,phone,_id,debtorContactsId,contactsRelationship){
        if(name!=''|| phone!=''){
            app.noEmpty=1;
        }
        $("#linkName").val(name)
        $("#linkPhone").val(phone)
        $("#linkId").val(debtorContactsId)
        $(".linkManName").attr('data-id',name)
        $(".linkManName").val(name)
        $(".callTel").val(phone)
        $(".callTel").attr('data-id',phone)
        $("#guanxi").val(contactsRelationship)
        $(".linkManName ").css('border','1px solid rgba(224,231,237,1)')
        $(".callTel").css('border','1px solid rgba(224,231,237,1)')
        $("#caseStatus").css('border','1px solid rgba(224,231,237,1)')
        $(".backMoney").css('border','1px solid rgba(224,231,237,1)')
        $("#commitmentTime").css('border','1px solid rgba(224,231,237,1)')
        $.ajax({
            url : '<%=basePath%>manage/mydebtor/getCaseLastInfo.do?debtorId='+_id,
            async : true,
            success : function(data) {
                console.log('新增催记回显',data)
                var obj=JSON.parse(data);
                if(obj.lastResult!='' || obj.lastResult!=undefined || obj.lastResult!=null){
                    app.noEmpty=1
                }
                console.log("obj.lastResult-----",obj.lastResult)
                $(".caseStatus li").each(function(index,ele){
                    if($(this).attr('data-id')==obj.lastResult){
                        $(this).addClass('selected');
                        $(this).siblings().removeClass('selected');
                    }
                })
                if(obj.lastResult==1){
                    app.repayment=true;
                    $("#caseStatus").val('承诺还款');
                    $(".backMoney").val(parseFloat(obj.chengnuoAmount).toFixed(2));
                    $(".backMoney").attr('data-id',parseFloat(obj.chengnuoAmount).toFixed(2));
                    $("#commitmentTime").val(obj.chengnuoTime);
                    $("#commitmentTime").attr('data-id',obj.chengnuoTime);
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==3){
                    app.repayment=false;
                    $("#caseStatus").val('待对账');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==4){
                    app.repayment=false;
                    $("#caseStatus").val('谈判中');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==8){
                    app.repayment=false;
                    $("#caseStatus").val('恶意拖欠');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==9){
                    app.repayment=false;
                    $("#caseStatus").val('失联');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==10){
                    app.repayment=false;
                    $("#caseStatus").val('多次跳票');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==12){
                    app.repayment=false;
                    $("#caseStatus").val('投诉倾向');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }else if(obj.lastResult==13){
                    app.repayment=false;
                    $("#caseStatus").val('否认身份');
                    $("#caseStatus").attr('data-id',obj.lastResult);
                }

            },
            error : function() {
            }
        });
    }

    /*非空验证*/
    function notEmpty(num,obj){
//        console.log(obj);
        if($(obj).attr('data-id')!=''){
            console.log($(obj).attr('data-id'),1)
            if(num==0){
                app.noEmpty=1
            }else if(num==1){
                app.noEmpty1=1
            }else if(num==2){
                app.noEmpty2=1
            }
        }else if($(obj).attr('data-id')==''){
            console.log($(obj).attr('data-id'),2)
            var i=0;
            var verifyInputLength=document.getElementsByClassName('verifyInput').length;
            var reductionInputLength=document.getElementsByClassName('reductionInput').length;
            var j=0;
            var k=0;
            if(num==0){
                $(".addInput").each(function(index,ele){
                    if($(this).attr('data-id')==""){
                        ++i
                        console.log('i++第'+index+'个',i)
                    }else{
                        i--
                        console.log('i--第'+index+'个',i)
                    }
                });
                console.log(i)
                if(i==9){
                    app.noEmpty=0;
                    newAddflag=1

                }else{
                    app.noEmpty=1

                }
            }else if(num==1){
                $('.verifyInput').each(function(index,ele){
                    if($(this).attr('data-id')==""){
                        ++j
                        console.log('j++第'+index+'个',j)
                    }else{
                        j--;
                        console.log('j--第'+index+'个',j)
                    }
                })
                console.log(j)
                if(j==verifyInputLength){
                    app.noEmpty1=0;
                    verifySubmitflag=1

                }else{
                    app.noEmpty1=1

                }
            }else if(num==2){
                $('.reductionInput').each(function(index,ele){
                    if($(this).attr('data-id')==""){
                        ++k
                        console.log('k++第'+index+'个',k)
                    }else{
                        k--;
                        console.log('k--第'+index+'个',k)
                    }
                })
                console.log(k)
                if(k==reductionInputLength){
                    app.noEmpty2=0;
                    reductionSubmitflag=1
                }else{
                    app.noEmpty2=1
                }
            }
        }
    }
    function focusFun(obj){
        $(obj).css('border','1px solid #4DA1FE')
    }
    function blurFun(obj){
        $(obj).css('border','1px solid rgba(224,231,237,1)')
    }
    /*一键保存取消按钮*/
    function cancelBtn(){
        layer.open({
            id: 'layerDemo' //防止重复弹出
            ,type: 1
            ,title:'提示'
            ,content:'<div style="padding:15px 10px;font-size:18px;color:#252631;">确定清空所填写内容吗？</div>'
            ,area:["450px","170px"]
            ,btn:['确定','取消']
            ,yes:function(index){
                $('.addInput').each(function(index,ele){
                    $(this).attr('data-id','');
                    $(this).val('');
                    $(this).css('border','1px solid rgb(224, 231, 237)')
                })
                $('.verifyInput').each(function(index,ele){
                    $(this).attr('data-id','');
                    $(this).val('');
                    $(this).css('border','1px solid rgb(224, 231, 237)')
                })
                $('.reductionInput').each(function(index,ele){
                    $(this).attr('data-id','');
                    $(this).val('');
                    $(this).css('border','1px solid rgb(224, 231, 237)')
                })
                $(".imgBox1").html('')
                $(".videoBox1").html('')
                $(".imgBox2").html('')
                $(".videoBox2").html('')
                $(".reductionImg").css('border','1px solid rgb(224, 231, 237)')
                $(".reductionVideo").css('border','1px solid rgb(224, 231, 237)')
                $(".verifyImg").css('border','1px solid rgb(224, 231, 237)')
                $(".verifyVideo").css('border','1px solid rgba(224,231,237)')
                $(".verifyImgListName").attr('data-id','');
                $(".verifyVideoListName").attr('data-id','');
                $(".reductionImgListName").attr('data-id','');
                $(".reductionVideoListName").attr('data-id','');
                objList=[];
                objList1=[];
                objList2=[];
                objList3=[];
                obj1List={}
                obj2List={}
                obj3List={}
                app.noEmpty=0;
                app.noEmpty1=0;
                app.noEmpty2=0;
                flagText='';
                verifySubmitflag=1;
                reductionSubmitflag=1
                newAddflag=1;
                $("#guanxi").val("")
                $(".telState").val("请选择");
                $(".solveMode").val("请选择");
                $("#caseStatus").val("请选择")
                $("#backType").val("请选择")
                $(".settle").val("请选择")
                app.repayment=false;
                app.backType=false;
                $(".selList li").each(function(index,ele){
                    if($(this).index()==0){
                        $(this).addClass('selected');
                    }else{
                        $(this).removeClass('selected');
                    }
                })
                layer.close(index);
            }
            ,cancel : function(index) {
                layer.close(index);
            }
        })
        _czc.push(["_trackEvent","清空的点击","点击清空",'${login_user.companyName}'+"/"+'${login_user.name}']);
    }
    /*一键保存*/
    function submitBtn(){
        flagText=''
        if(app.noEmpty==0 && app.noEmpty1==0 && app.noEmpty2==0){
            layer.msg('您没有填写任何内容，请填写后提交！')
        }else{
            if(app.noEmpty==1){
                newAdd();
            }
            if(app.noEmpty1==1){
                verify()
            }
            if(app.noEmpty2==1){
                reduction();
            }
            if(newAddflag==1 && verifySubmitflag==1 && reductionSubmitflag==1){
                if(obj1List.hasOwnProperty('contectName')){
                    newAddSubmit(obj1List);
                    loadIng= layer.load(1, {
                        shade: [0.1,'#000']
                    });
                }
                if(obj2List.hasOwnProperty('bMStatus')){
                    verifySubmit(obj2List);
                    loadIng= layer.load(1, {
                        shade: [0.1,'#000']
                    });
                }
                if(obj3List.hasOwnProperty('before_money')){
                    reductionSubmit(obj3List);
                    loadIng= layer.load(1, {
                        shade: [0.1,'#000']
                    });
                }
//                alertMsg()
            }
            alertText();
        }
    }

    /*新增催记非空验证提交*/

    function newAdd(){
        console.log("newAdd函数开始")
        var linkManName=$('.linkManName').attr('data-id')
        if(linkManName==""){
            $('.linkManName').css('border','1px solid red')
        }
        var arrText=['714高炮', 'pay贷', '现金贷', '砍头息', '贷款超市', '超短期', '高息', '乱伦', '做台', '卖身', '卖逼', '口交', '口淫', '嗑药', '女士服务', '奸杀', '妓女嫖鸡', '婊子', '嫖妓','小穴','少妇','开苞','强奸','强暴','性伙伴','性奴','性服务','性爱','性虐','有偿服务','淫靡','群交','裸照','陪聊','骚女','乌龟','人渣','杂交','杂种','狗杂种','猪狗不如','王八蛋','畜生','社会败类','缩头乌龟','老废物','蛋疼','要饭的','败类','陪客','龟儿子','p图','下流','不得好死','你他妈','你想死啊','你要不要脸','傻逼','全家死','卑鄙','卖淫','卖身','卖逼','去你妈','去卖去','吃屎','呼死你','喷屎','喷漆','喷粪','坐台','妈逼','小逼仔子',"弄死他","打爆通话详单","拉横幅","搞到身败名裂","操你妈","操你老婆","智障","有毛病","棺材","死人","死全家","死逼","泼墨","流氓","烂货","烂逼","爆通讯录","狗日的","狗杂","痞子","真他妈","砍死","神经病","给你脸了","老子弄死你","老逼","脑残","臭逼","花圈","被车撞","装孙","贱婢","贱货","贱逼", '轰炸','骨灰','人民银行','公安局','办公厅','央行','无耻','政府','律所','支行','机关单位','检察院','派出所']
        for(var x=0;x<arrText.length;x++){
//            console.log(arrText[x])
//            console.log($(".linkManName").val().indexOf(arrText[x]))
            if($(".linkManName").val().indexOf(arrText[x])!=-1){
                cuhuaFlag=0
                layer.open({
                    type: 0,
                    area: ['300px', '200px'],
                    shadeClose: true, //点击遮罩关闭
                    content: '<span style="color:black">您提交的催记涉及敏感词不能提交，请修改后再试</span>',
                });
                return;
            }
        }
        var callTel=$('.callTel').attr('data-id')
        if(callTel==""){
            $('.callTel').css('border','1px solid red')
        }
        var telState=$('.telState').attr('data-id');
        if(telState==""){
            $('.telState').css('border','1px solid red')
        }
        var flollowTime=$('#flollowTime').attr('data-id');
        var solveMode=$('.solveMode').attr('data-id');
        var caseStatus=$('#caseStatus').attr('data-id');
        if(caseStatus==""){
            $('#caseStatus').css('border','1px solid red')
        }
        if(caseStatus==1){
            var backMoney=$('.backMoney').attr('data-id');
            if(backMoney==""){
                $('.backMoney').css('border','1px solid red')
            }
            var commitmentTime=$('#commitmentTime').attr('data-id');
            if(commitmentTime==""){
                $('#commitmentTime').css('border','1px solid red')
            }
        }
        var newAddRemarks=$('.newAddRemarks').attr('data-id');
        for(var i=0;i<arrText.length;i++){
            if($(".newAddRemarks").val().indexOf(arrText[i])!=-1){
//                var Keyword=true;
                cuhuaFlag=0
                layer.open({
                    type: 0,
                    area: ['300px', '200px'],
                    shadeClose: true, //点击遮罩关闭
                    content: '<span style="color:black">您提交的催记涉及敏感词不能提交，请修改后再试</span>',
                });
                return;
            }
        }
        if(linkManName=="" || callTel=="" || telState=="" || caseStatus=="" || commitmentTime=="" || backMoney==""){
            // layer.msg('新增催记的必填项不能为空，请重新填写');
            newAddflag=0;
            return
        }else{
            newAddflag=1;
            if(commitmentTime!='' && commitmentTime!=null){
                commitmentTime=commitmentTime.replace(new RegExp("[.]",'g'), "-");   //承诺还款日期
            }
            if(flollowTime!='' && flollowTime!=null){
                flollowTime=flollowTime.replace(new RegExp("[.]",'g'), "-");   //承诺还款日期
            }
        }

        obj1List.conid=$('#linkId').val();    //联系人id
        obj1List.relation=$('#guanxi').val();            //关系
        obj1List.debtorId='${dDebtorInfo.id}';   //债务人id
        obj1List.contectName=encodeURI(linkManName);       //联系人姓名
        obj1List.phoneNum=callTel;              //联系人电话
        obj1List.telStatus=telState;            //电话状态
        obj1List.result=caseStatus;             //按键状态
        obj1List.followupTime=flollowTime;     //跟进时间
        obj1List.collectionState=solveMode;    //沟通方式
        obj1List.balancemoney=backMoney;       //承诺还款金额
        obj1List.balanceTime=commitmentTime;   //承诺还款日期
        obj1List.record=encodeURI(newAddRemarks);          //备注
//        if(newAddflag==1){
//            newAddSubmit(obj1)
//        }
    }

    /*校验对账*/
    function checkVerify(id,type){
        $.ajax({
            url : '<%=basePath%>manage/commit/checkCommit.do?debtorId='+id+'&isFirst='+type,
            async : true,
            success : function(data) {
                verifyType=true;
                console.log(data)
                if(data.com_ct_list=="" || data.com_ct_list==undefined || data.com_ct_list==null){
                    app.customTitle=0
                }else{
                    app.customTitle=data.com_ct_list.length;
                    app.com_ct_list=data.com_ct_list;
                    console.log("com_ct_list-------",data.com_ct_list)
                }
                var obj=[]
                var Listobj1=[];
                console.log('data.repaymentMethod------',data.repaymentMethod)
                for(var i in data.repaymentMethod){
                    if(i=='银行转账'){
                        obj.push({
                            name:i,
                            val:data.repaymentMethod[i]
                        })
                        Listobj1=data.repaymentMethod[i].split(',')
                    }else{
                        obj.push({
                            name:i,
                            val:data.repaymentMethod[i]
                        })
                    }
                }
                console.log(Listobj1);
                console.log("还款方式---------------",obj)
                console.log("还款方式1---------------",Listobj1.pop())
                app.backMoneyType=obj;
                var html='';
                $("#backTypeInfo1").val(Listobj1[0])
                $("#backTypeInfo1").attr('data-id',Listobj1[0])
                for(var i=0;i<Listobj1.length;i++){
                    console.log("Listobj1[i]---------",Listobj1[i])
                    html+='<li title="'+Listobj1[i]+'" data-id="'+Listobj1[i]+'">'+Listobj1[i]+'</li>'
                }
                console.log('123123123---------------',html)
                $("#backMoneyType1").html(html)
                app.ableCommit=data.ableCommit;
                app.maxRepayMoney=parseFloat(data.maxRepayMoney);
                console.log('还款金额----------------',app.maxRepayMoney)
                app.com_photo=data.com_photo;
                app.com_redio=data.com_redio;
                console.log(app.backMoneyType)
            },
            error : function() {
            }
        });
    }
    /*发起对账非空验证提交*/

    function verify(){
        if(app.backTypeName==false){
            var backType=$("#backType").attr('data-id');
        }else{
            var backType=$("#backTypeInfo1").attr('data-id');
        }
        if(backType==""){
            $("#backType").css('border','1px solid red')
        }
        var backMoneyTime=$("#backMoneyTime").attr('data-id');
        if(backMoneyTime==""){
            $("#backMoneyTime").css('border','1px solid red')
        }
        var backMoneyNum=$(".backMoneyNum").attr('data-id');
        if(backMoneyNum==""){
            $(".backMoneyNum").css('border','1px solid red')
        }
        var backMoneyName=$(".backMoneyName").attr('data-id');
        var backBank=$(".backBank").attr('data-id');
        var settle=$(".settle").attr('data-id');
        var remarks1=$(".remarks1").attr('data-id');
        var remarks2=$(".remarks2").attr('data-id');
        var remarks3=$(".remarks3").attr('data-id');
        var remarks4=$(".remarks4").attr('data-id');
        var remarks5=$(".remarks5").attr('data-id');
        if(app.customTitle>=1){
            if(app.com_ct_list[0].fieldValue==1){
                if(remarks1==""){
                    $(".remarks1").css('border','1px solid red')
                }
            }
        }
        if(app.customTitle>=2){
            if(app.com_ct_list[1].fieldValue==1){
                if(remarks2==""){
                    $(".remarks2").css('border','1px solid red')
                }
            }
        }
        if(app.customTitle>=3){
            if(app.com_ct_list[2].fieldValue==1){
                if(remarks3==""){
                    $(".remarks3").css('border','1px solid red')
                }
            }
        }
        if(app.customTitle>=4){
            if(app.com_ct_list[3].fieldValue==1){
                if(remarks4==""){
                    $(".remarks4").css('border','1px solid red')
                }
            }
        }
        if(app.customTitle>=5){
            if(app.com_ct_list[4].fieldValue==1){
                if(remarks5==""){
                    $(".remarks5").css('border','1px solid red')
                }
            }
        }
        var com_photo=$('.verifyImgList').attr('data-id');
        if(app.com_photo==1){
            if(com_photo==""){
                $('.verifyImg').css('border','1px solid red')
            }
        }
        var com_redio=$(".verifyVideoList").attr('data-id');
        if(app.com_redio==1){
            if(com_redio==""){
                $('.verifyVideo').css('border','1px solid red')
            }
        }
        var customKey='';
        var numindex=0
        $(".customKey").each(function(index,ele){
            customKey+=$(this).text()+','
            numindex++;
        })
        console.log(customKey);
        if(remarks1==undefined || remarks1=="" || remarks1==null){
            remarks1=""
        }
        if(remarks2==undefined || remarks2=="" || remarks2==null){
            remarks2=""
        }
        if(remarks3==undefined || remarks3=="" || remarks3==null){
            remarks3=""
        }
        if(remarks4==undefined || remarks4=="" || remarks4==null){
            remarks4=""
        }
        if(remarks5==undefined || remarks5=="" || remarks5==null){
            remarks5=""
        }
        if(app.customTitle==0){
            if(app.com_photo==1){
                if(app.com_redio==1){
                    if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo=="" || com_redio==""){
//                         layer.msg('1发起对账的必填项不能为空，请重新填写');
                        verifySubmitflag=0;
                        return
                    }else{
                        //提交函数
                        verifySubmitflag=1
                    }
                }else{
                    if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo==""){
//                         layer.msg('2发起对账的必填项不能为空，请重新填写');
                        verifySubmitflag=0;
                        return
                    }else{
                        //提交函数
                        verifySubmitflag=1
                    }
                }
            }else{
                if(app.com_redio==1){
                    if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
//                         layer.msg('3发起对账的必填项不能为空，请重新填写');
                        verifySubmitflag=0;
                        return
                    }else{
                        //提交函数
                        verifySubmitflag=1
                    }
                }else{
                    if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
//                         layer.msg('4发起对账的必填项不能为空，请重新填写');
                        verifySubmitflag=0;
                        return
                    }else{
                        //提交函数
                        verifySubmitflag=1
                    }
                }
            }
        }
        if(app.customTitle>=1){
            /*备注1*/
            if(app.com_ct_list[0].fieldValue==1){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks1=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0;
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks1=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0;
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks1=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0;
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks1==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0;
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }else if(app.com_ct_list[0].fieldValue==2){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.customTitle>=2){
            /*备注2*/
            if(app.com_ct_list[1].fieldValue==1){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks2=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks2=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks2=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks2==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }else if(app.com_ct_list[1].fieldValue==2){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""|| com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""|| com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.customTitle>=3){
            /*备注3*/
            if(app.com_ct_list[2].fieldValue==1){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks3=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks3=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks3=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks3==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }else if(app.com_ct_list[2].fieldValue==2){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.customTitle>=4){
            /*备注4*/
            if(app.com_ct_list[3].fieldValue==1){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks4=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks4=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks4=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks4==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }else if(app.com_ct_list[3].fieldValue==2){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.customTitle==5){
            /*备注5*/
            if(app.com_ct_list[4].fieldValue==1){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks5=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks5=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks5=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || remarks5==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }else if(app.com_ct_list[4].fieldValue==2){
                if(app.com_photo==1){
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_photo==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(backType=="" || backMoneyTime=="" || backMoneyNum=="" || com_redio==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }else{
                        if(backType=="" || backMoneyTime=="" || backMoneyNum==""){
                            // layer.msg('发起对账的必填项不能为空，请重新填写');
                            verifySubmitflag=0
                            return
                        }else{
                            //提交函数
                            verifySubmitflag=1
                        }
                    }
                }
            }
        }
        if(customKey==''){
            remarks1==""
            remarks2==""
            remarks3==""
            remarks4==""
            remarks5==""
        }else{
            if(app.customTitle>=1 && remarks1==""){
                remarks1="- -"
            }
            if(app.customTitle>=2 && remarks2==""){
                remarks2="- -"
            }
            if(app.customTitle>=3 && remarks3==""){
                remarks3="- -"
            }
            if(app.customTitle>=4 && remarks4==""){
                remarks4="- -"
            }
            if(app.customTitle==5 && remarks5==""){
                remarks5="- -"
            }
        }

        var customValue1=encodeURI(changeCode1(remarks1))+','+encodeURI(changeCode1(remarks2))+','+encodeURI(changeCode1(remarks3))+','+encodeURI(changeCode1(remarks4))+','+encodeURI(changeCode1(remarks5))
        if(com_photo==""){
            com_photo=',,'
        }
        if(com_redio==''){
            com_redio=',,'
        }
        obj2List={
            dDebtorInfoId:_id,
            bMStatus:backType,
            recordtime:dateFmtTime(backMoneyTime),
            applyMoney:backMoneyNum,
            bMPerson:encodeURI(backMoneyName),
            bANum:encodeURI(backBank),
            backType:settle,
//            customValue:remarks1+','+remarks2+','+remarks3+','+remarks4+','+remarks5,
            customValue:customValue1,
            customKey:customKey,
            filename:com_photo,
            radioFilePath:com_redio,

        };
    }
    /*校验减免*/
    function checkReduction(id,type){
        $.ajax({
            url : '<%=basePath%>manage/MapplyReduction/checkReduction.do?debtorId='+id+'&isFirst='+type,
            async : true,
            success : function(data) {
                reductionType=true;
                console.log(data)
                if(data.red_ct_list=="" || data.red_ct_list == null || data.red_ct_list==undefined){
                    app.reductionReasons=0;
                }else{
                    app.reductionReasons=data.red_ct_list.length;
                    app.red_ct_list=data.red_ct_list;
//                    alert(app.reductionReasons)
                }
                app.ableReduction=data.ableReduction;
                app.red_photo=data.red_photo;
                app.red_redio=data.red_redio;
                app.maxAppAoumt_on_off=data.maxAppAoumt_on_off
                app.maxAppAoumt =data.maxAppAoumt
                app.applyBeforeMoney=data.applyBeforeMoney;
                app.hasAlsoMoney=data.hasAlsoMoney;
            },
            error : function() {
            }
        });
    }
    /*减免非空验证*/
    function reduction(){
        if(app.maxAppAoumt_on_off=="on"){
            var reductionMa=$('.reductionMa').attr('data-id');
            var reductionMb=app.applyBeforeMoney;
            var maxAppAoumt=app.maxAppAoumt;
            if(reductionMa==""){
                $(".reductionMa").css('border','1px solid red');
            }
        }else{
            var maxAppAoumt=''
            var reductionMb=$('.reductionMb').attr('data-id');
            if(reductionMb==""){
                $(".reductionMb").css('border','1px solid red')
            }
            var reductionMa=$('.reductionMa').attr('data-id');
            if(reductionMa==""){
                $(".reductionMa").css('border','1px solid red');
            }
        }
        var reductionReasons=$(".reductionReasons").attr('data-id');
        if(reductionReasons==""){
            $(".reductionReasons").css('border','1px solid red');
        }
        var red_photo=$('.reductionImgList').attr('data-id');
        if(app.red_photo==1){
            if(red_photo==""){
                $('.reductionImg').css('border','1px solid red')
            }
        }
        var red_redio=$(".reductionVideoList").attr('data-id');
        if(app.red_redio==1){
            if(red_redio==""){
                $('.reductionVideo').css('border','1px solid red')
            }
        }
        var remark1=$(".remark1").attr('data-id');
        var remark2=$(".remark2").attr('data-id');
        var remark3=$(".remark3").attr('data-id');
        var remark4=$(".remark4").attr('data-id');
        var remark5=$(".remark5").attr('data-id');
        if(app.reductionReasons>=1){
            if(app.red_ct_list[0].fieldValue==1){
                if(remark1==""){
                    $(".remark1").css('border','1px solid red')
                }
            }
        }
        if(app.reductionReasons>=2){
            if(app.red_ct_list[1].fieldValue==1){
                if(remark2==""){
                    $(".remark2").css('border','1px solid red')
                }
            }
        }
        if(app.reductionReasons>=3){
            if(app.red_ct_list[2].fieldValue==1){
                if(remark3==""){
                    $(".remark3").css('border','1px solid red')
                }
            }
        }
        if(app.reductionReasons>=4){
            if(app.red_ct_list[3].fieldValue==1){
                if(remark4==""){
                    $(".remark4").css('border','1px solid red')
                }
            }
        }
        if(app.reductionReasons==5){
            if(app.red_ct_list[4].fieldValue==1){
                if(remark5==""){
                    $(".remark5").css('border','1px solid red')
                }
            }
        }
        var customlist=''
        $(".customlist").each(function(index,ele){
            customlist+=$(this).text()+','
        });
        if(remark1==undefined || remark1=="" || remark1==null){
            remark1=""
        }
        if(remark2==undefined  || remark2=="" || remark2==null){
            remark2=""
        }
        if(remark3==undefined  || remark3=="" || remark3==null){
            remark3=""
        }
        if(remark4==undefined  || remark4=="" || remark4==null){
            remark4=""
        }
        if(remark5==undefined  || remark5=="" || remark5==null){
            remark5=""
        }
        if(app.reductionReasons==0){
            if(app.red_photo==1){
                if(app.red_redio==1){
                    if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
//                         layer.msg('1发起减免的必填项不能为空，请重新填写');
                        reductionSubmitflag=0;
                        return
                    }else{
                        //提交函数
                        reductionSubmitflag=1
                    }
                }else{
                    if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
//                         layer.msg('2发起减免的必填项不能为空，请重新填写');
                        reductionSubmitflag=0;
                        return
                    }else{
                        //提交函数
                        reductionSubmitflag=1
                    }
                }
            }else{
                if(app.red_redio==1){
                    if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
//                         layer.msg('3发起减免的必填项不能为空，请重新填写');
                        reductionSubmitflag=0;
                        return
                    }else{
                        //提交函数
                        reductionSubmitflag=1
                    }
                }else{
                    if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
//                         layer.msg('4发起减免的必填项不能为空，请重新填写');
                        reductionSubmitflag=0;
                        return
                    }else{
                        //提交函数
                        reductionSubmitflag=1
                    }
                }
            }
        }
        if(app.reductionReasons>=1){
            /*备注1*/
            if(app.red_ct_list[0].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark1=="" || red_photo=="" || red_redio==""){
//                             layer.msg('1发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark1=="" || red_photo==""){
//                             layer.msg('2发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark1=="" || red_redio==""){
//                             layer.msg('3发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark1==""){
//                             layer.msg('4发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }

            }else if(app.red_ct_list[0].fieldValue==2){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
//                             layer.msg('5发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
//                             layer.msg('6发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
//                             layer.msg('7发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
//                             layer.msg('8发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.reductionReasons>=2){
            /*备注2*/
            if(app.red_ct_list[1].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark2=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark2=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark2=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark2==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }else if(app.red_ct_list[1].fieldValue==2){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.reductionReasons>=3){
            /*备注3*/
            if(app.red_ct_list[2].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark3=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark3=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark3=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark3==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }else if(app.red_ct_list[2].fieldValue==2){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.reductionReasons>=4){
            /*备注4*/
            if(app.red_ct_list[3].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark4=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark4=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.com_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark4=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark4==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }else if(app.red_ct_list[3].fieldValue==2){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }
        }
        if(app.reductionReasons>=5){
            /*备注5*/
            if(app.red_ct_list[4].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark5=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark5=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark5=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || remark5==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0;
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }else if(app.red_ct_list[4].fieldValue==1){
                if(app.red_photo==1){
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_photo==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }else{
                    if(app.red_redio==1){
                        if(reductionMb=="" || reductionMa=="" || reductionReasons=="" || red_redio==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }else{
                        if(reductionMb=="" || reductionMa=="" || reductionReasons==""){
                            // layer.msg('发起减免的必填项不能为空，请重新填写');
                            reductionSubmitflag=0
                            return
                        }else{
                            //提交函数
                            reductionSubmitflag=1
                        }
                    }
                }
            }
        }
//        if(reductionSubmitflag==1){
//            reductionSubmit(obj3List)
//        }
        if(customlist==''){
            remark1=''
            remark2=''
            remark3=''
            remark4=''
            remark5=''
        }else{
            if(app.reductionReasons>=1 && remark1==""){
                remark1="- -"
            }
            if(app.reductionReasons>=2 && remark2==""){
                remark2="- -"
            }
            if(app.reductionReasons>=3 && remark3==""){
                remark3="- -"
            }
            if(app.reductionReasons>=4 && remark4==""){
                remark4="- -"
            }
            if(app.reductionReasons==5 && remark5==""){
                remark5="- -"
            }
        }
        if(red_photo==""){
            red_photo=',,'
        }
        if(red_redio==""){
            red_redio=',,'
        }
        obj3List={
            detorId:_id,
            before_money:reductionMb,
            remark1:maxAppAoumt,
            later_money:reductionMa,
            reasonRejection:encodeURI(changCode(reductionReasons)),
            customKey:customlist,
            customValue:encodeURI(changeCode1(remark1))+','+encodeURI(changeCode1(remark2))+','+encodeURI(changeCode1(remark3))+','+encodeURI(changeCode1(remark4))+','+encodeURI(changeCode1(remark5)),
            fileName:red_photo,
            radioFilePath:red_redio,

        }
    }
function changCode(value){
    return value.replace(/</g,'《').replace(/>/g,'》').replace(/"|'/g,'“').replace(/"|'/g,'”')
}
    function changeCode1(value){
        return value.replace(/,/g,"，").replace(/</g,'《').replace(/>/g,'》').replace(/"|'/g,'“').replace(/"|'/g,'”')
    }
    function newAddSubmit(_obj1){
        $.ajax({
            url : '<%=basePath%>manage/collection/collectionRecord/save.do',
            type:'POST',
            async : true,
            data:_obj1,
            success : function(data) {
                newAddNum=1;
                openText1='';
                if(data.success=='true'){
                    $('.addInput').each(function(index,ele){
                        $(this).attr('data-id','');
                        $(this).val('');
                    })
                    app.noEmpty=0
                    app.isCollected=false;
//                    obj1List={}
                    $(".telState").val("请选择");
                    $(".solveMode").val("请选择");
                    $("#caseStatus").val("请选择")
                    $("#guanxi").val("")
                    app.repayment=false;
                    $(".newAdd .selList li").each(function(index,ele){
                        if($(this).index()==0){
                            $(this).addClass('selected');
                        }else{
                            $(this).removeClass('selected');
                        }
                    })
                    if(_obj1.result==1){
                        app.lastResult='承诺还款'
                    }else if(_obj1.result==3){
                        app.lastResult='待对账';
                    }else if(_obj1.result==4){
                        app.lastResult='谈判中';
                    }else if(_obj1.result==8){
                        app.lastResult='恶意拖欠';
                    }else if(_obj1.result==9){
                        app.lastResult='失联';
                    }else if(_obj1.result==10){
                        app.lastResult='多次跳票';
                    }else if(_obj1.result==12){
                        app.lastResult='投诉倾向';
                    }else if(_obj1.result==13){
                        app.lastResult='否认身份';
                    }
                    console.log('新增催记成功')
                    var relationship=$("#relationship").val();
                    queryHistoryRecord('${dDebtorInfo.id}',relationship);
                    if(data.message>${collectedNum}){
                        $(".collectionNum").text(parseInt(${collectedNum})+1)
                        $('.collectionNum').addClass('animated heartBeat');
                        $('.collectionNum').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
                            $('.collectionNum').removeClass('animated heartBeat')
                        })
                    }
                    openText1+="「<span style='/*color:#4DA1FE*/'>新增催记</span>」成功！";
                    collectReadRecordNew(_id)
                    collectReadContactNew(_id)
                }else{
                    openText1+="「<span style='/*color:#4DA1FE*/'>新增催记</span>」失败！";
                }
                alertMsg()
            },
            error : function(data) {
                openText1+="「<span style='/*color:#4DA1FE*/'>新增催记</span>」失败！";
            }
        });
    }
    function verifySubmit(_obj){
        $.ajax({
            url : '<%=basePath%>manage/commit/save.do',
            type:'POST',
            async : true,
            data:_obj,
            success : function(data) {
                openText2='';
                verifyNum=1;
                if(data.success == "true"){
//                        layer.msg("发起对账"+data.message)
                    openText2+="「<span style='/*color:#4DA1FE*/'>发起对账</span>」"+data.message+"！"
                    $('.verifyInput').each(function(index,ele){
                        $(this).attr('data-id','');
                        $(this).val('');
                    })
                    $(".verifyImgListName").attr('data-id','');
                    $(".verifyVideoListName").attr('data-id','');
                    $("#backType").val("请选择")
                    $(".settle").val("请选择")
                    $(".imgBox1").html('')
                    $(".videoBox1").html('')
                    app.backType=false;
                    $(".verify .selList li").each(function(index,ele){
                        if($(this).index()==0){
                            $(this).addClass('selected');
                        }else{
                            $(this).removeClass('selected');
                        }
                    })
                    objList=[]
                    objList1=[]
                    app.noEmpty1=0
//                        obj2List={}
                    collectReadCommitNew('${dDebtorInfo.id}');
                }else{
//                        layer.msg(data.message)
                    if(data.message=='债务人所属标的正在撤标，无法发起对账或减免'){
                        openText2+="「<span style='/*color:#4DA1FE*/'>发起对账</span>」失败,"+data.message+"！";
                    }else if(data.message=='发起对账失败'){
                        openText2+="「<span style='/*color:#4DA1FE*/'>发起对账</span>」失败！";
                    }else{
                        openText2+="「<span style='/*color:#4DA1FE*/'>发起对账</span>」失败！";
                    }
//                        obj2List={}
                }
                alertMsg()
            },
            error : function() {
                openText2+="「<span style='/*color:#4DA1FE*/'>发起对账</span>」失败！";
            }
        });
    }
    function reductionSubmit(_obj){
        console.log(_obj);
        $.ajax({
            url : '<%=basePath%>manage/MapplyReduction/save.do',
            type:'POST',
            async : true,
            data:_obj,
            success : function(data) {
                reductionNum=1;
                openText3=''
                if(data.success=="true"){
                    $('.reductionInput').each(function(index,ele){
                        $(this).attr('data-id','');
                        $(this).val('');
                    })
                    $(".reductionVideoListName").attr('data-id','')
                    $(".reductionImgListName").attr('data-id','')
                    $(".imgBox2").html('')
                    $(".videoBox2").html('')
                    objList2=[]
                    objList3=[];
//                        obj3List={}
                    app.noEmpty2=0;
                    checkReduction(_id,reductionType)
//                    layer.msg("发起减免"+data.message)
                    openText3+="「<span style='/*color:#4DA1FE*/'>发起减免</span>」"+data.message+"!"
                    collectReadApplyNew(_id)
                }else{
//                    obj3List={}
                    if(data.type=="false"){
                        openText3+='「<span style="/*color:#4DA1FE*/">发起减免</span>」！失败此债务人有未审批完的减免信息，暂时无法再次发起'
                    }else{
                        if(data.message=='债务人所属标的正在撤标，无法发起对账或减免'){
                            openText3+="「<span style='/*color:#4DA1FE*/'>发起减免</span>」失败,"+data.message+"！";
                        }else if(data.message=='发起减免失败'){
                            openText3+="「<span style='/*color:#4DA1FE*/'>发起减免</span>」失败！";
                        }else{
                            openText3+="「<span style='/*color:#4DA1FE*/'>发起减免</span>」失败！";
                        }
                    }
                }
                alertMsg()
            },
            error : function() {
                openText3+="「<span style='/*color:#4DA1FE*/'>发起减免</span>」失败！";
            }
        });
    }
    function alertText(){
        console.log("flagText---",flagText)
        if(newAddflag==0){
            flagText+='「新增催记」';
        }
        if(verifySubmitflag==0){
            flagText+='「发起对账」'
        }
        if(reductionSubmitflag==0){
            flagText+='「发起减免」'
        }
        if(cuhuaFlag==0){
            return
        }else{
            if(newAddflag==0 || reductionSubmitflag==0 || verifySubmitflag==0){
                layer.msg(flagText+'的必填项不能为空，请重新填写')
            }
        }
    }
    /*数字格式化*/
    function toNum(value){
        if(value=='' || value==null ||value==undefined){
            return '0.00';
        }else{
            return (parseFloat(value).toFixed(2)).replace(/(?!^)(?=(\d{3})+($|\.))/g,",");
        }
    }
    function alertMsg(){
        console.log('qqqqqqqqqqqqqqqq--------')
        if(obj1List.hasOwnProperty('contectName')==true && obj2List.hasOwnProperty('bMStatus')==true && obj3List.hasOwnProperty('before_money')==true){
            if(newAddNum==1 && verifyNum==1 && reductionNum==1){
                console.log('111111111111111111111111111')
                _czc.push(["_trackEvent","同时提交的催记、发起减免和发起对账的次数","同时提交的催记、发起减免和发起对账",'${login_user.companyName}'+"/"+'${login_user.name}']);
                openMsg();
            }
        }else if(obj1List.hasOwnProperty('contectName')==true && obj2List.hasOwnProperty('bMStatus')==true && obj3List.hasOwnProperty('before_money')==false){
            if(newAddNum==1 && verifyNum==1 && reductionNum==0){
                console.log('22222222222222222222222222222')
                _czc.push(["_trackEvent","同时提交的催记、发起对账的次数","同时提交的催记、发起对账",'${login_user.companyName}'+"/"+'${login_user.name}']);
                openMsg();
            }
        }else if(obj1List.hasOwnProperty('contectName')==true && obj2List.hasOwnProperty('bMStatus')==false && obj3List.hasOwnProperty('before_money')==true){
            if(newAddNum==1 && verifyNum==0 && reductionNum==1){
                console.log('3333333333333333333333333333333')
                _czc.push(["_trackEvent","同时提交的催记、发起减免的次数","同时提交的催记、发起减免",'${login_user.companyName}'+"/"+'${login_user.name}']);
                openMsg();
            }
        }else if(obj1List.hasOwnProperty('contectName')==false && obj2List.hasOwnProperty('bMStatus')==true && obj3List.hasOwnProperty('before_money')==true){
            if(newAddNum==0 && verifyNum==1 && reductionNum==1){
                console.log('44444444444444444444444444444444')
                openMsg();
            }
        }else if(obj1List.hasOwnProperty('contectName')==false && obj2List.hasOwnProperty('bMStatus')==false && obj3List.hasOwnProperty('before_money')==true){
            if(newAddNum==0 && verifyNum==0 && reductionNum==1){
                console.log('555555555555555555555555555555555')
//                openMsg();
                layer.close(loadIng)
                layer.msg(openText3)
                    openText3="";
                    obj3List={};
                    reductionNum=0;
            }
        }else if(obj1List.hasOwnProperty('contectName')==false && obj2List.hasOwnProperty('bMStatus')==true && obj3List.hasOwnProperty('before_money')==false){
            if(newAddNum==0 && verifyNum==1 && reductionNum==0){
                console.log('6666666666666666666666666666666')
//                openMsg();
                layer.close(loadIng)
                layer.msg(openText2)
                    openText2="";
                    obj2List={};
                    verifyNum=0;
            }
        }else if(obj1List.hasOwnProperty('contectName')==true && obj2List.hasOwnProperty('bMStatus')==false && obj3List.hasOwnProperty('before_money')==false){
            if(newAddNum==1 && verifyNum==0 && reductionNum==0){
                console.log('7777777777777777777777777777777777')
//                openMsg();
                layer.close(loadIng)
                layer.msg(openText1)
                    openText1="";
                    obj1List={};
                    newAddNum=0;
            }
        }
    }
    function openMsg(){
        layer.close(loadIng)
        layer.open({
            id: 'layerDemo' //防止重复弹出
            ,type: 1
            ,title:'提示'
            ,content:'<div style="padding:15px 10px;font-size:18px;color:#252631;">'+openText1+openText2+openText3+'</div>'
            ,area:["450px","196px"]
            ,btn:['知道了']
            ,yes:function(index){
                openText1="";
                openText2="";
                openText3="";
                obj1List={}
                obj2List={}
                obj3List={}
                newAddNum=0;
                verifyNum=0;
                reductionNum=0;
                layer.close(index);
            }
            ,cancel : function(index) {
                openText1="";
                openText2="";
                obj1List={}
                obj2List={}
                obj3List={}
                newAddNum=0;
                verifyNum=0;
                reductionNum=0;
                layer.close(index);
            }
        })
    }
    //让左侧导航栏收起来
    closeLeft();
    function closeLeft(){
        top.workframeset.cols = "50,*";
        $(parent.frames["leftFrame"].document).find("#title").attr('title','展开');
        $(parent.frames["leftFrame"].document).find("#openList").show();
        $(parent.frames["leftFrame"].document).find("#closeList").hide();
        $(parent.frames["leftFrame"].document).find("#tablePar").css('overflowY','hidden');
        $(parent.frames["leftFrame"].document).find("#treeTable").css({left:'-247px'});
        $(parent.frames["leftFrame"].document).find(".director").css({left:'-150px'});
        $(parent.frames["leftFrame"].document).find(".director").css({'width':'200px','borderRight':'1px solid #dadada'});
        $(parent.frames["leftFrame"].document).find("#iconList").show(20);
    }
    // 今日新增 确认到账
    function gotoCommit(){
        _czc.push(["_trackEvent","轮播栏","确认到账",'${login_user.companyName}'+"/"+'${login_user.name}']);
        window.location.href = "<%=basePath%>manage/CS/commit/myCommitRecord.do?messageType=1";
    }

    // 今日新增 确认减免
    function gotoJianmian(){
        _czc.push(["_trackEvent","轮播栏","确认减免",'${login_user.companyName}'+"/"+'${login_user.name}']);
        window.location.href = "<%=basePath%>manage/MapplyReduction/csMyQuery.do?messageType=1";
    }

    // 今日新增 债务人
    function gotoNewDebtor(){
        _czc.push(["_trackEvent","轮播栏","债务人",'${login_user.companyName}'+"/"+'${login_user.name}']);
        window.location.href = "<%=basePath%>manage/mydebtor/query.do?messageType=1";
    }
    function dateFmtTime(value){
        if(null!=value&&""!=value){
            var date = new Date(value);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            if(m<10){
                m="0"+m;
            }
            var d = date.getDate();
            if(d<10){
                d="0"+d;
            }
            return y + '-' +m + '-' + d;
        }else{
            return "";
        }
    }
</script>
</html>
<script>
    $(document).ajaxStop(function(){
        layer.close(loadIngOpen)
    })
</script>