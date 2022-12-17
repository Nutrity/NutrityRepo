package com.test.demo.model;

import javax.persistence.Embeddable;
import org.springframework.lang.Nullable;

import lombok.Data;

@Data
@Embeddable
public class Address {
	 	
	private String address1;
	@Nullable
	private String address2;
	private String zipcode;

}
