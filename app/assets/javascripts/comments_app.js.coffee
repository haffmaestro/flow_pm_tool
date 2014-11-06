app = angular.module("app")

app.factory('CurrentUser', ['$window', ($window) ->
  $window.currentUser
])

# ng-click="discussionCtrl.like(comment)"
# ng-show="discussionCtrl.userHasNotLiked(comment.likes)"
# a ng-click="discussionCtrl.unlike(comment)" ng-show="discussionCtrl.userHasLiked(comment.likes)"
# =fa_icon('heart')

app.directive('commentDisplay', ['$http', 'CurrentUser', ($http, CurrentUser) ->
  restrict: 'E'
  replace: true
  scope: 
    deleteCommentCallback: '='
    comment: '='
  template: """
    <blockquote>
      <cite>
        by {{comment.user_id}} at {{comment.created_at | date}}
        <a ng-click="deleteCommentCallback(comment)">
         <i class="fa fa-trash"></i></a>
        <like-button comment="comment"></like-button>
      </cite>
      <p>
        {{comment.body}}
      </p>
    </blockquote>
  """
  controller: ($scope, $http) ->
    #Get the data

])


app.controller("DiscussionController", ["$http","$preloaded", ($http, $preloaded) ->

    # Set up
    @discussion = $preloaded.discussion
    @currentUser = $preloaded.user
    console.log @discussion.comments
    debugger
    state = @

    # Get the data
    # $http.get("/api/discussions/" + discussionId).success (data) ->
    #   state.discussion.comments = data.discussion.comments
    #   console.log state.discussion.comments
    #   state.discussion.today = data.discussion.today
    #   state.discussion.id = data.discussion.id

    @deleteComment = (comment) ->
      console.log @
      indexOf = state.discussion.comments.indexOf(comment)
      state.discussion.comments.splice indexOf, 1
      $http["delete"] "/api/discussions/" + state.discussion.id + "/comments/" + comment.id

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
      $http.post("/api/discussions/" + discussion.id + "/comments", @comment)
      .success (data) ->
        if data.saved
          alert "wat"
      .error (data) ->
        if !data.saved
          discussion.comments.pop()
          alert "Your comment was not saved!"

      console.log discussion
      @comment = {}
])
