
<%@ page import="com.ciphertool.genetics.entities.ExecutionStatistics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'executionStatistics.label', default: 'ExecutionStatistics')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-executionStatistics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-executionStatistics" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="crossoverAlgorithm" title="${message(code: 'executionStatistics.crossoverAlgorithm.label', default: 'Crossover Algorithm')}" />
					
						<g:sortableColumn property="crossoverRate" title="${message(code: 'executionStatistics.crossoverRate.label', default: 'Crossover Rate')}" />
					
						<g:sortableColumn property="endDateTime" title="${message(code: 'executionStatistics.endDateTime.label', default: 'End Date Time')}" />
					
						<g:sortableColumn property="fitnessEvaluator" title="${message(code: 'executionStatistics.fitnessEvaluator.label', default: 'Fitness Evaluator')}" />
					
						<g:sortableColumn property="lifespan" title="${message(code: 'executionStatistics.lifespan.label', default: 'Lifespan')}" />
					
						<g:sortableColumn property="mutationAlgorithm" title="${message(code: 'executionStatistics.mutationAlgorithm.label', default: 'Mutation Algorithm')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${executionStatisticsInstanceList}" status="i" var="executionStatisticsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${executionStatisticsInstance.id}">${fieldValue(bean: executionStatisticsInstance, field: "crossoverAlgorithm")}</g:link></td>
					
						<td>${fieldValue(bean: executionStatisticsInstance, field: "crossoverRate")}</td>
					
						<td><g:formatDate date="${executionStatisticsInstance.endDateTime}" /></td>
					
						<td>${fieldValue(bean: executionStatisticsInstance, field: "fitnessEvaluator")}</td>
					
						<td>${fieldValue(bean: executionStatisticsInstance, field: "lifespan")}</td>
					
						<td>${fieldValue(bean: executionStatisticsInstance, field: "mutationAlgorithm")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${executionStatisticsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
