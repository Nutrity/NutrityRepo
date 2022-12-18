package com.test.demo.model;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.lang.Nullable;

import lombok.Data;
import lombok.Getter;

@Getter
@Embeddable
public class Address {
	 
	private String address1;
	@Nullable
	private String address2;
	private String zipcode;
	
	public Address() {
		
	}
	
	public Address(String address1, String address2, String zipcode) {
		this.address1 = address1;
		this.address2 = address2;
		this.zipcode = zipcode;
	}

}
