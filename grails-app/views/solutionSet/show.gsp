
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
			
				<g:if test="${solutionSetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="solutionSet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${solutionSetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solutionSetInstance?.solutions}">
				<li class="fieldcontain">
					<span id="solutions-label" class="property-label"><g:message code="solutionSet.solutions.label" default="Solutions" /></span>
					
						<g:each in="${solutionSetInstance.solutions}" var="s">
						<span class="property-value" aria-labelledby="solutions-label"><g:link controller="solution" action="show" params="[solutionId: s?.id.solutionId, solutionSetId: s?.id.solutionSet.id]">${s?.id.solutionId.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
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
