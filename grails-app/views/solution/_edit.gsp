<%@ page import="com.ciphertool.zodiacengine.entities.Solution" %>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'id.solutionSet.name', 'error')} ">
	<label for="solutionSetName">
		<g:message code="solution.id.solutionSet.id.label" default="Solution Set Id" />
		
	</label>
	<g:link controller="solutionSet" action="show" id="${solutionInstance?.id?.solutionSet.id}"><g:fieldValue bean="${solutionInstance}" field="id.solutionSet.name"/></g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'id.solutionId', 'error')} ">
	<label for="solutionId">
		<g:message code="solution.id.solutionId.label" default="Solution Id" />
		
	</label>
	<g:fieldValue bean="${solutionInstance}" field="id.solutionId"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'cipher.name', 'error')} ">
	<label for="cipherName">
		<g:message code="solution.cipher.label" default="Cipher" />
		
	</label>
	<g:link controller="cipher" action="show" id="${solutionInstance?.cipher?.id}"><g:fieldValue bean="${solutionInstance}" field="cipher.name"/></g:link>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'totalMatches', 'error')} ">
	<label for="totalMatches">
		<g:message code="solution.totalMatches.label" default="Total Matches" />
		
	</label>
	<g:fieldValue bean="${solutionInstance}" field="totalMatches"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'uniqueMatches', 'error')} ">
	<label for="uniqueMatches">
		<g:message code="solution.uniqueMatches.label" default="Unique Matches" />
		
	</label>
	<g:fieldValue bean="${solutionInstance}" field="uniqueMatches"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'adjacentMatchCount', 'error')} ">
	<label for="adjacentMatchCount">
		<g:message code="solution.adjacentMatchCount.label" default="Adjacent Match Count" />
		
	</label>
	<g:fieldValue bean="${solutionInstance}" field="adjacentMatchCount"/>
</div>