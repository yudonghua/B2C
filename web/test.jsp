<%-- 
    Document   : test
    Created on : 2017-3-12, 12:37:38
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="user" scope="session" class="com.other.User"/>
<jsp:setProperty name="user" property="*"/>  
<!--或者用以下,param可以不填写,其中param对应的是提交页面的表单name  -->
<jsp:setProperty property="username" name="user" param="username"/>  
<jsp:setProperty property="password" name="user" param="password"/> 
<html>  
  <body>   
      注册成功:<br>  
      <hr>  
      使用Bean的属性方法<br>  
      用户名: <%=user.getUsername()%><br>  
      密码: <%=user.getPassword()%><br>  
      <hr>  
      使用getProperty<br>  
      用户名:<jsp:getProperty name="user" property="username"/><br>  
      密码: <jsp:getProperty name="user" property="password"/><br>   
  </body>  
</html>  
