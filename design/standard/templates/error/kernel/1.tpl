<div class="warning">
<h2>{"Access denied"|i18n("design/standard/error/kernel")}</h2>
<p>{"You don't have permission to access this area."|i18n("design/standard/error/kernel")}</p>
<p>{"Possible reasons for this is."|i18n("design/standard/error/kernel")}</p>
<ul>
    {section show=ne($current_user.contentobject_id,$anonymous_user_id)}
    <li>{"Your current user does not have the proper privileges to access this page."|i18n("design/standard/error/kernel")}</li>
    {section-else}
    <li>{"You're currently not logged in on the site, to get proper access create a new user or login with an existing user."|i18n("design/standard/error/kernel")}</li>
    {/section}
    <li>{"You misspelled some parts of your url, try changing it."|i18n("design/standard/error/kernel")}</li>
</ul>
</div>

{section show=eq($current_user.contentobject_id,$anonymous_user_id)}

    {section show=$embed_content}

    {$embed_content}
    {section-else}

        <form method="post" action={"/user/login/"|ezurl}>

        <p>{"Click the Login button to login."|i18n("design/standard/error/kernel")}</p>
        <div class="buttonblock">
        <input class="button" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user','Button')}" />
        </div>

        <input type="hidden" name="Login" value="" />
        <input type="hidden" name="Password" value="" />
        <input type="hidden" name="RedirectURI" value="{$redirect_uri}" />
        </form>

    {/section}

{/section}
