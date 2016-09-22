package com.yc.law.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yc.law.entity.LeaveMsg;
import com.yc.law.service.MessagesService;
import com.yc.law.util.FindIP;

@Controller
@RequestMapping("/messages")
public class MessageHandler {

	@Autowired
	MessagesService messagesService;

	@RequestMapping("/findMessages")
	@ResponseBody
	public JSONObject findMessages(@RequestParam("page") int page,@RequestParam("rows") int rows) {
		List<LeaveMsg> flist = messagesService.findMessageByPage(page, rows);
		JSONArray json = JSONArray.fromObject(flist);
		JSONObject jb = new JSONObject();
		jb.put("rows", json);
		jb.put("total", messagesService.findAllMessageCount());
		return jb;
	}

	@RequestMapping("/showMore")
	@ResponseBody
	public LeaveMsg showMore(@RequestParam("mid") int mid) {
		LeaveMsg lm=null;
		try {
			lm = messagesService.findMessageInfo(mid);
			return lm;
		} catch (Exception e) {
			LogManager.getLogger().error("展示更多失败。",e);
		}
		return lm;
	}

	@RequestMapping("/insertMsg")
	@ResponseBody
	public boolean  insertMsg(LeaveMsg leaveMsg,HttpServletRequest request) {
		try {
			if(null != leaveMsg){
				//日期转型
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				leaveMsg.setMtime( sdf.format(new Date()) );
				//记录IP
				leaveMsg.setMip( FindIP.findRealIp(request) );
				//System.out.println(leaveMsg);
				int result = messagesService.insertMsg(leaveMsg);
				if(result==1){
					return true;
				}
			}
			return false;
		} catch (Exception e) {
			LogManager.getLogger().error("插入留言失败。",e);
			return false;
		}
	}
}
