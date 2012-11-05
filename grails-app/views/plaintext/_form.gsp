<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>



<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="plaintext.id.label" default="Id" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'hasMatch', 'error')} ">
	<label for="hasMatch">
		<g:message code="plaintext.hasMatch.label" default="Has Match" />
		
	</label>
	<g:checkBox name="hasMatch" value="${plaintextInstance?.hasMatch}" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="plaintext.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${plaintextInstance?.value}" />
</div>

