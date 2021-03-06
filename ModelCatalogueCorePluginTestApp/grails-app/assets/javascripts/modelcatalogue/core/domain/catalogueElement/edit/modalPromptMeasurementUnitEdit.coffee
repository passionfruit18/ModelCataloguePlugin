angular.module('modelcatalogue.core.domain.catalogueElement.edit.modalPromptMeasurementUnitEdit', ['mc.util.messages', 'mc.core.ui.bs.withClassificationCtrlMixin', 'mc.util.ui.actions']).config ['messagesProvider', (messagesProvider)->
  factory = [ '$uibModal', '$q', 'messages', ($uibModal, $q, messages) ->
    (title, body, args) ->
      if not args?.element? and not args?.create?
        messages.error('Cannot create relationship dialog.', 'The element to be edited is missing.')
        return $q.reject('Missing element argument!')

      dialog = $uibModal.open {
        windowClass: 'basic-edit-modal-prompt'
        size: 'lg'
        template: '''
         <div class="modal-header">
            <h4>''' + title + '''</h4>
        </div>
        <div class="modal-body">
            <messages-panel messages="messages"></messages-panel>
            <form role="form" ng-submit="saveElement()">
              <div class="form-group" ng-if="!hideDataModels()">
                <label for="dataModel"> Data Models</label>
                <elements-as-tags elements="copy.dataModels"></elements-as-tags>
                <input id="dataModel" placeholder="Data Model" ng-model="pending.dataModel" catalogue-element-picker="dataModel" label="el.name" typeahead-on-select="addToDataModels()">
              </div>
              <div class="form-group">
                <label for="name" class="">Name</label>
                <input type="text" class="form-control" id="name" placeholder="Name" ng-model="copy.name">
              </div>
              <div class="form-group">
                <label for="symbol" class="">Symbol</label>
                <input type="symbol" class="form-control" id="symbol" placeholder="Symbol" ng-model="copy.symbol">
              </div>
              <div class="form-group">
                <label for="modelCatalogueId" class="">Catalogue ID</label>
                <input type="text" class="form-control" id="modelCatalogueId" placeholder="e.g. external ID, namespace (leave blank for generated)" ng-model="copy.modelCatalogueId">
              </div>
              <div class="form-group">
                <label for="description" class="">Description</label>
                <textarea rows="10" ng-model="copy.description" placeholder="Description" class="form-control" id="description"></textarea>
              </div>
              <fake-submit-button/>
            </form>
        </div>
        <div class="modal-footer">
          <contextual-actions role="{{::actionRoleAccess.ROLE_MODAL_ACTION}}"></contextual-actions>
        </div>
        '''
        controller: ['$scope', 'messages', '$controller', '$uibModalInstance', 'actionRoleAccess', ($scope, messages, $controller, $uibModalInstance, actionRoleAccess) ->
          $scope.actionRoleAccess = actionRoleAccess
          $scope.pending    = {dataModel: null}
          $scope.newEntity  = -> {dataModels: $scope.copy?.dataModels ? []}
          $scope.copy     = angular.copy(args.element ? $scope.newEntity())
          $scope.original = args.element ? {}
          $scope.messages = messages.createNewMessages()
          $scope.create   = args.create
          $scope.currentDataModel = args.currentDataModel

          angular.extend(this, $controller('withClassificationCtrlMixin', {$scope: $scope}))
          angular.extend(this, $controller('saveAndCreateAnotherCtrlMixin', {$scope: $scope, $uibModalInstance: $uibModalInstance}))

          $scope.hasChanged   = ->
            $scope.copy.name != $scope.original.name\
              or $scope.copy.description != $scope.original.description\
              or $scope.copy.symbol != $scope.original.symbol\
              or $scope.copy.modelCatalogueId != $scope.original.modelCatalogueId

        ]

      }

      dialog.result
  ]

  messagesProvider.setPromptFactory 'edit-measurementUnit', factory
]
