
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
			
				<li class="fieldcontain">
					<span id="solutionId-label" class="property-label"><g:message code="solution.id.solutionId.label" default="Solution Id" /></span>
					
						<span class="property-value" aria-labelledby="solutionId-label"><g:fieldValue bean="${solutionInstance}" field="id.solutionId"/></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="solutionSetId-label" class="property-label"><g:message code="solution.id.solutionSet.id.label" default="Population Id" /></span>
					
						<span class="property-value" aria-labelledby="solutionSetId-label"><g:fieldValue bean="${solutionInstance}" field="id.solutionSet.id"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="totalMatches-label" class="property-label"><g:message code="solution.totalMatches.label" default="Total Matches" /></span>
					
						<span class="property-value" aria-labelledby="totalMatches-label"><g:fieldValue bean="${solutionInstance}" field="totalMatches"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="uniqueMatches-label" class="property-label"><g:message code="solution.uniqueMatches.label" default="Unique Matches" /></span>
					
						<span class="property-value" aria-labelledby="uniqueMatches-label"><g:fieldValue bean="${solutionInstance}" field="uniqueMatches"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="adjacentMatchCount-label" class="property-label"><g:message code="solution.adjacentMatchCount.label" default="Adjacent Matches" /></span>
					
						<span class="property-value" aria-labelledby="adjacentMatchCount-label"><g:fieldValue bean="${solutionInstance}" field="adjacentMatchCount"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="cipher-label" class="property-label"><g:message code="solution.cipher.label" default="Cipher" /></span>
					
						<span class="property-value" aria-labelledby="cipher-label"><g:link controller="cipher" action="show" id="${solutionInstance?.cipher?.id}">${solutionInstance?.cipher?.name.encodeAsHTML()}</g:link></span>
					
				</li>
				
				<li class="fieldcontain">
					<span id="createdDate-label" class="property-label"><g:message code="solution.createdDate.label" default="Created Date" /></span>
					
						<span class="property-value" aria-labelledby="createdDate-label"><g:formatDate date="${solutionInstance?.createdDate}" type="datetime" style="MEDIUM"/></span>
					
				</li>
			
				<li class="fieldcontain">
					<span id="plaintextCharacters-label" class="property-label"><g:message code="solution.plaintextCharacters.label" default="Plaintext Characters" /></span>
					
					<table>
					<tr>
					<g:if test="${solutionInstance.plaintextCharacters != null && solutionInstance.plaintextCharacters.size() > 0}">
						<g:each in="${ (1..solutionInstance.plaintextCharacters.size()) }">
							<g:set var="p" value="${solutionInstance.plaintextCharacters.getAt(it - 1)}" />
							<td>
							<span class="property-value" aria-labelledby="plaintextCharacters-label">
								<g:link controller="plaintext" action="show" params="[solutionSetId: p?.id.solution.id.solutionSet.id, solutionId: p?.id.solution.id.solutionId, ciphertextId: p?.id.ciphertextId]">
									<g:if test="${p.hasMatch}">
										[${p.value.encodeAsHTML()}]
									</g:if>
									<g:else>
										${p.value.encodeAsHTML()}
									</g:else>
								</g:link>
							</span>
							</td>
							<g:if test="${(it % solutionInstance.cipher.columns) == 0}">
								</tr><tr>
							</g:if>
						</g:each>
					</g:if>
					</tr>
					</table>
				</li>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="solutionId" value="${solutionInstance?.id.solutionId}" />
					<g:hiddenField name="solutionSetId" value="${solutionInstance?.id.solutionSet.id}" />
					<g:link class="edit" action="edit" params="[solutionId:solutionInstance?.id.solutionId, solutionSetId:solutionInstance?.id.solutionSet.id]"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
