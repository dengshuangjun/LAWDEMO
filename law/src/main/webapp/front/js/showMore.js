$(function() {
	findLawMark();
});
function findLawMark() {
	$.post("../../fronts/getMoreNewsContent", {
		nid : GetQueryString("nid")
	}, function(data) {
	var str="<span>"+data.title+"</span><p style='margin: 3px 100px'>发表日期："+data.ndate+"作者："+data.author+"浏览次数："+data.views+"<hr width='90%'/><div style='padding:20px'>"+data.content+"<div>";
		$(".right_top").html($(str));
		
	}, "json");
}
// 获取地址栏参数
function GetQueryString(name) {
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r != null)
		return unescape(r[2]);
	return null;
}
// 点击评论
/*function Comment() {
	$.post("../../ArtServlet", {
		op : "Comment",
		params : (toJsonStr($("#formID").serialize()))
	}, function(data) {
		if (data) {
			findLawMark();
			$("#formID textarea").val("");
		}
	});
}*/
function toJsonStr(str) {
	return str = "{\"" + str.replace(/=/g, "\":\"").replace(/&/g, "\",\"")
			+ "\"}";
}