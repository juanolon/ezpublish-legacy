<form method="post" action={concat("setup/toolbar/",$current_siteaccess,"/",$toolbar_position)|ezurl}>
<h1>{"Tool List for Toolbar_%toolbar_position"|i18n("design/standard/setup",,hash( '%toolbar_position', $toolbar_position ))}</h1>

{section show=$tool_list}
<table class="list" width="100%" cellspacing="0" cellpadding="0" border="0">
<tr>
    <th width="1">
        &nbsp;
    </th>
    <th colspan="2">
        {"Tool"|i18n("design/standard/setup/toolbar")}
    </th>
    <th>
        {"Placement"|i18n("design/standard/setup/toolbar")}
    </th>
</tr>
{section var=Tool loop=$tool_list sequence=array( bglight, bgdark )}
<tr class="{$Tool.sequence}">
    <td align="right" width="1">
        <input type="checkbox" name="deleteToolArray[]" value="{$Tool.index}" />
    </td>
    <td>
    <img src={concat("toolbar/",$Tool.name,".png")|ezimage} alt="{$Tool.name}" />
    <div>{$Tool.name}</div>
    </td>
    <td>
        <table>
        {section var=Parameter loop=$Tool.parameters}
        <tr>
            <td>
            {$Parameter.name}
            </td>
            <td>
            <input type="text" name="{$Tool.index}_parameter_{$Parameter.name}" size="20" value="{$Parameter.value}">
            </td>
        </tr>
        {/section}
        </table>
    </td>
    <td>
        <input type="text" name="placement_{$Tool.index}" size="2" value="{sum($Tool.index,1)}">
    </td>
</tr>
{/section}
</table>
{/section}
<div class="buttonblock">
<input class="button" type="submit" name="UpdatePlacementButton" value="{'Update Placement'|i18n('design/standard/setup/toolbar')}" />
<input class="button" type="submit" name="RemoveButton" value="{'Remove'|i18n('design/standard/setup/toolbar')}" />
<input class="button" type="submit" name="StoreButton" value="{'Store'|i18n('design/standard/setup/toolbar')}" />
</div>

<select name="toolName">
{section var=Tool loop=$available_tool_list}
    <option value="{$Tool}">{$Tool}</option>
{/section}
</select>
<input class="button" type="submit" name="NewToolButton" value="{'Add Tool'|i18n('design/standard/setup')}" />

</form>