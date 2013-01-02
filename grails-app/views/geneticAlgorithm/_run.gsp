<%@ page import="com.ciphertool.zodiacengine.genetic.util.FitnessEvaluatorType" %>
<%@ page import="com.ciphertool.genetics.algorithms.crossover.CrossoverAlgorithmType" %>
<%@ page import="com.ciphertool.genetics.algorithms.mutation.MutationAlgorithmType" %>
<%@ page import="com.ciphertool.genetics.algorithms.selection.SelectionAlgorithmType" %>

<div class="fieldcontain">
	<label for="cipherName">
		<g:message code="genetic.algorithm.cipher.label" default="Cipher to Solve for" />
		
	</label>
	<g:select name="cipherName" from="${cipherInstanceList}" value="zodiac408" optionKey="name" optionValue="name" />
</div>

<div class="fieldcontain">
	<label for="solutionSet">
		<g:message code="genetic.algorithm.solutionSet.label" default="Solution Set to Continue With" />
		
	</label>
	<g:select name="solutionSet" from="${solutionSetInstanceList}" noSelection="${['null':'Start from scratch']}" optionKey="id" optionValue="name" />
</div>

<div class="fieldcontain">
	<label for="generations">
		<g:message code="genetic.algorithm.generations.label" default="Generations" />
		
	</label>
	<g:field type="number" name="generations" value="50" min="0" max="1000000" step="50"/>
</div>

<div class="fieldcontain">
	<label for="runContinuously">
		<g:message code="genetic.algorithm.run.continuously.label" default="Run until user stops" />
		
	</label>
	<g:checkBox name="runContinuously" onClick="toggleGenerationsSpinner()" value="${false}" />
</div>

<div class="fieldcontain">
	<label for="populationSize">
		<g:message code="genetic.algorithm.population.size.label" default="Population Size" />
		
	</label>
	<g:field type="number" name="populationSize" value="100" min="0" max="1000000" step="100"/>
</div>

<div class="fieldcontain">
	<label for="lifespan">
		<g:message code="genetic.algorithm.lifespan.label" default="Individual Lifespan (generations)" />
		
	</label>
	<g:field type="number" name="lifespan" value="-1" min="-1" max="1000" step="1"/>
</div>

<div class="fieldcontain">
	<label for="survivalRate">
		<g:message code="genetic.algorithm.survival.rate.label" default="Survival Rate" />
		
	</label>
	<g:field type="number" name="survivalRate" value="0.95" min="0" max="1" step="0.01"/>
</div>

<div class="fieldcontain">
	<label for="mutationRate">
		<g:message code="genetic.algorithm.mutation.rate.label" default="Mutation Rate" />
		
	</label>
	<g:field type="number" name="mutationRate" value="0.01" min="0" max="1" step="0.001"/>
</div>

<div class="fieldcontain">
	<label for="crossoverRate">
		<g:message code="genetic.algorithm.crossover.rate.label" default="Crossover Rate" />
		
	</label>
	<g:field type="number" name="crossoverRate" value="0.05" min="0" max="1" step="0.01"/>
</div>

<div class="fieldcontain ">
	<label for="fitnessEvaluator">
		<g:message code="genetic.algorithm.fitnessEvaluator.label" default="Fitness Evaluator Algorithm" />
		
	</label>
	<g:select name="fitnessEvaluator" from="${FitnessEvaluatorType?.values()}" optionKey="name" optionValue="displayName" value="${FitnessEvaluatorType.CIPHER_SOLUTION_MATCH_DISTANCE.getName()}" />
</div>

<div class="fieldcontain ">
	<label for="crossoverAlgorithm">
		<g:message code="genetic.algorithm.crossoverAlgorithm.label" default="Crossover Algorithm" />
		
	</label>
	<g:select name="crossoverAlgorithm" from="${CrossoverAlgorithmType?.values()}" optionKey="name" optionValue="displayName" value="${CrossoverAlgorithmType.LOWEST_COMMON_GROUP.getName()}" />
</div>

<div class="fieldcontain ">
	<label for="mutationAlgorithm">
		<g:message code="genetic.algorithm.mutationAlgorithm.label" default="Mutation Algorithm" />
		
	</label>
	<g:select name="mutationAlgorithm" from="${MutationAlgorithmType?.values()}" optionKey="name" optionValue="displayName" value="${MutationAlgorithmType.CONSERVATIVE.getName()}" />
</div>

<div class="fieldcontain ">
	<label for="selectionAlgorithm">
		<g:message code="genetic.algorithm.selectionAlgorithm.label" default="Selection Algorithm" />
		
	</label>
	<g:select name="selectionAlgorithm" from="${SelectionAlgorithmType?.values()}" optionKey="name" optionValue="displayName" value="${SelectionAlgorithmType.PROBABILISTIC.getName()}" />
</div>

<div class="fieldcontain">
	<label for="compareToKnownSolution">
		<g:message code="genetic.algorithm.compareToKnownSolution.label" default="Compare to known solution" />
		
	</label>
	<g:checkBox name="compareToKnownSolution" value="${false}" />
</div>