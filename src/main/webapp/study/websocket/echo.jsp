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
		
	    var ws = null;
	    var url = "ws://192.168.10.46:8080/Employee/echo";
	  
	    $scope.receive = "수신 메세지";
	    
	    $scope.connect = function () {
	       console.log("connect()...");
	        ws = new WebSocket(url);
	        console.dir(ws);
	        ws.onopen = function () {
	            console.log("websocket open...");
	        };
	        ws.onmessage = function (event) {
	            console.dir(event);
	            $scope.receive += "\n" + event.data;
	            $scope.$apply();
	            
	        };
	        ws.onclose = function (event) {
	        	console.log("websocket close...");
	        };
	    };
	  
	    $scope.disconnect = function () {
	        ws.close();
	        ws = null;
	    };
	    
	    $scope.message = "";
	  
	    $scope.echo = function () {
	        // send 명령을 이용해서 전송을 한다.
	        ws.send($scope.message);
	    };
		
	});
	
</script>

</head>
<body data-ng-controller="mainController" class="container">
<button data-ng-click="connect()">Open</button>
<button data-ng-click="disconnect()">Close</button>
<button data-ng-click="echo()">Send</button>
<input type="text" data-ng-model="message"/>

<pre>{{receive}}</pre>


</body>
</html>