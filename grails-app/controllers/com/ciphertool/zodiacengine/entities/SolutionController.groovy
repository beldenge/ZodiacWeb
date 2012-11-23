package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException
import org.hibernate.FetchMode

class SolutionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
		def maxToDisplay = Math.min(params.max as Integer ?: 10, 100)
		def offset = params.offset as Integer ?: 0
		def sortBy = params.sort as String ?: "id"
		def direction = params.order as String ?: "asc"
		def solutionCriteria = Solution.createCriteria()
		def solutions = solutionCriteria.list {
			maxResults(maxToDisplay)
			firstResult(offset)
			order(sortBy, direction)
			fetchMode("plaintextCharacters", FetchMode.SELECT)
		}
        [solutionInstanceList: solutions, solutionInstanceTotal: Solution.count()]
    }

    def create() {
        [solutionInstance: new Solution()]
    }

    def save() {
		def solutionSet = new SolutionSet(params.solutionSetId as Integer)
		def cipher = new Cipher(params.cipherId as Integer)
        def solutionInstance = new Solution(solutionSet, params.solutionId as int, cipher)
        if (!solutionInstance.save(flush: true, insert:true)) {
            render(view: "create", model: [solutionInstance: solutionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'solution.label', default: 'Solution'), solutionInstance.id])
        redirect(action: "show", params: [solutionId:solutionInstance.id.solutionId, solutionSetId:solutionInstance.id.solutionSet.id])
    }

    def show() {
		def solutionId = new SolutionId(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int)
        def solutionInstance = Solution.findById(solutionId)

        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "list")
            return
        }

        [solutionInstance: solutionInstance]
    }

    def edit() {
		def solutionId = new SolutionId(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int)
        def solutionInstance = Solution.findById(solutionId)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "list")
            return
        }

        [solutionInstance: solutionInstance]
    }

    def update() {
		def solutionId = new SolutionId(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int)
        def solutionInstance = Solution.findById(solutionId)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "list")
            return
        }

        solutionInstance.properties = params

        if (!solutionInstance.save(flush: true)) {
            render(view: "edit", model: [solutionInstance: solutionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
        redirect(action: "show", params: [solutionId:solutionId.solutionId, solutionSetId:solutionId.solutionSet.id])
    }

    def delete() {
		def solutionId = new SolutionId(new SolutionSet(params.solutionSetId as Integer), params.solutionId as int)
        def solutionInstance = Solution.findById(solutionId)
        if (!solutionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "list")
            return
        }

        try {
            solutionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'solution.label', default: 'Solution'), solutionId])
            redirect(action: "show", params: [solutionId:solutionId.solutionId, solutionSetId:solutionId.solutionSet.id])
        }
    }
}
