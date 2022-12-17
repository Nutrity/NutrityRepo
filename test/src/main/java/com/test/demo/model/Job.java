package com.test.demo.model;

import javax.persistence.Embeddable;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;

import lombok.Data;


@Data
@Embeddable
@DynamicInsert
public class Job {
			
	@ColumnDefault("'ROLE_USER'")
	private String role;
	
	private String job;
	private String qualName;
}
