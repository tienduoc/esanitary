package com.fpt.esanitary.service;

import com.fpt.esanitary.dao.DealHistoryDetailDAO;
import com.fpt.esanitary.entities.DealHistoryDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DealHistoryDetailSeviceImpl implements DealHistoryDetailService {

  @Autowired
  private DealHistoryDetailDAO dealHistoryDetailDAO;

  @Override
  public List<DealHistoryDetail> findByDealHistoryId(String dealHistoryId) {
    return dealHistoryDetailDAO.findByDealHistoryId(dealHistoryId);
  }

  @Override
  public List<DealHistoryDetail> findByUsername(String username) {
    return dealHistoryDetailDAO.findByUsername(username);
  }

  @Override
  public void save(DealHistoryDetail dealHistoryDetail) {
    dealHistoryDetailDAO.save(dealHistoryDetail);
  }

  @Override
  public void update(DealHistoryDetail dealHistoryDetail) {
    dealHistoryDetailDAO.update(dealHistoryDetail);
  }
}
