<%@ page import="com.ciphertool.genetics.entities.ExecutionStatistics" %>



<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="executionStatistics.id.label" default="Id" />
		
	</label>
	<g:field type="number" name="id" value="${executionStatisticsInstance.id}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'crossoverAlgorithm', 'error')} ">
	<label for="crossoverAlgorithm">
		<g:message code="executionStatistics.crossoverAlgorithm.label" default="Crossover Algorithm" />
		
	</label>
	<g:textField name="crossoverAlgorithm" value="${executionStatisticsInstance?.crossoverAlgorithm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'crossoverRate', 'error')} ">
	<label for="crossoverRate">
		<g:message code="executionStatistics.crossoverRate.label" default="Crossover Rate" />
		
	</label>
	<g:field type="number" name="crossoverRate" value="${executionStatisticsInstance.crossoverRate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'endDateTime', 'error')} ">
	<label for="endDateTime">
		<g:message code="executionStatistics.endDateTime.label" default="End Date Time" />
		
	</label>
	<g:datePicker name="endDateTime" precision="day" value="${executionStatisticsInstance?.endDateTime}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'fitnessEvaluator', 'error')} ">
	<label for="fitnessEvaluator">
		<g:message code="executionStatistics.fitnessEvaluator.label" default="Fitness Evaluator" />
		
	</label>
	<g:textField name="fitnessEvaluator" value="${executionStatisticsInstance?.fitnessEvaluator}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'generationStatisticsList', 'error')} ">
	<label for="generationStatisticsList">
		<g:message code="executionStatistics.generationStatisticsList.label" default="Generation Statistics List" />
		
	</label>
	<g:select name="generationStatisticsList" from="${com.ciphertool.genetics.entities.GenerationStatistics.list()}" multiple="multiple" optionKey="id" size="5" required="" value="${executionStatisticsInstance?.generationStatisticsList*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'lifespan', 'error')} ">
	<label for="lifespan">
		<g:message code="executionStatistics.lifespan.label" default="Lifespan" />
		
	</label>
	<g:field type="number" name="lifespan" value="${executionStatisticsInstance.lifespan}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'mutationAlgorithm', 'error')} ">
	<label for="mutationAlgorithm">
		<g:message code="executionStatistics.mutationAlgorithm.label" default="Mutation Algorithm" />
		
	</label>
	<g:textField name="mutationAlgorithm" value="${executionStatisticsInstance?.mutationAlgorithm}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'mutationRate', 'error')} ">
	<label for="mutationRate">
		<g:message code="executionStatistics.mutationRate.label" default="Mutation Rate" />
		
	</label>
	<g:field type="number" name="mutationRate" value="${executionStatisticsInstance.mutationRate}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'populationSize', 'error')} ">
	<label for="populationSize">
		<g:message code="executionStatistics.populationSize.label" default="Population Size" />
		
	</label>
	<g:field type="number" name="populationSize" value="${executionStatisticsInstance.populationSize}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'startDateTime', 'error')} ">
	<label for="startDateTime">
		<g:message code="executionStatistics.startDateTime.label" default="Start Date Time" />
		
	</label>
	<g:datePicker name="startDateTime" precision="day" value="${executionStatisticsInstance?.startDateTime}" />
</div>

<div class="fieldcontain ${hasErrors(bean: executionStatisticsInstance, field: 'survivalRate', 'error')} ">
	<label for="survivalRate">
		<g:message code="executionStatistics.survivalRate.label" default="Survival Rate" />
		
	</label>
	<g:field type="number" name="survivalRate" value="${executionStatisticsInstance.survivalRate}" />
</div>

