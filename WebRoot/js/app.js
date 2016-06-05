/**
 *	设置弹窗 
 */
 function selfAlert(content){
	/* 设置弹窗动画 */
    $("#header").popover({
    	container:"body",
    	content:content,
    	placement:"bottom",
    	
    });
    $('#header').popover('show');
    var temp = setTimeout(function(){
  	  $('#header').popover('hide').popover('destroy');
    }, 1000);
}