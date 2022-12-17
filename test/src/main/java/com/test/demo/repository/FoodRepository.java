package com.test.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.test.demo.model.FoodList;

public interface FoodRepository extends JpaRepository<FoodList, String>{

	@Query(value =  "select * from food_list where foodname like CONCAT('%',:foodname,'%') order by foodcode desc", nativeQuery = true)
	List<FoodList> findByFoodnameDesc(String foodname);
	
	@Query(value =  "select * from food_list where foodname like CONCAT('%',:foodname,'%')", nativeQuery = true)
	List<FoodList> findByFoodname(String foodname);
	
	FoodList findByFoodcode(String foodcode);
	
}
