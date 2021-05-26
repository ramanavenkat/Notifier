package com.Notifier;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class databaseCon {
	private String driver;
	private String conurl;
	private String database;
	private String userid;
	private String pwds;
	private String password=" ";
	public String name;
	public String email;
	public String Email;
	public String Id;
	public String Id1;
	public int Id2;
	public String NoteBId;
	public String studentId;
	public int id1;
	public String sId;
	public String NBId;
	public int temp;
	public String NIBd;
	public String NDID;
	public int count;
	public List<NoteBookObject> l1=new ArrayList<>();
	
	public databaseCon(String driver,String conurl,String database,String userid,String pwds){
		this.driver=driver;
		this.conurl=conurl;
		this.database=database;
		this.userid=userid;
		this.pwds=pwds;
		connection(this.driver,this.conurl,this.database,this.userid,this.pwds);
	}
	private Connection con;
	protected void connection(String driver,String conurl,String database,String userid,String pwds){
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(conurl+database,userid,pwds);
			System.out.println("Successfull connected");
		}catch(Exception e){
			System.out.print(e);
			e.printStackTrace();
		}
	}
	protected void insertData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String firstname=request.getParameter("fname");
		String lastname=request.getParameter("lname");
		String email=request.getParameter("email");
		String psw=request.getParameter("psw");
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("insert into dataUser(firstname,lastname,email,psw)values('"+firstname+"','"+lastname+"','"+email+"','"+psw+"')");
		System.out.println("Data inserted successfull"+i);
		if(i>0){
			RequestDispatcher dispatcher=request.getRequestDispatcher("/loginPage.jsp");
			dispatcher.forward(request, response);
		}
	}
	protected void resultData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String Email=request.getParameter("email");
		String psw=request.getParameter("psw");
		Statement stmt=con.createStatement();
		System.out.println(psw+" "+Email);
		ResultSet rs=stmt.executeQuery("select psw from dataUser where email='"+Email+"'");
		rs.next();
		password=rs.getString("psw");
//		System.out.println(password);
		if(password.equals(psw)){
//			System.out.println(psw+" "+password);
			ResultSet rw=stmt.executeQuery("select firstname,email,studentId from dataUser where email='"+Email+"'");
			while(rw.next()){	
				name=rw.getString("firstname");
				email=rw.getString("email");
				Id=rw.getString("studentId");
			}
			System.out.println(Id);
			Cookie ck16=new Cookie("user",name);
			System.out.println(name);
			Cookie ck17=new Cookie("email",email);
			System.out.println(email);
			Cookie ck18=new Cookie("Id",Id);
			response.addCookie(ck16);
			System.out.println(name);
			response.addCookie(ck17);
			System.out.println(name);
			response.addCookie(ck18);
			response.sendRedirect("NoteBookdata");
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/mainPage1.jsp");
//			dispatcher.forward(request,response);
		}
		else{
			RequestDispatcher dispatcher=request.getRequestDispatcher("/loginPage.jsp");
			dispatcher.forward(request,response);
		}
	}
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String firstname=request.getParameter("firstname");
		String lastname=request.getParameter("lastname");
		String psw=request.getParameter("psw");
		Cookie ck[]=request.getCookies();
//		System.out.println("hi Cookie");
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("email")){
				Email=ck[i].getValue();
			}
		}
//		System.out.println("cookie is got"+Email);
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("update dataUser set firstname='"+firstname+"',lastname='"+lastname+"',psw='"+psw+"' where email='"+Email+"'");
		System.out.println("Updated successfully");
		Cookie ck3=new Cookie("user",firstname);
		response.addCookie(ck3);
		if(i>0){
			response.sendRedirect("NoteBookdata");
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/mainPage1.jsp");
//			dispatcher.forward(request,response);
		}		
	}
	protected void insertNoteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String NoteBookName=request.getParameter("bookName");
		System.out.println(NoteBookName);
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("Id")){
				Id1=ck[i].getValue();
			}
		}
		System.out.println(Id1);
		Statement stmt1=con.createStatement();
		Statement stmt2=con.createStatement();
		int i=stmt1.executeUpdate("insert into NoteBookTable (studentId,NoteBookname) values ('"+Id1+"','"+NoteBookName+"')");
		ResultSet rs=stmt2.executeQuery("select NoteBookId from NoteBookTable where NoteBookname='"+NoteBookName+"'");
		rs.next();
		String NoteBookId=rs.getString("NoteBookId");
		Cookie ck8=new Cookie("NoteBookId",NoteBookId);
		response.addCookie(ck8);
		if(i>0){
			response.sendRedirect("NoteBookdata");
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/mainPage1.jsp");
//			dispatcher.forward(request,response);
		}
	}
	protected void insertNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String notesName=request.getParameter("notesName");
		String startDate=request.getParameter("sDate");
		String EndDate=request.getParameter("eDate");
		String remainderDate=request.getParameter("rDate");
		String status=request.getParameter("status");
		String tag=request.getParameter("tag");
		String des=request.getParameter("des");
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("NoteBookId")){
				NoteBId=ck[i].getValue();
			}
			if(ck[i].getName().equals("Id")){
				studentId=ck[i].getValue();
			}
		}
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("insert into Notes (studentId,NoteBookId,Nname,startDate,endDate,remainderDate,status,tag,description) values ('"+studentId+"','"+NoteBId+"','"+notesName+"','"+startDate+"','"+EndDate+"','"+remainderDate+"','"+status+"','"+tag+"','"+des+"')");
		if(i>0){
			response.sendRedirect("Notesdata");
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/NotesPage.jsp");
//			dispatcher.forward(request,response);
		}
	}
	protected void getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		List<NoteBookObject> l1=new ArrayList<>();
		Statement stmt1=con.createStatement();
		Statement stmt2=con.createStatement();
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("Id")){
				Id1=ck[i].getValue();
			}
		}
//		System.out.println("hiiii"+Id1);
		ResultSet rs=stmt1.executeQuery("select NoteBookName,NoteBookId from NoteBookTable where studentId="+Id1+"");
//		System.out.println("Data got....");
		while(rs.next()){
			System.out.println("virtus");
			String s1=rs.getString("NoteBookName");
		    Id2=rs.getInt("NoteBookId");
			id1=Integer.parseInt(Id1);
			System.out.println("hi"+s1);
			ResultSet rw=stmt2.executeQuery("select count(*) as a from Notes where NoteBookId in (select NoteBookId from NoteBookTable where NoteBookName='"+s1+"')");
			while(rw.next()){
				count=rw.getInt("a");
			}
			System.out.println(count);
			NoteBookObject n1=new NoteBookObject(id1,Id2,s1,count);
//			System.out.println(s1);
			l1.add(n1);	
		}
		request.setAttribute("NoteBookList", l1);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/mainPage1.jsp");
		dispatcher.forward(request,response);
	}
//	protected void count(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
//		System.out.println("hi venkat");
//		stmt.getMoreResults();
//		ResultSet rw=stmt.executeQuery("select * from Notes where NoteBookId="+Id2+"");
//		rw.last();
//		System.out.println(rw.getRow());
//		
//	}
	protected void updateNoteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String NoteBookName=request.getParameter("bookName");
		String BookId=request.getParameter("noteBookId");
		Statement stmt=con.createStatement();
		System.out.println(BookId+" "+NoteBookName);
		int i=stmt.executeUpdate("update NoteBookTable set NoteBookName='"+NoteBookName+"' where NoteBookId="+BookId+"");
		if(i>0){
			response.sendRedirect("NoteBookdata");
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/mainPage1.jsp");
//			dispatcher.forward(request,response);
		}
		
	}
	protected void NotesData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		List<NotesObject> l2=new ArrayList<>();
		List<NotesObject> l8=new ArrayList<>();
		Statement stmt1=con.createStatement();
		Statement stmt2=con.createStatement();
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("Id")){
				Id1=ck[i].getValue();
			}
		}
		ResultSet rs=stmt1.executeQuery("select * from Notes where studentId="+Id1+" ");
		while(rs.next()){
			int NId=rs.getInt("NoteId");
			String name=rs.getString("Nname");
			Date sDate=rs.getDate("startDate");
			Date eDate=rs.getDate("endDate");
			Date rDate=rs.getDate("remainderDate");
			String status=rs.getString("status");
			String tag=rs.getString("tag");
			String des=rs.getString("description");
			NotesObject n2=new NotesObject(NId,name,sDate,eDate,rDate,status,tag,des);
			l2.add(n2);
		}
		request.setAttribute("NotesList", l2);
		ResultSet rp=stmt2.executeQuery("select * from Notes where studentId="+Id1+"&& remainderDate='"+java.time.LocalDate.now()+"'");
		while(rp.next()){
			int nId=rp.getInt("NoteId");
			String Name=rp.getString("Nname");
			Date sdate=rp.getDate("startDate");
			Date edate=rp.getDate("endDate");
			Date rdate=rp.getDate("remainderDate");
			String Status=rp.getString("status");
			String tag=rp.getString("tag");
			String des=rp.getString("description");
			NotesObject n8=new NotesObject(nId,Name,sdate,edate,rdate,Status,tag,des);
			l8.add(n8);
		}
		request.setAttribute("count", l8.size());
		request.setAttribute("Remainder", l8);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/NotesPage.jsp");
		dispatcher.forward(request,response);
	}
	protected void deleteNoteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id7=request.getParameter("notBookId");
		System.out.println(id7);
		Statement stmt=con.createStatement();
		int j =stmt.executeUpdate("delete from Notes where NoteBookId="+id7+"");
		System.out.println("Hi Notes deleted");
		int i=stmt.executeUpdate("delete from NoteBookTable where NoteBookId="+id7+"");
		if(i>0 || j>0){
			response.sendRedirect("NoteBookdata");
		}
	}
	protected void editNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id8=request.getParameter("Id");
		String nam=request.getParameter("notesName");
		String sdate=request.getParameter("sDate");
		String edate=request.getParameter("eDate");
		String rdate=request.getParameter("rDate");
		String sta=request.getParameter("status");
		String ta=request.getParameter("tag");
		String de=request.getParameter("des");
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("update Notes set Nname='"+nam+"',startDate='"+sdate+"',endDate='"+edate+"',remainderDate='"+rdate+"',Status='"+sta+"',tag='"+ta+"',description='"+de+"' where NoteId="+id8+"");
		if(i>0){
			response.sendRedirect("Notesdata");
		}
	}
	protected void deleteNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id9=request.getParameter("ID");
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("delete from Notes where NoteId="+id9+"");
		if(i>0){
			response.sendRedirect("Notesdata");
		}
	}
	protected void displayNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		List<BookNotesObject> l3=new ArrayList<>();
		List<BookNotesObject> l9=new ArrayList<>();
		String id10=request.getParameter("id");
		Cookie ck11=new Cookie("NotBkId",id10);
		response.addCookie(ck11);
		System.out.println("Date"+id10);
		Statement stmt1=con.createStatement();
		Statement stmt2=con.createStatement();
		ResultSet rs=stmt1.executeQuery("select * from Notes where NoteBookId="+id10+"");
		while(rs.next()){
			int NId=rs.getInt("NoteId");
			String name=rs.getString("Nname");
			Date sDate=rs.getDate("startDate");
			Date eDate=rs.getDate("endDate");
			Date rDate=rs.getDate("remainderDate");
			String status=rs.getString("status");
			String tag=rs.getString("tag");
			String des=rs.getString("description");
			BookNotesObject n2=new BookNotesObject(NId,name,sDate,eDate,rDate,status,tag,des);
			l3.add(n2);
		}
		request.setAttribute("NotesListitems", l3);
		ResultSet rw=stmt2.executeQuery("select * from Notes where NoteBookId="+id10+"&& remainderDate='"+java.time.LocalDate.now()+"'");
		while(rw.next()){
			int nId=rw.getInt("NoteId");
			String Name=rw.getString("Nname");
			Date sdate=rw.getDate("startDate");
			Date edate=rw.getDate("endDate");
			Date rdate=rw.getDate("remainderDate");
			String Status=rw.getString("status");
			String tag=rw.getString("tag");
			String des=rw.getString("description");
			BookNotesObject n9=new BookNotesObject(nId,Name,sdate,edate,rdate,Status,tag,des);
			l9.add(n9);
		}
		request.setAttribute("count", l9.size());
		request.setAttribute("Remainder", l9);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/BookNoteList.jsp");
		dispatcher.forward(request,response);
		
	}
	protected void BookinsertNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String notesName=request.getParameter("notesName");
		String startDate=request.getParameter("sDate");
		String EndDate=request.getParameter("eDate");
		String remainderDate=request.getParameter("rDate");
		String status=request.getParameter("status");
		String tag=request.getParameter("tag");
		String des=request.getParameter("des");
		Statement stmt=con.createStatement();
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("Id")){
				System.out.println(ck[i].getValue());
				sId=ck[i].getValue();
			}
			if(ck[i].getName().equals("NotBkId"));
			{
				System.out.println(ck[i].getValue());
				NBId=ck[i].getValue();
			}
		}
//		Cookie ck13=new Cookie("NotBkId",NBId);
		int v=stmt.executeUpdate("insert into Notes (studentId,NoteBookId,Nname,startDate,endDate,remainderDate,status,tag,description) values ('"+sId+"','"+NBId+"','"+notesName+"','"+startDate+"','"+EndDate+"','"+remainderDate+"','"+status+"','"+tag+"','"+des+"')");
		if(v>0){
			response.sendRedirect("NoteBooknote?id="+NBId);
//			RequestDispatcher dispatcher=request.getRequestDispatcher("/BookNoteList.jsp");
//			dispatcher.forward(request,response);
		}
	}
	protected void editBookNote(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id12=request.getParameter("Id");
		String nam=request.getParameter("notesName");
		String sdate=request.getParameter("sDate");
		String edate=request.getParameter("eDate");
		String rdate=request.getParameter("rDate");
		String sta=request.getParameter("status");
		String ta=request.getParameter("tag");
		String de=request.getParameter("des");
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("NotBkId")){
				NIBd=ck[i].getValue();
			}
		}
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("update Notes set Nname='"+nam+"',startDate='"+sdate+"',endDate='"+edate+"',remainderDate='"+rdate+"',Status='"+sta+"',tag='"+ta+"',description='"+de+"' where NoteId="+id12+"");
		if(i>0){
			response.sendRedirect("NoteBooknote?id="+NIBd);
		}
	}
	protected void deleteBookNotes(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id14=request.getParameter("ID");
		Cookie ck[]=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("NotBkId")){
				NDID=ck[i].getValue();
			}
		}
		Statement stmt=con.createStatement();
		int i=stmt.executeUpdate("delete from Notes where NoteId="+id14+"");
		if(i>0){
			response.sendRedirect("NoteBooknote?id="+NDID);
		}
	}
	protected void NotesDisplay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id15=request.getParameter("id");
		List<NotesDetailsDisplay> l4=new ArrayList<>();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from Notes where NoteId='"+id15+"'");
		while(rs.next()){
			String noname=rs.getString("Nname");
			Date sdate=rs.getDate("startDate");
			Date edate=rs.getDate("endDate");
			Date rdate=rs.getDate("remainderDate");
			String status=rs.getString("Status");
			String tag=rs.getString("tag");
			String descrip=rs.getString("description");
			NotesDetailsDisplay n4=new NotesDetailsDisplay(noname,sdate,edate,rdate,status,tag,descrip);
			l4.add(n4);
		}
		request.setAttribute("NotesDetails", l4);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/NotesDescription.jsp");
		dispatcher.forward(request,response);	
	}
	protected void BookNotesDisplay(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
		String id17=request.getParameter("id");
		List<NotesDetailsDisplay> l5=new ArrayList<>();
		Statement stmt=con.createStatement();
		ResultSet rs=stmt.executeQuery("select * from Notes where NoteId='"+id17+"'");
		while(rs.next()){
			String noname=rs.getString("Nname");
			Date sdate=rs.getDate("startDate");
			Date edate=rs.getDate("endDate");
			Date rdate=rs.getDate("remainderDate");
			String status=rs.getString("Status");
			String tag=rs.getString("tag");
			String descrip=rs.getString("description");
			NotesDetailsDisplay n5=new NotesDetailsDisplay(noname,sdate,edate,rdate,status,tag,descrip);
			l5.add(n5);
		}
		request.setAttribute("NotesDetailsitems", l5);
		RequestDispatcher dispatcher=request.getRequestDispatcher("/BookNotesDescription.jsp");
		dispatcher.forward(request,response);	
	}
	
}

