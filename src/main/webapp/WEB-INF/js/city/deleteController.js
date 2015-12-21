/**
 * @author java
 */

app.config(function($routeProvider) {
	console.log("/delete config...")
	
	$routeProvider.when("/delete/:id", {
		templateUrl: "delete.html",
		controller: "deleteController"
	});
	
});

app.controller('deleteController', function($scope, $http, URL, $routeParams) {
	console.log("deleteController...");
	console.log("URL.DELETE_ITEM_DELETE_BASE = " + URL.DELETE_ITEM_DELETE_BASE);
	console.log("id = " + $routeParams.id);
	
	$scope.$parent.title = "Delete City View";
	
	var ajax = $http.delete(URL.DELETE_ITEM_DELETE_BASE + $routeParams.id);
	
	ajax.then(function() {
		$scope.$parent.title = "삭제 성공";
	}, function() {
		$scope.$parent.title = "삭제 실패";
	});
	
	
});
