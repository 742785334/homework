package edu.homework.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tb_department")
public class Department implements Comparable<Department>{

	private int departNumber;
	private String departName;
	private String departMnemonic;
	private String departLeading;
	private String departProperty;

	@Id
	@Column(name = "depart_number")
	public int getDepartNumber() {
		return departNumber;
	}

	public void setDepartNumber(int departNumber) {
		this.departNumber = departNumber;
	}

	@Column(name = "depart_name")
	public String getDepartName() {
		return departName;
	}

	public void setDepartName(String departName) {
		this.departName = departName;
	}

	@Column(name = "depart_mnemonic")
	public String getDepartMnemonic() {
		return departMnemonic;
	}

	public void setDepartMnemonic(String departMnemonic) {
		this.departMnemonic = departMnemonic;
	}

	@Column(name = "depart_leading", nullable = true)
	public String getDepartLeading() {
		return departLeading;
	}

	public void setDepartLeading(String departLeading) {
		this.departLeading = departLeading;
	}

	@Column(name = "depart_property", nullable = true)
	public String getDepartProperty() {
		return departProperty;
	}

	public void setDepartProperty(String departProperty) {
		this.departProperty = departProperty;
	}

	public int compareTo(Department dep) {
		
		if(this.departNumber>dep.departNumber)
			return 1;
		else if(this.departNumber<dep.departNumber)
			return -1;
		else
			return 0;
		
		
	}

}
