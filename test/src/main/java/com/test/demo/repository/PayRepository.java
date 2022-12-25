package com.test.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.PayInfo;

public interface PayRepository extends JpaRepository<PayInfo, Long>{

}
