<%-- 
    Document   : up
    Created on : 2017-3-18, 13:00:07
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="uploadPreview.js" type="text/javascript"></script>
        <script src="uploadPreview.min.js" type="text/javascript"></script>
        <script>
           window.onload = function () { 
                new uploadPreview({ UpBtn: "up_img", DivShow: "imgdiv", ImgShow: "imgShow" });
            }
        </script>
        <style>
             .upbtn{
		font-size: 14px;
		color: #fff;
		background: #8B4512;
		border-radius: 30px;
		padding: 10px 25px;
		border: none;
		text-transform: capitalize;
		transition: all 0.5s ease 0s;
            }
            .txt{
                background:#f8f8f8;box-shadow: 0px 1px 0px rgba(255,255,255,.1), inset 0px 1px 1px rgba(214, 214, 214, 0.7);width:340px; border-radius:5px;position:relative; padding: 2px 0;
                margin:10px 0;font-size:14px;font-family:"宋体";
            }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <center>
                <div id="imgdiv" onclick="select()">
                    <img src="images/add.png" id="imgShow" width="100" height="100" />
                </div>
            </center>
            <form action="GoodsServlet" method="post" enctype="multipart/form-data">
                <center><input  id="up_img" style="display:none" type="file" name="img" class="file"/></center>
                <center><input class="txt" type="text" name="name" placeholder="请输入商品名" /></center>
                <center><input class="txt" type="text" name="type" placeholder="请输入商品类型" /></center>
                <center><input class="txt" type="text" name="money" placeholder="请输入商品价格" /></center>
                <center><button type="submit" class="upbtn">上传</button></center>
            </form>
        </div>
    </body>
    <script type="text/javascript">
        function select(){
            $("#up_img").click();
        }
    </script>
</html>
