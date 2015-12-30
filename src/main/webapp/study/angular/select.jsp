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
<title>select.jsp</title>
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
		
		   $scope.data = {
				    repeatSelect: '2',
				    availableOptions: [
				      {id: '1', name: 'Option A'},
				      {id: '2', name: 'Option B'},
				      {id: '3', name: 'Option C'}
				    ],
		   };
		   
		   $scope.today = function() {
			    $scope.dt = new Date();
			  };
			  $scope.today();

			  $scope.clear = function () {
			    $scope.dt = null;
			  };

			  // Disable weekend selection
			  $scope.disabled = function(date, mode) {
			    return ( mode === 'day' && ( date.getDay() === 0 || date.getDay() === 6 ) );
			  };

			  $scope.toggleMin = function() {
			    $scope.minDate = $scope.minDate ? null : new Date();
			  };
			  $scope.toggleMin();
			  $scope.maxDate = new Date(2020, 5, 22);

			  $scope.open = function($event) {
			    $scope.status.opened = true;
			  };

			  $scope.setDate = function(year, month, day) {
			    $scope.dt = new Date(year, month, day);
			  };

			  $scope.dateOptions = {
			    formatYear: 'yy',
			    startingDay: 1
			  };

			  $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
			  $scope.format = 'yyyy-MM-dd';

			  $scope.status = {
			    opened: false
			  };

			  var tomorrow = new Date();
			  tomorrow.setDate(tomorrow.getDate() + 1);
			  var afterTomorrow = new Date();
			  afterTomorrow.setDate(tomorrow.getDate() + 2);
			  $scope.events =
			    [
			      {
			        date: tomorrow,
			        status: 'full'
			      },
			      {
			        date: afterTomorrow,
			        status: 'partially'
			      }
			    ];

			  $scope.getDayClass = function(date, mode) {
			    if (mode === 'day') {
			      var dayToCheck = new Date(date).setHours(0,0,0,0);

			      for (var i=0;i<$scope.events.length;i++){
			        var currentDay = new Date($scope.events[i].date).setHours(0,0,0,0);

			        if (dayToCheck === currentDay) {
			          return $scope.events[i].status;
			        }
			      }
			    }

			    return '';
			  };
		
	});
	

	
</script>
</head>
<body data-ng-controller="mainController" class="container">

  <form name="myForm">
    <label for="repeatSelect"> Repeat select: </label>
    <select name="repeatSelect" id="repeatSelect" ng-model="data.repeatSelect">
<!--       <option data-ng-repeat="option in data.availableOptions" value="{{option.id}}">{{option.name}}</option> -->
	<option value="1">1xxx</option>
	<option value="2">2xxx</option>
	<option value="3">3xxx</option>
	<option value="4">4xxx</option>
    </select>
  </form>
  <hr>
  repeatSelect = {{data.repeatSelect}}<br/>

<input type="text" class="form-control" uib-datepicker-popup="{{'yyyy-MM-dd'}}" ng-model="xx" is-open="status.opened"  ng-required="true"/>

<span class="input-group-btn">
  <button type="button" class="btn btn-default" ng-click="open($event)"><i class="glyphicon glyphicon-calendar"></i></button>
</span>

{{xx}}
</body>
</html>