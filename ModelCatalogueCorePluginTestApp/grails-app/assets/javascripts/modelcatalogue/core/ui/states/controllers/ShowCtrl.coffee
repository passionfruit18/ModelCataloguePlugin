angular.module('modelcatalogue.core.ui.states.controllers.ShowCtrl', ['ui.router', 'mc.util.ui']).controller('modelcatalogue.core.ui.states.controllers.ShowCtrl', [
  '$scope', '$stateParams', '$state', 'element',
  ($scope ,  $stateParams ,  $state ,  element) ->

    if (not $stateParams.dataModelId or $stateParams.dataModelId == 'catalogue') and element.getDataModelId() != 'catalogue'
      $state.go 'dataModel.resource.show', {dataModelId: element.getDataModelId(), id: element.id, resource: $stateParams.resource}, {reload: true, location: 'replace'}
      return

    $scope.element = element
    $scope.original = element

    $scope.propertyToDisplay = $state.params.property

    if $state.params.focused
      $scope.displayOnly = $state.params.property
])
