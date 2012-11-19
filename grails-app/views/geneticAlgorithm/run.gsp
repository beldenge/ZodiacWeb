<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="genetic.algorithm.run.label" /></title>
		<g:javascript library="jquery" />
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="run-genetic-algorithm" class="content scaffold-create" role="main">
			<h1><g:message code="genetic.algorithm.run.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors>
			<ul class="errors" role="alert">
				<g:eachError var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="execute" >
				<fieldset class="form">
					<g:render template="run"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitToRemote action="execute" name="start" class="save" update="executionResult" value="${message(code: 'genetic.algorithm.start.label', default: 'Start')}" />
					<g:submitToRemote action="halt" name="stop" class="delete" update="executionResult" value="${message(code: 'genetic.algorithm.stop.label', default: 'Stop')}" />
				</fieldset>
			</g:form>
		</div>
		<div id="executionResult">Not started</div>
	</body>
</html>