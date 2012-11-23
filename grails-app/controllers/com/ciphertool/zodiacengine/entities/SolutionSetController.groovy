package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException
import org.hibernate.FetchMode

class SolutionSetController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [solutionSetInstanceList: SolutionSet.list(params), solutionSetInstanceTotal: SolutionSet.count()]
    }

    def create() {
        [solutionSetInstance: new SolutionSet()]
    }

    def save() {
        def solutionSetInstance = new SolutionSet(params.name)
        if (!solutionSetInstance.save(flush: true, insert:true)) {
            render(view: "create", model: [solutionSetInstance: solutionSetInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), solutionSetInstance.id])
        redirect(action: "show", id: solutionSetInstance.id)
    }

    def show(Integer id) {
        def solutionSetInstance = SolutionSet.findById(id, [fetch: [solutions: "eager"]])
        if (!solutionSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "list")
            return
        }

		def maxToDisplay = Math.min(params.max as Integer ?: 10, 100)
		def offset = params.offset as Integer ?: 0
		def sortBy = params.sort as String ?: "id"
		def direction = params.order as String ?: "asc"
		def solutionCriteria = Solution.createCriteria()
		def solutions = solutionCriteria.list {
			eq("id.solutionSet.id", id)
			maxResults(maxToDisplay)
			firstResult(offset)
			order(sortBy, direction)
			fetchMode("plaintextCharacters", FetchMode.SELECT)
		}
		
        [solutionSetInstance: solutionSetInstance, solutionInstanceList: solutions, solutionInstanceTotal:solutionSetInstance.solutions.size()]
    }

    def edit(Long id) {
        def solutionSetInstance = SolutionSet.get(id)
        if (!solutionSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "list")
            return
        }

        [solutionSetInstance: solutionSetInstance]
    }

    def update(Long id) {
        def solutionSetInstance = SolutionSet.get(id)
        if (!solutionSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "list")
            return
        }

        solutionSetInstance.properties = params

        if (!solutionSetInstance.save(flush: true)) {
            render(view: "edit", model: [solutionSetInstance: solutionSetInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), solutionSetInstance.id])
        redirect(action: "show", id: solutionSetInstance.id)
    }

    def delete(Long id) {
        def solutionSetInstance = SolutionSet.get(id)
        if (!solutionSetInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "list")
            return
        }

        try {
            solutionSetInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'solutionSet.label', default: 'SolutionSet'), id])
            redirect(action: "show", id: id)
        }
    }
}
