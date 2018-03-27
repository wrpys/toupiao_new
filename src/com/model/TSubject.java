package com.model;

/**
 * 
 * @author CZX
 *
 */
public class TSubject implements java.io.Serializable{
	
	private static final long serialVersionUID = -5462243924960629520L;
	
	private Long subjectId;
	
	private String subjectTitle;
	
	private Integer subjectType;
	
	private String wenjuanId;

	public Long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}

	public String getSubjectTitle() {
		return subjectTitle;
	}

	public void setSubjectTitle(String subjectTitle) {
		this.subjectTitle = subjectTitle;
	}

	public Integer getSubjectType() {
		return subjectType;
	}

	public void setSubjectType(Integer subjectType) {
		this.subjectType = subjectType;
	}

	public String getWenjuanId() {
		return wenjuanId;
	}

	public void setWenjuanId(String wenjuanId) {
		this.wenjuanId = wenjuanId;
	}

}
