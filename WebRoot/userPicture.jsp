<%@ page language="java" import="java.util.*,com.huaban.model.User" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
/* 	User u1 = new User();
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
    <title>个人主页</title>
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
    <article class="container ">
        <section class="main">
            <div class="myPic">
                <img src="${u.selfpic }">
            </div>
            <div class="username">
            	<strong style="font-size: 20px;">${u.nickname }</strong>
            	<p class="comment"><span>个性签名：</span> 
            		<span>${u.motto }</span> </p>	
            </div>
            <ul class="clear row myablity">
                <li  class="col-md-2 col-lg-2 active"><a href="#">发步图片说说</a></li>
                <li class="col-md-2 col-lg-2"><a href="<%=path %>/UpdateUser.jsp">修改个人信息</a></li>
            </ul>
        </section>
        <section id="showimg" class="showimgs">
            <header class="toAddImg">
                    <label  class="addImgBg">

                    </label>
                    <p>添加采集</p>
            </header>
           

           
            <script id="picInfo" type="text/html">
                <div class="oSelfInfo">
                    <div class="userpic">
                        <a></a>
						<section class="clearfix">
							<a class="btn btn-danger fl delete">删除</a> <a class="btn btn-default fr update">编辑</a>
						</section>
                    </div>
                    <div class="picDetail clearfix">
                        <a class="userLogo"  href="#"><img src="${u.selfpic }"></a>
                        <div>
                            <p class="textOverflow uusername"><a href="userPicture.jsp">牛元强</a>采集到</p>
                            <p class="textOverflow sPicComment"><a href="#">这里是内容</a></p>
                        </div>
                    </div>

                </div>
            </script>
        </section>

    </article>
    <footer id="loader">

    </footer>

    <!--弹窗部分-->
    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
       <label id="heihei"> </label>
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">
                    		图片上传
                    		<div class="progress" style="display: none">
			                   	<div class="length">
			                        
			                    </div>
			                    
		                   </div>
                    		<span class="finish"></span>
                    		
                    </h4>
                    
                </div>
                <div class="modal-body drop">
                    <label for="imgs" class="uploadLabel droplabel" >
                        将文件拖到这里或点击上传
                    </label>
                    <ul id="showimglist"  class="clearfix" style="display:none">
                        <li>
                            <label for="imgs" class="uploadLabel">
                            </label>
                        </li>
                        <script type="text/html" id="img">
                            <li>
                                <img src="<%=path%>/img/head.jpg" class="pic">
                                <div class="form-group">
                                    <label class="sr-only"></label>
                                    <input type="text" placeholder="添加描述" class="form-control content"   />
                                </div>
                            </li>
                        </script>
                    </ul>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <a href="#heihei" class="btn btn-primary" id="filesloader">上传图片</a>
                </div>
            </div>
        </div>
    </div>

    <input type="file" id="imgs" name="files"  multiple style="display: none"/>
    <script src="<%=path %>/js/bootstrap.min.js" ></script>
    <script src="<%=path %>/js/respond.min.js"></script>
   <script type="text/javascript" src="<%=path %>/js/app.js"></script>
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
        var sUrl = '<%=path %>/Ajax/userPictureList.action';
        //每列的top值
        var arrT = [];
        //每行对应列的left值
        var arrL = [];
        var iPageOffset = 0;
        var iPagecount = 0;
        var iBtn = true;
		
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
            $(".nav-form").width((containerWidth-($("#logo").width()+$(".self-info").width()+$(".mynavinfo").width()))-90);
        }
        setCell();

        arrT[0] = $(".toAddImg").height()+20;
        arrL[0] = 0;
        for (var i=1; i<iCells; i++) {
            arrT[i] = 0;
            arrL[i] = iOuterWidth * i;
        }

        function getData() {
            $.getJSON(sUrl, {pageOffset:iPageOffset}, function(jData) {
            	if (!iBtn) {
        			return ;
        		}
            	
                var pagers = jData.pager;
                iPageOffset += pagers.pagerSize;
                //console.log(iPageOffset);
                iPagecount = pagers.pageCount;
                //console.log(iPagecount);
                // console.log(pagers.objs);
                $.each(pagers.objs,function(index,obj){
                	//console.log(obj);
                	var sHtml = $selfInfoModel.html();
                	var $Str = $(sHtml); 
                	
                	/*  */
                	$Str.find(".userLogo img").attr("src", $(".self-pic").attr("src"));
                	$Str.find(".uusername a").html($(".username strong").html());
                	$Str.find(".sPicComment a").html(obj.comment?obj.comment:"尚未发表意见");
                	$Str.find(".delete").attr("data-id", obj.id);
                	//update
                	$Str.find(".update").attr("href", "<%=path %>/Picture/updatepicreforward.action?pid="+obj.id);
                	
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
                    
                    $Str.find(".userpic>a").append(oImg);
                    oShowImg.append($Str);
                    
                    var objImg = new Image();
                    objImg.onload = function() {

                        oImg.attr('src', this.src);
                    };
                    
                    objImg.src = pagers.url+obj.name;
    				
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
    <!--  文件上传预览  -->
    <script>
    	/* 调用slice的call方法将 使其可以使用foreach方法 */
		var slice = Array.prototype.slice;
	
        /*拖拽式文件上传*/
        var aFiles = [];
        var $drop = $(".drop");
        var $ImgList = $("#showimglist");
        var $ImgHtml = $($("#img").html());
        //统计comment的个数
        var iLength = 0;
        $drop.each(function(){
            this.ondragover = function(e){
                $(this).find(".droplabel").html("释放上传图片");
                e.preventDefault();
            };
            this.ondragleave = function()
            {
                $(this).find(".droplabel")[0].innerHTML = "亲.直接拖拽可上传图片哦";
            };
            this.ondrop = function(e){
                showimg(e.dataTransfer.files);
                e.preventDefault();
            };
        });
        function showimg(files){
            $ImgList.show();
            $(".droplabel").hide();
            $(files).each(function(){
                if(this.type.match(/^(image\/)/)){
                    var fr = new FileReader();
                    fr.readAsDataURL(this);
                    fr.onload = function( e){
                        $ImgHtml.find(".pic").attr("src", e.target.result);
                        $ImgList.append($ImgHtml.clone());
                    };
                }
            });
            var filelis = slice.call(files,0);
            aFiles = aFiles.concat(filelis);
        }

        /*文件预览*/
        var oFile = $("#imgs");
        var fnSlice = Array.prototype.slice;
        var formdata = new FormData();
        oFile.change(function(){
            showimg(this.files);
        });
        
        /* 文件上传 */
        var fileLoader = $("#filesloader");
        var bfileLoader = true;
        var formUrl = "<%=path %>/Ajax/picAction.action";
        var iIndex = 0;
        var oProgress = $(".progress");
        var oFinish = $(".finish");
        fileLoader.click(function(){
        	iLength = aFiles.length;
        	if(!iLength) return;
        	if(!bfileLoader) return;
        	var aComment = $ImgList.children("li");
        	oProgress.show();
        	oFinish.html(iIndex+"/"+iLength);
        	aFiles.forEach(function(filing,z){
        			var val = aComment.eq(z+1).find(".content").val();
        			var oMyForm = new FormData();
    				oMyForm.append("picture.comment",val);
    				oMyForm.append("picFile", filing);
    				var xhr = new XMLHttpRequest();
        			xhr.open("post", formUrl ,true);
        			xhr.onload = function(){
        				//var json = JSON.parse(xhr.responseText);
        				
        				iIndex++;
        				var fFrogress = Math.floor(iIndex*100/iLength);
        				oProgress.find(".length").css("width", fFrogress+"%");
        				oFinish.html(iIndex+"/"+iLength);
        				if(iIndex==iLength){
        					setTimeout(function(){
        						//alert(123)
        						location.href="<%=path %>/userPicture.jsp";
        					}, 1200);
        				}
        			};
        			xhr.onerror = function(){
        				alert("未知错误");
        			};
        			xhr.send(oMyForm);
        			
        		});
			
        });
		
      
    </script>
    <script>
        //显示上传文件的弹窗
        var $toAddImg = $(".toAddImg");
        /*显示弹窗*/
        $toAddImg.click(function(){
            $('#myModal').modal('show');
        });
    </script>
    <!-- 图片信息删除 -->
    <script type="text/javascript">
    	var urlDeletePic = "<%=path %>/Ajax/deletePic.action";
    	oShowImg.on("click",".delete",function(){
    		var pid =$(this).attr("data-id");
    		var that = this;
    		$.ajax(urlDeletePic,{
    			type:"post",
    			data: {pid:pid},
    			dataType:"json",
    			success:function(data){
    				 /* 设置弹窗动画 */
                    selfAlert("删除成功");
    				 $(that).closest(".oSelfInfo").remove();
    				 /* 设置图片刷新界面 */
    				 iCells=0;
    				 resizeWindow();
    				 
    			},
    			error:function(xhr){
    				selfAlert("删除失败");
    			}
    		});
    	});
    </script>
</body>
</html>