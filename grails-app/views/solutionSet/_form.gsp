<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>



<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="solutionSet.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${solutionSetInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: solutionSetInstance, field: 'solutions', 'error')} ">
	<label for="solutions">
		<g:message code="solutionSet.solutions.label" default="Solutions" />
		
	</label>
	<g:select name="solutions" from="${com.ciphertool.zodiacengine.entities.Solution.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${solutionSetInstance?.solutions*.id}" class="many-to-many"/>
</div>

