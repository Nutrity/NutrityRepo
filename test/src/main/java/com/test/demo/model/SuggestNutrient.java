package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class SuggestNutrient {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long snum;
	private int age_range;
	private int gender;
	private double sg_kcal;
	private double sg_protein;
	private double sg_fat;
	private double sg_carb;
	private double sg_suger;
	private double sg_fiber;
	private double sg_calcium;
	private double sg_iron;
	private double sg_sodium;
	private double sg_vit_b1;
	private double sg_vit_b2;
	private double sg_vit_c;
	private double sg_satuated_fat;
	private double sg_trans_fat;
	
}
