package com.test.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{

}
