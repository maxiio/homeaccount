package com.zoutong.homeaccount.service;

import java.util.List;

import com.zoutong.homeaccount.entity.Region;

public interface RegionService {

	public List<Region> findAll();

	public Region findById(Integer region_id);

	public void save(Region region);

	public void update(Region region);

	public void delete(String region_ids);

}
