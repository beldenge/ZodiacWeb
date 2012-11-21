<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.solution.id.solutionSet.name', 'error')} ">
	<label for="solutionSetName">
		<g:message code="id.solution.id.solutionSet.id.label" default="Solution Set Id" />
		
	</label>
	<g:link controller="solutionSet" action="show" id="${plaintextInstance?.id?.solution?.id.solutionSet.id}"><g:fieldValue bean="${plaintextInstance}" field="id.solution.id.solutionSet.name"/></g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.solution.id.solutionId', 'error')} ">
	<label for="solution">
		<g:message code="id.solution.id.solutionId.label" default="Solution Id" />
		
	</label>
	<g:link controller="solution" action="show" params="[solutionSetId:plaintextInstance?.id?.solution.id.solutionSet.id, solutionId:plaintextInstance?.id?.solution.id.solutionId]"><g:fieldValue bean="${plaintextInstance}" field="id.solution.id.solutionId"/></g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.ciphertextId', 'error')} ">
	<label for="ciphertext">
		<g:message code="id.ciphertextId.label" default="Ciphertext Id" />
		
	</label>
	<g:link controller="ciphertext" action="show" params="[cipherId:plaintextInstance?.id?.solution.cipher.id, ciphertextId:plaintextInstance?.id?.ciphertextId]"><g:fieldValue bean="${plaintextInstance}" field="id.ciphertextId"/></g:link>
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

