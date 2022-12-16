package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.ColumnDefault;

import lombok.Data;

@Data
@Entity
public class Job {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long jnum;
	
	@ColumnDefault("User")
	private String role;
	
	private String job;
	private String qual_name;
}
