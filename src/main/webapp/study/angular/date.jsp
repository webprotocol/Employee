<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>    
<!DOCTYPE html>
<html lang="ko" data-ng-app="employeeApp">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>angular.jsp</title>

<%@ include file="/WEB-INF/view/common.jspf" %>

<style type="text/css">
	.red {
		background-color: red;
		color: blue;
	}
</style>

<script type="text/javascript">
	var app = angular.module("employeeApp", []);
	app.controller("examController", function($scope, $http, $filter) {
		$scope.title = "Angular 기본구조 연습";
		
		$scope.title = $filter('date')(new Date(),'yyyy-MM-dd');

		$scope.pass = 12;
		$scope.pass2 = 13;
		
		$scope.xxx = function() {
			return angular.equals($scope.pass, $scope.pass2);
// 			return $scope.pass == $scope.pass2;
		};
		
	});

</script>

</head>
<body data-ng-controller="examController">
<h1>date = {{title}}</h1>
<button ng-click="">post</button>

{{xxx()}}

</body>
</html>




