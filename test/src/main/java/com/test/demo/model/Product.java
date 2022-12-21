package com.test.demo.model;

import javax.persistence.Embeddable;

import lombok.Data;

@Data
@Embeddable
public class Product {
	
	private Long amount;
	private String name;

}
