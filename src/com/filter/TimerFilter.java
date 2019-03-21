package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;


public class TimerFilter implements Filter{
	
	//����
	//���ʹ� �� ���ø����̼ǿ��� ����ϴ� �����̳� JSP��
	//�����ϱ� ���� Request�� ������ ������ �� �����̳� JSP�� �����ϴ� ���
	//�ַ� ������ ���� ����ϰ� ��û������ ���ڵ��۾� � ���
	
	//Ư�� �������� ������ �� ��, �������� ��ȸ�Ǵ� �ð��� ���͸� ���� ��ȸ�ϰ��� �� 
	private FilterConfig config;

	@Override
	public void destroy() {
		//3. ���Ϳ��� ������ ����
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		//2. �����۾�
		
		long before = System.currentTimeMillis(); //���۽ð�
		
		chain.doFilter(request, response);
		
		long after = System.currentTimeMillis(); //����ð�
		
		String uri;
		if(request instanceof HttpServletRequest){
			//downcast
			HttpServletRequest req = (HttpServletRequest)request;
			
			uri = req.getRequestURI();
			//config.getServletContext().log(uri+":"+(after-before)+"ms");//�α� ����� ���
			System.out.println(uri+":"+(after-before)+"ms");
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		//1. ���Ϳ� ���ö� ó������
		this.config = config;
	}
	
}
