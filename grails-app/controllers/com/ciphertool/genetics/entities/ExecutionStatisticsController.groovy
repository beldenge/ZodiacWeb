package com.ciphertool.genetics.entities

import org.springframework.dao.DataIntegrityViolationException
import org.codehaus.groovy.grails.web.json.JSONArray

class ExecutionStatisticsController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [executionStatisticsInstanceList: ExecutionStatistics.list(params), executionStatisticsInstanceTotal: ExecutionStatistics.count()]
    }

    def create() {
        [executionStatisticsInstance: new ExecutionStatistics(params)]
    }

    def save() {
        def executionStatisticsInstance = new ExecutionStatistics(params)
        if (!executionStatisticsInstance.save(flush: true)) {
            render(view: "create", model: [executionStatisticsInstance: executionStatisticsInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), executionStatisticsInstance.id])
        redirect(action: "show", id: executionStatisticsInstance.id)
    }

    def show(Long id) {
        def executionStatisticsInstance = ExecutionStatistics.get(id)
        if (!executionStatisticsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "list")
            return
        }

		def bestFitnessList = executionStatisticsInstance.getGenerationStatisticsList().collect{ it.bestFitness }
		def averageFitnessList = executionStatisticsInstance.getGenerationStatisticsList().collect{ it.averageFitness }
		def executionTimeList = executionStatisticsInstance.getGenerationStatisticsList().collect{ it.executionTime }
		
		[executionStatisticsInstance: executionStatisticsInstance, bestFitnessList: new JSONArray(bestFitnessList), averageFitnessList: new JSONArray(averageFitnessList), executionTimeList: new JSONArray(executionTimeList)]
    }

    def edit(Long id) {
        def executionStatisticsInstance = ExecutionStatistics.get(id)
        if (!executionStatisticsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "list")
            return
        }

        [executionStatisticsInstance: executionStatisticsInstance]
    }

    def update(Long id, Long version) {
        def executionStatisticsInstance = ExecutionStatistics.get(id)
        if (!executionStatisticsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (executionStatisticsInstance.version > version) {
                executionStatisticsInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'executionStatistics.label', default: 'ExecutionStatistics')] as Object[],
                          "Another user has updated this ExecutionStatistics while you were editing")
                render(view: "edit", model: [executionStatisticsInstance: executionStatisticsInstance])
                return
            }
        }

        executionStatisticsInstance.properties = params

        if (!executionStatisticsInstance.save(flush: true)) {
            render(view: "edit", model: [executionStatisticsInstance: executionStatisticsInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), executionStatisticsInstance.id])
        redirect(action: "show", id: executionStatisticsInstance.id)
    }

    def delete(Long id) {
        def executionStatisticsInstance = ExecutionStatistics.get(id)
        if (!executionStatisticsInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "list")
            return
        }

        try {
            executionStatisticsInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'executionStatistics.label', default: 'ExecutionStatistics'), id])
            redirect(action: "show", id: id)
        }
    }
}
