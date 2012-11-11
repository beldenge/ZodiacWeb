<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>
<%@ page import="com.ciphertool.sentencebuilder.common.PartOfSpeech" %>



<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id.word', 'error')} ">
	<label for="word">
		<g:message code="word.word.label" default="Word" />
		
	</label>
	<g:field type="text" name="word" maxlength="50" />
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'id.partOfSpeech', 'error')} ">
	<label for="partOfSpeech">
		<g:message code="word.partOfSpeech.label" default="Part of Speech" />
		
	</label>
	<g:select name="partOfSpeech" from="${PartOfSpeech?.values()}" optionKey="tag" />
</div>

<div class="fieldcontain ${hasErrors(bean: wordInstance, field: 'frequencyWeight', 'error')} ">
	<label for="frequencyWeight">
		<g:message code="word.frequencyWeight.label" default="Frequency Weight" />
		
	</label>
	<g:field type="number" name="frequencyWeight" value="${wordInstance.frequencyWeight}" />
</div>

