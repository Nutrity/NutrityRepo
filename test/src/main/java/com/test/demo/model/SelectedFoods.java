package com.test.demo.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Entity
public class SelectedFoods {

	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long fnum;
	private int ex;
	
	@ManyToOne
	@JoinColumn(name = "bnum")
	private DietBoard dietBoard;
	 
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "foodcode")
	private FoodList foodList;
	
}
