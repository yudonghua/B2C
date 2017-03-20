/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.other;

import com.sql.Updata;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 *
 * @author PC
 */
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
                HttpSession session = request.getSession();
		String customer = request.getParameter("customer");
                String id = request.getParameter("id");
                String comment = request.getParameter("comment");
                new Updata().addcomment(id, customer, comment);
                request.getRequestDispatcher("/index.jsp").forward(request, response);

		
	}
//            public static void main(String[] args) {
//                String author="YHD";
//                String title="uuuu";
//                String conment="fdsf";
//                String name="sdfs";
//                Conment c = new Conment();
//		c.addconment(author,title,conment,name);
//		
//	}

}

