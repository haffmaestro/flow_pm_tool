app = angular.module("app")

app.directive('deleteButton', ['$http', 'CurrentUser', ($http, CurrentUser) ->
  restrict: 'E'
  replace: true
  scope:
    comment: '='
])