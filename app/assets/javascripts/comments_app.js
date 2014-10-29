(function() {
  var app = angular.module("flow", []);
  app.controller('DiscussionController', ['$http',function($http) {
    this.discussion = {};
    var discussionId = $('#discussion').data('discussion-id');
    this.discussion.currentUser = $('#discussion').data('current-user');
    var state = this;
    this.discussion.comments = [];

    $http.get("/api/discussions/"+discussionId+"/comments.json").success(function(data) {
      state.discussion.comments = data.discussion.comments;
      state.discussion.today = data.discussion.today;
      state.discussion.id = data.discussion.id;

    });

    this.deleteComment=function(comment) {
      $http.delete("/api/discussions/"+discussionId+"/comments/"+comment.id).success(function(data) {
        var indexOf = state.discussion.comments.indexOf(comment);
        state.discussion.comments.splice(indexOf, 1);
      });

    };

  }]);
  
  app.controller('CommentController',['$http',function($http) {
    this.comment = {};
    this.isTyping = function() {
      return ($("#comment-area").hasClass("ng-valid"));
    };
    this.isNotTyping = function() {
      return $("#comment-area").hasClass("ng-invalid");
    };
    this.addComment= function(discussion){
      this.comment.user = discussion.currentUser;
      this.comment.created_at = discussion.today;
      discussion.comments.push(this.comment);
      $http.post("/api/discussions/"+discussion.id+"/comments", this.comment).success(function(data) {
        if (data.saved) {
        }
        else {
          discussion.comments.pop();
          alert("Your comment was not saved!");
        }
      });
      console.log(discussion);
      this.comment = {};
    };

  }]);

})();