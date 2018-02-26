package org.modelcatalogue.core.geb

import geb.Page

class DataModelPage extends Page {

    static at = {
        title.startsWith('Activity of')
    }

    static url = '/#'

    @Override
    String convertToPath(Object[] args) {
        args ? "/${args[0]}/dataModel/${args[0]}/" : ''
    }

    static content = {
        h3CeName { $('h3.ce-name', 0) }
        treeView { $('div.data-model-treeview-pane', 0).module(DataModelTreeViewModule) }
        rightSideTitleH3 { $("h3:not(.ng-hide):not(.data-model-heading)", 0) }
    }

    boolean titleContains(String query) {
        String text = h3CeName.text()
        text.contains(query)
    }

    String getRightSideTitle() {
        rightSideTitleH3.text()
    }
}
