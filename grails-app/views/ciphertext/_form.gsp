<%@ page import="com.ciphertool.zodiacengine.entities.Ciphertext" %>



<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="ciphertext.id.label" default="Id" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="ciphertext.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${ciphertextInstance?.value}" />
</div>

