app = angular.module("app")

app.factory('CurrentUser', ['$window', ($window) ->
  $window.currentUser
])

app.directive('likeButton', ['$http', 'CurrentUser', ($http, CurrentUser) ->
  restrict: 'E'
  replace: true
  scope:
    comment: '='
  template: """
    <a>
      <i class="fa fa-heart"
         ng-show="isLikedByCurrentUser()"
         ng-click="unlike()"></i>

      <i class="fa fa-heart-o"
         ng-show="!isLikedByCurrentUser()"
         ng-click="like()"></i>
    </a>
  """
  controller: ($scope) ->
    $scope.isLikedByCurrentUser = ->
      _.any($scope.comment.likes, (like) ->
        like.user_id == CurrentUser.id
      )

    $scope.like = ->
      $http.post("/api/discussions/" + $scope.comment.discussion_id + "/comments/" + $scope.comment.id + "/likes").success((data) ->
        # Add the like to the comment when the post request is complete
        $scope.comment.likes.push(
          comment_id: $scope.comment.id
          user_id: CurrentUser.id
        )

        console.log $scope.comment.likes
      ).error((data) ->
        console.log $scope.data
      )

    $scope.unlike = ->
      $http["delete"]("/api/discussions/" + $scope.comment.discussion_id + "/comments/" + $scope.comment.id + "/unlike/").success((data) ->
        $scope.comment.likes = data.likes
      ).error((data) ->
        console.log data
      )
])

# ng-click="discussionCtrl.like(comment)"
# ng-show="discussionCtrl.userHasNotLiked(comment.likes)"
# a ng-click="discussionCtrl.unlike(comment)" ng-show="discussionCtrl.userHasLiked(comment.likes)"
# =fa_icon('heart')


app.controller("DiscussionController", ["$http", ($http) ->

    # Set up
    @discussion = {}
    discussionId = $("#discussion").data("discussion-id")
    @discussion.currentUserId = $("#discussion").data("current-user-id")
    @discussion.comments = []
    state = @

    # Get the data
    $http.get("/api/discussions/" + discussionId).success (data) ->
      state.discussion.comments = data.discussion.comments
      console.log state.discussion.comments
      state.discussion.today = data.discussion.today
      state.discussion.id = data.discussion.id

    @deleteComment = (comment) ->
      indexOf = state.discussion.comments.indexOf(comment)
      state.discussion.comments.splice indexOf, 1
      $http["delete"] "/api/discussions/" + discussionId + "/comments/" + comment.id

])

app.controller("CommentController", ["$http", ($http) ->
    @comment = {}
    @isTyping = ->
      $("#comment-area").hasClass("ng-valid")

    @isNotTyping = ->
      $("#comment-area").hasClass("ng-invalid")

    @addComment = (discussion) ->
      @comment.user = discussion.currentUser
      @comment.created_at = discussion.today
      discussion.comments.push @comment
      $http.post("/api/discussions/" + discussion.id + "/comments", @comment).success (data) ->
        if data.saved
          alert "wat"
        else
          discussion.comments.pop()
          alert "Your comment was not saved!"
        return

      console.log discussion
      @comment = {}
])
