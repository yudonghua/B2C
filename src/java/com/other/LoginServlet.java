/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.other;

import com.sql.Updata;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
                HttpSession session = request.getSession();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String psw =new Updata().findUsername(username);
		if(psw ==null){
                        session.setAttribute("username", null);
                        session.setAttribute("password", null);
                        request.setAttribute("msg", "账号不存在");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if(psw!=null&&!psw.equals(password)){
                        session.setAttribute("username", null);
                        session.setAttribute("password", null);
                        request.setAttribute("msg", "密码错误");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return;
		}
		if(psw.equals(password)){
                        request.setAttribute("username", username);
                        session.setAttribute("username", username);
			request.getRequestDispatcher("/index.jsp").forward(request, response);
 
			//response.setHeader("Refresh","1;url=welcome.jsp");
		}
		
	}

}

