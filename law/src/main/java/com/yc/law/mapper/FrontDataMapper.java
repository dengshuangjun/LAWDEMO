package com.yc.law.mapper;

import com.yc.law.entity.BasicContentPage;

public interface FrontDataMapper {

	BasicContentPage getArtDataByPage(Integer pageSize, Integer pageNum,
			Integer partid, Integer usid);

}
