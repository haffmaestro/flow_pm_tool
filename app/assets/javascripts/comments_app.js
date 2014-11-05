(function() {
  var app = angular.module('app');
  app.controller('DiscussionController', ['$http',function($http) {
    this.discussion = {};
    var discussionId = $('#discussion').data('discussion-id');
    this.discussion.currentUserId = $('#discussion').data('current-user-id');
    var state = this;
    this.discussion.comments = [];

    $http.get("/api/discussions/"+discussionId).success(function(data) {
      state.discussion.comments = data.discussion.comments;
      console.log(state.discussion.comments);
      state.discussion.today = data.discussion.today;
      state.discussion.id = data.discussion.id;
    });

    likeForUser=function(likes) {
      var like = _.findWhere(likes, {user_id: state.discussion.currentUserId});
      return like;
    };

    this.userHasLiked=function(likes) {
      if (likeForUser(likes))
        return true;
      else
        return false;
    };

    this.userHasNotLiked=function(likes) {
      return !state.userHasLiked(likes);
    };

    this.deleteComment=function(comment) {
      var indexOf = state.discussion.comments.indexOf(comment);
      state.discussion.comments.splice(indexOf, 1);
      $http.delete("/api/discussions/"+discussionId+"/comments/"+comment.id).success(function(data) {
      });

    };

    this.like=function(comment) {
      $http.post("/api/discussions/"+discussionId+"/comments/"+comment.id+"/likes").success(function(data){
        comment.likes.push({comment_id: comment.id, user_id: state.discussion.currentUserId});
        console.log(comment.likes);
      })
      .error(function(data){
        console.log(data);
      });
    };
    this.unlike=function(comment){
      var like = comment.likes[0];
      comment.likes=[];
      $http.delete("/api/discussions/"+discussionId+"/comments/"+comment.id+"/likes/"+like.id).success(function(data){
        console.log(data);
      }).error(function(data){
        console.log(data);
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