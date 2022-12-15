package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.FoodList;

public interface FoodRepository extends JpaRepository<FoodList, String>{

	List<FoodList> findByFoodname(String foodname);
	
}
