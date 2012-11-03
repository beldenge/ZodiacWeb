<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>



<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="word.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${wordInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'frequencyWeight', 'error')} ">
	<label for="frequencyWeight">
		<g:message code="word.frequencyWeight.label" default="Frequency Weight" />
		
	</label>
	<g:field type="number" name="frequencyWeight" value="${wordInstance.frequencyWeight}" />
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'partOfSpeech', 'error')} ">
	<label for="partOfSpeech">
		<g:message code="word.partOfSpeech.label" default="Part Of Speech" />
		
	</label>
	<g:field type="number" name="partOfSpeech" value="${wordInstance.partOfSpeech}" />
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'word', 'error')} ">
	<label for="word">
		<g:message code="word.word.label" default="Word" />
		
	</label>
	<g:textField name="word" value="${wordInstance?.word}" />
</div>

