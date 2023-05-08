<#macro kw component="button" rest...>
  <${component}
    class="btn btn--primary"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
    <#nested>
  </${component}>
</#macro>
