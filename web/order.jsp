<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="net.sf.json.*" %>
<%@ page import="com.other.User" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/b2c"
     user="root"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from buy where customer='${username}';
</sql:query>
<%
//    List<User> users = new ArrayList<User>(); // JavaBean的List
//    users.add(new User("黄彪", "xxxxxx"));
//    users.add(new User("昊天", "xxxxxx"));
//    users.add(new User("姐姐", "yyyyyy"));
//    users.add(new User("丫头", "zzzzzz"));
//
//    session.setAttribute("users", users); // 添加到session

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            
            .dateview {position:absolute;left:535px;top:15px;width:64px;line-height:35px;background:#8B4512;border-radius:0 30px;text-align:center;
            color:#fff;font-weight:bold;font-size:14px; }
            .say_box {background:#f8f8f8;width:490px; border-radius:5px;position:relative; padding: 20px 0;
            margin:10px 0;font-size:14px;font-family:"宋体"; }
            .say_box::before {content: "";width:0px;height:0px;border-style:solid;border-width:0px 0 20px 22px;border-color:transparent transparent transparent #fff;position:absolute;left:490px;top: 23px; }/* 三角形 */
            .say_box::after {content: "";width: 10px;height: 10px;border-radius: 50%;position:absolute;left:513px;top:16px;background:#CCCCCE;border: 2px solid #fff;transition:all 0.5s; }/* 圆形 */
            .say_box:hover::before {border-color:transparent transparent transparent #CECCCD }/* 三角形 */
            .say_box:hover::after {border:#fff 2px solid;background:#999; }/* 圆形 */
            .say_box:hover {background: #f4f2f2;color:#333; text-shadow: #f7f7f7 1px 1px 1px }
            p {  width:15rem; height:1.5rem; font-size:1rem; margin: 20px 20px 20px 20px;border:1px solid #e5e5e5; text-align:center; color:#A1A09C; background-color:#fff;}
        </style>
         <script>
            function order_delivery(id,status){
                var post="id="+id+"&status="+status;
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
                        alert("收货完成");
                    }
                }
                xmlhttp.open("POST","StatusServlet",true);
                xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                xmlhttp.send(post);
        };
        $(document).ready(function(){
            $(".order_status").click(function(){
                order_delivery($(this).parent().find('p[class*=order_id]').html(),"已收货");
            });
            $(".each_comment").hide();
            $(".btn_comment").click(function(){
                if(!$(this).parent().parent().parent().find('.each_comment').is(":visible")){
                    $(this).parent().parent().siblings().show();
                    $(this).parent().parent().parent().siblings().hide();
                }else{
                    $(this).parent().parent().siblings().hide();
                    $(this).parent().parent().parent().siblings().show();
                }
            });
            $(".inbtn_comment").click(function(){
                order_comment($(this).parent().find('.inner_id').html(),$(this).parent().find('.inner_comment').val());
            });
        });
        </script>
    </head>
    <body>
<!--       <table>
            <tr>
                <th>username</th>
                <th>password</th>
            </tr>
            <c:forEach var="user" items="${users}">
            <tr>
            <td><c:out value="${user.username}"/></td>
            <td><c:out value="${user.password}"/></td>
            </tr>
            </c:forEach>
        </table>-->
        <div id="order_content">
                    <ul>
                        <c:forEach var="row" items="${result.rows}">
                            <li class="each_li" style="width:100%">
                                <div style="margin: 10px 10px 10px 10px;">
                                    <img src="images/goods/${row.id}.png" width="200px" height="200px" alt="没上传照片"/>
                                    <div style="float: right;">
                                        <p class="order_id" style="display:none;">${row.id}</p>
                                        <p>购买数量:${row.num}</p>
                                        <p class="order_status">${row.status}</p>
                                        <p class="btn_comment">评论</p>
                                    </div>
                                    <div class="pic_text">
                                        <em class="textfont text_list_bk">${row.name}</em>
                                        <div class="proPrice">￥<em class="newPrice">${row.money}</em>元</div>
                                    </div>
                                </div>
                                <div class="each_comment">
                                    <div calss="send_comment">
                                        <div class="inner_id" style="display:none;">${row.id}</div>
                                        <textarea class="inner_comment" cols="50" rows="5" placeholder="说点什么吧"></textarea>
                                        <input class='inbtn_comment' type="button" value="发表"   />
                                    </div>
                                    
                                    <sql:query dataSource="${snapshot}" var="goods_comment">
                                    SELECT * from goods where id='${row.id}';
                                    </sql:query>
                                    <div id="customer_comment">
                                    </div>
                                    <c:forEach var="row" items="${goods_comment.rows}">

                                        
                                            <div class="cmt${row.id}">
<!--                                            <div class="ttt">-->
                                            </div>
                                            <script lanuage="javascript">
                                                    var co ='${row.comment}';
                                                    var myobj=eval(co);
                                                    for(var i=0;i<myobj.length;i++){
                                                        $(".cmt${row.id}").html($(".cmt${row.id}").html()+"<ul class='say_box'>"+myobj[i].comment+"<span class='dateview'>"+myobj[i].customer+"</span></ul>");
//                                                var body = document.body;
//                                                var div = document.createElement("div");
//                                                div.id = "mDiv";
//                                                div.innerHTML = "<ul class='say_box'>"+myobj[i].comment+"<span class='dateview'>"+myobj[i].customer+"</span></ul>";
//                                                body.appendChild(div);
//                                                        document.write("<ul class='say_box'>"+myobj[i].comment);
//                                                        document.write("<span class='dateview'>"+myobj[i].customer+"</span></ul>");
                                                    }
                                            </script>
                                    </c:forEach>
                                    
                                </div>
                                
                            </li> 

                        </c:forEach>
                            

                    </ul>
        </div>
    </body>
    
        <script>
        function order_comment(id,word){
                var post="customer=${username}"+"&id="+id+"&comment="+word;
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
                        alert("评论成功");
                    }
                }
                xmlhttp.open("POST","CommentServlet",true);
                xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                xmlhttp.send(post);
        };
        </script>
</html>
