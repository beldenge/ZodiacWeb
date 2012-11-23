
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
					
						<g:sortableColumn property="id.solutionSet.id" title="${message(code: 'solution.id.solutionSet.id.label', default: 'Population Id')}" />
					
						<g:sortableColumn property="id.solutionId" title="${message(code: 'solution.id.solutionId.label', default: 'Solution Id')}" />					
					
						<g:sortableColumn property="cipher" title="${message(code: 'solution.cipher.label', default: 'Cipher')}" />
					
						<g:sortableColumn property="totalMatches" title="${message(code: 'solution.totalMatches.label', default: 'Total Matches')}" />
					
						<g:sortableColumn property="uniqueMatches" title="${message(code: 'solution.uniqueMatches.label', default: 'Unique Matches')}" />
					
						<g:sortableColumn property="adjacentMatchCount" title="${message(code: 'solution.adjacentMatchCount.label', default: 'Adjacent Matches')}" />
						
						<g:sortableColumn property="createdDate" title="${message(code: 'solution.createdDate.label', default: 'Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${solutionInstanceList}" status="i" var="solutionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="SolutionSet" action="show" id="${solutionInstance.id.solutionSet.id}">${fieldValue(bean: solutionInstance, field: "id.solutionSet.id")}</g:link></td>
					
						<td><g:link action="show" params="[solutionId: solutionInstance?.id.solutionId, solutionSetId: solutionInstance?.id.solutionSet.id]">${fieldValue(bean: solutionInstance, field: "id.solutionId")}</g:link></td>
					
						<td><g:link controller="cipher" action="show" id="${solutionInstance.cipher.id}">${fieldValue(bean: solutionInstance, field: "cipher.name")}</g:link></td>
					
						<td>${fieldValue(bean: solutionInstance, field: "totalMatches")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "uniqueMatches")}</td>
					
						<td>${fieldValue(bean: solutionInstance, field: "adjacentMatchCount")}</td>
						
						<td><g:formatDate date="${solutionInstance?.createdDate}" type="datetime" style="MEDIUM"/></td>
					
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
