<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="survey.*,java.util.*,survey.service.SurveyService" %>
<jsp:useBean id="dao" class="survey.dao.SurveyDaoImpl"/>
<!--  SurveyDao dao = new SurveyDaoImpl(); -->
    
<%
SurveyService service = new SurveyService(dao);
request.setCharacterEncoding("UTF-8");
String[] userValues=request.getParameterValues("country");
List<String> ls= dao.selectCountry();

if (!userValues[0].equals("")){
	for (int i=0; i<userValues.length; i++){
		if (ls.contains(userValues[i])) {
			service.vote(userValues[i]);
		}else{
			service.initializeNewItem(userValues[i]);
		}
	}
}
request.getRequestDispatcher("userResult.jsp").forward(request, response);


%>
