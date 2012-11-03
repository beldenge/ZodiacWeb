
<%@ page import="com.ciphertool.zodiacengine.entities.Solution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solution.label', default: 'Solution')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-solution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-solution" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="adjacentMatchCount" title="${message(code: 'solution.adjacentMatchCount.label', default: 'Adjacent Match Count')}" />
					
						<th><g:message code="solution.cipher.label" default="Cipher" /></th>
					
						<g:sortableColumn property="cipherId" title="${message(code: 'solution.cipherId.label', default: 'Cipher Id')}" />
					
						<g:sortableColumn property="solutionId" title="${message(code: 'solution.solutionId.label', default: 'Solution Id')}" />
					
						<th><g:message code="solution.solutionSet.label" default="Solution Set" /></th>
					
						<g:sortableColumn property="totalMatches" title="${message(code: 'solution.totalMatches.label', default: 'Total Matches')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solutionInstanceList}" status="i" var="solutionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${solutionInstance.id}">${fieldValue(bean: solutionInstance, field: "adjacentMatchCount")}</g:link></td>
					
						<td>${fieldValue(bean: solutionInstance, field: "cipher")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "cipherId")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "solutionId")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "solutionSet")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "totalMatches")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${solutionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
