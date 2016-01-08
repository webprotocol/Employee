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

<script src="/Employee/ng-file-upload/dist/ng-file-upload-shim.js"></script> <!-- for no html5 browsers support -->
<script src="/Employee/ng-file-upload/dist/ng-file-upload.js"></script>


<title>upload.jsp</title>
<script type="text/javascript">
	var deps = ['ngRoute',
	            'ngAnimate',
	            'ngTouch',
	            'angular-loading-bar',
	            'ngFileUpload'
	           ];

	var app = angular.module("employeeApp", deps);
	
	app.controller("mainController", function($scope, $http, Upload) {
		console.log("mainController...");
		
		$scope.submit = function() {
			console.dir($scope.file);
			console.dir($scope.files);
// 	        $scope.upload($scope.file);
	        $scope.uploadFiles($scope.files);
		};
		
		$scope.username = "홍길동";
	    // upload on file select or drop
	    $scope.upload = function (file) {
	        Upload.upload({
	            url: '/Employee/file/upload',
	            data: {file: file, 'username': $scope.username}
	        }).then(function (resp) {
	        	console.dir(resp);
	            console.log('Success ' + resp.config.data.file.name + 'uploaded. Response: ' + resp.data);
	        }, function (resp) {
	            console.log('Error status: ' + resp.status);
	        }, function (evt) {
	            var progressPercentage = parseInt(100.0 * evt.loaded / evt.total);
	            console.log('progress: ' + progressPercentage + '% ' + evt.config.data.file.name);
	        });
	    };
	    // for multiple files:
	    $scope.uploadFiles = function (files) {
	      if (files && files.length) {
// 	        for (var i = 0; i < files.length; i++) {
// 	          Upload.upload({
// 	        	  url: '/Employee/file/upload',
// 	        	  data: {file: files[i]}
// 	          });
// 	        }
	        // or send them all together for HTML5 browsers:
	        Upload.upload({
	        	url: '/Employee/file/uploads',
	        	data: {file: files}
	        });
	      }
	    }
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
        
<hr>        
<form name="form">
<!--   <div class="button"  -->
<!--   	   data-ngf-select  -->
<!--   	   data-ng-model="file"  -->
<!--   	   name="file"  -->
<!--   	   data-ngf-pattern="'image/*'" -->
<!--        data-ngf-accept="'image/*'"  -->
<!--        data-ngf-max-size="20MB"  -->
<!--        data-ngf-min-height="100"  -->
<!--        data-ngf-resize="{width: 100, height: 100}">Select</div> -->
  <input type="button" class="button" 
  	   data-ngf-select 
  	   data-ng-model="file" 
  	   name="file"
  	   data-ngf-resize="{width: 100, height: 100}"
       />Select
  <div>{{file.name}}</div>       
  <textarea>{{form.file}}</textarea>     
  
  <div class="button" 
  	   data-ngf-select 
  	   data-ng-model="files" 
  	   data-ngf-multiple="true">
  	   Select</div>
  	   
  <div ngf-drop ng-model="files" class="drop-box">Drop</div>
  <button type="submit" ng-click="submit()">submit</button>
</form>
</html>

</body>
</html>