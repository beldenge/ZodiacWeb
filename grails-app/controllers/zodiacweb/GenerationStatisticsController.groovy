package zodiacweb

import grails.converters.JSON
import com.ciphertool.genetics.entities.GenerationStatistics
import org.codehaus.groovy.grails.web.json.JSONArray

class GenerationStatisticsController {

    def index() {
		redirect(action: "display", params: params)
	}
	
	def display() {
		def bestFitnessList = GenerationStatistics.list().collect{ it.bestFitness }
		def averageFitnessList = GenerationStatistics.list().collect{ it.averageFitness }
		def executionTimeList = GenerationStatistics.list().collect{ it.executionTime }
		
		[bestFitnessList: new JSONArray(bestFitnessList), averageFitnessList: new JSONArray(averageFitnessList), executionTimeList: new JSONArray(executionTimeList)]
	}
}
