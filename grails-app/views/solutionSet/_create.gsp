<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="solutionSet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${solutionSetInstance?.name}" />
</div>