<?php
/* +**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is: vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 * ***********************************************************************************/

class ExtensionStore_Listings_View extends Vtiger_Index_View {

	public function __construct() {
		parent::__construct();
		$this->exposeMethod('getPromotions');
	}

	public function getHeaderScripts(Vtiger_Request $request) {
		$jsFileNames = array(
			"libraries.jquery.boxslider.jqueryBxslider",
		);
		$jsScriptInstances = $this->checkAndConvertJsScripts($jsFileNames);
		return $jsScriptInstances;
	}

	public function process(Vtiger_Request $request) {
		$mode = $request->getMode();
		if (!empty($mode)) {
			$this->invokeExposedMethod($mode, $request);
			return;
		}
	}

	/**
	 * Function to get news listings by passing type as News
	 */
	protected function getPromotions(Vtiger_Request $request) {
		$modelInstance = Settings_ExtensionStore_Extension_Model::getInstance();
		$promotions = $modelInstance->getListings(null, 'Promotion');
		$qualifiedModuleName = $request->getModule(false);
		// https://redmine.innocom.vn/issues/1941
		$link = file_get_contents('https://s.innocom.vn/vtigerfree/promo.php?view=link');
	    $banner = file_get_contents('https://s.innocom.vn/vtigerfree/promo.php?view=banner'); 
		// https://redmine.innocom.vn/issues/1941 END 
		$viewer = $this->getViewer($request);
		// https://redmine.innocom.vn/issues/1941
		$viewer->assign('LINK', $link);
		$viewer->assign('BANNER', $banner);
		// https://redmine.innocom.vn/issues/1941 END 	
		$viewer->assign('PROMOTIONS', $promotions);
		$viewer->assign('QUALIFIED_MODULE', $qualifiedModuleName);
		$viewer->assign('HEADER_SCRIPTS', $this->getHeaderScripts($request));
		// $viewer->view('Promotions.tpl', $qualifiedModuleName);
		// https://redmine.innocom.vn/issues/1941
		$viewer->view('Promotions2.tpl', $qualifiedModuleName);
		// https://redmine.innocom.vn/issues/1941 END 	
	}

}
