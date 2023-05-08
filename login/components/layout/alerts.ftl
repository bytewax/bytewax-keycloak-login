<#macro kw>
  <#switch message.type>
    <#case "error">
      <#assign color="alert--error">
      <#break>
    <#case "info">
      <#assign color="alert--info">
      <#break>
    <#case "success">
      <#assign color="alert--success">
      <#break>
    <#case "warning">
      <#assign color="alert--warning">
      <#break>
    <#default>
      <#assign color="alert--default">
  </#switch>

  <div class="${color} alert role="alert">
    <span>${kcSanitize(message.summary)?no_esc}</span>
  </div>
</#macro>
