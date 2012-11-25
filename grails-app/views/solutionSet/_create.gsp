<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="solutionSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${solutionSetInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'cipher.id', 'error')} ">
	<label for="cipherId">
		<g:message code="solutionSetInstance.cipher.label" default="Cipher" />
		
	</label>
	<g:select name="cipherId" from="${Cipher.list()}" optionKey="id" optionValue="name" />
</div>