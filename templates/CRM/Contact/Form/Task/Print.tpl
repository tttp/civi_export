{*
 +--------------------------------------------------------------------+
 | CiviCRM version 3.3                                                |
 +--------------------------------------------------------------------+
 | Copyright CiviCRM LLC (c) 2004-2010                                |
 +--------------------------------------------------------------------+
 | This file is a part of CiviCRM.                                    |
 |                                                                    |
 | CiviCRM is free software; you can copy, modify, and distribute it  |
 | under the terms of the GNU Affero General Public License           |
 | Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
 |                                                                    |
 | CiviCRM is distributed in the hope that it will be useful, but     |
 | WITHOUT ANY WARRANTY; without even the implied warranty of         |
 | MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
 | See the GNU Affero General Public License for more details.        |
 |                                                                    |
 | You should have received a copy of the GNU Affero General Public   |
 | License and the CiviCRM Licensing Exception along                  |
 | with this program; if not, contact CiviCRM LLC                     |
 | at info[AT]civicrm[DOT]org. If you have questions about the        |
 | GNU Affero General Public License or the licensing of CiviCRM,     |
 | see the CiviCRM license FAQ at http://civicrm.org/licensing        |
 +--------------------------------------------------------------------+
*}
{if $rows}
<script type="text/javascript" charset="utf-8" src='{$config->userFrameworkResourceURL}/packages/jquery/plugins/jquery.dataTables.min.js'></script> 
<script type="text/javascript" charset="utf-8" src="{$tabletool}/ZeroClipboard/ZeroClipboard.js"></script> 
<script type="text/javascript" charset="utf-8" src="{$tabletool}/js/TableTools.js"></script> 
 
<script> 
  TableToolsInit.sSwfPath = '{$tabletool}/swf/ZeroClipboard.swf';  
{literal} 
   $(function($){ 
      $('table').dataTable( 
       {'bPaginate': false, 
        'bJQueryUI': true, 
         'sDom': 'T<\"clear\">lfrt', 
         'aaSorting':[], 
        });  
   });
</script>
  <link type='text/css' rel='stylesheet' media='screen'  href='{/literal}{$tabletool}{literal}/css/TableTools.css'></link>
  <style media='screen'>.selector th {padding-right:16px} .ui-icon {float:left;}</style>
{/literal}

<div class="crm-submit-buttons element-right">
     {include file="CRM/common/formButtons.tpl"}
</div>
<div class="spacer"></div>
<div>
<br />
<table>
  <thead>
  <tr class="columnheader">
{if $id}
  {foreach from=$columnHeaders item=header}
     <th>{$header}</th>
  {/foreach}
{else}
    <th>{ts}Name{/ts}</th>
    <th>{ts}Address{/ts}</th>
    <th>{ts}City{/ts}</th>
    <th>{ts}State{/ts}</th>
    <th>{ts}Postal{/ts}</th>
    <th>{ts}Country{/ts}</th>
    <th>{ts}Email{/ts}</th>
    <th>{ts}Phone{/ts}</th>
{/if}
  </tr>
  </thead><tbody>
{foreach from=$rows item=row}
    <tr class="{cycle values="odd-row,even-row"}">
{if $id}
        <td>{$row.sort_name}</td>
         {foreach from=$row item=value key=key}
           {if ($key neq "checkbox") and ($key neq "action") and ($key neq "contact_type") and ($key neq "status") and ($key neq "contact_id") and ($key neq "sort_name")}
              <td>{$value}</td>
           {/if}
         {/foreach}

{else}
        <td>{$row.sort_name}</td>
        <td>{$row.street_address}</td>
        <td>{$row.city}</td>
        <td>{$row.state_province}</td>
        <td>{$row.postal_code}</td>
        <td>{$row.country}</td>
        <td>{$row.email}</td>
        <td>{$row.phone}</td>
{/if}
    </tr>
{/foreach}
</tbody>
</table>
</div>

<div class="crm-submit-buttons element-right">
     {include file="CRM/common/formButtons.tpl"}
</div>

{else}
   <div class="messages status">
  <div class="icon inform-icon"></div>
       {ts}There are no records selected for Print.{/ts}
  </div>
{/if}
