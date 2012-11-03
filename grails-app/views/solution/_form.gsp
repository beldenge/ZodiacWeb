<%@ page import="com.ciphertool.zodiacengine.entities.Solution" %>



<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="solution.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${solutionInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'adjacentMatchCount', 'error')} ">
	<label for="adjacentMatchCount">
		<g:message code="solution.adjacentMatchCount.label" default="Adjacent Match Count" />
		
	</label>
	<g:field type="number" name="adjacentMatchCount" value="${solutionInstance.adjacentMatchCount}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'cipher', 'error')} ">
	<label for="cipher">
		<g:message code="solution.cipher.label" default="Cipher" />
		
	</label>
	<g:select id="cipher" name="cipher.id" from="${com.ciphertool.zodiacengine.entities.Cipher.list()}" optionKey="id" required="" value="${solutionInstance?.cipher?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'cipherId', 'error')} ">
	<label for="cipherId">
		<g:message code="solution.cipherId.label" default="Cipher Id" />
		
	</label>
	<g:field type="number" name="cipherId" value="${solutionInstance.cipherId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'plaintextCharacters', 'error')} ">
	<label for="plaintextCharacters">
		<g:message code="solution.plaintextCharacters.label" default="Plaintext Characters" />
		
	</label>
	<g:select name="plaintextCharacters" from="${com.ciphertool.zodiacengine.entities.Plaintext.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${solutionInstance?.plaintextCharacters*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'solutionId', 'error')} ">
	<label for="solutionId">
		<g:message code="solution.solutionId.label" default="Solution Id" />
		
	</label>
	<g:field type="number" name="solutionId" value="${solutionInstance.solutionId}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'solutionSet', 'error')} ">
	<label for="solutionSet">
		<g:message code="solution.solutionSet.label" default="Solution Set" />
		
	</label>
	<g:select id="solutionSet" name="solutionSet.id" from="${com.ciphertool.zodiacengine.entities.SolutionSet.list()}" optionKey="id" required="" value="${solutionInstance?.solutionSet?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'totalMatches', 'error')} ">
	<label for="totalMatches">
		<g:message code="solution.totalMatches.label" default="Total Matches" />
		
	</label>
	<g:field type="number" name="totalMatches" value="${solutionInstance.totalMatches}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionInstance, field: 'uniqueMatches', 'error')} ">
	<label for="uniqueMatches">
		<g:message code="solution.uniqueMatches.label" default="Unique Matches" />
		
	</label>
	<g:field type="number" name="uniqueMatches" value="${solutionInstance.uniqueMatches}" />
</div>

