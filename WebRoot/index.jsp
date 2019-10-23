<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>Estore</title>
  </head>
  <body>
     <h1>Estore</h1><hr> 
     <c:if test="${sessionScope.user==null}">
        欢迎光临，游客！
        <a href="${pageContext.request.contextPath}/regist.jsp">注册</a>
        <a href="${pageContext.request.contextPath}/login.jsp">登录</a>
     </c:if>
     <c:if test="${sessionScope.user!=null}">
     欢迎回来，${sessionScope.user.username}!<br>
     <a href="${pageContext.request.contextPath}/addProd.jsp">添加商品</a><br/>
     <a href="${pageContext.request.contextPath}/ProdListServlet">商品列表</a><br/>
     <a href="${pageContext.request.contextPath}/cartList.jsp">购物车</a><br/>
     <a href="${pageContext.request.contextPath}/OrderListServlet">查询订单</a><br/>
     <a href="${pageContext.request.contextPath}/SaleListServlet">出售榜单下载</a><br/>  
     <a href="${pageContext.request.contextPath}/LogoutServlet">注销</a>
     </c:if>
  </body>
</html>
