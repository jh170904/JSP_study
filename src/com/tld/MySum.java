package com.tld;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class MySum extends TagSupport{

	private static final long serialVersionUID = 1L;
	
	private String su;
	private String defaultValue;
	
	public void setSu(String su){
		this.su = su;
	}
	public void SetDefaultValue(String defaultValue){
		this.defaultValue = defaultValue;
	}
	
	@Override
	public int doStartTag() throws JspException {
		
		JspWriter out = pageContext.getOut();
		
		try {
			String value = su;
			
			if(value==null){
				value = defaultValue;
			}
			//<sum:s su=""/>
			if(value==null||value.equals("")){
				value = "0"; //인수를 적지 않았을때 0 기입
			}
			
			int s = 0;
			for(int i=0;i<=Integer.parseInt(value);i++){
				s += i;
			}
			
			out.print(s);
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return SKIP_BODY;
	}
}
