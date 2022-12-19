package com.test.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.demo.model.SuggestNutrient;

public interface SuggestNutrientRepository extends JpaRepository<SuggestNutrient, Long>{

	SuggestNutrient findByGender(String gender);
	
}
