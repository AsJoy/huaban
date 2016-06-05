package com.huaban.action;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("userInvalidate")
@Scope("prototype")
public class UserInvalidate extends ActionSupport
{
	public String userInvalidate(){
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
}
