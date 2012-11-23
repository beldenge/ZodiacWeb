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

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'createdDate', 'error')} ">
	<label for="createdDate">
		<g:message code="solutionSet.createdDate.label" default="Created Date" />
		
	</label>
	<g:formatDate date="${solutionSetInstance?.createdDate}" type="datetime" style="MEDIUM"/>
</div>