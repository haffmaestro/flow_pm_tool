(->
  DiscussionPanelController = ($scope, $http) ->
    vm = this
    # vm.projectId= $("#project").data "project-id"
    vm.getDiscussions = ->
      $http.get ("/api/projects/"+vm.projectId), (data) ->
        console.log(data.discussions)


    # $http.get ("/api/discussions/" + discussionId), (data) ->
    #   vm.discussion = data
    #   debugger

  angular.module("app")
    .controller "DiscussionPanelController", ["$scope", "$http" ,DiscussionPanelController]
)()