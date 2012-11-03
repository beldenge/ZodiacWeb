package com.ciphertool.zodiacengine.entities

import org.springframework.dao.DataIntegrityViolationException

class CipherController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cipherInstanceList: Cipher.list(params), cipherInstanceTotal: Cipher.count()]
    }

    def create() {
        [cipherInstance: new Cipher(params)]
    }

    def save() {
        def cipherInstance = new Cipher(params)
        if (!cipherInstance.save(flush: true)) {
            render(view: "create", model: [cipherInstance: cipherInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cipher.label', default: 'Cipher'), cipherInstance.id])
        redirect(action: "show", id: cipherInstance.id)
    }

    def show(Long id) {
        def cipherInstance = Cipher.get(id)
        if (!cipherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "list")
            return
        }

        [cipherInstance: cipherInstance]
    }

    def edit(Long id) {
        def cipherInstance = Cipher.get(id)
        if (!cipherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "list")
            return
        }

        [cipherInstance: cipherInstance]
    }

    def update(Long id, Long version) {
        def cipherInstance = Cipher.get(id)
        if (!cipherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cipherInstance.version > version) {
                cipherInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cipher.label', default: 'Cipher')] as Object[],
                          "Another user has updated this Cipher while you were editing")
                render(view: "edit", model: [cipherInstance: cipherInstance])
                return
            }
        }

        cipherInstance.properties = params

        if (!cipherInstance.save(flush: true)) {
            render(view: "edit", model: [cipherInstance: cipherInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cipher.label', default: 'Cipher'), cipherInstance.id])
        redirect(action: "show", id: cipherInstance.id)
    }

    def delete(Long id) {
        def cipherInstance = Cipher.get(id)
        if (!cipherInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "list")
            return
        }

        try {
            cipherInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cipher.label', default: 'Cipher'), id])
            redirect(action: "show", id: id)
        }
    }
}
