(function() {
  function DiscoController($http) {
    var vm = this;

    vm.getDiscussion = function(){};
    $http.get('/api/discussions/'+discussionId);




  }

angular.module('app')
  .controller('DiscoController', ['$http' ,DiscoController]);
})();