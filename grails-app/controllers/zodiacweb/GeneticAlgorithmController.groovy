package zodiacweb

import com.ciphertool.zodiacengine.entities.SolutionSet
import com.ciphertool.zodiacengine.entities.Cipher
import com.ciphertool.zodiacengine.gui.controller.CipherSolutionController

class GeneticAlgorithmController {

	CipherSolutionController cipherSolutionController
	
    def index() {
		redirect(action: "run", params: params) 
	}
	
	def run() {
		[cipherInstanceList: Cipher.list(params), solutionSetInstanceList: SolutionSet.list(params), solutionSetInstanceTotal: SolutionSet.count()]
	}
	
	def execute() {
		def maxGenerations = ((params.runContinuously as Boolean) ? -1 : params.generations as Integer)
		
		cipherSolutionController.startServiceThread(params.cipherName, params.populationSize as Integer, params.lifespan as Integer,
			maxGenerations, params.survivalRate as Double, params.mutationRate as Double, params.crossoverRate as Double, 
			params.fitnessEvaluator as String, params.crossoverAlgorithm as String, params.mutationAlgorithm as String);
		
		render "Running"
	}
	
	def halt() {
		cipherSolutionController.stopServiceThread();
		
		render "Stopped"
	}
}
