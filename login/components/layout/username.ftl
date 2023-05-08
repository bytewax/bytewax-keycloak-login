<#import "../icon/external-link.ftl" as iconExternalLink>
<#import "../link/primary.ftl" as linkPrimary>

<#macro kw>
  <#nested "show-username">
  <div class="username">
    <strong>${auth.attemptedUsername}</strong>
    <@linkPrimary.kw
      href="${url.loginRestartFlowUrl}"
      title="${msg('restartLoginTooltip')}"
    >
      <@iconExternalLink.kw />
    </@linkPrimary.kw>
  </div>
</#macro>
