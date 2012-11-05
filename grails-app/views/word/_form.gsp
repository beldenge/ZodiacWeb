<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>



<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="word.id.label" default="Id" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'frequencyWeight', 'error')} ">
	<label for="frequencyWeight">
		<g:message code="word.frequencyWeight.label" default="Frequency Weight" />
		
	</label>
	<g:field type="number" name="frequencyWeight" value="${wordInstance.frequencyWeight}" />
</div>

