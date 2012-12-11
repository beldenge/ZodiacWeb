import com.ciphertool.zodiacengine.gui.service.GeneticCipherSolutionService
import com.ciphertool.zodiacengine.dao.SolutionSetDao
import com.ciphertool.genetics.algorithms.ConcurrentBasicGeneticAlgorithm
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor
import com.ciphertool.genetics.algorithms.crossover.LowestCommonGroupCrossoverAlgorithm
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionKnownSolutionFitnessEvaluator;
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionTruncatedFitnessEvaluator
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionFrequencyFitnessEvaluator
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionFrequencyTruncatedFitnessEvaluator
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionFrequencyLengthFitnessEvaluator
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionUniqueWordFitnessEvaluator;
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionMatchDistanceFitnessEvaluator;
import com.ciphertool.zodiacengine.dao.CipherDao
import com.ciphertool.zodiacengine.genetic.dao.WordGeneListDao
import com.ciphertool.sentencebuilder.dao.FrequencyWordListDao
import com.ciphertool.sentencebuilder.dao.WordDao
import com.ciphertool.genetics.Population
import com.ciphertool.zodiacengine.genetic.util.SolutionChromosomeGenerator
import com.ciphertool.genetics.util.MaximizationFitnessComparator
import com.ciphertool.zodiacengine.gui.controller.ZodiacCipherSolutionController
import com.ciphertool.zodiacengine.genetic.util.CipherSolutionFitnessEvaluator;
import com.ciphertool.genetics.algorithms.crossover.ConservativeCrossoverAlgorithm;
import com.ciphertool.genetics.algorithms.crossover.LiberalCrossoverAlgorithm;
import com.ciphertool.genetics.algorithms.crossover.ConservativeCentromereCrossoverAlgorithm;
import com.ciphertool.genetics.util.ChromosomeHelper;
import com.ciphertool.zodiacengine.genetic.dao.PlaintextSequenceDao;
import com.ciphertool.genetics.algorithms.mutation.SingleSequenceMutationAlgorithm;
import com.ciphertool.genetics.algorithms.mutation.LiberalMutationAlgorithm;
import com.ciphertool.genetics.algorithms.mutation.ConservativeMutationAlgorithm;
import com.ciphertool.genetics.dao.ExecutionStatisticsDao;
import com.ciphertool.genetics.algorithms.selection.TruncationSelectionAlgorithm;
import com.ciphertool.genetics.algorithms.selection.ProbabilisticSelectionAlgorithm;

//Place your Spring DSL code here
beans = {
	
	taskExecutor(ThreadPoolTaskExecutor) {
		corePoolSize = grailsApplication.config.taskExecutor.corePoolSize
		maxPoolSize = grailsApplication.config.taskExecutor.maxPoolSize
		//queueCapacity should be the same as populationSize, or we will get rejected execution exceptions
		queueCapacity = grailsApplication.config.taskExecutor.queueCapacity
		keepAliveSeconds= '5'
		allowCoreThreadTimeOut = 'true'
	}
	
	cipherDao(CipherDao) {
		sessionFactory = ref('sessionFactory')
	}
		
	wordDao(WordDao) {
		sessionFactory = ref('sessionFactory')
	}
	
	wordListDao(FrequencyWordListDao, ref('wordDao')) {
	}
	
	geneListDao(WordGeneListDao) {
		wordListDao = ref('wordListDao')
	}
	
	chromosomeGenerator(SolutionChromosomeGenerator) {
		wordListDao = ref ('wordListDao')
	}
	
	cipherSolutionKnownSolutionFitnessEvaluator(CipherSolutionKnownSolutionFitnessEvaluator) {}
	
	cipherSolutionFitnessEvaluator(CipherSolutionFitnessEvaluator) {}
	
	cipherSolutionMatchDistanceFitnessEvaluator(CipherSolutionMatchDistanceFitnessEvaluator) {}
	
	cipherSolutionUniqueWordFitnessEvaluator(CipherSolutionUniqueWordFitnessEvaluator) {}
	
	cipherSolutionTruncatedFitnessEvaluator(CipherSolutionTruncatedFitnessEvaluator) {}
	
	defaultFitnessEvaluator(CipherSolutionFrequencyFitnessEvaluator) {
		expectedLetterFrequencies = 
				["a" : grailsApplication.config.language.english.frequency.a as Double,
				"b" : grailsApplication.config.language.english.frequency.b as Double,
				"c" : grailsApplication.config.language.english.frequency.c as Double,
				"d" : grailsApplication.config.language.english.frequency.d as Double,
				"e" : grailsApplication.config.language.english.frequency.e as Double,
				"f" : grailsApplication.config.language.english.frequency.f as Double,
				"g" : grailsApplication.config.language.english.frequency.g as Double,
				"h" : grailsApplication.config.language.english.frequency.h as Double,
				"i" : grailsApplication.config.language.english.frequency.i as Double,
				"j" : grailsApplication.config.language.english.frequency.j as Double,
				"k" : grailsApplication.config.language.english.frequency.k as Double,
				"l" : grailsApplication.config.language.english.frequency.l as Double,
				"m" : grailsApplication.config.language.english.frequency.m as Double,
				"n" : grailsApplication.config.language.english.frequency.n as Double,
				"o" : grailsApplication.config.language.english.frequency.o as Double,
				"p" : grailsApplication.config.language.english.frequency.p as Double,
				"q" : grailsApplication.config.language.english.frequency.q as Double,
				"r" : grailsApplication.config.language.english.frequency.r as Double,
				"s" : grailsApplication.config.language.english.frequency.s as Double,
				"t" : grailsApplication.config.language.english.frequency.t as Double,
				"u" : grailsApplication.config.language.english.frequency.u as Double,
				"v" : grailsApplication.config.language.english.frequency.v as Double,
				"w" : grailsApplication.config.language.english.frequency.w as Double,
				"x" : grailsApplication.config.language.english.frequency.x as Double,
				"y" : grailsApplication.config.language.english.frequency.y as Double,
				"z" : grailsApplication.config.language.english.frequency.z as Double]
	}
	
	frequencyFitnessTruncatedEvaluator(CipherSolutionFrequencyTruncatedFitnessEvaluator) {
		expectedLetterFrequencies =
				["a" : grailsApplication.config.language.english.frequency.a as Double,
				"b" : grailsApplication.config.language.english.frequency.b as Double,
				"c" : grailsApplication.config.language.english.frequency.c as Double,
				"d" : grailsApplication.config.language.english.frequency.d as Double,
				"e" : grailsApplication.config.language.english.frequency.e as Double,
				"f" : grailsApplication.config.language.english.frequency.f as Double,
				"g" : grailsApplication.config.language.english.frequency.g as Double,
				"h" : grailsApplication.config.language.english.frequency.h as Double,
				"i" : grailsApplication.config.language.english.frequency.i as Double,
				"j" : grailsApplication.config.language.english.frequency.j as Double,
				"k" : grailsApplication.config.language.english.frequency.k as Double,
				"l" : grailsApplication.config.language.english.frequency.l as Double,
				"m" : grailsApplication.config.language.english.frequency.m as Double,
				"n" : grailsApplication.config.language.english.frequency.n as Double,
				"o" : grailsApplication.config.language.english.frequency.o as Double,
				"p" : grailsApplication.config.language.english.frequency.p as Double,
				"q" : grailsApplication.config.language.english.frequency.q as Double,
				"r" : grailsApplication.config.language.english.frequency.r as Double,
				"s" : grailsApplication.config.language.english.frequency.s as Double,
				"t" : grailsApplication.config.language.english.frequency.t as Double,
				"u" : grailsApplication.config.language.english.frequency.u as Double,
				"v" : grailsApplication.config.language.english.frequency.v as Double,
				"w" : grailsApplication.config.language.english.frequency.w as Double,
				"x" : grailsApplication.config.language.english.frequency.x as Double,
				"y" : grailsApplication.config.language.english.frequency.y as Double,
				"z" : grailsApplication.config.language.english.frequency.z as Double]
	}
	
	cipherSolutionFrequencyLengthFitnessEvaluator(CipherSolutionFrequencyLengthFitnessEvaluator) {
		expectedLetterFrequencies =
				["a" : grailsApplication.config.language.english.frequency.a as Double,
				"b" : grailsApplication.config.language.english.frequency.b as Double,
				"c" : grailsApplication.config.language.english.frequency.c as Double,
				"d" : grailsApplication.config.language.english.frequency.d as Double,
				"e" : grailsApplication.config.language.english.frequency.e as Double,
				"f" : grailsApplication.config.language.english.frequency.f as Double,
				"g" : grailsApplication.config.language.english.frequency.g as Double,
				"h" : grailsApplication.config.language.english.frequency.h as Double,
				"i" : grailsApplication.config.language.english.frequency.i as Double,
				"j" : grailsApplication.config.language.english.frequency.j as Double,
				"k" : grailsApplication.config.language.english.frequency.k as Double,
				"l" : grailsApplication.config.language.english.frequency.l as Double,
				"m" : grailsApplication.config.language.english.frequency.m as Double,
				"n" : grailsApplication.config.language.english.frequency.n as Double,
				"o" : grailsApplication.config.language.english.frequency.o as Double,
				"p" : grailsApplication.config.language.english.frequency.p as Double,
				"q" : grailsApplication.config.language.english.frequency.q as Double,
				"r" : grailsApplication.config.language.english.frequency.r as Double,
				"s" : grailsApplication.config.language.english.frequency.s as Double,
				"t" : grailsApplication.config.language.english.frequency.t as Double,
				"u" : grailsApplication.config.language.english.frequency.u as Double,
				"v" : grailsApplication.config.language.english.frequency.v as Double,
				"w" : grailsApplication.config.language.english.frequency.w as Double,
				"x" : grailsApplication.config.language.english.frequency.x as Double,
				"y" : grailsApplication.config.language.english.frequency.y as Double,
				"z" : grailsApplication.config.language.english.frequency.z as Double]
		averageWordLength = grailsApplication.config.language.english.averageWordLength
	}

	defaultFitnessComparator(MaximizationFitnessComparator) {}
	
	population(Population) {
		chromosomeGenerator = ref('chromosomeGenerator')
		fitnessEvaluator = ref('defaultFitnessEvaluator')
		fitnessComparator = ref('defaultFitnessComparator')
		taskExecutor = ref('taskExecutor')
		lifespan = grailsApplication.config.genetic.algorithm.lifespan
	}
	
	chromosomeHelper(ChromosomeHelper) {
		geneListDao = ref('geneListDao')
	}
	
	liberalCrossoverAlgorithm(LiberalCrossoverAlgorithm) {
		fitnessEvaluator = ref('defaultFitnessEvaluator')
		geneListDao = ref('geneListDao')
		chromosomeHelper = ref('chromosomeHelper')
	}

	conservativeCrossoverAlgorithm(ConservativeCrossoverAlgorithm) {
		fitnessEvaluator = ref('defaultFitnessEvaluator')
		geneListDao = ref('geneListDao')
	}
	
	defaultCrossoverAlgorithm(LowestCommonGroupCrossoverAlgorithm) {
		fitnessEvaluator = ref('defaultFitnessEvaluator')
		geneListDao = ref('geneListDao')
	}
	
	conservativeCentromereCrossoverAlgorithm(ConservativeCentromereCrossoverAlgorithm) {
		fitnessEvaluator = ref('defaultFitnessEvaluator')
		geneListDao = ref('geneListDao')
	}
	
	sequenceDao(PlaintextSequenceDao) {}
	
	defaultMutationAlgorithm(SingleSequenceMutationAlgorithm) {
		sequenceDao = ref('sequenceDao')
	}
	
	liberalMutationAlgorithm(LiberalMutationAlgorithm) {
		geneListDao = ref('geneListDao')
		chromosomeHelper = ref('chromosomeHelper')
	}
	
	conservativeMutationAlgorithm(ConservativeMutationAlgorithm) {
		geneListDao = ref('geneListDao')
	}
	
	defaultSelectionAlgorithm(ProbabilisticSelectionAlgorithm) {}
	
	truncationSelectionAlgorithm(TruncationSelectionAlgorithm) {}
	
	executionStatisticsDao(ExecutionStatisticsDao) {
		sessionFactory = ref('sessionFactory')
	}
	
	geneticAlgorithm(ConcurrentBasicGeneticAlgorithm) {
		finalSurvivorCount = grailsApplication.config.genetic.algorithm.finalSurvivorCount
		crossoverAlgorithm = ref('defaultCrossoverAlgorithm')
		mutationAlgorithm = ref('defaultMutationAlgorithm')
		selectionAlgorithm = ref('defaultSelectionAlgorithm')
		population = ref('population')
		taskExecutor = ref('taskExecutor')
		executionStatisticsDao = ref("executionStatisticsDao")
	}
	
	solutionSetDao(SolutionSetDao) {
		sessionFactory = ref('sessionFactory')
	}
	
	cipherSolutionService(GeneticCipherSolutionService) {
		geneticAlgorithm = ref('geneticAlgorithm')
		solutionSetDao = ref('solutionSetDao')
		commandsBefore = grailsApplication.config.app.commands.before
		commandsAfter = grailsApplication.config.app.commands.after
	}

	cipherSolutionController(ZodiacCipherSolutionController) {
		cipherSolutionService = ref('cipherSolutionService')
		cipherDao = ref ('cipherDao')
		fitnessEvaluatorDefault = ref('defaultFitnessEvaluator')
		crossoverAlgorithmDefault = ref('defaultCrossoverAlgorithm')
		mutationAlgorithmDefault = ref('defaultMutationAlgorithm')
		selectionAlgorithmDefault = ref('defaultSelectionAlgorithm')
	}
}
