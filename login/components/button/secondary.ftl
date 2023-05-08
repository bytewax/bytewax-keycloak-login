<#macro kw component="button" rest...>
  <${component}
    class="btn btn--secondary"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
