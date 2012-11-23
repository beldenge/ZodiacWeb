
<%@ page import="com.ciphertool.zodiacengine.entities.Ciphertext" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ciphertext.label', default: 'Ciphertext')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-ciphertext" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-ciphertext" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id.cipher.id" title="${message(code: 'ciphertext.id.cipher.id.label', default: 'Cipher Id')}" />
					
						<g:sortableColumn property="id.ciphertextId" title="${message(code: 'ciphertext.id.ciphertextId.label', default: 'Ciphertext Id')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'ciphertext.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${ciphertextInstanceList}" status="i" var="ciphertextInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="cipher" action="show" id="${ciphertextInstance?.id.cipher.id}">${fieldValue(bean: ciphertextInstance, field: "id.cipher.id")}</g:link></td>
					
						<td><g:link action="show" params="[cipherId:ciphertextInstance?.id.cipher.id, ciphertextId:ciphertextInstance?.id.ciphertextId]">${fieldValue(bean: ciphertextInstance, field: "id.ciphertextId")}</g:link></td>
					
						<td>${fieldValue(bean: ciphertextInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${ciphertextInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
