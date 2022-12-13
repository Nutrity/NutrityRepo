package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data 
@Entity
public class FoodList {
	@Id
	private String foodcode;
	private String foodname;
	private String category;
	private String cate_detail;
	private String madeby;
	private int gram;
	private double kcal;
	private double protein;
	private double fat;
	private double carb;
	private double suger;
	private double fiber;
	private double calcium;
	private double iron;
	private double sodium;
	private double vit_b1;
	private double vit_b2;
	private double vit_c;
	private double satuated_fat;
	private double trans_fat;

}
