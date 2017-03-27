<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="wap-font-scale" content="no"/>
        <meta id="viewport" name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0,target-densitydpi=medium"/>
        <title>公司名称</title>
        <link type="text/css" rel="stylesheet" href="css/base.css"/>
        <script type="text/javascript" src="js/cookies.js"></script>
        <script src="js/jquery-1.7.1.min.js" language="JavaScript"></script>
        <script src="js/uploadPreview.js" type="text/javascript"></script>
        <link type="text/css" rel="stylesheet" href="css/web_frame.css"/>
        <link type="text/css" rel="stylesheet" href="css/change_module.css"/>
        <link type="text/css" rel="stylesheet" href="css/index.css"/>
        <link rel="stylesheet" href="css/wap_cfcy3.css"/>
        <style type="text/css">
        #goods{
            display: none;
            width: 100%;
            z-index:99;
            text-align:center;
            top: 200px;
        }
        .goods input{  width:1.5rem; height:1.5rem; font-size:1rem; border:1px solid #e5e5e5; text-align:center; color:#A1A09C; background-color:#fff;}
        .goods input.result{ border:none; color:#FF5151;}
        </style>
        <script>
//                window.onload = function(){
//            alert("dd");
//         //  
//        };
        function buy_goods(id,business,name,price,num,address){
                var post="customer=${username}"+"&id="+id+"&business="+business+"&name="+name+"&price="+price+"&num="+num+"&address="+address;
                var xmlhttp;
                if (window.XMLHttpRequest){
                    xmlhttp=new XMLHttpRequest();
                }
                else{
                    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlhttp.onreadystatechange=function(){
                    if (xmlhttp.readyState==4 && xmlhttp.status==200){
                        $("#page_order").load("order.jsp");
                        $("#page_message").load("message.jsp");
                        $("#goods").hide();
                        $("#goods").siblings().show();
                        alert("购买成功");
                    }
                }
                xmlhttp.open("POST","BuyServlet",true);
                xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                xmlhttp.send(post);
        };
        </script>
        <script>
        
        $(document).ready(function(){
            $("#page_goods").siblings().hide();
          $(".inner").click(function(){
            gds_name=$(this).find('em[class*=textfont]');
            price=$(this).find('em[class*=newPrice]');
            gds_id=$(this).find('em[class*=goods_id]');
            gds_business=$(this).find('em[class*=goods_business]');
            gds_comment=$(this).find('em[class*=goods_comment]');
            $("#goods_name").html(gds_name.html());
            $("#goods_price").html(price.html());
            $("#goods_comment").html("");
            var co = gds_comment.html();
            if(co!=""){
                var myobj=eval(co);
                for(var i=0;i<myobj.length;i++){
                    $("#goods_comment").html($("#goods_comment").html()+"<ul class='say_box'>"+myobj[i].comment+"<span class='dateview'>"+myobj[i].customer+"</span></ul>");
                }
            }
            //$("#goods").css("background-image","url(images/user/yhd.png)");
            $("#goods").css("background-image","url(images/goods/"+gds_id.html()+".png)");
            $("#goods").siblings().hide();
            $("#goods").show();

          });
          
          $(".add").click(function(){
                buy_goods_num=$(this).parent().find('input[class*=result]'); 
                var sum=$(this).parent().find('input[class*=sum]'); 
                buy_goods_num.val(parseInt(buy_goods_num.val())+1);
                sum.val(parseInt(buy_goods_num.val())*parseInt(price.html()));
            });
             
            $(".minus").click(function(){ 
                buy_goods_num=$(this).parent().find('input[class*=result]'); 
                var sum=$(this).parent().find('input[class*=sum]'); 
                buy_goods_num.val(parseInt(buy_goods_num.val())-1);
                if(parseInt(buy_goods_num.val())<0){ 
                    buy_goods_num.val(0);
                } 
                sum.val(parseInt(buy_goods_num.val())*parseInt(price.html()));

            });
            $(".gds_buy").click(function(){
                alert($(this).parent().find('input[class*=address]').val());
                buy_goods(gds_id.html(),gds_business.html(),gds_name.html(),price.html(),buy_goods_num.val(),$(this).parent().find('input[class*=address]').val());
                $("#goods").hide();

            });
             $("#toolHome").click(function(){
                $("#page_goods").show();
                $("#page_goods").siblings().hide();

            });
             $("#toolShoppingCar").click(function(){
                $("#page_order").show();
                $("#page_order").siblings().hide();

            });
             $("#toolMember").click(function(){
                $("#page_user").show();
                $("#page_user").siblings().hide();

            });
             $("#toolUp").click(function(){
                $("#page_up").show();
                $("#page_up").siblings().hide();

            });
             $("#toolMessage").click(function(){
                $("#page_message").show();
                $("#page_message").siblings().hide();

            });
            $(".gds_cancel").click(function(){
                $("#goods").hide();
                $("#goods").siblings().show();

            });
        });
        </script>
        
    </head>

    <body id="webBody" data-curbg="wbg_0" data-ver="0">
        <div id="goods" class="goods">
            <div style="margin-top: 120px;">
                    <p id="goods_name"></p>
                    <p id="goods_price"></p>
                    <div id="goods_comment"></div>
                    <br/>
                    <input type="button" class="minus"  value="-">
                    <input type="text" class="result" value="0">
                    <input type="button" class="add" value="+">
                    <input type="text" style=" width:4rem;" class="sum" value="0">
                    <br>
                    <input type="text" style=" width:20rem;" class="address"  placeholder="送货地址">
                    <input type="button" class="gds_buy" style="width: 4rem;" value="购买">
                    <input type="button" class="gds_cancel" style="width: 4rem;" value="取消">
            </div>
        </div>
        <div class="wrapper" id="wrapper" data-curbg="wbg_0" style="min-height: 979px;">

            <div class="header" id="header" visible="show" data-remove="true">
                <div class="headerBg"></div>
                <div class="headerCon">
                    <div class="logo" id="logo">
                        <a id="logo_link" href="wap_cfcy3.html?showWelcome=1">
                            <div style="text-align:center;">
                                <span style="line-height:2.5;font-size:24px;color:#FFFFFF;"><strong>${username}${msg}</strong></span> 
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <div id="content">
                <div id="page_goods">
                    <jsp:include page="goods.jsp" flush="true"/>
                </div>
                <div id="page_order">
                     <jsp:include page="order.jsp" flush="true"/>
                </div>
                <div id="page_up">
                     <jsp:include page="up.jsp" flush="true"/>
                </div>
                <div id="page_user">
                     <jsp:include page="user.jsp" flush="true"/>
                </div>
                <div id="page_message">
                     <jsp:include page="message.jsp" flush="true"/>
                </div>
            </div>
           
            
            
            <div class="toolMenuBg" id="tool_menu_bg"></div>
            <div class="toolMenu" id="tool_menu">
                <menu class="toolBut q">
                    <li id="toolHome" sorts="13" style=" width:20%;">
                            <b class="icon" id="icon_1270961">
                                <img src="images/wap/toolHome_icon.png">
                            </b>
                            <strong>首页</strong>
                    </li>
<!--                    <li id="toolTel" sorts="12" style=" width:20%;">
                        <a href="tel_3A">
                            <b class="icon" id="icon_1270958">
                                <img src="images/wap/toolTel_icon.png">
                            </b>
                            <strong>电话</strong>
                        </a>
                    </li>-->
                    <li id="toolMessage" sorts="11" style=" width:20%;">
                            <b class="icon" id="icon_1270959">
                                <img src="images/wap/toolMessage_icon.png">
                            </b>
                            <strong>信息</strong>
                    </li>
<!--                    <li id="toolQQ" sorts="10" style="display: none; width:20%;">
                        <a href="../wpa.qq.com/msgrd?v=3&amp;uin=&amp;site=qq&amp;menu=yes">
                            <b class="icon" id="icon_1270965">
                                <img src="images/wap/toolQQ_icon.png">
                            </b>
                            <strong>QQ</strong>
                        </a>
                    </li>-->
                    <li id="toolUp" sorts="9" style=" width:20%;">
                            <b class="icon" id="icon_1270963">
                                <img src="images/wap/toolUp.png">
                            </b>
                            <strong>上架</strong>
                    </li>
<!--                    <li id="toolMap" sorts="8" style=" width:20%;">
                        <a href="wap/map.php?username=cfcy3">
                            <b class="icon" id="icon_1270960">
                                <img src="images/wap/toolMap_icon.png">
                            </b>
                            <strong>位置</strong>
                        </a>
                    </li>-->
                    <li id="toolShoppingCar" sorts="7" style=" width:20%;">
                            <b class="icon" id="icon_1270964">
                                <img src="images/wap/toolShoppingCar_icon.png">
                            </b>
                            <strong>订单</strong>
                    </li>
                    <li id="toolMember" sorts="6" style=" width:20%;">
                            <b class="icon" id="icon_1270962">
                                <img src="images/wap/toolMember_icon.png">
                            </b>
                            <strong>会员</strong>
                    </li>
                </menu>
            </div>
        </div>
    </body>
    <script type="text/javascript">

        
    </script>
   
</html>
   

