<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html lang="ko" data-ng-app="employeeApp">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<%@ include file="/WEB-INF/view/common.jspf" %>
<title>echo.jsp</title>
<script type="text/javascript">
	var deps = ['ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar'
	           ];

	var app = angular.module("employeeApp", deps);
	
	app.controller("mainController", function($scope, $http) {
		console.log("mainController...");
		
		
	});
	
</script>

</head>
<body data-ng-controller="mainController" class="container">
        <form action="/Employee/file/upload" enctype="multipart/form-data" method="post">
            <p>
                <label>Select a file: </label>
                <input type="file" name="file"/>
            </p>
            <input type="submit" value="Upload" />
        </form>
</html>

</body>
</html>