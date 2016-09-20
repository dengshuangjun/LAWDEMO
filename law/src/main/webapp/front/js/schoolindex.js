/**
 * 这里写的是一些超链接的点击跳转事件,其中的请求是获取相关内容的总条数
 */
var law_Partid=1003;
var pagesize=6;
var str='';
var i=0;
$(function(){
	var total=1;
	var urlPath=window.location.pathname;
	var file=urlPath.substring(urlPath.lastIndexOf("/")+1);
	if(file=="people.jsp"){
		law_Partid=1009;
		pagesize=4;
	}else if(file=="story.jsp"){
		law_Partid=1010;
		pagesize=4;
	}else if(file=="story2.jsp"){
		law_Partid=1011;
		pagesize=3;
	}else if(file=="saying.jsp"){
		law_Partid=1012;
		pagesize=10;
	}else if(file=="secret.jsp"){
		law_Partid=1013;
		pagesize=20;
	}else if(file=="words.jsp"){
		law_Partid=1014;
		pagesize=4;
	}
	$.post("../../school/getSchoolNewsTotal",{law_Partid:law_Partid},function(data){
		if(data==0){
			total=1;
		}else if(data%pagesize==0){
			total=data/pagesize;
		}else{
			total=Math.floor(data/pagesize)+1;
		}
		
		//第一页的页面数据导入
		$.post("../../school/findSchoolNewsByPage",{law_Partid:law_Partid,pageNum:1,pageSize:pagesize},function(data){
	    	   $.each(data,function(index,item){
	    		   switch (law_Partid) {
				case 1009:
					 str+='<li><a style="color:black;" href="javascript:showMore('+item.nid+')"><b>'+item.title+'</b><div>'+item.content.substring(0,220)+'</div></a></li><img src="../../'+item.picpath+' ">';
					break;
				case 1010:
		    		 str+='<li class="lii"><a style="color:black;" href="javascript:showMore('+item.nid+')"><b>'+item.title+'</b><p>'+item.content.substring(0,220)+'</p></a></li>';
					break;
				case 1011:
					str+='<div class="story2"><b>'+item.title +'</b><p>'+item.content +'</p></div>';
					break;
				case 1012:
					str+='<li><p>'+item.content +'</p><b>——'+item.title+'</b></li>';
					break;
				case 1013:
					i++;
					str+= '<li><a href="#">'+item.content +'</a><b>'+item.ndate+'</b></li>';
					if(i%5==0){
						str+='<i></i>';
					}
					break;
				case 1014:
					str+= '<li>'+item.content +'</li>';			
					break;
				default:
					break;
				}
	    	   });
	    	   $("#newsContent").html( $(str) );
	       },"json");
		
		//点击下一页时触发的事件
		$(".tcdPageCode").createPage({
		    pageCount:total,
		    current:1,
		    backFn:function(pageNum){
		    	str="";
		    	var i=0;
		       $.post("../../school/findSchoolNewsByPage",{law_Partid:law_Partid,pageNum:pageNum,pageSize:pagesize},function(data){
		    	   $.each(data,function(index,item){
		    		   switch (law_Partid) {
					case 1009:
						 str+='<li><a style="color:black;" href="javascript:showMore('+item.nid+')"><b>'+item.title+'</b><div>'+item.content.substring(0,220)+'</div></a></li><img src="../../'+item.picpath+' ">';
						break;
					case 1010:
			    		 str+='<li class="lii"><a style="color:black;" href="javascript:showMore('+item.nid+')"><b>'+item.title+'</b><p>'+item.content.substring(0,220)+'</p></a></li>';
						break;
					case 1011:
						str+='<div class="story2"><b>'+item.title +'</b><p>'+item.content +'</p></div>';
						break;
					case 1012:
						str+='<li><p>'+item.content +'</p><b>——'+item.title+'</b></li>';
						break;
					case 1013:
						i++;
						str+= '<li><a href="#">'+item.content +'</a><b>'+item.ndate+'</b></li>';
						if(i%5==0){
							str+='<i></i>';
						}
						break;
					case 1014:
						str+= '<li>'+item.content +'</li>';			
						break;
					default:
						break;
					}
		    	   });
		    	   $("#newsContent").html( $(str) );
		       },"json");
		    }
		});
	});
	
});

