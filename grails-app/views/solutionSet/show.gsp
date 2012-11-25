
<%@ page import="com.ciphertool.zodiacengine.entities.SolutionSet" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solutionSet.label', default: 'SolutionSet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solutionSet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solutionSet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solutionSet">

				<li class="fieldcontain">
					<span id="id-label" class="property-label"><g:message code="solutionSet.id.label" default="Population Id" /></span>
					
						<span class="property-value" aria-labelledby="id-label"><g:fieldValue bean="${solutionSetInstance}" field="id"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="solutionSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${solutionSetInstance}" field="name"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="cipher-label" class="property-label"><g:message code="solutionSet.cipher.label" default="Cipher" /></span>
					
						<span class="property-value" aria-labelledby="cipher-label"><g:link controller="cipher" action="show" id="${solutionSetInstance?.cipher?.id}">${solutionSetInstance?.cipher?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="solutionSet.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${solutionSetInstance?.createdDate}" type="datetime" style="MEDIUM"/></span>
					
				</li>

			</ol>
			
			<div id="list-solution" class="content scaffold-list" role="main">
				<h1><g:message code="default.list.label" args="['Solution']" /></h1>
				<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
				</g:if>
				<table>
					<thead>
						<tr>
						
							<!-- <th><g:message code="solution.id.label" default="Solution Id" /></th> -->
							<g:sortableColumn property="id.solutionId" title="${message(code: 'solution.id.label', default: 'Solution Id')}" />
							
							<g:sortableColumn property="cipher" title="${message(code: 'solution.cipher.label', default: 'Cipher')}" />						
						
							<g:sortableColumn property="totalMatches" title="${message(code: 'solution.totalMatches.label', default: 'Total Matches')}" />
						
							<g:sortableColumn property="uniqueMatches" title="${message(code: 'solution.uniqueMatches.label', default: 'Unique Matches')}" />
						
							<g:sortableColumn property="adjacentMatchCount" title="${message(code: 'solution.adjacentMatchCount.label', default: 'Adjacent Matches')}" />
							
							<g:sortableColumn property="createdDate" title="${message(code: 'solution.createdDate.label', default: 'Created Date')}" />
						
						</tr>
					</thead>
					<tbody>
					<g:each in="${solutionInstanceList}" status="i" var="solutionInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						
							<td><g:link controller="solution" action="show" params="[solutionId: solutionInstance?.id.solutionId, solutionSetId: solutionInstance?.id.solutionSet.id]">${fieldValue(bean: solutionInstance, field: "id.solutionId")}</g:link></td>
						
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
					<g:paginate total="${solutionInstanceTotal}" id="${solutionSetInstance.id}"/>
				</div>
			</div>
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solutionSetInstance?.id}" />
					<g:link class="edit" action="edit" id="${solutionSetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
