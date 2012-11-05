
<%@ page import="com.ciphertool.zodiacengine.entities.Solution" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'solution.label', default: 'Solution')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-solution" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-solution" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list solution">
			
				<g:if test="${solutionInstance?.adjacentMatchCount}">
				<li class="fieldcontain">
					<span id="adjacentMatchCount-label" class="property-label"><g:message code="solution.adjacentMatchCount.label" default="Adjacent Match Count" /></span>
					
						<span class="property-value" aria-labelledby="adjacentMatchCount-label"><g:fieldValue bean="${solutionInstance}" field="adjacentMatchCount"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solutionInstance?.cipher}">
				<li class="fieldcontain">
					<span id="cipher-label" class="property-label"><g:message code="solution.cipher.label" default="Cipher" /></span>
					
						<span class="property-value" aria-labelledby="cipher-label"><g:link controller="cipher" action="show" id="${solutionInstance?.cipher?.id}">${solutionInstance?.cipher?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${solutionInstance?.cipherId}">
				<li class="fieldcontain">
					<span id="cipherId-label" class="property-label"><g:message code="solution.cipherId.label" default="Cipher Id" /></span>
					
						<span class="property-value" aria-labelledby="cipherId-label"><g:fieldValue bean="${solutionInstance}" field="cipherId"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solutionInstance?.plaintextCharacters}">
				<li class="fieldcontain">
					<span id="plaintextCharacters-label" class="property-label"><g:message code="solution.plaintextCharacters.label" default="Plaintext Characters" /></span>
					
						<g:each in="${solutionInstance.plaintextCharacters}" var="p">
						<span class="property-value" aria-labelledby="plaintextCharacters-label"><g:link controller="plaintext" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${solutionInstance?.totalMatches}">
				<li class="fieldcontain">
					<span id="totalMatches-label" class="property-label"><g:message code="solution.totalMatches.label" default="Total Matches" /></span>
					
						<span class="property-value" aria-labelledby="totalMatches-label"><g:fieldValue bean="${solutionInstance}" field="totalMatches"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${solutionInstance?.uniqueMatches}">
				<li class="fieldcontain">
					<span id="uniqueMatches-label" class="property-label"><g:message code="solution.uniqueMatches.label" default="Unique Matches" /></span>
					
						<span class="property-value" aria-labelledby="uniqueMatches-label"><g:fieldValue bean="${solutionInstance}" field="uniqueMatches"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${solutionInstance?.id}" />
					<g:link class="edit" action="edit" id="${solutionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
