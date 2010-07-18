{include file='settings_admin_menu.tpl'}
{ajaxheader modname=Settings filename=settings_admin_multilingual.js noscriptaculous=true effects=true}
<div class="z-admincontainer">
    <div class="z-adminpageicon">{img modname="core" src="voice-support.gif" set="icons/large" __alt="Settings"}</div>
    <h2>{gt text="Localisation settings"}</h2>
    <form class="z-form" action="{modurl modname="Settings" type="admin" func="updatemultilingual"}" method="post">
        <div>
            <input type="hidden" name="authid" value="{insert name='generateauthkey' module='Settings'}" />
            <input id="mlsettings_timezone_server" type="hidden" name="mlsettings_timezone_server" value="{$timezone_server}" />
            <fieldset>
                <legend>{gt text="Language system"}</legend>
                <div class="z-formrow">
                    <label for="mlsettings_multilingual">{gt text="Activate multi-lingual features"}</label>
                    <span id="mlsettings_multilingual">
                        <input id="multilingual1" type="radio" name="mlsettings_multilingual" value="1"{if $multilingual eq 1} checked="checked"{/if} />
                        <label for="multilingual1">{gt text="Yes"}</label>
                        <input id="multilingual0" type="radio" name="mlsettings_multilingual" value="0"{if $multilingual eq 0} checked="checked"{/if} />
                        <label for="multilingual0">{gt text="No"}</label>
                    </span>
                </div>
                <div class="z-formrow">
                    <label for="mlsettings_languageurl">{gt text="Add language to URL"}</label>
                    <span id="mlsettings_languageurl">
                        <input id="languageurl0" type="radio" name="mlsettings_languageurl" value="1"{if $languageurl eq 1} checked="checked"{/if} />
                        <label for="languageurl0">{gt text="Always"}</label>
                        <input id="languageurl1" type="radio" name="mlsettings_languageurl" value="0"{if $languageurl eq 0} checked="checked"{/if} />
                        <label for="languageurl1">{gt text="Only for non-default languages"}</label>
                    </span>
                </div>
                <div class="z-formrow">
                    <label for="mlsettings_language_bc">{gt text="Enable language variations"}</label>
                    <span id="mlsettings_language_bc">
                        <input id="language_bc1" type="radio" name="mlsettings_language_bc" value="1"{if $language_bc eq 1} checked="checked"{/if} />
                        <label for="language_bc1">{gt text="Yes"}</label>
                        <input id="language_bc0" type="radio" name="mlsettings_language_bc" value="0"{if $language_bc eq 0} checked="checked"{/if} />
                        <label for="language_bc0">{gt text="No"}</label>
                    </span>
                </div>
                <div id="mlsettings_language_bc_warning">
                    <p class="z-warningmsg">
                        {gt text="Notice: This disables any language packs of which the name template is 'LL_*'."}<br />
                        {gt text="If this setting is disabled, data stored in such a language may be lost, depending on how a particular module handles multi-lingual content. This setting is designed for legacy modules that rely on 3-letter ISO-639-1 language codes for which there is no matching ISO-639-2 code."}
                    </p>
                </div>
            </fieldset>
            <fieldset>
                <legend>{gt text="Browser"}</legend>
                <div class="z-formrow">
                    <label for="mlsettings_language_detect">{gt text="Automatically detect language from browser settings"}</label>
                    <span id="mlsettings_language_detect">
                        <input id="language_detect1" type="radio" name="mlsettings_language_detect" value="1"{if $language_detect eq 1} checked="checked"{/if} />
                        <label for="language_detect1">{gt text="Yes"}</label>
                        <input id="language_detect0" type="radio" name="mlsettings_language_detect" value="0"{if $language_detect eq 0} checked="checked"{/if} />
                        <label for="language_detect0">{gt text="No"}</label>
                    </span>
                </div>
                <div id="mlsettings_language_detect_warning">
                    <p class="z-informationmsg z-formnote">
                        {gt text="If this is set to 'Yes', Zikula try to serve the language requested by the each user's browser (if that language available and allowed by the multi-lingual settings). If users sets their personal language preference, then this setting will be overriden by their personal preference."}<br />
                    </p>
                </div>
            </fieldset>
            <fieldset>
                <legend>{gt text="Server"}</legend>
                <div class="z-formrow">
                    <label for="mlsettings_language_i18n">{gt text="Default language to use for this site"}</label>
                    {html_select_locales id=mlsettings_language_i18n name=mlsettings_language_i18n selected=$language_i18n installed=1 all=false}
                </div>
                <div class="z-formrow">
                    <label for="mlsettings_timezone_offset">{gt text="Time zone for anonymous guests"}</label>
                    <select id="mlsettings_timezone_offset" size="1" name="mlsettings_timezone_offset">
                        {timezoneselect selected=$timezone_offset}
                    </select>
                </div>
                <div class="z-formrow">
                    <label>{gt text="Server time zone"}</label>
                    <span>{$timezone_server_abbr}</span>
                    <input type="hidden" name="mlsettings_timezone_server" value="{$timezone_server|default:0}" />
                </div>
            </fieldset>
            <fieldset>
                <legend>{gt text="Variable validation"}</legend>
                <div class="z-formrow">
                    <label>{gt text="Allow IDN domain names"}</label>
                    <div>
                        <input id="idnnamesyes" type="radio" name="idnnames" value="1" {if $idnnames == 1}checked="checked" {/if}/>
                        <label for="idnnamesyes">{gt text="Yes"}</label>
                        <input id="idnnamesno" type="radio" name="idnnames" value="0" {if $idnnames != 1}checked="checked" {/if}/>
                        <label for="idnnamesno">{gt text="No"}</label>
                    </div>
                    <div class="z-formnote z-sub z-italic">{gt text="Notice: With IDN domains, special characters are allowed in e-mail addresses and URLs."}</div>
                </div>
            </fieldset>
            <div class="z-buttons z-formbuttons">
                {button src="button_ok.gif" set="icons/extrasmall" __alt="Save" __title="Save" __text="Save"}
                <a href="{modurl modname="Settings" type="admin"}" title="{gt text="Cancel"}">{img modname="core" src="button_cancel.gif" set="icons/extrasmall" __alt="Cancel" __title="Cancel"} {gt text="Cancel"}</a>
            </div>
        </div>
    </form>
</div>
