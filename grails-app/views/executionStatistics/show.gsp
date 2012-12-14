
<%@ page import="com.ciphertool.genetics.entities.ExecutionStatistics" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'executionStatistics.label', default: 'ExecutionStatistics')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<g:javascript library="jquery" />
		<g:javascript src="jquery.jqplot.js" />
		<g:javascript>
			$(document).ready(function(){
				$.jqplot('fitness-chart', [${bestFitnessList}, ${averageFitnessList}], 
					{
						title: 'Fitness Over Time',
						axes: {
							xaxis: {
								min: 0,
								label: 'Generations'
							},
							yaxis: {
								label: 'Fitness'
							}
						},
						series: [
							{
								label: 'Best Fitness',
								showMarker: false
							},
							{
								label: 'Average Fitness',
								showMarker: false
							}
						]
					}
				);
				if (${knownSolutionProximityList} != null && ${knownSolutionProximityList.size()} != 0) {
					$.jqplot('proximity-chart', [${knownSolutionProximityList}], 
						{
							title: 'Proximity to Known Solution Over Time',
							axes: {
								xaxis: {
									min: 0,
									label: 'Generations'
								},
								yaxis: {
									min: 0,
									max: 100,
									label: 'Proximity %'
								}
							},
							series: [
								{
									label: 'Proximity %',
									showMarker: false
								}
							]
						}
					);
				}
				$.jqplot('performance-chart', [${executionTimeList}], 
					{
						title: 'Performance Over Time',
						axes: {
							xaxis: {
								min: 0,
								label: 'Generations'
							},
							yaxis: {
								min:0,
								label: 'Milliseconds'
							}
						},
						series: [
							{
								label: 'Execution Time',
								showMarker: false
							}
						]
					}
				);
			});
		</g:javascript>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.css')}" type="text/css">
	</head>
	<body>
		<a href="#show-executionStatistics" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-executionStatistics" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list executionStatistics">
			
				<g:if test="${executionStatisticsInstance?.startDateTime}">
				<li class="fieldcontain">
					<span id="startDateTime-label" class="property-label"><g:message code="executionStatistics.startDateTime.label" default="Start Date Time" /></span>
					
						<span class="property-value" aria-labelledby="startDateTime-label"><g:formatDate date="${executionStatisticsInstance?.startDateTime}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionStatisticsInstance?.endDateTime}">
				<li class="fieldcontain">
					<span id="endDateTime-label" class="property-label"><g:message code="executionStatistics.endDateTime.label" default="End Date Time" /></span>
					
						<span class="property-value" aria-labelledby="endDateTime-label"><g:formatDate date="${executionStatisticsInstance?.endDateTime}" /></span>
					
				</li>
				</g:if>

				<g:if test="${executionStatisticsInstance?.populationSize}">
				<li class="fieldcontain">
					<span id="populationSize-label" class="property-label"><g:message code="executionStatistics.populationSize.label" default="Population Size" /></span>
					
						<span class="property-value" aria-labelledby="populationSize-label"><g:fieldValue bean="${executionStatisticsInstance}" field="populationSize"/></span>
					
				</li>
				</g:if>

				<g:if test="${executionStatisticsInstance?.lifespan}">
				<li class="fieldcontain">
					<span id="lifespan-label" class="property-label"><g:message code="executionStatistics.lifespan.label" default="Lifespan" /></span>
					
						<span class="property-value" aria-labelledby="lifespan-label"><g:fieldValue bean="${executionStatisticsInstance}" field="lifespan"/></span>
					
				</li>
				</g:if>

				<g:if test="${executionStatisticsInstance?.survivalRate}">
				<li class="fieldcontain">
					<span id="survivalRate-label" class="property-label"><g:message code="executionStatistics.survivalRate.label" default="Survival Rate" /></span>
					
						<span class="property-value" aria-labelledby="survivalRate-label"><g:fieldValue bean="${executionStatisticsInstance}" field="survivalRate"/></span>
					
				</li>
				</g:if>

				<g:if test="${executionStatisticsInstance?.crossoverRate}">
				<li class="fieldcontain">
					<span id="crossoverRate-label" class="property-label"><g:message code="executionStatistics.crossoverRate.label" default="Crossover Rate" /></span>
					
						<span class="property-value" aria-labelledby="crossoverRate-label"><g:fieldValue bean="${executionStatisticsInstance}" field="crossoverRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionStatisticsInstance?.mutationRate}">
				<li class="fieldcontain">
					<span id="mutationRate-label" class="property-label"><g:message code="executionStatistics.mutationRate.label" default="Mutation Rate" /></span>
					
						<span class="property-value" aria-labelledby="mutationRate-label"><g:fieldValue bean="${executionStatisticsInstance}" field="mutationRate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionStatisticsInstance?.crossoverAlgorithm}">
				<li class="fieldcontain">
					<span id="crossoverAlgorithm-label" class="property-label"><g:message code="executionStatistics.crossoverAlgorithm.label" default="Crossover Algorithm" /></span>
					
						<span class="property-value" aria-labelledby="crossoverAlgorithm-label"><g:fieldValue bean="${executionStatisticsInstance}" field="crossoverAlgorithm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionStatisticsInstance?.fitnessEvaluator}">
				<li class="fieldcontain">
					<span id="fitnessEvaluator-label" class="property-label"><g:message code="executionStatistics.fitnessEvaluator.label" default="Fitness Evaluator" /></span>
					
						<span class="property-value" aria-labelledby="fitnessEvaluator-label"><g:fieldValue bean="${executionStatisticsInstance}" field="fitnessEvaluator"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${executionStatisticsInstance?.mutationAlgorithm}">
				<li class="fieldcontain">
					<span id="mutationAlgorithm-label" class="property-label"><g:message code="executionStatistics.mutationAlgorithm.label" default="Mutation Algorithm" /></span>
					
						<span class="property-value" aria-labelledby="mutationAlgorithm-label"><g:fieldValue bean="${executionStatisticsInstance}" field="mutationAlgorithm"/></span>
					
				</li>
				</g:if>
			
			</ol>
			
			<div id="fitness-chart" style="height:400px;width:900px;margin-left: auto;margin-right: auto; "></div><br />
			<g:if test="${knownSolutionProximityList != null && knownSolutionProximityList.size() != 0}"><div id="proximity-chart" style="height:400px;width:900px;margin-left: auto;margin-right: auto; "></div><br /></g:if>
			<div id="performance-chart" style="height:400px;width:900px;margin-left: auto;margin-right: auto; "></div><br />
			
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${executionStatisticsInstance?.id}" />
					<g:link class="edit" action="edit" id="${executionStatisticsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
