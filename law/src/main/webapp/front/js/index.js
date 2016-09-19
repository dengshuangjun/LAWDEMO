/**
 * 这里写的是一些超链接的点击跳转事件,其中的请求是获取相关内容的总条数
 */
$(function() {
	var partId=$("#partId").val();
	var usid=$("#usname").val();
	$.post("../../fronts/getArtDataByPage",{pageSize:15,pageNum:1,partid:partId,usid:usid},function(data){
		disArt(data.basicContents);
		$(".tcdPageCode").createPage({
			pageCount : data.total,
			current : 1,
			backFn : function(pageNum) {
				$.post("../../fronts/getArtDataByPage",{pageSize:15,pageNum:pageNum,partid:partId,usid:usid},function(data1){
					disArt(data1.basicContents);
				});
			}
		});
	},"json");
});
function disArt(data){
	var str="";
	 $.each(data,function(index,item){
		 str+="<a href='showMore.jsp?nid="+item.nid+"'><li>"+item.title+"</li></a><span>"+item.ndate+"</span>";
		 if(index!=0&&index%5==0){
			 str+="<br/>";
		 }
	 });
	$(".new ul").html( $(str) );
}
