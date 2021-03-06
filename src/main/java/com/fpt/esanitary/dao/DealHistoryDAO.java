package com.fpt.esanitary.dao;

import com.fpt.esanitary.entities.DealHistory;

import java.util.List;

public interface DealHistoryDAO {

  List<DealHistory> findAll();

  List<DealHistory> findByUsername(String username);

  DealHistory findById(String dealHistoryId);

  List<DealHistory> findByOrderId(String orderId);

  void save(DealHistory dealHistory);

  void update(DealHistory dealHistory);

  void delete(DealHistory dealHistory);

  void deleteByOrderId(String orderId);
}
