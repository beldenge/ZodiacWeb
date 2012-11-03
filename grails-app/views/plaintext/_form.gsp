<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>



<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="plaintext.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${plaintextInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'ciphertextId', 'error')} ">
	<label for="ciphertextId">
		<g:message code="plaintext.ciphertextId.label" default="Ciphertext Id" />
		
	</label>
	<g:field type="number" name="ciphertextId" value="${plaintextInstance.ciphertextId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'hasMatch', 'error')} ">
	<label for="hasMatch">
		<g:message code="plaintext.hasMatch.label" default="Has Match" />
		
	</label>
	<g:checkBox name="hasMatch" value="${plaintextInstance?.hasMatch}" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'solution', 'error')} ">
	<label for="solution">
		<g:message code="plaintext.solution.label" default="Solution" />
		
	</label>
	<g:select id="solution" name="solution.id" from="${com.ciphertool.zodiacengine.entities.Solution.list()}" optionKey="id" required="" value="${plaintextInstance?.solution?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="plaintext.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${plaintextInstance?.value}" />
</div>

