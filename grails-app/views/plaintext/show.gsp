
<%@ page import="com.ciphertool.zodiacengine.entities.Plaintext" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'plaintext.label', default: 'Plaintext')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-plaintext" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-plaintext" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list plaintext">
			
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="plaintext.value.label" default="Value" /></span>
					
					<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${plaintextInstance}" field="value"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="hasMatch-label" class="property-label"><g:message code="plaintext.hasMatch.label" default="Has Match" /></span>
					
					<span class="property-value" aria-labelledby="hasMatch-label"><g:formatBoolean boolean="${plaintextInstance?.hasMatch}" /></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="solution-label" class="property-label"><g:message code="plaintext.id.solution.label" default="Solution" /></span>
					
					<span class="property-value" aria-labelledby="solution-label"><g:link controller="solution" action="show" params="[solutionId: plaintextInstance?.id.solution.id.solutionId, solutionSetId: plaintextInstance?.id.solution.id.solutionSet.id]">${fieldValue(bean: plaintextInstance, field: "id.solution.id.solutionId")}</g:link></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="ciphertextId-label" class="property-label"><g:message code="plaintext.id.ciphertextId.label" default="Ciphertext" /></span>
					
					<span class="property-value" aria-labelledby="ciphertextId-label"><g:link controller="ciphertext" action="show" params="[cipherId: plaintextInstance?.id.solution.cipher.id, ciphertextId: plaintextInstance?.id.ciphertextId]"><g:img dir="images/cipher" file="${plaintextInstance?.id.solution.cipher.ciphertextCharacters.getAt(plaintextInstance?.id.ciphertextId)?.value?.encodeAsHTML()}.gif" /></g:link></span>
					
				</li>
				
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="solutionSetId" value="${plaintextInstance?.id.solution.id.solutionSet.id}" />
					<g:hiddenField name="solutionId" value="${plaintextInstance?.id.solution.id.solutionId}" />
					<g:hiddenField name="ciphertextId" value="${plaintextInstance?.id.ciphertextId}" />
					<g:link class="edit" action="edit" params="[solutionSetId:plaintextInstance?.id.solution.id.solutionSet.id, solutionId:plaintextInstance?.id.solution.id.solutionId, ciphertextId:plaintextInstance?.id.ciphertextId]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
