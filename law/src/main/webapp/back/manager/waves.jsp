<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<table id="waves_data"></table>
<!-- -------- 添加模块begin------ -->
<div id="waves_data_add" data-options="iconCls:'icon-add',modal:true,closed:true,fit:true" style="padding:20px;">
	<div style="text-align: center">
		所属类型: 
		<select id="wavesNtnameAdd" class="wavesNtname" panelHeight="auto" style="width:100px">
			<option value='-1'>全部</option>
		</select>
		所属版块: 
		<select id="wavesPartNameAdd" class="easyui-combobox" panelHeight="auto" style="width:100px">
			<option value="1001">校园动态</option>
			<option value="1002">社会聚焦</option>
			<option value="1003">新闻调查</option>
			<option value="1004">法治视频</option>
			<option value="1005">法治动漫</option>
			<option value="1006">法治摄影</option>
			<option value="1007">法治书画</option>
			<option value="1008">法治小说</option>
			<option value="1009">法治名人</option>
			<option value="1010">法治故事</option>
			<option value="1011">法治典故</option>
			<option value="1012">法治名言</option>
			<option value="1013">法治灯谜</option>
			<option value="1014">法治楹联</option>
			<option value="1015">法治时评</option>
			<option value="1016">以案释法</option>
			<option value="1017">名人说法</option>
			<option value="1018">法规检索</option>
			<option value="1019">法理探索</option>
		</select>
		标题：<input id="wavesTitleAdd" class="easyui-textbox" type="text" name="title" />
		作者：<input id="wavesAuthorAdd" class="easyui-textbox" type="text" name="title" />
		权重：<input id="WavesWeightAdd" class="easyui-numberspinner" style="width:80px;" value="0" required="required" data-options="min:0,max:100,editable:false"/>  
		登陆才可见：<select id="wavesFlagAdd" class="easyui-combobox" style="width:50px;" panelHeight="auto" >
					<option value='Y'>是</option>
					<option value='N'>否</option>
				</select>
	</div>
	<p style="color: red;width:1024px;margin: 0 auto;padding:10px;">注意：以上都为必选或必填，否则不能添加或者提示添加失败...</p>
	<div>
	<script id="wavesEditor" type="text/plain" style="width:1024px;height:500px;text-align: center; margin: 20px auto;"></script>
	</div>
	<p style="text-align: center;">
	<input type="button" id="submitWavesBtn" value="提交上传"/><input type="button" id="resetWavesBtn" value="重置"/>
	</p> 
</div>  
<!-- -------- 添加模块end------ -->
<!----------------- 搜索模块begin ----------------->
<div id="waves_bar" style="padding:5px;height:auto">
		<div>
			按日期搜索从：<input id="wavesData1" class="easyui-datebox" style="width:100px">
			到: <input id="wavesData2" class="easyui-datebox" style="width:100px">
			所属类型: 
			<select id="wavesNtname" class="wavesNtname" panelHeight="auto" style="width:100px">
				<option value='-1'>全部</option>
			</select>
			所属版块: 
			<select id="wavesPartName" class="easyui-combobox" panelHeight="auto" style="width:100px">
				<option value='-1'>全部</option>
				<option value="1001">校园动态</option>
				<option value="1002">社会聚焦</option>
				<option value="1003">新闻调查</option>
				<option value="1004">法治视频</option>
				<option value="1005">法治动漫</option>
				<option value="1006">法治摄影</option>
				<option value="1007">法治书画</option>
				<option value="1008">法治小说</option>
				<option value="1009">法治名人</option>
				<option value="1010">法治故事</option>
				<option value="1011">法治典故</option>
				<option value="1012">法治名言</option>
				<option value="1013">法治灯谜</option>
				<option value="1014">法治楹联</option>
				<option value="1015">法治时评</option>
				<option value="1016">以案释法</option>
				<option value="1017">名人说法</option>
				<option value="1018">法规检索</option>
				<option value="1019">法理探索</option>
			</select>
			按标题：<input id="wavesTitle" class="easyui-textbox" type="text" name="title" />
			<a href="javascript:void(0)" onclick="searchWavesAuto()" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
			<a href="javascript:void(0)" onclick="resetWaves()" class="easyui-linkbutton" iconCls="icon-undo">重置</a>
			<div style="float: right; margin-right: 20px;">
			<a href="javascript:void(0)" onclick="addWavsNews()" class="easyui-linkbutton"  iconCls="icon-add">添加</a>
			<a href="javascript:void(0)" onclick="delWaves()" class="easyui-linkbutton" iconCls="icon-remove">删除</a>
		</div>
		</div>
		
	</div>
	<!----------------- 搜索模块end ----------------->
<script type="text/javascript">
if (typeof wavesUe != 'undefined') {  
	wavesUe.destroy();  
}
var wavesUe=UE.getEditor('wavesEditor');//实例化编辑器
//显示模块开始---------------------------------------
var partid;
var wavesObj;
wavesObj=$('#waves_data').datagrid({
	url:'backs/getWavesByPage',
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
	toolbar:"#waves_bar",
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
				str+=value+"<a href='javascript:setWavesWeight("+row.nid+",1,"+row.weight+","+row.partid+")' style='margin-left:4px;'>置顶</a>"+
				"<a href='javascript:setWavesWeight("+row.nid+",2,"+row.weight+","+row.partid+")' style='margin-left:4px;'>上移</a>"+
				"<a href='javascript:setWavesWeight("+row.nid+",3,"+row.weight+","+row.partid+")' style='margin-left:4px;'>下移</a>"
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
$('.wavesNtname').combobox({  
    url:'backs/getNewsTypeName',  
    valueField:'ntid',  
    textField:'ntname'  
});
//显示模块end--------------------------------------------	
//打开添加面板
function addWavsNews(){
			$('#waves_data_add').dialog({title:"添加",closed:false,modal:true,});
		
}
//绑定提交按钮
$('#submitWavesBtn').bind('click', function(){  
        
        var wavesNtnameAdd=$('#wavesNtnameAdd').combobox('getValue');
        var wavesPartNameAdd=$('#wavesPartNameAdd').combobox('getValue');
        var wavesTitleAdd=$('#wavesTitleAdd').textbox('getValue');
        var wavesAuthorAdd=$('#wavesAuthorAdd').textbox('getValue');
        var WavesWeightAdd=$('#WavesWeightAdd').numberspinner('getValue');
        var wavesFlagAdd=$('#wavesFlagAdd').combobox('getValue');
        if(wavesNtnameAdd==''||wavesPartNameAdd==''||wavesTitleAdd==''||wavesAuthorAdd==''||WavesWeightAdd==''||wavesFlagAdd==''){
        	$.messager.alert('提示信息','您填入的信息不合法或者填写不完整...','error');
        	return;
        }
        $.post("backs/addWavsNews",{usid:$("#usid").val(),author:wavesAuthorAdd,flag:wavesFlagAdd,weight:WavesWeightAdd,content:wavesUe.getContent(),nitid:wavesNtnameAdd,partid:wavesPartNameAdd,title:wavesTitleAdd},function(data){
        	if(data){
        		$.messager.show({
        			title:'成功提示',
        			msg:'添加成功',
        			timeout:3000,
        			showType:'slide'
        		});
        		$('#waves_data').datagrid({
        			url:'backs/getWavesByPage'});
        		wavesUe.setContent("");
        	}else{
        		$.messager.alert('错误信息','上传出错，请重新上传...','error');
        	}
        },"json");
}); 
//更新权重
function setWavesWeight(nid,val,weight,partid){
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
function searchWavesAuto(){
	 var time1=$('#wavesData1').datebox('getValue');
	var time2=$('#wavesData2').datebox('getValue');
	var ntname=$('#wavesNtname').combobox('getValue');
	var partName=$('#wavesPartName').combobox('getValue');
	var title=$('#wavesTitle').textbox('getValue');
	partid=partName;
		$('#waves_data').datagrid('load',{time1:time1,time2:time2,nitid:ntname,partid:partName,title:title});  
	
} 
//重置搜索表单
function resetWaves(){
	$('#wavesData1').datebox('setValue','');
	$('#wavesData2').datebox('setValue','');
	$('#wavesNtname').combobox('setValue','-1');
	$('#wavesNtname').combobox('setText','全部');
	$('#wavesPartName').combobox('setValue','-1');
	$('#wavesPartName').combobox('setText','全部');
	$('#wavesTitle').textbox('setValue','');
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
		$('#waves_data').datagrid({
			url:'backs/getWavesByPage',
			queryParams: { partid: partid }});
	}else if(data==2){
		$.messager.alert('温馨提示','所属版块'+action+'已到最佳','info');
	}else{
		$.messager.alert('错误提示','操作失败...','error');
	}
}
//删除选中
function delWaves(){
	var rows=wavesObj.datagrid("getSelections");
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
						$('#waves_data').datagrid({
							url:'backs/getWavesByPage',
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
				$('#waves_data').datagrid({
					url:'backs/getWavesByPage',
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
				$('#waves_data').datagrid({
					url:'backs/getWavesByPage',
					queryParams: { partid: partid }});
			}
		},"json");
	}
</script>	