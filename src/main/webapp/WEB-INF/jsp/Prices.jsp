<%@ page import="ru.javawebinar.topjava.repository.datajpa.DataJpaMealRepositoryImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://topjava.javawebinar.ru/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="fragments/headTag.jsp"/>
<head>
    <title>Title</title>
    <%=new DataJpaMealRepositoryImpl().getAll(100000).size()%>
</head>
<body>

</body>
</html>
