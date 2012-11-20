<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Solution" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'id.solutionSet.id', 'error')} ">
	<label for="solutionSetId">
		<g:message code="solution.id.solutionSet.id.label" default="Solution Set Id" />
		
	</label>
	<g:select name="solutionSetId" from="${SolutionSet.list()}" optionKey="id" optionValue="name" value="${solutionInstance?.id?.solutionSet?.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'id.solutionId', 'error')} ">
	<label for="solutionId">
		<g:message code="solution.id.solutionId.label" default="Solution Id" />
		
	</label>
	<g:field type="number" name="solutionId" value="${solutionInstance?.id?.solutionId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'cipher.id', 'error')} ">
	<label for="cipherId">
		<g:message code="solution.cipher.label" default="Cipher" />
		
	</label>
	<g:select name="cipherId" from="${Cipher.list()}" optionKey="id" optionValue="name" />
</div>