package com.yc.law.service;

import com.yc.law.entity.BasicContentPage;

public interface FrontDataService {

	BasicContentPage getArtDataByPage(Integer pageSize, Integer pageNum,
			Integer partid, Integer usid);

}
