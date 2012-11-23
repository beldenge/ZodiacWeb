<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id.word', 'error')} ">
	<label for="id.word">
		<g:message code="word.word.label" default="Word" />
		
	</label>
	<g:fieldValue bean="${wordInstance}" field="id.word"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id.partOfSpeech', 'error')} ">
	<label for="id.partOfSpeech">
		<g:message code="word.partOfSpeech.label" default="Part of Speech" />
		
	</label>
	<g:fieldValue bean="${wordInstance}" field="id.partOfSpeech"/>
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'frequencyWeight', 'error')} ">
	<label for="frequencyWeight">
		<g:message code="word.frequencyWeight.label" default="Frequency Weight" />
		
	</label>
	<g:field type="number" name="frequencyWeight" value="${wordInstance.frequencyWeight}" />
</div>