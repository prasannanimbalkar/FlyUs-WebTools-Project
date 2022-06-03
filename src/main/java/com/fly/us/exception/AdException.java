package com.fly.us.exception;

@SuppressWarnings("serial")
public class AdException extends Exception {

	public AdException(String message) {
		super(message);
	}

	public AdException(String message, Throwable cause) {
		super(message, cause);
	}

}
