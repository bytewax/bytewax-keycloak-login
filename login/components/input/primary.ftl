<#macro kw invalid name autofocus=false disabled=false message=true required=true rest...>
  <label class="form__label" for="${name}">
    <#nested>
  </label>
  <input
   class="form__input"
    <#if autofocus>autofocus</#if>
    <#if disabled>disabled</#if>
    <#if required>required</#if>
    aria-invalid="${messagesPerField.existsError(invalid)?c}"
    id="${name}"
    name="${name}"
    <#list rest as attrName, attrValue>
      ${attrName}="${attrValue}"
    </#list>
  >
  <#if message && messagesPerField.existsError(invalid)>
    <div class="form__message">
      ${kcSanitize(messagesPerField.getFirstError(invalid))?no_esc}
    </div>
  </#if>
</#macro>
