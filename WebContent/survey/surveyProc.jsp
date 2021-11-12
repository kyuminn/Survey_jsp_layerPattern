<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.*,java.util.*,survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>

    
<%
SurveyService service = new SurveyService(dao);
request.setCharacterEncoding("UTF-8");
String[] userValues= request.getParameterValues("country");
String otherValue = request.getParameter("other");
List<String> ls= dao.selectCountry();

if (userValues !=null || otherValue!=""){ // 둘 중 하나라도 값이 있으면 값을 db에 반영 후 userResult로 포워딩
	if (otherValue==""){
		for (int i=0; i<userValues.length; i++){
			service.vote(userValues[i]);
		}
	}else if (userValues==null){
		if (ls.contains(otherValue)){
			service.vote(otherValue);
		}else{
			service.initializeNewItem(otherValue);
		}
	}else{
		for (int i=0; i<userValues.length; i++){
			service.vote(userValues[i]);
		}
		if (ls.contains(otherValue)){
			service.vote(otherValue);
		}else{
			service.initializeNewItem(otherValue);
		}
	}
	request.getRequestDispatcher("userResult.jsp").forward(request, response);
}else{	// 둘다 값이 없으면 surveyForm 으로 redirect
	response.sendRedirect("surveyForm.jsp");
}







%>
