<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    <title>注册账号</title>
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
			
           	<s:if test='#session.u==null'>
	        	<div class="myinfo fr">
	            	<a href="<%=path %>/addUser.jsp" class="btn btn-warning" >注册</a>
	                <a href="#" class="btn btn-info" data-toggle="modal" data-target=".bs-example-modal-sm">登陆</a>	
        		</div>
	        </s:if>
            <s:else>
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
            </s:else>
       </nav>
    </header>
    <article class="container">
        <div class="span1 col-md-10 col-md-offset-1">
            <p class="userCommon caption"><strong>${exception.message }</strong></p>
        </div>

    </article>
 
     <div class="modal fade bs-example-modal-sm " tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm">
             <form class="form-horizontal" action="<%=path %>/User/userlogin.action" method="post">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	                    <h4 class="modal-title" id="exampleModalLabel">用户登录</h4>
	                </div>
	                
	                <div class="modal-body">
	                   
	                        <div class="form-group">
	                            <div class="input-group col-md-10 col-md-offset-1">
	                                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
	                                <input type="text" name="username" class="form-control" placeholder="用户名"/>
	                            </div>
	                        </div>
	                        <div class="form-group">
	                            <div class="input-group col-md-10 col-md-offset-1">
	                                <span class="input-group-addon"><span class="glyphicon glyphicon-knight"></span></span>
	                                <input type="password" name="password" class="form-control" placeholder="用户密码"/>
	                            </div>
	                        </div>
	                    
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	                    <button type="submit" class="btn btn-primary">登陆</button>
	                </div>
	              
	            </div>
              </form>
        </div>
    </div>

    <script src="<%=path %>/js/bootstrap.min.js" ></script>
    <script src="<%=path %>/js/respond.min.js"></script>
    <script src="<%=path %>/js/jquery-html5Validate.js"></script>

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

        $('#adduser').html5Validate(function(){
            $("#adduser").submit();
        },{
        	 validate: function() {
        	        // 下面这些就是额外的一些特殊验证
        	        if ($("#addpic")[0].files.length == 0) {
        	            $("[for=addpic]").testRemind("亲，传个头像吧");
        	            return false;  
        	        }
        	       return true;  
        	    }
        });
        $.testRemind.css = {
            color: "#fff",
            backgroundColor: "#f60"
        };
		
        
        function showimg(files){
        	$(".adduserpic div").show();
        	$(files).each(function(){
                if(this.type.match(/^(image\/)/)){
                    var fr = new FileReader();
                    fr.readAsDataURL(this);
                    fr.onload = function( e){
                    	$(".adduserpic div").hide();
                      $(".adduserpic")
                      	.html($("<img>").attr("src", e.target.result));	
                      
                    };
                }
            });
        }
        $("#addpic").change(function(){
        	showimg(this.files);
        });
    </script>

</body>
</html>