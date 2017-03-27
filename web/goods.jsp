<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/b2c"
     user="root"  password="root"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from goods;
</sql:query>
<html>

    <head>
        <meta charset="utf-8" />
    </head>
    <body>
        <div class="MoBodyC">

            <div class="exhibition_map" id="prolist_1767224">
                <div class="exhibition_demo" id="contents">
                    <ul class="demo1" style="float: none;">
                       
                             <c:forEach var="row" items="${result.rows}">
                                <li style="width:33%">
                                    <div class="inner">
                                            <span class="pic" style="height: 197px; line-height: 193px;">
                                                <img src="images/goods/${row.id}.png"  alt="没上传照片"/>

                                            </span>
                                        <div class="pic_text">
                                            <em style="display: none;" class="goods_id">${row.id}</em>
                                            <em style="display: none;" class="goods_business">${row.business}</em>
                                            <em style="display: none;" class="goods_comment">${row.comment}</em>
                                            <em class="textfont text_list_bk">${row.name}</em>


                                            <div class="proPrice">￥<em class="newPrice">${row.money}</em>元</div>
                                        </div>
                                    </div>
                                </li>  

                            </c:forEach>
                      

                    </ul>
                </div>
            </div>
        </div>



    </body>


</html>