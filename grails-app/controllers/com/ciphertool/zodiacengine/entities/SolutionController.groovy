package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException

class SolutionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        def maxResults = Math.min(params.max as Integer ?: 10, 100)
        [solutionInstanceList: Solution.list(offset: params.offset, max:maxResults, fetch:[plaintextCharacters: "lazy"], sort: "id"), solutionInstanceTotal: Solution.count()]
    }

    def create() {
        [solutionInstance: new Solution()]
    }

    def save() {
        def solutionInstance = new Solution(params)
        if (!solutionInstance.save(flush: true, insert:true)) {
            render(view: "create", model: [solutionInstance: solutionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'solution.label', default: 'Solution'), solutionInstance.id])
        redirect(action: "show", id: solutionInstance.id)
    }

    def show() {
        def solutionInstance = Solution.findById(new SolutionId(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int))
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "list")
            return
        }

        [solutionInstance: solutionInstance]
    }

    def edit(Long id) {
        def solutionInstance = Solution.get(id)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "list")
            return
        }

        [solutionInstance: solutionInstance]
    }

    def update(Long id) {
        def solutionInstance = Solution.get(id)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "list")
            return
        }

        solutionInstance.properties = params

        if (!solutionInstance.save(flush: true)) {
            render(view: "edit", model: [solutionInstance: solutionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'solution.label', default: 'Solution'), solutionInstance.id])
        redirect(action: "show", id: solutionInstance.id)
    }

    def delete(Long id) {
        def solutionInstance = Solution.get(id)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "list")
            return
        }

        try {
            solutionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), id])
            redirect(action: "show", id: id)
        }
    }
}
