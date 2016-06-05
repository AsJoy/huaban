<%@ page language="java" import="java.util.*,com.huaban.model.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
/* User u1 = new User();
u1.setId(48);
u1.setUsername("1231wwer");
u1.setPassword("erertqwe");
u1.setSelfpic("http:\\\\www.c.com/48/logo.jpg");
u1.setNickname("吼吼哈嘿");
u1.setMotto("哈哈红黑");
session.setAttribute("u", u1); */
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="<%=path %>/js/jquery.min.js" ></script>
    <script src="<%=path %>/js/html5shiv.min.js"></script>
    <link href="<%=path %>/css/bootstrap.min.css" rel="stylesheet" />

    <link href="<%=path %>/css/style.css" rel="stylesheet" />
    <link rel="shortcut icon" href="<%=path %>/img/logo_ico.ico"/>
    <title>账号设置</title>
</head>
<body>
    <header id="header">

      <nav class="container clearfix">
           <a href="#" id="logo"><img  src="<%=path %>/img/sy_03.png"/></a>
           <ul class="nav-info mynavinfo clearfix">
               <li><a href="<%=path %>/index.jsp">首页</a></li>
               <li><a href="<%=path %>/User/finduser.action?pager.offset=0">发现</a></li>
               <li><a href="#">最新</a></li>
               <li class="more"><a href="#">更多</a></li>
           </ul>
          <form class="col-md-6  fl nav-form" action="<%=path %>/Picture/findpictureList.action">
               <div class="form-group has-feedback">
                   <label class="sr-only" ></label>
                   
                   <input type="text" class="form-control" name="seachValue" placeholder="输入搜索内容">
                   <span class="glyphicon glyphicon-search form-control-feedback"></span>
               </div>
               <input type="hidden" name="pageOffset" value="0"/>
           </form>
       
          	<div class="btn-group myinfo fr" role="group">
                 <button type="button" class="self-info dropdown-toggle self-pis-wrapper" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <img class="self-pic" src="${u.selfpic }"/>
                 </button>
                 <ul class="dropdown-menu">
                     <li><a href="<%=path%>/userPicture.jsp"><span class="glyphicon glyphicon-home"></span>我的主页</a></li>
                     <s:if test="#session.u.type==1">
	                    	<li class="divider"></li>
	                    	<li><a href="<%=path%>/User/usermanager.action?pager.offset=0"><span class="glyphicon glyphicon-home"></span>用户管理</a></li>
	                    </s:if>
                     <li class="divider"></li>
                     <li><a href="<%=path %>/UpdateUser.jsp"><span class="glyphicon glyphicon-edit"></span>修改个人信息</a></li>
                     <li><a href="<%=path %>/User/userInvalidate.action"><span class="glyphicon glyphicon-cog"></span>注销</a></li>
                 </ul>
            </div>		
       </nav>
    </header>
    <article class="container">
        <div class="span1 col-md-10 col-md-offset-1">
            <p class="userCommon caption"><strong>个人信息修改</strong></p>
                <ul class="col-md-11 userNav">
	                <li>
	                    <div class="adduser">
	                        <div class="userCommon">
	                            <span class="col-md-3">个人资料</span>
	                            <span class="  col-md-2 textoverflow">基本信息</span>
	                        </div>
	                        <div class="adduserdetail">
	                           <form class="form-horizontal"  method="post" id="updateuser" enctype="multipart/form-data">
                                <div class="form-group">
	                                    <label class="control-label col-md-2">登录名:</label>
	                                    <div class="col-md-4">
	                                        <input type="text" name="user.username" class="form-control" value="${u.username }" placeholder="3-16位账号" pattern="^[a-z0-9_-]{3,16}$" required  />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="control-label col-md-2">登录密码：</label>
	                                    <div class="col-md-4">
	                                        <input type="password" name="user.password" class="form-control" value="${u.password }" pattern="^[a-z0-9_-]{6,18}$" required placeholder="6位或以上密码" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="control-label col-md-2">昵称：</label>
	                                    <div class="col-md-4">
	                                        <input type="text" name="user.nickname" class="form-control" value="${u.nickname }" placeholder="用户昵称" required/>
	                                     </div>
	                                </div>
	                                <div class="form-group">
	                                    <label class="control-label col-md-2">签名：</label>
	                                    <div class="col-md-4">
	                                        <input type="text" name="user.motto" class="form-control" value="${u.motto }" placeholder="座右铭" required/>
	                                    </div>
	                                </div>
	                                <button type="submit" class="btn btn-danger col-md-offset-4" >保存修改</button>
	          					</form>
	                        </div>
	                    </div>
	                </li>
	                <li>
	                    <div class="adduser">
	                        <div class="userCommon">
	                            <span class="col-md-3">头像</span>
	                            <span class="  col-md-2 textoverflow">头像上传</span>
	                        </div>
	                        <div class="adduserdetail">
	                           <div class="adduserpic">
	                              <img src="${u.selfpic }">
	                              <div ></div>
	                           </div>
	                            <label class="btn btn-default addimg" for="addpic">上传图片</label>
	                        </div>
	                    </div>
	                </li>
	            </ul>
                 
                 <input type="file" name="file" id="addpic" style="display: none" required="required" />
	             
        </div>
    </article>
    <footer >

    </footer>
    
    <script src="<%=path %>/js/bootstrap.min.js" ></script>
    <script src="<%=path %>/js/respond.min.js"></script>
    <script src="<%=path %>/js/jquery-html5Validate.js"></script>
	<script type="text/javascript" src="<%=path %>/js/app.js"></script>

    <script>
        var oContainer = $('.container');
        var iCells = 0;
        //图片宽度
        var iWidth = 200;
        var iSpace = 20;
        //图片的宽度和margin
        var iOuterWidth = iWidth + iSpace;

        function setCell() {
            iCells = Math.floor($(window).innerWidth() *0.96/ iOuterWidth);
            if (iCells < 3) {
                iCells = 3;
            } else if (iCells > 8) {
                iCells = 8;
            }
            //alert(iCells);
            var containerWidth = iCells * iOuterWidth+10;
            oContainer.css('width', containerWidth);
            $(".nav-form").width((containerWidth-($("#logo").width()+$(".myinfo").width()+$(".mynavinfo").width()))-100);
        }
        setCell();

        $('#updateuser').html5Validate(function(){
        	/* 更新用户信息  */
            var url = "<%=path %>/Ajax/updateUserAction.action";
            $.ajax(url,
           		{
           			data:$("#updateuser").serialize(),
           			dataType:"json",
           			type:"post",
           			success:function(date){
           			 	selfAlert("修改成功");
           			},
           			error:function(xhr){
           				console.log(xhr.status);
           			}
           		});
        });
        /* 设置html5validate一些简单样式 */
        $.testRemind.css = {
            color: "#fff",
            backgroundColor: "#f60"
        };
		
        
        
        
        
        
        var formUrl = "<%=path%>/Ajax/updatePhoto.action";
        function showimg(files){
        	$(".adduserpic div").show();
            $(files).each(function(){
                if(this.type.match(/^(image\/)/)){
                	var that = this;
                	var oMyForm = new FormData();
                	oMyForm.append("file",this);
                	var xhr = new XMLHttpRequest();
        			xhr.open("post", formUrl ,true);
        			xhr.onload = function(){
        				var fr = new FileReader();
                        fr.readAsDataURL(that);
                        fr.onload = function( e){
                        $(".adduserpic div").hide();
                          $(".adduserpic img").attr("src", e.target.result);	
                          
                          /* 设置弹窗动画 */
                          selfAlert("上传成功");
                        };	
        				
        			};
        			xhr.onerror = function(){
        				alert("未知错误");
        			};
        			xhr.send(oMyForm);
                	
                }
            });
        }
        $("#addpic").change(function(){
        	showimg(this.files);
        });
        
        
       
    </script>

</body>
</html>