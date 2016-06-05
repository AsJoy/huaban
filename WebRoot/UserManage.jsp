<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="pg" uri="http://jsptags.com/tags/navigation/pager" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <p class="userCommon caption"><strong>发现成员</strong></p>
	            <ul class="col-md-11 userNav">
	                <li>
	                    <div class="adduser">
	                        <div class="userCommon">
	                        	<span class="col-md-3 col-sm-3" style="text-align:center">序号</span>
	                            <span class="col-md-3 col-sm-3" style="text-align: center;">成员头像</span>
	                            <span class="col-md-3 col-sm-3 textoverflow" style="text-align: center;">成员昵称</span>
	                            <span class="col-md-3 col-sm-3 textoverflow" style="text-align: center;">成员管理</span>
	                        </div>
                        </div>
	                </li>
	               	<s:iterator value="#pager.objs" var="user" status="st">
	               		<li>
		                    <div class="adduser">
		                        <div class="userCommon">
	                        		 <div class="a" style="display: inline-block; width: 100%;height: 100%" data-href="<%=path %>/Picture/commonUserPicture.action?uid=<s:property value="#user.id"/>">
		                        		<span class="col-md-3 col-sm-3" style="text-align:center"><s:property value="#st.index+1"/></span>
			                            <span class="col-md-3 col-sm-3" style="text-align: center;">
			                            	 <label class="userselfpic"><img src='${pager.url }<s:property value="#user.selfpic"/>'></label> 
			                            </span>
			                            <span class="col-md-3 col-sm-3 textoverflow" style="text-align: center;"><s:property value="#user.nickname"/> </span>
			                            <span class="col-md-3 col-sm-3 textoverflow" style="text-align: center;">
			                            	<a class="btn btn-link deleteuser"
			                            		href='javascript:void(0)'
			                            		data-id="<s:property value="#user.id" />">
			                            			用户删除
			                            	</a>
			                            </span>
		                       		 </div>	
		                        </div>
		                    </div>
	                	</li>	
	               	</s:iterator>
	                
	                <li>
	                	 <nav style="text-align: right; padding-right: 30px;" >
						  <ul class="pagination">
						   <!-- 分页  -->
						   <pg:pager maxPageItems="${pager.pagerSize }" items="${pager.pageCount }" export="curPage=pageNumber" maxIndexPages="5" url="${param.url }">
						   		<pg:prev ifnull="true" >
						   			<li>
								      <a href="${pageUrl }" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
						   		</pg:prev>
						   		<pg:pages>
						   			<c:if test="${curPage eq pageNumber }">
						   			 <li class="active"><a href="${pageUrl }">${pageNumber } <span class="sr-only"></span></a></li>
									</c:if>
									<c:if test="${curPage ne pageNumber }">
										<a href="${pageUrl }">${pageNumber }</a>
									</c:if>
						   		</pg:pages>
						   		<pg:next ifnull="true">
					   				 <li>
								      <a href="${pageUrl }" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
								    </li>
						   		</pg:next>
						   </pg:pager>
						  </ul>
						</nav>
	                </li>
	            </ul>
        </div>
 
    </article>

    <script src="<%=path %>/js/bootstrap.min.js" ></script>
    <script src="<%=path %>/js/respond.min.js"></script>
    <script src="<%=path %>/js/jquery-html5Validate.js"></script>
	<script src="<%=path %>/js/app.js"></script>

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
	<script type="text/javascript">
		var deleteUrl = "<%=path %>/Ajax/deleteuser.action";
		$(".deleteuser").click(function(){
			var uid = $(this).attr("data-id");
			
			$.ajax(deleteUrl,{
				data:{uid:uid},
				dataType:"json",
				type:"post",
				success:function(data){
					selfAlert("删除"+data.jsonMap.msg);
					setTimeout(function(){
						location.href=location.href+"#";
					}, 1000);
				},error:function(){
					selfAlert("删除失败");
				}
			});
		});
	</script>
</body>
</html>