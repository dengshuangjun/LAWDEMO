<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="art_data"></table>
<!-- -------- 添加模块begin------ -->
<div id="art_data_add" data-options="iconCls:'icon-add',modal:true,closed:true,fit:true" style="padding:20px;">
	<div style="text-align: center">
		所属类型: 
		<select id="artNtnameAdd" class="artNtname" panelHeight="auto" style="width:100px">
			<option value='-1'>全部</option>
		</select>
		所属版块: 
		<select id="artPartNameAdd" class="easyui-combobox" panelHeight="auto" style="width:100px">
			<option value="1004">法治视频</option>
				<option value="1005">法治动漫</option>
				<option value="1006">法治摄影</option>
				<option value="1007">法治书画</option>
				<option value="1008">法治小说</option>
		</select>
		标题：<input id="artTitleAdd" class="easyui-textbox" type="text" name="title" />
		作者：<input id="artAuthorAdd" class="easyui-textbox" type="text" name="title" />
		权重：<input id="artWeightAdd" class="easyui-numberspinner" style="width:80px;" value="0" required="required" data-options="min:0,max:100,editable:false"/>  
		登陆才可见：<select id="artFlagAdd" class="easyui-combobox" style="width:50px;" panelHeight="auto" >
					<option value='Y'>是</option>
					<option value='N'>否</option>
				</select>
	</div>
	<p style="color: red;width:1024px;margin: 0 auto;padding:10px;">注意：以上都为必选或必填，否则不能添加或者提示添加失败...</p>
	<div>
	<script id="artEditor" type="text/plain" style="width:1024px;height:500px;text-align: center; margin: 20px auto;"></script>
	</div>
	<p style="text-align: center;">
	<input type="button" id="submitartBtn" value="提交上传"/><input type="button" id="resetartBtn" value="重置"/>
	</p> 
</div>  
<!-- -------- 添加模块end------ -->
<!----------------- 搜索模块begin ----------------->
<div id="art_bar" style="padding:5px;height:auto">
		<div>
			按日期搜索从：<input id="artData1" class="easyui-datebox" style="width:100px">
			到: <input id="artData2" class="easyui-datebox" style="width:100px">
			所属类型: 
			<select id="artNtname" class="artNtname" panelHeight="auto" style="width:100px">
				<option value='-1'>全部</option>
			</select>
			所属版块: 
			<select id="artPartName" class="easyui-combobox" panelHeight="auto" style="width:100px">
				<option value='1004,1005,1006,1007,1008'>全部</option>
				<option value="1004">法治视频</option>
				<option value="1005">法治动漫</option>
				<option value="1006">法治摄影</option>
				<option value="1007">法治书画</option>
				<option value="1008">法治小说</option>
			</select>
			按标题：<input id="artTitle" class="easyui-textbox" type="text" name="title" />
			<a href="javascript:void(0)" onclick="searchartAuto()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
			<a href="javascript:void(0)" onclick="resetart()" class="easyui-linkbutton" iconCls="icon-undo">重置</a>
			<div style="float: right; margin-right: 20px;">
			<a href="javascript:void(0)" onclick="addArtNews()" class="easyui-linkbutton"  iconCls="icon-add">添加</a>
			<a href="javascript:void(0)" onclick="delart()" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		</div>
		</div>
		
	</div>
	<!----------------- 搜索模块end ----------------->
<script type="text/javascript">
var ue=UE.getEditor('artEditor');//实例化编辑器
//显示模块开始---------------------------------------
var partid="1004,1005,1006,1007,1008";
var artObj;
artObj=$('#art_data').datagrid({
	url:'backs/getartByPage',
	queryParams: {
		partid: partid
	},
	fitColumns:true,
	fit:true,
	striped:true,
	loadMsg:"正在加载中...",
	pagination:true,
	pageNumber:1,
	pageSize:10,
	pageList:[10,20,30,40,50],
	remoteSort:false,
	sortName:'weight',
	toolbar:"#art_bar",
	columns:[[
		{field:'nid',sortable:true,align:'center',checkbox:true},
		{field:'ntname',title:'所属类型',width:200,align:'center',
			formatter:function(value,rowData,index){
				if(value==''||value==undefined){
					return "其它类型";
				}else{
					return value;
				}
	    	}	
		},
		{field:'partName',title:'所属版块',width:180,align:'center'},
		{field:'title',title:'标题',width:350,align:'center'},
		{field:'ndate',title:'修改时间',sortable:true,width:400,align:'center'},
		{field:'weight',title:'文章权重',width:300,align:'center',sortable:true,
			formatter: function(value,row,index){
				var str="";
				str+=value+"<a href='javascript:setartWeight("+row.nid+",1,"+row.weight+","+row.partid+")' style='margin-left:4px;'>置顶</a>"+
				"<a href='javascript:setartWeight("+row.nid+",2,"+row.weight+","+row.partid+")' style='margin-left:4px;'>上移</a>"+
				"<a href='javascript:setartWeight("+row.nid+",3,"+row.weight+","+row.partid+")' style='margin-left:4px;'>下移</a>"
				return str; 
			}	
		},
		
		
		{field:'views',title:'浏览次数',sortable:true,width:180,align:'center'},
		{field:'author',title:'作者来源',width:200,align:'center'},
		{field:'flag',title:'非注册可见',width:200,align:'center',
			formatter:function(value,rowData,index){
				if(rowData.status == "Y"){
					return '<select><option onclick="changeNewsFlag('+'\'Y\','+rowData.nid+')">是</option><option onclick="changeNewsFlag('+'\'N\','+rowData.nid+')">否</option></select>';
				}else if(rowData.status == "N"){
					return '<select><option onclick="changeNewsFlag('+'\'N\','+rowData.nid+')">否</option><option onclick="changeNewsFlag('+'\'Y\','+rowData.nid+')">是</option></select>';
				}
	    	}	
		},
		{field:'usname',title:'上传者',width:200,align:'center'},
		{field:'status',title:'是否可见',width:160,align:'center',
			formatter:function(value,rowData,index){
				if(rowData.status == "Y"){
					return '<select><option onclick="changeNewsStatus('+'\'Y\','+rowData.nid+')">是</option><option onclick="changeNewsStatus('+'\'N\','+rowData.nid+')">否</option></select>';
				}else if(rowData.status == "N"){
					return '<select><option onclick="changeNewsStatus('+'\'N\','+rowData.nid+')">否</option><option onclick="changeNewsStatus('+'\'Y\','+rowData.nid+')">是</option></select>';
				}
	    	}		
		},
		{field:'_operate',title:'操作',width:160,align:'center',
			formatter:function(value,rowData,index){
	    		return "<a href='javascript:newMore("+rowData.nid+")'>详细</a>";
	    	}	
		}  ]]

	
	});
	//加载类型
$('.artNtname').combobox({  
    url:'backs/getNewsTypeName',  
    valueField:'ntid',  
    textField:'ntname'  
});
//显示模块end--------------------------------------------	
//打开添加面板
function addArtNews(){
			$('#art_data_add').dialog({title:"添加",closed:false,modal:true,});
		
}
//绑定提交按钮
$('#submitartBtn').bind('click', function(){  
        
        var artNtnameAdd=$('#artNtnameAdd').combobox('getValue');
        var artPartNameAdd=$('#artPartNameAdd').combobox('getValue');
        var artTitleAdd=$('#artTitleAdd').textbox('getValue');
        var artAuthorAdd=$('#artAuthorAdd').textbox('getValue');
        var artWeightAdd=$('#artWeightAdd').numberspinner('getValue');
        var artFlagAdd=$('#artFlagAdd').combobox('getValue');
        if(artNtnameAdd==''||artPartNameAdd==''||artTitleAdd==''||artAuthorAdd==''||artWeightAdd==''||artFlagAdd==''){
        	$.messager.alert('提示信息','您填入的信息不合法或者填写不完整...','error');
        	return;
        }
        $.post("backs/addArtNews",{usid:$("#usid").val(),author:artAuthorAdd,flag:artFlagAdd,weight:artWeightAdd,content:ue.getContent(),nitid:artNtnameAdd,partid:artPartNameAdd,title:artTitleAdd},function(data){
        	if(data){
        		$.messager.show({
        			title:'成功提示',
        			msg:'添加成功',
        			timeout:3000,
        			showType:'slide'
        		});
        		$('#art_data').datagrid({
        			url:'backs/getartByPage',
        			queryParams: { partid: partid }});
        		
        	}else{
        		$.messager.alert('错误信息','上传出错，请重新上传...','error');
        	}
        },"json");
}); 
//更新权重
function setartWeight(nid,val,weight,partid){
	if(val==1){//置顶
		$.post("backs/setTop",{nid:nid,weight:weight,partid:partid},function(data){
			messageHandler("置顶",data);
		},"json");
	}else if(val==2){//上移
		$.post("backs/setUp",{nid:nid,weight:weight,partid:partid},function(data){
			messageHandler("上移",data);
		},"json");
	}else{//下移
		if(weight==0){
			$.messager.alert('提示信息','亲,权重最低为0..','info');
			return;
		}
		$.post("backs/setDown",{nid:nid},function(data){
			messageHandler("下移",data);
		},"json");
	}
}
//搜索
function searchartAuto(){
	 var data1=$('#artData1').datebox('getValue');
	var data2=$('#artData2').datebox('getValue');
	var ntname=$('#artNtname').combobox('getValue');
	var partName=$('#artPartName').combobox('getValue');
	var title=$('#artTitle').textbox('getValue');
	partid=partName;
	console.info(data1+data2+ntname+partName+title+partid); 


} 
//重置搜索表单
function resetart(){
	$('#artData1').datebox('setValue','');
	$('#artData2').datebox('setValue','');
	$('#artNtname').combobox('setValue','-1');
	$('#artNtname').combobox('setText','全部');
	$('#artPartName').combobox('setValue','1001，1002，1003');
	$('#artPartName').combobox('setText','全部');
	$('#artTitle').textbox('setValue','');
}
//权重消息提示封装函数
function messageHandler(action,data){
	if(data==1){
		$.messager.show({
			title:'成功提示',
			msg:'权重'+action+'成功',
			timeout:3000,
			showType:'slide'
		});
		$('#art_data').datagrid({
			url:'backs/getartByPage',
			queryParams: { partid: partid }});
	}else if(data==2){
		$.messager.alert('温馨提示','所属版块'+action+'已到最佳','info');
	}else{
		$.messager.alert('错误提示','操作失败...','error');
	}
}
//删除选中
function delart(){
	var rows=artObj.datagrid("getSelections");
		if(rows!=undefined&&rows!=''){
			$.messager.confirm('信息确认','您确定要删除选定的数据吗?', function(r){
				if (r){
					var nids="";
				for(var i=0;i<rows.length-1;i++){
					nids+=rows[i].nid+",";
				}
				nids+=rows[rows.length-1].nid;
				$.post("backs/delNews",{nids:nids},function(data){
					if(data){
						$.messager.show({
							title:'成功提示',
							msg:'删除成功',
							timeout:2000,
							showType:'slide'
						});
						rows=undefined;
						$('#art_data').datagrid({
							url:'backs/getartByPage',
							queryParams: { partid: partid }});//刷新表格
					}else{
						$.messager.alert('失败提示','删除失败','error');
					}
				});
				}
			});
		}else{
			$.messager.alert('温馨提示','请选择要删除的数据...','info');
		}
	}
	//更新是否登陆可见
	function changeNewsFlag(flag,nid){
		$.post("backs/changeNewsFlag",{flag:flag,nid:nid},function(data){
			if(data){
				$.messager.show({
					title:'成功提示',
					msg:'更新成功',
					timeout:2000,
					showType:'slide'
				});
			}else{
				$.messager.alert('错误提示','更新失败...','error');
				$('#art_data').datagrid({
					url:'backs/getartByPage',
					queryParams: { partid: partid }});
			}
		},"json");
	}
	//更新是否前台显示
	function changeNewsStatus(status,nid){
		$.post("backs/changeNewsStatus",{status:status,nid:nid},function(data){
			if(data){
				$.messager.show({
					title:'成功提示',
					msg:'更新成功',
					timeout:2000,
					showType:'slide'
				});
			}else{
				$.messager.alert('错误提示','更新失败...','error');
				$('#art_data').datagrid({
					url:'backs/getartByPage',
					queryParams: { partid: partid }});
			}
		},"json");
	}
</script>	