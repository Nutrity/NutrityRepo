package com.test.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class Job {
	@Id
	private String role;
	private String job;
	private String qual_name;
	

}
