<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.solution.id.solutionSet.name', 'error')} ">
	<label for="solutionSetName">
		<g:message code="id.solution.id.solutionSet.id.label" default="Solution Set Id" />
		
	</label>
	<g:select name="solutionSetId" from="${SolutionSet.list()}" optionKey="id" optionValue="name" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.solution.id.solutionId', 'error')} ">
	<label for="solution">
		<g:message code="id.solution.id.solutionId.label" default="Solution Id" />
		
	</label>
	<g:field type="number" name="solutionId" value="${plaintextInstance?.id?.solution?.id?.solutionId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: plaintextInstance, field: 'id.ciphertextId', 'error')} ">
	<label for="ciphertext">
		<g:message code="id.ciphertextId.label" default="Ciphertext Id" />
		
	</label>
	<g:field type="number" name="ciphertextId" value="${plaintextInstance?.id?.ciphertextId}" />
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

