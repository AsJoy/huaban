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
    <title> caiji · 采集 </title>
</head>
<body>
    <header id="header">

      <nav class="container clearfix">
           <a href="<%=path %>/index.jsp" id="logo"><img  src="<%=path %>/img/sy_03.png"/></a>
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
    <article class="container ">
       
        <section id="showimg" class="showimgs span2">
           
           
            <script id="picInfo" type="text/html">
                <div class="oSelfInfo">
                    <div class="userpic">
                        <a></a>
                    </div>
                    <div class="picDetail clearfix">
                        <a class="userLogo"  href="#"><img src="img/logo.jpg"></a>
                        <div>
                            <p class="textOverflow uusername"><a href="#">牛元强</a>采集到</p>
                            <p class="textOverflow sPicComment"><a href="#">这里是内容</a></p>
                        </div>
                    </div>

                </div>
            </script>
        </section>

    </article>
    <footer id="loader">

    </footer>
    
    <!-- 登陆弹窗 -->
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
	<label class="sr-only" id = "sSelectvalue"><s:property value="#selectvalue"/></label>
    <script src="<%=path %>/js/bootstrap.min.js" ></script>
    <script src="<%=path %>/js/respond.min.js"></script>

   <!--瀑布流-->
    <script>
        var oContainer = $('.container');
        var oShowImg = $("#showimg");
        var iCells = 0;
        //图片宽度
        var iWidth = 230;
        var iSpace = 20;
        //图片的宽度和margin
        var iOuterWidth = iWidth + iSpace;
        //ajax路径
        var sUrl = '<%=path %>/Ajax/PictureList.action';
        //每列的top值
        var arrT = [];
        //每行对应列的left值
        var arrL = [];
        var iPageOffset = 0;
        var iPagecount = 0;
        var iBtn = true;
        var svalue = $("#sSelectvalue").text();
		
        var $selfInfoModel = $("#picInfo");


        function setCell() {
            iCells = Math.floor($(window).innerWidth()*.96/ iOuterWidth);
            if (iCells < 3) {
                iCells = 3;
            } else if (iCells > 8) {
                iCells = 8;
            }
            //alert(iCells);
            var containerWidth = iCells * iOuterWidth+10;
            oContainer.css('width', containerWidth);
            $(".nav-form").width((containerWidth-($("#logo").width()+$(".self-info").width()+$(".mynavinfo").width()+$(".myinfo").width()))-90);
        }
        setCell();

        for (var i=0; i<iCells; i++) {
            arrT[i] = 0;
            arrL[i] = iOuterWidth * i;
        }

        function getData() {
            $.getJSON(sUrl, {pageOffset:iPageOffset,sSelectvalue:svalue}, function(jData) {
            	if (!iBtn) {
        			return ;
        		}
            	$('#loader').show();
                var pagers = jData.pager;
                iPageOffset += pagers.pagerSize;
                //console.log(iPageOffset);
                iPagecount = pagers.pageCount;
                //console.log(iPagecount);
                console.log(pagers.objs);
                console.log(pagers.url);
                $.each(pagers.objs,function(index,obj){
                	//console.log(obj);
                	var sHtml = $selfInfoModel.html();
                	var $Str = $(sHtml); 
                	
                	/*  */
                	$Str.find(".userLogo img").attr("src",pagers.url+"/"+obj.user.id+obj.user.selfpic);
                	$Str.find(".uusername a")
                		.html(obj.user.nickname)
                		.attr("href","<%=path %>/Picture/commonUserPicture.action?uid="+obj.user.id);
                	$Str.find(".sPicComment a").html(obj.comment?obj.comment:"尚未发表意见");
                	
                	
                	var oImg = $('<img />');
                	//宽高
                    var iHeight = obj.height * (iWidth / obj.width);
                    oImg.css({
                        width	:	iWidth,
                        height	:	iHeight
                    });
                    var _index = getMin();
                    $Str.css({
                        left	:	arrL[_index],
                        top		:	arrT[_index]
                    });
                    arrT[_index] += iHeight + 60+20;
                    
                    $Str.find(".userpic a").append(oImg);
                    oShowImg.append($Str);
                    
                    var objImg = new Image();
                    objImg.onload = function() {
                        oImg.attr('src', this.src);
                    };
                    
                    objImg.src = pagers.url+obj.name;
                    oImg.src = pagers.url+obj.name;
    				
    				setTimeout(function() {
    					$('#loader').hide();
    				},500);
    				
    				iBtn = true;
                });
            });
        }
        getData();
        /*每次加入一张图片后都要重新计算top最小值的下标*/
        function getMin() {
            var v = arrT[0];
            var _index = 0;
            for (var i=1; i<arrT.length; i++) {
                if (arrT[i] < v) {
                    v = arrT[i];
                    _index = i;
                }
            }
            return _index;
        }


      $(window).on('scroll', function() {
    	  
    	 	 if (!iBtn) {
	  			return ;
	  		}
    	 	 if(iPageOffset<iPagecount){
    	 		var _index =getMin();
                var iH = $(window).scrollTop() + $(window).innerHeight();
                if (arrT[_index] + 50 < iH) {
                    getData();
                    
                }	 
    	 	 }
            
        });

        /* 屏幕变化时 */
        function resizeWindow(){
            var iLength = iCells;
            setCell();
            if( iLength== iCells){
                return;
            }
            arrL.length=0;
            arrT.length=0;
            arrT[0] = $(".toAddImg").height()+20;
            arrL[0] = 0;
            for (var i=1; i<iCells; i++) {
                arrT[i] = 0;
                arrL[i] = iOuterWidth * i;
            }
            var aInfos = oShowImg.find(".oSelfInfo");
            $(aInfos).each(function(index){
                //console.log(index)
                var min_index = getMin();
               //alert(arrT)
                $(this).animate({top:arrT[min_index],
                    left:arrL[min_index]},800);
                arrT[min_index] += $(this).height() + 20;
            });
        }
        
    	
        $(window).resize(function(){
            resizeWindow();
        });

		
    </script>
   
</body>
</html>