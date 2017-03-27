<%-- 
    Document   : user
    Created on : 2017-3-17, 17:47:42
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                
        <script>
            $(document).ready(function(){
                if(!"${username}"=="") $("#customer_img").siblings().hide();
                else $("#customer_login").siblings().hide();
            });
            
        </script>
        <style>
             .btn{
		float: left;
		font-size: 14px;
		color: #fff;
		background: #8B4512;
		border-radius: 30px;
		padding: 10px 25px;
		border: none;
		text-transform: capitalize;
		transition: all 0.5s ease 0s;
            }
        </style>
    </head>
    <body>
        <div>
            <button class="btn" onclick="tologin()">登录</button>
            <button class="btn" onclick="toregist()">注册</button>
        </div>
        <br><br><br>
        <div>
            <div id="customer_img">
                <center>
                    <div id="user_img" onclick="user_select()">
                        <img src="images/user/${username}.png" id="user_imgShow" width="100" height="100" />
                    </div>
                </center>
            </div>
            
            <div id="customer_login">
                <form action="LoginServlet" method="post">
                    <center><input class="txt" type="text" name="username" placeholder="请输入账号" /></center>
                    <center><input class="txt" type="text" name="password" placeholder="请输入密码" /></center>
                    <center><button type="submit">登录</button></center>
                </form>
            </div>
            <div id="customer_regist">
                <form action="test" method="post" enctype="multipart/form-data">
                    <center><input class="txt" type="text" name="username" placeholder="请输入账号" /></center>
                    <center><input class="txt" type="text" name="password" placeholder="请输入密码" /></center>
                    <center><input class="txt" type="text" name="repassword" placeholder="请确认密码" /></center>
                    <center><input class="txt" type="text" name="phone" placeholder="电话号码" /></center>
                    <center><input class="txt" type="text" name="address" placeholder="邮寄住址" /></center>
                     <center><input  id="up_user_img" style="display:none" type="file" name="img" class="file"/></center>
                    <center><button type="submit">注册</button></center>
                </form>
            </div>
        </div>
        
        
    </body>
    <script>
        function user_select(){
            $("#up_user_img").click();
        }
        function tologin(){
            $("#customer_login").siblings().hide();
            $("#customer_login").show();
        }
        function toregist(){
            $("#customer_login").hide();
            $("#customer_login").siblings().show();
        }
    </script>
</html>
