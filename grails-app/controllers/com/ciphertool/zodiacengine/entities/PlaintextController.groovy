package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException

class PlaintextController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [plaintextInstanceList: Plaintext.list(params), plaintextInstanceTotal: Plaintext.count()]
    }

    def create() {
        [plaintextInstance: new Plaintext(params)]
    }

    def save() {
        def plaintextInstance = new Plaintext(params)
        if (!plaintextInstance.save(flush: true)) {
            render(view: "create", model: [plaintextInstance: plaintextInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextInstance.id])
        redirect(action: "show", id: plaintextInstance.id)
    }

    def show(Long id) {
        def plaintextInstance = Plaintext.get(id)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "list")
            return
        }

        [plaintextInstance: plaintextInstance]
    }

    def edit(Long id) {
        def plaintextInstance = Plaintext.get(id)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "list")
            return
        }

        [plaintextInstance: plaintextInstance]
    }

    def update(Long id, Long version) {
        def plaintextInstance = Plaintext.get(id)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (plaintextInstance.version > version) {
                plaintextInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'plaintext.label', default: 'Plaintext')] as Object[],
                          "Another user has updated this Plaintext while you were editing")
                render(view: "edit", model: [plaintextInstance: plaintextInstance])
                return
            }
        }

        plaintextInstance.properties = params

        if (!plaintextInstance.save(flush: true)) {
            render(view: "edit", model: [plaintextInstance: plaintextInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), plaintextInstance.id])
        redirect(action: "show", id: plaintextInstance.id)
    }

    def delete(Long id) {
        def plaintextInstance = Plaintext.get(id)
        if (!plaintextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "list")
            return
        }

        try {
            plaintextInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'plaintext.label', default: 'Plaintext'), id])
            redirect(action: "show", id: id)
        }
    }
}