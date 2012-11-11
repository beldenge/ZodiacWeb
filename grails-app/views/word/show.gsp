
<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'word.label', default: 'Word')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-word" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-word" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list word">

				<li class="fieldcontain">
					<span id="word-label" class="property-label"><g:message code="word.id.word.label" default="Word" /></span>
					
						<span class="property-value" aria-labelledby="word-label"><g:fieldValue bean="${wordInstance}" field="id.word"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="partOfSpeech-label" class="property-label"><g:message code="word.id.partOfSpeech.label" default="Part Of Speech" /></span>
					
						<span class="property-value" aria-labelledby="partOfSpeech-label"><g:fieldValue bean="${wordInstance}" field="id.partOfSpeech"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="frequencyWeight-label" class="property-label"><g:message code="word.frequencyWeight.label" default="Frequency Weight" /></span>
					
						<span class="property-value" aria-labelledby="frequencyWeight-label"><g:fieldValue bean="${wordInstance}" field="frequencyWeight"/></span>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="word" value="${wordInstance?.id.word}" />
					<g:hiddenField name="partOfSpeech" value="${wordInstance?.id.partOfSpeech}" />
					<g:link class="edit" action="edit" params="[word: wordInstance?.id.word, partOfSpeech: wordInstance?.id.partOfSpeech]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
