<#macro kw name checked=false rest...>
  <div class="checkbox-group">
    <input
      <#if checked>checked</#if>
      class="checkbox-input"
      id="${name}"
      name="${name}"
      type="checkbox"
      <#list rest as attrName, attrValue>
        ${attrName}="${attrValue}"
      </#list>
    >
    <label class="checkbox-label" for="${name}">
      <#nested>
    </label>
  </div>
</#macro>
