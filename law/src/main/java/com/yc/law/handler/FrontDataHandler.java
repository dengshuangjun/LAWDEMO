package com.yc.law.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.law.entity.BasicContentPage;
import com.yc.law.service.FrontDataService;

@Controller
@RequestMapping("/fronts")
public class FrontDataHandler {
	
	@Autowired
	private FrontDataService frontDataService;
	
	@RequestMapping("/getArtDataByPage")
	@ResponseBody
	public BasicContentPage getArtDataByPage(Integer pageSize,Integer pageNum,Integer partid,Integer usid){
		BasicContentPage result = frontDataService.getArtDataByPage(pageSize,pageNum,partid,usid);
		if(result!=null){
			if(result.getTotal()%pageSize==0){
				result.setTotal(result.getTotal()/pageSize);
			}else{
				result.setTotal(((int)(result.getTotal()/pageSize))+1);
			}
		}
		return result;
	}
}
