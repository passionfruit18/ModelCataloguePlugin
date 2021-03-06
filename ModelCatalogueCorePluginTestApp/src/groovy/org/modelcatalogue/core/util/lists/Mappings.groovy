package org.modelcatalogue.core.util.lists

import org.modelcatalogue.core.Mapping

class Mappings implements ListWrapper<Mapping>, HasListWrapper<Mapping> {

    @Delegate ListWrapper<Mapping> list

    Class<Mapping> getItemType() { Mapping }

}
