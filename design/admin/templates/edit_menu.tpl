<div class="objectinfo">

<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h4>{'Object information'|i18n( 'design/admin/content/edit' )}</h4>

</div></div></div></div></div></div>

<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-br"><div class="box-bl"><div class="box-content">

{* Object ID *}
<p>
<label>{'ID'|i18n( 'design/admin/content/edit' )}:</label>
{$object.id}
</p>

{* Created *}
<p>
<label>{'Created'|i18n( 'design/admin/content/edit' )}:</label>
{section show=$object.published}
{$object.published|l10n( shortdatetime )}<br />
{$object.current.creator.name}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/edit' )}
{/section}
</p>

{* Modified *}
<p>
<label>{'Modified'|i18n( 'design/admin/content/edit' )}:</label>
{section show=$object.modified}
{$object.modified|l10n( shortdatetime )}<br />
{fetch( content, object, hash( object_id, $object.content_class.modifier_id ) ).name}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/edit' )}
{/section}
</p>

{* Published version *}
<p>
<label>{'Published version'|i18n( 'design/admin/content/edit' )}:</label>
{section show=$object.published}
{$object.current_version}
{section-else}
{'Not yet published'|i18n( 'design/admin/content/edit' )}
{/section}
</p>

{* Manage versions *}
<div class="block">
{section show=$object.versions|count|gt( 1 )}
<input class="button" type="submit" name="VersionsButton" value="{'Manage versions'|i18n( 'design/admin/content/edit' )}" />
{section-else}
<input class="button-disabled" type="submit" name="VersionsButton" value="{'Manage versions'|i18n( 'design/admin/content/edit' )}" disabled="disabled" />
{/section}
</div>

</div></div></div></div></div></div>

</div>
<br />


<div class="drafts">

<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h4>{'Current draft'|i18n( 'design/admin/content/edit' )}</h4>

</div></div></div></div></div></div>

{section show=fetch( content, translation_list )|count|gt( 1 )}
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-content">
{section-else}
<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">
{/section}

{* Created *}
<p>
<label>{'Created'|i18n( 'design/admin/content/edit' )}:</label>
{$content_version.created|l10n( shortdatetime )}<br />
{$content_version.creator.name}
</p>

{* Modified *}
<p>
<label>{'Modified'|i18n( 'design/admin/content/edit' )}:</label>
{$content_version.modified|l10n( shortdatetime )}<br />
{$content_version.creator.name}
</p>

{* Version *}
<p>
<label>{'Version'|i18n( 'design/admin/content/edit' )}:</label>
{$edit_version}
</p>

<div class="block">
<input class="button" type="submit" name="PreviewButton" value="{'Preview'|i18n('design/admin/content/edit')}" />
</div>
<div class="block">
{*<input class="button" type="submit" name="StoreButton" value="{'Store'|i18n('design/standard/content/edit')}" />*}
<input class="button" type="submit" name="StoreExitButton" value="{'Store and exit'|i18n('design/standard/content/edit')}" />
</div>

{section show=fetch( content, translation_list )|count|gt( 1 )}
</div></div></div></div>
{section-else}
</div></div></div></div></div></div>
{/section}

</div>



{section show=fetch( content, translation_list )|count|gt( 1 )}

<!-- Translation box start-->
<div class="translations">
{let name=Translation
     language_index=0
     default_translation=$content_version.translation
     other_translation_list=$content_version.translation_list
     translation_list=$Translation:other_translation_list|array_prepend($Translation:default_translation)}

{section show=$Translation:translation_list}
<div class="box-header"><div class="box-ml"><div class="box-mr">
<h4>{'Translations [%translation_count]'|i18n( 'design/admin/content/edit',, hash( '%translation_count', $Translation:translation_list|count ) )}</h4>
</div></div></div>

<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

{section loop=$Translation:translation_list}
  {section show=eq($edit_language,$Translation:item.language_code)}
    {set language_index=$Translation:index}
  {/section}
{/section}


{section show=$Translation:other_translation_list|count|gt( 1 )}
{section loop=$Translation:translation_list}
<p>
<label>
<input type="radio" name="EditSelectedLanguage" value="{$Translation:item.language_code}" {section show=eq($Translation:index,$Translation:language_index)}checked="checked"{/section} />
{section show=$Translation:item.locale.is_valid}
<img src={$Translation:item.language_code|flag_icon} alt="{$Translation:item.language_code}" style="vertical-align: middle;" /> {$Translation:item.locale.intl_language_name|shorten( 16 )}
{section-else}
{'%1 (No locale information available)'|i18n( 'design/admin/content/edit',, array($Translation:item.language_code))}
{/section}
</label>
</p>
{/section}
{section-else}
<p>
<label>
<input type="radio" name="" value="" checked="checked" disabled="disabled" />
<img src={$content_version.translation.language_code|flag_icon} alt="{$content_version.translation.language_code}" style="vertical-align: middle;" /> {$content_version.translation.locale.intl_language_name|shorten( 16 )}
</label>
</p>
{/section}

<div class="block">
{section show=$Translation:other_translation_list|not}
<input class="button-disabled" type="submit" name="EditLanguageButton" value="{'Edit selected'|i18n( 'design/admin/content/edit' )}" disabled="disabled" />
{section-else}
<input class="button" type="submit" name="EditLanguageButton" value="{'Edit selected'|i18n( 'design/admin/content/edit' )}" />
{/section}
</div>
<div class="block">
<input class="button" type="submit" name="TranslateButton" value="{'Manage translations'|i18n('design/admin/content/edit' )}" />
</div>
{/section}

{/let}
</div></div></div></div></div></div>
</div>

<!-- Translation box end-->

{/section}

