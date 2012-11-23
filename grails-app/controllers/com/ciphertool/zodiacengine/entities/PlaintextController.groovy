package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException
import org.hibernate.FetchMode

class PlaintextController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def maxToDisplay = Math.min(params.max as Integer ?: 10, 100)
		def offset = params.offset as Integer ?: 0
		def sortBy = params.sort as String ?: "id"
		def direction = params.order as String ?: "asc"
		def plaintextCriteria = Plaintext.createCriteria()
		def plaintextCharacters = plaintextCriteria.list {
			maxResults(maxToDisplay)
			firstResult(offset)
			order(sortBy, direction)
		}
        [plaintextInstanceList: plaintextCharacters, plaintextInstanceTotal: Plaintext.count()]
    }

    def create() {
        [plaintextInstance: new Plaintext()]
    }

    def save() {
		def plaintextId = new PlaintextId(new Solution(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int), params.ciphertextId as int)
        def plaintextInstance = new Plaintext(plaintextId, params.value)
        if (!plaintextInstance.save(flush: true, insert:true)) {
            render(view: "create", model: [plaintextInstance: plaintextInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
        redirect(action: "show", params: [solutionSetId:plaintextId.solution.id.solutionSet.id, solutionId:plaintextId.solution.id.solutionId, ciphertextId:plaintextId.ciphertextId])
    }

    def show(params) {
		def plaintextId = new PlaintextId(new Solution(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int), params.ciphertextId as int)
        def plaintextInstance = Plaintext.findById(plaintextId)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "list")
            return
        }

        [plaintextInstance: plaintextInstance]
    }

    def edit() {
		def plaintextId = new PlaintextId(new Solution(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int), params.ciphertextId as int)
        def plaintextInstance = Plaintext.findById(plaintextId)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "list")
            return
        }

        [plaintextInstance: plaintextInstance]
    }

    def update() {
		def plaintextId = new PlaintextId(new Solution(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int), params.ciphertextId as int)
        def plaintextInstance = Plaintext.findById(plaintextId)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "list")
            return
        }

        plaintextInstance.properties = params

        if (!plaintextInstance.save(flush: true)) {
            render(view: "edit", model: [plaintextInstance: plaintextInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
        redirect(action: "show", params: [solutionSetId:plaintextId.solution.id.solutionSet.id, solutionId:plaintextId.solution.id.solutionId, ciphertextId:plaintextId.ciphertextId])
    }

    def delete() {
		def plaintextId = new PlaintextId(new Solution(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int), params.ciphertextId as int)
        def plaintextInstance = Plaintext.findById(plaintextId)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "list")
            return
        }

        try {
			def solution = plaintextInstance.id.solution
			solution.getPlaintextCharacters().remove(plaintextInstance)
            plaintextInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextId])
            redirect(action: "show", params: [solutionSetId:plaintextId.solution.id.solutionSet.id, solutionId:plaintextId.solution.id.solutionId, ciphertextId:plaintextId.ciphertextId])
        }
    }
}
