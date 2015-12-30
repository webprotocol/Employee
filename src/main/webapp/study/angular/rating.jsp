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
<title>rating.jsp</title>
<script type="text/javascript">
	var deps = ['ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar',
	            'ui.bootstrap'
	           ];

	var app = angular.module("employeeApp", deps);
	
	app.controller("mainController", function($scope, $http) {
		console.log("mainController...");
		
		$scope.rate = 3;
		$scope.max = 5;
		$scope.isReadonly=false;
		
		$scope.hoveringOver = function(value) {
		    $scope.overStar = value;
// 		    $scope.percent = 100 * (value / $scope.max);
		    $scope.percent = Math.floor(100 * (value / $scope.max));
		};
	});
	

	
</script>
</head>
<body data-ng-controller="mainController" class="container">

<h4>{{rate}}</h4>
<div data-uib-rating 
	 data-ng-model="rate" 
	 data-max="max" 
	 data-readonly="isReadonly" 
	 data-on-hover="hoveringOver(value)" 
	 data-on-leave="overStar = null" 
	 data-titles="['one','two','three']" 
			>

</div>
<span class="label" 
	  data-ng-class="{'label-warning': percent<30, 'label-info': percent>=30 && percent<70, 'label-success': percent>=70}" 
	  data-ng-show="overStar && !isReadonly">{{percent}}%</span>

{{percent2}}
</body>
</html>











