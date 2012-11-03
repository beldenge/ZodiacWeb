<%@ page import="com.ciphertool.zodiacengine.entities.Ciphertext" %>



<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="ciphertext.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${ciphertextInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'cipher', 'error')} ">
	<label for="cipher">
		<g:message code="ciphertext.cipher.label" default="Cipher" />
		
	</label>
	<g:select id="cipher" name="cipher.id" from="${com.ciphertool.zodiacengine.entities.Cipher.list()}" optionKey="id" required="" value="${ciphertextInstance?.cipher?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'ciphertextId', 'error')} ">
	<label for="ciphertextId">
		<g:message code="ciphertext.ciphertextId.label" default="Ciphertext Id" />
		
	</label>
	<g:field type="number" name="ciphertextId" value="${ciphertextInstance.ciphertextId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="ciphertext.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${ciphertextInstance?.value}" />
</div>

