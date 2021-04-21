package com.green.ffee.naver.api.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.ffee.naver.api.util.GetNaverLocal;


@WebServlet(urlPatterns= {"/getlocal"})
public class GetLocalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    //getlocal?area=21 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
				
		String areacode =request.getParameter("area");
		//String area = "강원도";
		String area="";
		switch(areacode) {
		case "1": area ="서울"; break;
		case "2": area ="강원도"; break;
		case "3": area ="충청북도"; break;
		case "4": area ="충청남도"; break;
		case "5": area ="전라북도"; break;
		case "6": area ="전라남도"; break;
		case "7": area ="대구"; break;
		case "8": area ="부산"; break;
		case "9": area ="제주도"; break;
		}
		
		String keyword = area + "맛집"; //검색어 - html이 보내주는거 받아올자리
		
		//String keyword = request.getParameter("keyword"); //검색어
		String currentPage = request.getParameter("currentPage"); 
		int start = 2;
		//int start = Integer.parseInt(currentPage);
		int display = 20; //한 페이지에 5ro - 최소1개 최대5
		
		GetNaverLocal getNaverLocal = new GetNaverLocal();
		String data = getNaverLocal.searchLocal(keyword,display,start);
		
		
		response.setContentType("application/json;charset=utf-8");
		//response.setContentType("application/xml;charset=utf-8");
	
		PrintWriter out = response.getWriter();
		out.print(data);
		out.flush();
		out.close();
	
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
















