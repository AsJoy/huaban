package com.huaban.exception;

public class CaijiException extends RuntimeException
{

	public CaijiException()
	{
		super();
	}

	public CaijiException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace)
	{
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public CaijiException(String message, Throwable cause)
	{
		super(message, cause);
	}

	public CaijiException(String message)
	{
		super(message);
	}

	public CaijiException(Throwable cause)
	{
		super(cause);
	}

}
