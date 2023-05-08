<#macro kw>
  <header class="login__header">
    <img class="login__logo" src="${url.resourcesPath}/dist/img/logo.svg" alt="${kcSanitize(msg("loginTitleHtml", (realm.displayNameHtml!"")))?no_esc}" />
  </header>
</#macro>
