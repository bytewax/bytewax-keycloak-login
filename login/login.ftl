<#import "template.ftl" as layout>
<#import "components/provider.ftl" as provider>
<#import "components/button/primary.ftl" as buttonPrimary>
<#import "components/checkbox/primary.ftl" as checkboxPrimary>
<#import "components/input/primary.ftl" as inputPrimary>
<#import "components/label/username.ftl" as labelUsername>
<#import "components/link/primary.ftl" as linkPrimary>

<@layout.registrationLayout
  displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??
  displayMessage=!messagesPerField.existsError("username", "password")
  ;
  section
>
  <#if section="header">
    ${msg("loginAccountTitle")}
  <#elseif section="form">
    <#if realm.password>
      <form
        class="form"
        action="${url.loginAction}"
        method="post"
        onsubmit="login.disabled = true; return true;"
      >
        <input
          name="credentialId"
          type="hidden"
          value="<#if auth.selectedCredential?has_content>${auth.selectedCredential}</#if>"
        >
        <div class="form__group">
          <@inputPrimary.kw
            autocomplete=realm.loginWithEmailAllowed?string("email", "username")
            autofocus=true
            disabled=usernameEditDisabled??
            invalid=["username", "password"]
            name="username"
            type="text"
            value=(login.username)!''
          >
            <@labelUsername.kw />
          </@inputPrimary.kw>
        </div>
        <div class="form__group">
          <@inputPrimary.kw
            invalid=["username", "password"]
            message=false
            name="password"
            type="password"
          >
            ${msg("password")}
          </@inputPrimary.kw>
        </div>
        <div class="form__actions">
          <@buttonPrimary.kw name="login" type="submit">
            ${msg("doLogIn")}
            <svg class="btn__icon" xmlns="http://www.w3.org/2000/svg" height="48" viewBox="0 96 960 960" width="48"><path d="M489 936v-60h291V276H489v-60h291q24 0 42 18t18 42v600q0 24-18 42t-42 18H489Zm-78-185-43-43 102-102H120v-60h348L366 444l43-43 176 176-174 174Z"/></svg>
          </@buttonPrimary.kw>
          <div class="form__remember">
            <#if realm.rememberMe && !usernameEditDisabled??>
              <@checkboxPrimary.kw checked=login.rememberMe?? name="rememberMe">
                ${msg("rememberMe")}
              </@checkboxPrimary.kw>
            </#if>
            <#if realm.resetPasswordAllowed>
              <@linkPrimary.kw href=url.loginResetCredentialsUrl>
                <span class="text-sm">${msg("doForgotPassword")}</span>
              </@linkPrimary.kw>
            </#if>
          </div>
        </div>
      </form>
    </#if>
    <#if realm.password && social.providers??>
      <@provider.kw />
    </#if>
  <#elseif section="info">
    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
      <div class="text-center">
        ${msg("noAccount")}
        <@linkPrimary.kw href=url.registrationUrl>
          ${msg("doRegister")}
        </@linkPrimary.kw>
      </div>
    </#if>
  </#if>
</@layout.registrationLayout>
