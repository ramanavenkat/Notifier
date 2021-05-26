package com.Notifier;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class loginSetup
 */
@WebServlet("/loginSetup")
public class loginSetup extends HttpServlet {
//	private Connection con;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginSetup() {
        super();
        // TODO Auto-generated constructor stub
    }
    private databaseCon d;
    public void init(){
    	String driver="com.mysql.cj.jdbc.Driver";
		String conurl="jdbc:mysql://localhost:3306/";
		String database="Notifier";
		String userid="root";
		String pwds="Radha@6420";
		d=new databaseCon(driver,conurl,database,userid,pwds);
		System.out.println("Connected");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			d.resultData(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}

}
