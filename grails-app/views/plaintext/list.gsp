
<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plaintext.label', default: 'Plaintext')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-plaintext" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-plaintext" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="hasMatch" title="${message(code: 'plaintext.hasMatch.label', default: 'Has Match')}" />
					
						<g:sortableColumn property="value" title="${message(code: 'plaintext.value.label', default: 'Value')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${plaintextInstanceList}" status="i" var="plaintextInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${plaintextInstance.id}">${fieldValue(bean: plaintextInstance, field: "hasMatch")}</g:link></td>
					
						<td>${fieldValue(bean: plaintextInstance, field: "value")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${plaintextInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
