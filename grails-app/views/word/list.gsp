
<%@ page import="com.ciphertool.sentencebuilder.entities.Word" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'word.label', default: 'Word')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-word" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-word" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="value" title="${message(code: 'word.id.word.label', default: 'Word')}" />
					
						<g:sortableColumn property="partOfSpeech" title="${message(code: 'word.id.partOfSpeech.label', default: 'Part Of Speech')}" />
					
						<g:sortableColumn property="frequencyWeight" title="${message(code: 'word.frequencyWeight.label', default: 'Frequency Weight')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${wordInstanceList}" status="i" var="wordInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" params="[word: wordInstance?.id.word, partOfSpeech: wordInstance?.id.partOfSpeech]" >${fieldValue(bean: wordInstance, field: "id.word")}</g:link></td>
						
						<td>${fieldValue(bean: wordInstance, field: "id.partOfSpeech")}</td>
						
						<td>${fieldValue(bean: wordInstance, field: "frequencyWeight")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${wordInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
