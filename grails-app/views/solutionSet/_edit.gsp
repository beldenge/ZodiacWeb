<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>



<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="solutionSet.id.label" default="Id" />
		
	</label>
	<g:fieldValue bean="${solutionSetInstance}" field="id"/>
</div>

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="solutionSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${solutionSetInstance?.name}" />
</div>