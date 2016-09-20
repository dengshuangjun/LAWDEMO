package com.yc.law.mapper;

import com.yc.law.entity.BasicContentPage;
import com.yc.law.entity.LawContent;

public interface FrontDataMapper {

	BasicContentPage getArtDataByPage(Integer pageSize, Integer pageNum,
			Integer partid, Integer usid);

	LawContent getMoreNewsContent(int nid);

}
