package com.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		String loginName=request.getParameter("loginName");
		String password=request.getParameter("password");
		
		if(loginName=="zhangping" && password=="soft"){
			
			System.out.println("��½�ɹ���");
		}else{
			
			System.out.println("��½ʧ�ܣ�");
		}
		
	
	}


	
}
