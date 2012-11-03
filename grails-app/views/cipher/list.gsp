
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cipher.label', default: 'Cipher')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-cipher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cipher" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="columns" title="${message(code: 'cipher.columns.label', default: 'Columns')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'cipher.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="rows" title="${message(code: 'cipher.rows.label', default: 'Rows')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cipherInstanceList}" status="i" var="cipherInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cipherInstance.id}">${fieldValue(bean: cipherInstance, field: "columns")}</g:link></td>
					
						<td>${fieldValue(bean: cipherInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: cipherInstance, field: "rows")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cipherInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
