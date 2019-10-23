<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>用户登录</title>
   <script type="text/javascript">
       window.onload=function(){//window.onload表示在页面加载完毕后再执行以下内容
          var str=decodeURI("${cookie.remName.value}"); //先进行解码操作；
          document.getElementsByName("username")[0].value=str; //然后将解码的值赋给用户名，相当于回写；
       }
</script>
  </head>
  <body bgcolor="#81BEF7">
   <div align="center">
   <h1>用户登录</h1><hr>
  
   <font color="red">${msg}</font>
   <form action="${pageContext.request.contextPath}/LoginServlet" method="POST" ">
   <table>
    <tr>
       <td>用户名</td>
       <td><input type="text" name="username"  value="${str}"/></td>
     </tr>
     <tr>
       <td>密码</td>
       <td><input type="password" name="password" /></td>
     </tr>
      <tr>
        <td>
         <input type="checkbox" name="remname" value="true" 
            <c:if test="${cookie.remName!=null}">checked="checked"</c:if>
         />记住用户名
        </td>
        <td>
         <input type="checkbox" name="autologin" value="true" 
            <c:if test="${cookie.autoLogin!=null}">checked="checked"</c:if>
         />30天自动登录
        </td>
     </tr>
     <tr>
       <td colspan="2"><input type="submit" name="loginSub" value="登录"/></td>
     </tr>
   
   </table>
   </form>
   </div>
  </body>
</html>
