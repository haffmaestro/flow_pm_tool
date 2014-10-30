(function() {
  var app = angular.module('app');
  app.controller('TaskController', ['$scope', '$http' ,function($scope, $http) {
    var projectId = $("#project").data('project-id');
    var projectData = this;
    $http.get('/api/projects/'+projectId+"/tasks.json").success(function(data) {
      projectData.project = data.project;
    });

    $scope.task = {};
    $scope.addTask = function() {
      projectData.project.tasks.unshift($scope.task);
      $http.post('/api/projects/'+projectId+'/tasks', $scope.task).success(function(data){
        console.log(data);
      });
      $scope.task = {};
    };

    $scope.deleteTask = function(task) {
      var indexOf = projectData.project.tasks.indexOf(task);
      projectData.project.tasks.splice(indexOf, 1);
      $http.delete('/api/projects/'+projectId+'/tasks/'+task.id).success(function(data){
        console.log(data);
      });

    };


  }]);

})();