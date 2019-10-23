<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <title>用户注册</title>
   <script type="text/javascript" src="./js/jquery-1.4.2.js"></script>
   <script type="text/javascript">
   /*点击图片改变图片*/
   function changeImg(img)
   {
        img.src=img.src+"?time="+new Date().getTime();
   }
   function formCheck()
   {    
        var isForword=true;
        isForword=isForword && checkNull("username","用户名不能为空");
        isForword=isForword && checkNull("password","密码不能为空");
        isForword=isForword && checkNull("passwordAgain","确认密码不能为空");
        isForword=isForword && checkNull("nickname","昵称不能为空");
        isForword=isForword && checkNull("email","邮件不能为空");
        isForword=isForword && checkNull("valistr","验证码不能为空");
        
        //验证两次密码是否一致
        var pwd1=document.getElementsByName("password")[0].value;
        var pwd2=document.getElementsByName("passwordAgain")[0].value;
        if(pwd1!=pwd2)
        {
              document.getElementById("passwordAgain_msg").innerHTML="<font color='red'>两次密码不一致！</font>";
              isForword=false;
        }
        //验证邮箱格式是否正确(xxx@xxx.xxxx.xxx...)即（^\w+@\w+(\.\w+)+$）
        var eml=document.getElementsByName("email")[0].value;
        if(eml!=null && eml!="" && !/^\w+@\w+(\.\w+)+$/.test(eml))
        {
              document.getElementById("email_msg").innerHTML="<font color='red'>邮箱格式不能正确！请按照以下格式书写（如：xx@xx.xx.xx.....）</font>";
              isForword=false;
        }
        
        return isForword;
   }
   function checkNull(name,msg)
   { 
        document.getElementById(name+"_msg").innerHTML="";/*初始情况为空*/
        var objValue=document.getElementsByName(name)[0].value;
         if(objValue==null || objValue=="")
         {
             document.getElementById(name+"_msg").innerHTML="<font color='red'>"+msg+"</font>";
              return false;
         }else
         {
              return true;
         }
        
   }
    //利用Ajax方式实现前端不刷新验证用户名是否存在
     window.onload=function(){
       // alert(110);
       $("input[type='text'][name='username']").change(function(){
              // alert(110);
               var username=$(this).val();
               //以Ajax方式在页面没有刷新的情况下将输入的用户名提交到后台进行验证是否存在
              $.post("${pageContext.request.contextPath}/ValiNameServlet",{username:username},function(data){
                 // eval方法要写成这样的形式是因为（原因在于：eval本身的问题。 由于json是以”{}”的方式来开始以及结束的，在JS中，它会被当成一个语句块来处理，所以必须强制性的将它转换成一种表达式。）
                   
                  var json=eval("("+data+")");//将后台传过来的json格式字符串解析成json格式数据
                   if(json.state==1)
				  {
				    $("#username_msg").html("<font color='red'>"+json.msg+"</font>");
				  }
				   if(json.state==0)
				  {
				     $("#username_msg").html("<font color='green'>"+json.msg+"</font>");
				  }
              });
       });
   }
   </script>
  </head>
  <body bgcolor="#81BEF7">
   <div align="center">
   <h1>用户注册</h1><hr>
   <form action="${pageContext.request.contextPath}/RegistServlet" method="POST" onsubmit="return formCheck()">
   <table>
    <tr>
       <td>用户名</td>
       <td><input type="text" name="username" value="${param.username}"/></td>
       <td id="username_msg"></td>
    </tr>
    <tr>
       <td>密码</td>
       <td><input type="password" name="password" /></td>
       <td id="password_msg"></td>
    </tr>
    <tr>
       <td>确认密码</td>
       <td><input type="password" name="passwordAgain"/></td>
       <td id="passwordAgain_msg"></td>
    </tr>
    <tr>
       <td>昵称</td>
       <td><input type="text" name="nickname" value="${param.nickname}"/></td>
       <td id="nickname_msg"></td>
    </tr>
    <tr>
       <td>邮箱</td>
       <td><input type="text" name="email" value="${param.email}"/></td>
       <td id="email_msg"></td>
    </tr>
    <tr>
       <td>验证码</td>
       <td><input type="text" name="valistr" value="${param.valistr}"/></td>
       <td id="valistr_msg">${msg}</td>
    </tr>
    <tr>
       <td><input type="submit" name="registSub" value="注册"/></td>
       <td><img src="${pageContext.request.contextPath}/ValiImg" onclick="changeImg(this)" sytle="cursor:pointer"/></td>
    </tr>
    
   </table>
   </form>
   </div>
  </body>
</html>
