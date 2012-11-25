
<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solutionSet.label', default: 'SolutionSet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solutionSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solutionSet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'solutionSet.id.label', default: 'Population Id')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'solutionSet.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="cipher" title="${message(code: 'solutionSet.cipher.label', default: 'Cipher')}" />
						
						<g:sortableColumn property="createdDate" title="${message(code: 'solutionSet.createdDate.label', default: 'Created Date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solutionSetInstanceList}" status="i" var="solutionSetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solutionSetInstance.id}">${fieldValue(bean: solutionSetInstance, field: "id")}</g:link></td>
					
						<td>${fieldValue(bean: solutionSetInstance, field: "name")}</td>
						
						<td><g:link controller="cipher" action="show" id="${solutionSetInstance.cipher.id}">${fieldValue(bean: solutionSetInstance, field: "cipher.name")}</g:link></td>
						
						<td><g:formatDate date="${solutionSetInstance?.createdDate}" type="datetime" style="MEDIUM"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solutionSetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
