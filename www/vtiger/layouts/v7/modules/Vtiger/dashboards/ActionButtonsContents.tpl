{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}
<!-- <link rel="stylesheet" href="/layouts/v7/modules/Members/dashboards/assets/css/bootstrap.min.css"/> -->
<!-- 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/> -->
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous"> -->
<link rel="stylesheet" type="text/css" href="/layouts/v7/modules/Vtiger/dashboards/assets/css/style.css">
<div style='padding:5px'>
    <div class='row-fluid'>
        <div class='span12'>

            <section class="wrap mt-2">
                <div class="row">
                    {* https://redmine.innocom.vn/issues/1958 *}
                    {foreach from=$AB_VISIBLE item=AB_MODULE}
                        {if $AB_MODULE eq "Calendar"}
                            {assign var="VIEW" value="Calendar"}
                        {else}
                            {assign var="VIEW" value="List"}
                        {/if}
                        <div class="col-md-4 col-sm-4 col-lg-4 col-4 col-xs-4">
                            <div class="item text-center">
                                <a target="_blank" href="index.php?module={$AB_MODULE}&view={$VIEW}">
                                    <img src="/layouts/v7/modules/Vtiger/dashboards/assets/images/{$AB_ICONS[$AB_MODULE]}" class="img-fluid" />
                                    <h4>{vtranslate({$AB_MODULE},"Vtiger")}</h4>
                                </a>
                            </div>
                        </div>
                    {/foreach}
                    {* https://redmine.innocom.vn/issues/1958 END *}
                </div>
            </section>
        </div>

    </div>

</div>