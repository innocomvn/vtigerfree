<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
class Vtiger_ActionButtons_Dashboard extends Vtiger_IndexAjax_View {

    function getSearchParams($value) {
        // $listSearchParams = array();
        // $conditions = array(array('ticketstatus','e','Open'),array('assigned_user_id','e',$value));
        // $listSearchParams[] = $coZnditions;
        // return '&search_params='. json_encode($listSearchParams);
    }
    public function process(Vtiger_Request $request) {
        $currentUser = Users_Record_Model::getCurrentUserModel();
        $viewer = $this->getViewer($request);
        $moduleName = $request->getModule();
        $linkId = $request->get('linkid');
        $moduleModel = Vtiger_Module_Model::getInstance($moduleName);
        // $data = $moduleModel->getOpenTickets();
        // $listViewUrl = $moduleModel->getListViewUrl();
        for($i = 0;$i<count($data);$i++){
            //$data[$i]["links"] = $listViewUrl.$this->getSearchParams($data[$i][name]);
            $data[$i]["links"] = "abc";
        }

        // https://redmine.innocom.vn/issues/1958

        $menuModelsList = Vtiger_Menu_Model::getAll(true);
        $selectedModule = $request->getModule(); // lay ra module hien tai
        $menuStructure = Vtiger_MenuStructure_Model::getInstanceFromMenuList($menuModelsList, $selectedModule);
        $menuGroupedByParent = Settings_MenuEditor_Module_Model::getAllVisibleModules();

        $modules_actions_icons = array(
            "Potentials" => "icon1.png",
            "Accounts" => "icon2.png",
            "Products" => "icon4.png",
            "Assets" => "icon6.png",
            "Invoice" => "icon8.png",
            "Reports" => "icon7.png",
            "Calendar" => "icon3.png",
            "SMSNotifier" => "icon7.png",
            "EmailTemplates" => "icon7.png",
            "Campaigns" => "icon11.png",
        );
        $AllVisibleModules = array();
        foreach ($menuGroupedByParent as $app) {
            $AllVisibleModules = array_merge($AllVisibleModules,array_keys($app));
        }
        $AllVisibleModules = array_merge($AllVisibleModules,array("Reports","Calendar"));
        $user_visible_modules = array_intersect($AllVisibleModules, array_keys($modules_actions_icons));

        $viewer->assign('AB_VISIBLE', array_unique($user_visible_modules));
        $viewer->assign('AB_ICONS', $modules_actions_icons);

        // https://redmine.innocom.vn/issues/1958 END

        $widget = Vtiger_Widget_Model::getInstance($linkId, $currentUser->getId());
        $viewer->assign('WIDGET', $widget);
        $viewer->assign('MODULE_NAME', $moduleName);
        $viewer->assign('DATA', $data);

        //Include special script and css needed for this widget
        $viewer->assign('CURRENTUSER', $currentUser);
        $content = $request->get('content');
        if(!empty($content)) {
            $viewer->view('dashboards/DashBoardWidgetContents.tpl', $moduleName);
        } else {
            $viewer->view('dashboards/ActionButtons.tpl', $moduleName);
        }
    }
}