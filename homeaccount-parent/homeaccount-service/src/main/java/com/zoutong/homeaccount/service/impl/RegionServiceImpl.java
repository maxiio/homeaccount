package com.zoutong.homeaccount.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zoutong.homeaccount.dao.RegionDao;
import com.zoutong.homeaccount.entity.Region;
import com.zoutong.homeaccount.service.RegionService;
@Service
@Transactional
public class RegionServiceImpl implements RegionService {

	@Autowired
	private RegionDao regionDao;

	//查找所有大区
	public List<Region> findAll() {
		return regionDao.findAll();
	}

	@Override
	public Region findById(Integer region_id) {
		return regionDao.findById(region_id);
	}

	@Override
	public void save(Region region) {
		regionDao.save(region);
	}

	@Override
	public void update(Region region) {
		regionDao.update(region);
	}

	//批量删除
	public void delete(String region_ids) {
		System.out.println("============删除region==========");
		String[] regionIds = region_ids.split(",");
		for (String region_id : regionIds) {
			regionDao.executeUpdate("region.delete", Integer.parseInt(region_id));
		}
	}
}
