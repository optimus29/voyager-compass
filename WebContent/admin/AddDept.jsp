<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="jktags" prefix="jk" %>
<%@ page import="com.jk.travel.model.*"%> 
<%@ page import="java.util.Enumeration,java.util.List"%>
<%@ page import="com.jk.travel.dao.*,com.jk.core.util.DateWrapper"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Department | Voyager Compass</title>
	
	<link type="text/css" rel="stylesheet" href="/css/global.css"/>
	<link type="text/css" rel="stylesheet" href="/css/form-style.css"/>
	<link type="text/css" rel="stylesheet" href="/css/primary-menu.css"/>
	<script type="text/javascript" src="/js/validate.min.js"></script>
	<jsp:include page="/oth/ieAndOther.html" />
</head>


<body>
<%-- Checking if user is logged in or not --%>
<c:if test="${empty sessionScope.role}">
	<c:redirect url="/index.jsp" />
</c:if>

<jsp:include page="/oth/header.html"/>

<jsp:include page="/oth/selectMenu.jsp"/>


<main>
<h2>Add Department</h2>

<jk:status var="status"/>

<div class="page-content">
<div class="form-wrapper">
<div id="formErrors" tabindex="0"></div>

<form method="post" name="register" action="/AddDeptAction"><table class="form-grid">
	<tr>
		<td>Department Name<span class="mnd">*</span></td>
		<td><input type="text" name="DeptName" value="${dept.getDepartmentName()}" /></td>
	</tr>

	<tr>
		<td>Department Abbr<span class="mnd">*</span></td>
		<td><input type="text" name="DeptAbbr" value="${dept.getDepartmentAbbr()}" /></td>
	</tr>
	
	<tr>
		<td></td>
		<td><input type="submit" name="Submit" value="Add Deparment" class="button"/></td>
		<td></td>
	</tr>
</table></form>
</div>
</div><!-- page-conent -->

<script>
var fields = [
{name:'DeptName', display:'Deparment Name', rules:'required|max_length[40]'},
{name:'DeptAbbr', display:'Department Abbr', rules:'required|max_length[40]'}
];

function handleFormErrors(errors, event) {
	event.preventDefault();

	var errWrapper = document.getElementById("formErrors");

	if (errors.length == 0) {
		errWrapper.innerHTML = '';
		document.register.submit();
		return true;
	}

	var errStr = '<li style="list-style:none;"><strong>Errors</strong></li>';

	for (var i = 0; i < errors.length; i++) {
		errStr += '<li>' + errors[i].message + '</li>';
	}
	errStr = '<ul>' + errStr + '</ul>';

	errWrapper.innerHTML = errStr;
	errWrapper.focus();
	return false;
}

var validator = new FormValidator('register', fields, handleFormErrors);
</script>

</main>
<jsp:include page="/oth/footer.html"/>
</body>
</html>
