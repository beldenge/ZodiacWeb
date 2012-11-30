<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="genetic.algorithm.run.label" /></title>
		<g:javascript library="jquery" />
		<g:javascript src="spin.js" />
		<g:javascript>
			var opts = {
				lines: 13, // The number of lines to draw
				length: 17, // The length of each line
				width: 12, // The line thickness
				radius: 40, // The radius of the inner circle
				corners: 1, // Corner roundness (0..1)
				rotate: 0, // The rotation offset
				color: '#FFF', // #rgb or #rrggbb
				speed: 1, // Rounds per second
				trail: 60, // Afterglow percentage
				shadow: false, // Whether to render a shadow
				hwaccel: false, // Whether to use hardware acceleration
				className: 'spinner', // The CSS class to assign to the spinner
				zIndex: 2e9, // The z-index (defaults to 2000000000)
				top: 'auto', // Top position relative to parent in px
				left: 'auto' // Left position relative to parent in px
			};

			var target = document.getElementById('overlay');
			var spinner = new Spinner(opts);

			window.onload = function(){
				//Check if the program is already running and disable the form if so
				if (document.getElementById('executionResult').innerHTML.trim() == "Running") {
					disableForm();
				}
			};
			
			function disableForm() {
				$('#executionResult').html("Running");
				$('[name="start"]').attr("disabled", "disabled");
				$('input').not('[name="stop"]').attr("disabled", "disabled");
				$('select').attr("disabled", "disabled");
				$('#overlay').show();
				spinner.spin(target);
			}
			
			function enableForm() {
				$('[name="start"]').removeAttr("disabled");
				$('input').not('[name="stop"]').removeAttr("disabled");
				$('select').removeAttr("disabled");
				$('#overlay').hide();
				spinner.stop();
			}
			
			function notifyStopping() {
				$('#executionResult').html("Stopping.  Please wait...");
			}
			
			function toggleGenerationsSpinner() {
				if ($('[name="runContinuously"]').attr("checked")) {
					$('[name="generations"]').attr("disabled", "disabled");
				}
				else {
					$('[name="generations"]').removeAttr("disabled");
				}
			}
		</g:javascript>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'run.css')}" type="text/css">
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
					<div id="overlay" style="display: none;"></div>
					<g:render template="run"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitToRemote action="execute" name="start" class="save" after="disableForm()" onComplete="enableForm()" update="executionResult" value="${message(code: 'genetic.algorithm.start.label', default: 'Start')}" />
					<g:submitToRemote action="halt" name="stop" class="delete" after="notifyStopping()" onComplete="enableForm()" update="executionResult" value="${message(code: 'genetic.algorithm.stop.label', default: 'Stop')}" />
				</fieldset>
			</g:form>
		</div>
		<div class="message" id="executionResult">
			<g:if test="${runState}">Running</g:if>
			<g:else>Not started</g:else>
		</div>
	</body>
</html>