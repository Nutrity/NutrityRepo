package com.test.demo.model;

import javax.persistence.Embeddable;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.DynamicInsert;
import org.springframework.web.multipart.MultipartFile;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Embeddable
@DynamicInsert
public class Job {
		
	@ColumnDefault("'ROLE_USER'")
	private String role;	
	private String job;
	
	@Transient
	private MultipartFile upload;
	private String qualName;
	
	

}
