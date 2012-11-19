<div class="fieldcontain">
	<label for="cipherName">
		<g:message code="genetic.algorithm.cipher.label" default="Cipher to Solve for" />
		
	</label>
	<g:select name="cipherName" from="${cipherInstanceList}" optionKey="name" optionValue="name" />
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
	<g:checkBox name="runContinuously" value="${false}" />
</div>

<div class="fieldcontain">
	<label for="populationSize">
		<g:message code="genetic.algorithm.population.size.label" default="Population Size" />
		
	</label>
	<g:field type="number" name="populationSize" value="100" min="0" max="1000000" step="100"/>
</div>

<div class="fieldcontain">
	<label for="survivalRate">
		<g:message code="genetic.algorithm.survival.rate.label" default="Survival Rate" />
		
	</label>
	<g:field type="number" name="survivalRate" value="0.9" min="0" max="1" step="0.01"/>
</div>

<div class="fieldcontain">
	<label for="mutationRate">
		<g:message code="genetic.algorithm.mutation.rate.label" default="Mutation Rate" />
		
	</label>
	<g:field type="number" name="mutationRate" value="0.001" min="0" max="1" step="0.001"/>
</div>

<div class="fieldcontain">
	<label for="crossoverRate">
		<g:message code="genetic.algorithm.crossover.rate.label" default="Crossover Rate" />
		
	</label>
	<g:field type="number" name="crossoverRate" value="0.05" min="0" max="1" step="0.01"/>
</div>