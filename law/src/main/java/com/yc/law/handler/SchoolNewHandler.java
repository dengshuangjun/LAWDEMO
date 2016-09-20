package com.yc.law.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.law.entity.LawContent;
import com.yc.law.service.SchoolNewsService;
import com.yc.law.service.WaveNewsService;

@Controller
@RequestMapping("/school")
public class SchoolNewHandler {
	
	@Autowired
	private  SchoolNewsService schoolNewsService;
	
	@RequestMapping("/getSchoolNewsTotal")
	@ResponseBody
	public int getWaveNewsTotal(@RequestParam("law_Partid") String partId){
		return schoolNewsService.getSchoolNewsTotal(Integer.parseInt(partId));
	}
	
	@RequestMapping("/findSchoolNewsByPage")
	@ResponseBody
	public List<LawContent> findSchoolNewsByPage(@RequestParam("law_Partid") Integer partId,
								  @RequestParam("pageNum") Integer pageNum,
								  @RequestParam("pageSize") Integer pageSize){
		return schoolNewsService.findSchoolNewsByPages(partId,pageNum,pageSize);
	}
	
	/*
	@RequestMapping(value="/findWaveContentByNid",params="nid")
	public String findWaveContentByNid(@RequestParam("nid") int nid,ModelMap map){
		LawContent lawContent = schoolNewsService.findWaveContentByNid(nid);
		map.put("waveNewsContent", lawContent);
		return "forward:../front/wave/news.jsp?nid="+nid;
	}*/
}
