package com.beans.pkg;

import java.io.Serializable;

public class QuestionBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private String question;

	public String getQuestion() {
		return question;
	}

	public void setResNum(String question) {
		this.question = question;
	}

}
