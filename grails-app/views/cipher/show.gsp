
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cipher.label', default: 'Cipher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-cipher" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-cipher" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list cipher">
			
				<g:if test="${cipherInstance?.ciphertextCharacters}">
				<li class="fieldcontain">
					<span id="ciphertextCharacters-label" class="property-label"><g:message code="cipher.ciphertextCharacters.label" default="Ciphertext Characters" /></span>
					
						<g:each in="${cipherInstance.ciphertextCharacters}" var="c">
						<span class="property-value" aria-labelledby="ciphertextCharacters-label"><g:link controller="ciphertext" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cipherInstance?.columns}">
				<li class="fieldcontain">
					<span id="columns-label" class="property-label"><g:message code="cipher.columns.label" default="Columns" /></span>
					
						<span class="property-value" aria-labelledby="columns-label"><g:fieldValue bean="${cipherInstance}" field="columns"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cipherInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="cipher.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cipherInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cipherInstance?.rows}">
				<li class="fieldcontain">
					<span id="rows-label" class="property-label"><g:message code="cipher.rows.label" default="Rows" /></span>
					
						<span class="property-value" aria-labelledby="rows-label"><g:fieldValue bean="${cipherInstance}" field="rows"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${cipherInstance?.id}" />
					<g:link class="edit" action="edit" id="${cipherInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
