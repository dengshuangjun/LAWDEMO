package com.yc.law.service;

import com.yc.law.entity.BasicContentPage;
import com.yc.law.entity.LawContent;

public interface FrontDataService {

	BasicContentPage getArtDataByPage(Integer pageSize, Integer pageNum,
			Integer partid, Integer usid);

	LawContent getMoreNewsContent(int nid);

}
