package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestBookDao;
import com.javaex.vo.GuestBookVo;

@WebServlet("/pbc")
public class GuestController extends HttpServlet {

	//필드
	private static final long serialVersionUID = 1L;
	
	// 디폴트 생성자 사용
    
    //메소드 - gs
	
	//메소드 - 일반
	//get방식으로 요청시 호출 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//포스트 방식일 때 한글깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		
		// 코드작성
		// action 파라미터일 때 꺼내기
		String action = request.getParameter("action");
		System.out.println(action);
		
		if ("addlist".equals(action)) {	//add리스트일 때
			//포워드
			RequestDispatcher rd = request.getRequestDispatcher("/addList.jsp");
			rd.forward(request, response);
			
		} else if("add".equals(action)) {	//등록일 때	
			
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");

			GuestBookVo guestBookVo = new GuestBookVo(name, password, content);
			
			GuestBookDao guestBookDao = new GuestBookDao();
			
			guestBookDao.guestAdd(guestBookVo);
			
			//리다이렉트 list
			response.sendRedirect("/phonebook2/pbc?action=addList");
			
		} else if("deleteForm".equals(action)) { //등록폼일 때
			//포워드
			RequestDispatcher rd = request.getRequestDispatcher("/addList.jsp");
			rd.forward(request, response);
			
		} else if("delete".equals(action)){	 //삭제일때
			
			int no = Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");
			
			GuestBookVo guestBookVo = new GuestBookVo(no, password);	
			GuestBookDao guestBookDao = new GuestBookDao();
			
			guestBookDao.guestDelete(no);
				
			
			//리다이렉트 list
			response.sendRedirect("./pbc?action=deleteForm");
			
			
		} else {
			System.out.println("action 파라미터 없음");
		}
		
	}
	
	//post형식으로 요청시 호출 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
