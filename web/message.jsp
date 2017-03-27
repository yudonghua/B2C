<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/b2c"
     user="root"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from buy where business='${username}';
</sql:query>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            p {  width:15rem; height:1.5rem; font-size:1rem; margin: 20px 20px 20px 20px;border:1px solid #e5e5e5; text-align:center; color:#A1A09C; background-color:#fff;}
        </style>
         <script>

        function msg_delivery(id,status){
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
                        alert("送货成功");
                    }
                }
                xmlhttp.open("POST","StatusServlet",true);
                xmlhttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
                xmlhttp.send(post);
        };
       
        $(document).ready(function(){
            $(".msg_status").click(function(){
                msg_delivery($(this).parent().find('p[class*=msg_id]').html(),"货在路上");
            });
        });
        </script>
    </head>
    <body>
        <div id="order_content">
                    <ul>
                        <c:forEach var="row" items="${result.rows}">
                            <li style="width:100%">
                                <div style="margin: 10px 10px 10px 10px;">
                                    <img src="images/goods/${row.id}.png" width="200px" height="200px" alt="没上传照片"/>
                                    
                                    <div style="float: right;">
                                        <p class="msg_id" style="display:none;">${row.id}</p>
                                        <p>购买数量:${row.num}</p>
                                        <p>送货地址:${row.address}</p>
                                        <p class="msg_status">${row.status}</p>
                                        <p>评论</p>
                                    </div>
                                    <div class="pic_text">
                                        <em class="textfont text_list_bk">${row.name}</em>
                                        <div class="proPrice">￥<em class="newPrice">${row.money}</em>元</div>
                                    </div>
                                </div>
                            </li> 

                        </c:forEach>
                            

                    </ul>
        </div>
    </body>
</html>

