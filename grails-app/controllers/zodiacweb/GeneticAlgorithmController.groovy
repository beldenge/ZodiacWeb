package zodiacweb

import com.ciphertool.zodiacengine.entities.SolutionSet
import com.ciphertool.zodiacengine.entities.Cipher
import com.ciphertool.zodiacengine.gui.controller.CipherSolutionController
import com.ciphertool.zodiacengine.gui.service.CipherSolutionService

class GeneticAlgorithmController {

	CipherSolutionController cipherSolutionController
	CipherSolutionService cipherSolutionService
	
    def index() {
		redirect(action: "run", params: params) 
	}
	
	def run() {
		def runState = cipherSolutionService.isRunning() as boolean
		
		[cipherInstanceList: Cipher.list(params), solutionSetInstanceList: SolutionSet.list(params), solutionSetInstanceTotal: SolutionSet.count(), runState: runState]
	}
	
	def execute() {
		def maxGenerations = ((params.runContinuously as Boolean) ? -1 : params.generations as Integer)
		
		cipherSolutionController.startServiceThread(params.cipherName, params.populationSize as Integer, params.lifespan as Integer,
			maxGenerations, params.survivalRate as Double, params.mutationRate as Double, params.crossoverRate as Double, 
			params.fitnessEvaluator as String, params.crossoverAlgorithm as String, params.mutationAlgorithm as String, params.selectionAlgorithm as String);
		
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
