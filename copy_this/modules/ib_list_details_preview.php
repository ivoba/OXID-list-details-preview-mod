<?php

class ib_list_details_preview extends ib_list_details_preview {

    protected function loadPreview() {
        $this->_sThisTemplate = 'page/details/ib_list_details_preview.tpl';
        $oSmarty = oxUtilsView::getInstance()->getSmarty();
        $oSmarty->assign('oView', $this);
        $oSmarty->assign('oViewConf', $this->getViewConfig());
    }

}
