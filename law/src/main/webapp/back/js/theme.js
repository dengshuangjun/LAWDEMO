function changeCss(color){
	$.post("theme/changeCss?color=" + color,function(data){
		if(data>0){
			$.messager.show({title:'成功提示',msg:"前台样式修改成功!!!",timeout:5000,showType:'slide'});
		}
	});
}