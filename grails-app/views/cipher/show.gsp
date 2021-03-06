
<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cipher.label', default: 'Cipher')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript library="jquery" />
		<g:javascript src="cipher.js" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'cipher.css')}" type="text/css">
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
			
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="cipher.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${cipherInstance}" field="name"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="rows-label" class="property-label"><g:message code="cipher.rows.label" default="Rows" /></span>
					
						<span class="property-value" aria-labelledby="rows-label"><g:fieldValue bean="${cipherInstance}" field="rows"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="columns-label" class="property-label"><g:message code="cipher.columns.label" default="Columns" /></span>
					
						<span class="property-value" aria-labelledby="columns-label"><g:fieldValue bean="${cipherInstance}" field="columns"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="hasKnownSolution-label" class="property-label"><g:message code="cipher.hasKnownSolution.label" default="Has Known Solution" /></span>
					
						<span class="property-value" aria-labelledby="hasKnownSolution-label"><g:fieldValue bean="${cipherInstance}" field="hasKnownSolution"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="ciphertextCharacters-label" class="property-label"><g:message code="cipher.ciphertextCharacters.label" default="Ciphertext Characters" /></span>
					
					<table>
					<th colspan="${cipherInstance.columns}">
						Hover over a character to see all matching ciphertext characters in a red border.
					</th>
					<tr>
					<g:each in="${ (1..cipherInstance.ciphertextCharacters.size()) }">
						<g:set var="c" value="${cipherInstance.ciphertextCharacters.getAt(it - 1)}" />
						<td class="character ${c.value}">
						<span class="property-value" aria-labelledby="ciphertextCharacters-label">
							<g:link controller="ciphertext" action="show" params="[cipherId: c?.id.cipher.id, ciphertextId: c?.id.ciphertextId]">
								<g:img dir="images/cipher" file="${c.value.encodeAsHTML()}.gif" />
							</g:link>
						</span>
						</td>
						<g:if test="${(it % cipherInstance.columns) == 0}">
							</tr><tr>
						</g:if>
					</g:each>
					</tr>
					</table>
					
				</li>
			
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
