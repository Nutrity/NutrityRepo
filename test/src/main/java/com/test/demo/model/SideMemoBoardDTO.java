package com.test.demo.model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter@Setter
@AllArgsConstructor
public class SideMemoBoardDTO {
	private List<FoodList> flist;
	private DietBoard sideBoard;
}
