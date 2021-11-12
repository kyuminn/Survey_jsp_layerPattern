<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>

<%	
	SurveyService service= new SurveyService(dao);

	// checkbox parameter
	String userValues= request.getParameter("value");
	// , 를 기준으로 하나의 문자열을 나눠서 문자열 배열에 저장
	String[] values = userValues.split(",");

	
	for (String value: values){
		service.revoke(value);
	}
	
	// 기타입력 parameter 
	String other= request.getParameter("other");
	if (other!=""){
		if (service.selectCountByCountry(other)==1){ // 기타 입력값이 현재 1표밖에 없을 때
			service.deleteZeroValue(other);			 // 행 자체를 지우기
		}
		service.revoke(other);		//2표 이상이면 count만 -1 하기
	}
	
	response.sendRedirect("main.jsp");
%>
