<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title><g:message code="genetic.algorithm.statistics.label" /></title>
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
				$.jqplot('performance-chart', [${executionTimeList}], 
					{
						title: 'Performance Over Time',
						axes: {
							xaxis: {
								min: 0,
								label: 'Generations'
							},
							yaxis: {
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
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'run.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.jqplot.css')}" type="text/css">
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="fitness-chart" style="height:400px;width:900px;margin-left: auto;margin-right: auto; "></div>
		<div id="performance-chart" style="height:400px;width:900px;margin-left: auto;margin-right: auto; "></div>
	</body>
</html>