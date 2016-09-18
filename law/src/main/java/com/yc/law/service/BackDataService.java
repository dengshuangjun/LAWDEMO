package com.yc.law.service;

import java.util.List;

import com.yc.law.entity.AddContent;
import com.yc.law.entity.EasyType;
import com.yc.law.entity.LawContentPage;
import com.yc.law.entity.Type;
import com.yc.law.entity.TypePage;
import com.yc.law.entity.User;

public interface BackDataService {

	TypePage getTypeByPage(TypePage typePage);

	boolean addTypes(Type type);

	int delTypes(List<Integer> list);

	boolean updateType(Type type);
	
	int updateGeneralUser(User user);

	LawContentPage getWavesByPage(LawContentPage lawContentPage);

	int findMaxWeightFromNews(int partid,int nid);

	int setTop(int nid, int i);

	int setDown(int nid);

	boolean delNews(String nids);

	boolean changeNewsFlag(String flag, int nid);

	boolean changeNewsStatus(String status, int nid);

	List<EasyType> getNewsTypeName();

	boolean addWavsNews(AddContent addContent);

}
