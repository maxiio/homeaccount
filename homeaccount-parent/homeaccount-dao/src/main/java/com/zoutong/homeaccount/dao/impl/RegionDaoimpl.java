package com.zoutong.homeaccount.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Repository;

import com.zoutong.homeaccount.dao.RegionDao;
import com.zoutong.homeaccount.dao.base.impl.BaseDaoImpl;
import com.zoutong.homeaccount.entity.Region;
import com.zoutong.homeaccount.utils.PageBean;
@Repository
public class RegionDaoimpl extends BaseDaoImpl<Region> implements RegionDao {

}
