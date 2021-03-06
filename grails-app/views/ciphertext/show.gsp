
<%@ page import="com.ciphertool.zodiacengine.entities.Ciphertext" %>
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'ciphertext.label', default: 'Ciphertext')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-ciphertext" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-ciphertext" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list ciphertext">

				<li class="fieldcontain">
					<span id="cipher-label" class="property-label"><g:message code="ciphertext.id.cipher.name.label" default="Cipher" /></span>
					
						<span class="property-value" aria-labelledby="cipher-label"><g:link controller="cipher" action="show" id="${ciphertextInstance?.id.cipher.id}"><g:fieldValue bean="${ciphertextInstance}" field="id.cipher.name"/></g:link></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="ciphertextId-label" class="property-label"><g:message code="ciphertext.id.ciphertextId.label" default="Ciphertext Id" /></span>
					
						<span class="property-value" aria-labelledby="ciphertextId-label"><g:fieldValue bean="${ciphertextInstance}" field="id.ciphertextId"/></span>
					
				</li>				
				
				<li class="fieldcontain">
					<span id="value-label" class="property-label"><g:message code="ciphertext.value.label" default="Value" /></span>
					
						<span class="property-value" aria-labelledby="value-label"><g:fieldValue bean="${ciphertextInstance}" field="value"/></span>
					
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="cipherId" value="${ciphertextInstance?.id.cipher.id}" />
					<g:hiddenField name="ciphertextId" value="${ciphertextInstance?.id.ciphertextId}" />
					<g:link class="edit" action="edit" params="[cipherId:ciphertextInstance?.id.cipher.id, ciphertextId:ciphertextInstance?.id.ciphertextId]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
