package com.test.demo.model;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import lombok.Data;
import lombok.Getter;

@Getter
@Embeddable
@DynamicInsert
public class Job {
		
	@ColumnDefault("'ROLE_USER'")
	private String role;	
	private String job;
	private String qualName;
}
