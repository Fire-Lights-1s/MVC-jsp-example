package com.itwillbs.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.itwillbs.domain.MemberDTO;
import com.itwillbs.service.MemberService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class MemberController extends HttpServlet{
	// servlet 을 가져와서 => servlet 파일이 됨 => 상속 받아옴
	// HttpServlet 서블릿(처리담당자) 동작원리 => service(), doGet(), doPost() 메서드 자동으로 호출
	
	// doGet(), doPost() 재정의 => 메서드 오버라이딩
	// alt shift s => v
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doProcess");
		String sPath = request.getServletPath();
		System.out.println("가상 주소 : " + sPath);
		if(sPath.equals("/insert.me")) {
			//response.sendRedirect("member/insert.jsp");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/insert.jsp");
			dispatcher.forward(request, response);
		}//if insert.me
		if(sPath.equals("/insertPro.me")) {
			System.out.println("insertPro.me 가상 주소 일치 ");
			MemberService memberService = new MemberService();
			
			if(memberService.insertMember(request)) {
				response.sendRedirect("login.me");
			}else {
				response.sendRedirect("insert.me");
			}
		}//if insertPro.me
		if(sPath.equals("/login.me")) {
			System.out.println("login.me 가상 주소 일치 ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");
			dispatcher.forward(request, response);
			
		}//if login.me
		if(sPath.equals("/loginPro.me")) {
			System.out.println("loginPro.me 가상 주소 일치 ");
			MemberService memberService = new MemberService();
			
			if(memberService.userCheck(request)) {
				HttpSession session = request.getSession();
				session.setAttribute("id", request.getParameter("id"));
				response.sendRedirect("main.me");
			}else {
				response.sendRedirect("login.me");
			}
		}//if loginPro.me
		if(sPath.equals("/main.me")) {
			System.out.println("main.me 가상 주소 일치 ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/main.jsp");
			dispatcher.forward(request, response);
		}//if main.me
		if(sPath.equals("/logout.me")) {
			HttpSession session = request.getSession();
			session.invalidate();
			response.sendRedirect("login.me");
		}//if logout.me
		if(sPath.equals("/info.me")) {
			System.out.println("info.me 가상 주소 일치 ");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			MemberService memberService = new MemberService();
			MemberDTO member = memberService.getMember(id);
			request.setAttribute("memberDTO", member);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/info.jsp");
			dispatcher.forward(request, response);
		}// if info.me
		
		if(sPath.equals("/update.me")) {
			System.out.println("update.me 가상 주소 일치 ");
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			MemberService memberService = new MemberService();
			MemberDTO member = memberService.getMember(id);
			request.setAttribute("memberDTO", member);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/update.jsp");
			dispatcher.forward(request, response);
		}// if update.me
		if(sPath.equals("/updatePro.me")) {
			System.out.println("updatePro.me 가상 주소 일치 ");
			MemberService memberService = new MemberService();
			boolean result = memberService.userCheck(request);
			if(result) {
				memberService.updateMember(request);
				response.sendRedirect("main.me");
			}else {
				response.sendRedirect("update.me");
			}
		}// if updatePro.me
		
		if(sPath.equals("/delete.me")) {
			System.out.println("delete.me 가상 주소 일치 ");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/delete.jsp");
			dispatcher.forward(request, response);
		}// if delete.me
		if(sPath.equals("/deletePro.me")) {
			System.out.println("deletePro.me 가상 주소 일치 ");
			MemberService memberService = new MemberService();
			
			boolean result = memberService.userCheck(request);
			if(result) {
				memberService.deleteMember(request);
				HttpSession session = request.getSession();
				session.invalidate();
				response.sendRedirect("main.me");
			}else {
				response.sendRedirect("delete.me");
			}
		}// if deletePro.me
		if(sPath.equals("/list.me")) {
			System.out.println("list.me 가상 주소 일치 ");
			MemberService memberService = new MemberService();
			ArrayList<MemberDTO> memberList = memberService.getMemberList();
			request.setAttribute("memberList", memberList);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/list.jsp");
			dispatcher.forward(request, response);
		}
	}
}
