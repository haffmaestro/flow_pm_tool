(function() {
  function FileInput($parse) {
    function LinkFileInput(scope,elm,attrs) {
      elm.bind('change', function(){
        $parse(attrs.fileInput)
        .assign(scope, elm[0].files);
        scope.$apply();
      });
    }
    return {
      restrict: 'A',
      link: LinkFileInput
    };
  }
  function UploadController($scope, $http) {
    var projectId = $("#project").data('project-id');
    vm = this;
    vm.resource ="";
    vm.showing = false;
    vm.toggleShow = function() {
      vm.showing = !vm.showing;
    };

    $scope.filesChanged = function(elm) {
      $scope.files = elm.files;
      $scope.$apply();
    };

    $scope.upload = function() {
      var fd = new FormData();
      angular.forEach($scope.files, function(file){
        fd.append('file', file);
      });
      $http.post('/api/projects/'+projectId+'/uploads', fd,
      {
        transformRequest:angular.identity,
        headers:{'Content-Type':undefined}
      })
              .success(handleUploadSuccess)
              .error(handleUploadSuccess);
    };

    handleUploadSuccess = function(data){
      console.log(data);
    };

    vm.addResource = function() {
      $http.post('/api/projects/'+projectId+'/uploads', vm.resource)
        .success(handleUploadSuccess)
        .error(handleUploadSuccess);

    };
  }

  angular
    .module('app')
    .controller('UploadController',['$scope', '$http', UploadController])
    .directive('fileInput', ['$parse', FileInput]);

})();