<%@ page import="com.ciphertool.zodiacengine.entities.Ciphertext" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'id.cipher.id', 'error')} ">
	<label for="id.cipher.id">
		<g:message code="ciphertext.id.cipher.id.label" default="Cipher Id" />
		
	</label>
	<g:select name="cipherId" from="${Cipher.list(fetch:[ciphertextCharacters: "lazy"])}" optionKey="id" optionValue="name" />
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'id.ciphertextId', 'error')} ">
	<label for="id.ciphertextId">
		<g:message code="ciphertext.id.ciphertextId.label" default="Ciphertext Id" />
		
	</label>
	<g:field type="number" name="ciphertextId" value="${ciphertextInstance?.id?.ciphertextId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: ciphertextInstance, field: 'value', 'error')} ">
	<label for="value">
		<g:message code="ciphertext.value.label" default="Value" />
		
	</label>
	<g:textField name="value" value="${ciphertextInstance?.value}" />
</div>