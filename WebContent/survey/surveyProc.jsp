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
//String location="";
/*
if (userValues!=null || otherValue!=""){ // 체크박스나 기타 중 입력값이 하나라도 있을 때
	if (userValues!=null){	// 체크박스에 체크가 되어있다면
		for (int i=0; i<userValues.length; i++){ // 체크한 개수만큼 반복
				service.vote(userValues[i]); // count+1 해주고
		}
		if (otherValue!=""){
			if (ls.contains(otherValue)){
				service.vote(otherValue);
			}else{
				service.initializeNewItem(otherValue);
			}
		}
	}else{
		if (otherValue!=""){
			if (ls.contains(otherValue)){
				service.vote(otherValue);
			}else{
				service.initializeNewItem(otherValue);
			}
		}
	}
	request.getRequestDispatcher("userResult.jsp").forward(request, response);
}else{ // 체크박스도 기타도 둘다 입력하지 않았으면 surveyForm을 보여주도록
	response.sendRedirect("surveyForm.jsp");
}
*/

if (userValues !=null || otherValue!=""){
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
}else{
	response.sendRedirect("surveyForm.jsp");
}







%>
