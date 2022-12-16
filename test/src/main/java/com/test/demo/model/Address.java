package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.lang.Nullable;

import lombok.Data;

@Data
@Entity
public class Address {
	 
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long addrnum;
	private String address1;
	@Nullable
	private String address2;
	private String zipcode;

}
