package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException

class CiphertextController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ciphertextInstanceList: Ciphertext.list(params), ciphertextInstanceTotal: Ciphertext.count()]
    }

    def create() {
        [ciphertextInstance: new Ciphertext()]
    }

    def save() {
        def ciphertextInstance = new Ciphertext(params)
        if (!ciphertextInstance.save(flush: true)) {
            render(view: "create", model: [ciphertextInstance: ciphertextInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextInstance.id])
        redirect(action: "show", id: ciphertextInstance.id)
    }

    def show(Long id) {
		def cipher = new Cipher(params.cipherId as Integer)
		def ciphertextInstance = Ciphertext.findById(new CiphertextId(cipher, params.ciphertextId as int))
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
            return
        }

        [ciphertextInstance: ciphertextInstance]
    }

    def edit(Long id) {
        def ciphertextInstance = Ciphertext.get(id)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
            return
        }

        [ciphertextInstance: ciphertextInstance]
    }

    def update(Long id, Long version) {
        def ciphertextInstance = Ciphertext.get(id)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ciphertextInstance.version > version) {
                ciphertextInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ciphertext.label', default: 'Ciphertext')] as Object[],
                          "Another user has updated this Ciphertext while you were editing")
                render(view: "edit", model: [ciphertextInstance: ciphertextInstance])
                return
            }
        }

        ciphertextInstance.properties = params

        if (!ciphertextInstance.save(flush: true)) {
            render(view: "edit", model: [ciphertextInstance: ciphertextInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextInstance.id])
        redirect(action: "show", id: ciphertextInstance.id)
    }

    def delete(Long id) {
        def ciphertextInstance = Ciphertext.get(id)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
            return
        }

        try {
            ciphertextInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "show", id: id)
        }
    }
}
