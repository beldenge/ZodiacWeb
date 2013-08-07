package zodiacweb

import com.ciphertool.zodiacengine.entities.SolutionSet
import com.ciphertool.zodiacengine.entities.Cipher
import com.ciphertool.zodiacengine.gui.controller.CipherSolutionController
import com.ciphertool.zodiacengine.gui.service.CipherSolutionService
import com.ciphertool.zodiacengine.gui.common.GeneticStrategyBuilder
import com.ciphertool.zodiacengine.gui.common.ParameterConstants

class GeneticAlgorithmController {

	CipherSolutionController cipherSolutionController
	CipherSolutionService cipherSolutionService
	GeneticStrategyBuilder strategyBuilder
	
    def index() {
		redirect(action: "run", params: params) 
	}
	
	def run() {
		def runState = cipherSolutionService.isRunning() as boolean
		
		def cipherMap = [:]
		Cipher.list(params).each() {cipherMap.put(it.name, it)}
		
		[cipherInstanceMap: cipherMap, solutionSetInstanceList: SolutionSet.list(params), solutionSetInstanceTotal: SolutionSet.count(), runState: runState]
	}
	
	def execute() {
		def maxGenerations = ((params.runContinuously as Boolean) ? -1 : params.generations as Integer)
		
		def doComparisonToKnownSolution = ((params.compareToKnownSolution as Boolean) ? true : false)
		
		def paramsMap = [:]
		paramsMap.put(ParameterConstants.CIPHER_NAME, params.cipherName)
		paramsMap.put(ParameterConstants.POPULATION_SIZE, params.populationSize as Integer)
		paramsMap.put(ParameterConstants.LIFESPAN, params.lifespan as Integer)
		paramsMap.put(ParameterConstants.NUMBER_OF_GENERATIONS, maxGenerations)
		paramsMap.put(ParameterConstants.SURVIVAL_RATE, params.survivalRate as Double)
		paramsMap.put(ParameterConstants.MUTATION_RATE, params.mutationRate as Double)
		paramsMap.put(ParameterConstants.MAX_MUTATIONS_PER_INDIVIDUAL, params.maxMutationsPerChromosome as Integer)
		paramsMap.put(ParameterConstants.CROSSOVER_RATE, params.crossoverRate as Double)
		paramsMap.put(ParameterConstants.FITNESS_EVALUATOR, params.fitnessEvaluator as String)
		paramsMap.put(ParameterConstants.CROSSOVER_ALGORITHM, params.crossoverAlgorithm as String)
		paramsMap.put(ParameterConstants.MUTATION_ALGORITHM, params.mutationAlgorithm as String)
		paramsMap.put(ParameterConstants.SELECTION_ALGORITHM, params.selectionAlgorithm as String)
		paramsMap.put(ParameterConstants.SELECTOR_METHOD, params.selectorMethod as String)
		paramsMap.put(ParameterConstants.COMPARE_TO_KNOWN_SOLUTION, doComparisonToKnownSolution)
		
		cipherSolutionController.startServiceThread(strategyBuilder.buildStrategy(paramsMap));
		
		//Sleep first since it might take a second for the service to start fully
		Thread.sleep(1000);
		while(cipherSolutionService.isRunning()) {
			Thread.sleep(1000);
		}
		
		render "Stopped"
	}
	
	def halt() {
		cipherSolutionController.stopServiceThread();
		
		while(cipherSolutionService.isRunning()) {
			Thread.sleep(1000);
		}
		
		render "Stopped"
	}
}
