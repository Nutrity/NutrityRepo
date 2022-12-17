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
	private String madeby;
	private double kcal;
	private double car;
	private double protein;
	private double fat;
	private double suger;
	private double sodium;
	private double trans_fat;
	private double calcium;
	private double vit_c;
	private double iron;
	private int gram;
	private double fiber;
	private double vit_b1;
	private double vit_b2;
	private double satuated_fat;

}
