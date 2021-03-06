angular.module('modelcatalogue.core.ui.states.catalogue.feedback.FeedbackCtrl', ['ui.router', 'mc.util.ui']).controller 'modelcatalogue.core.ui.states.catalogue.feedback.FeedbackCtrl', ($scope, feedback, MessagingClient, $stateParams, $http, modelCatalogueApiRoot, actionRoleAccess) ->
    $scope.actionRoleAccess = actionRoleAccess
    $scope.feedback = feedback ? {}
    $scope.feedback.log = $scope.feedback.log ? ''
    $scope.reload = ->
      $http.get("#{modelCatalogueApiRoot}/feedback/#{$stateParams.id}").then (result) ->
        $scope.feedback = result.data
    MessagingClient.subscribe "/topic/feedback/#{$stateParams.id}/lines", (message) ->
      data = JSON.parse(message.body)
      $scope.feedback.log = $scope.feedback.log + '\n' + data.lines


