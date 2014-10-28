(function() {
var app = angular.module("flow", []);
    app.controller('CommentsController', ['$http',function($http) {
      var discussionId = $('#discussion').data('discussion-id');
      var information = this;
      information.comments = [];
      this.today = Date.now;

      $http.get("/api/discussions/"+discussionId+"/comments").success(function(data) {
        console.log(data);
        information.comments = data;

      });

      this.submit = function() {
        console.log('logged');
      };
      this.controller('ReviewController', function() {
        this.review = {};
        this.addComment()
      });
    }]);

})();