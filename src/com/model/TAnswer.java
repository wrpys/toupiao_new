package com.model;

public class TAnswer implements java.io.Serializable{
	
	private static final long serialVersionUID = 8591438446498104384L;
	
	private Integer answerId;
	
	private String answerContent;
	
	private Long subjectId;
	
	private Integer subjectRelId;

	public Integer getAnswerId() {
		return answerId;
	}

	public void setAnswerId(Integer answerId) {
		this.answerId = answerId;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public Long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(Long subjectId) {
		this.subjectId = subjectId;
	}

	public Integer getSubjectRelId() {
		return subjectRelId;
	}

	public void setSubjectRelId(Integer subjectRelId) {
		this.subjectRelId = subjectRelId;
	}
	
}
