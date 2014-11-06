app = angular.module("app")

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