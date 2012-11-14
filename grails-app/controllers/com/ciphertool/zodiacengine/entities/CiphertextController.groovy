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
		def ciphertextId = new CiphertextId(new Cipher(params.cipherId as Integer), params.ciphertextId as int)
		def ciphertextInstance = new Ciphertext(ciphertextId, params.value)
        if (!ciphertextInstance..save(flush: true, insert:true)) {
            render(view: "create", model: [ciphertextInstance: ciphertextInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
        redirect(action: "show", params: [cipherId:ciphertextId.cipher.id, ciphertextId:ciphertextId.ciphertextId])
    }

    def show() {
		def cipher = new Cipher(params.cipherId as Integer)
		def ciphertextInstance = Ciphertext.findById(new CiphertextId(cipher, params.ciphertextId as int))
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), id])
            redirect(action: "list")
            return
        }

        [ciphertextInstance: ciphertextInstance]
    }

    def edit() {
		def ciphertextId = new CiphertextId(new Cipher(params.cipherId as Integer), params.ciphertextId as int)
        def ciphertextInstance = Ciphertext.findById(ciphertextId)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
            redirect(action: "list")
            return
        }

        [ciphertextInstance: ciphertextInstance]
    }

    def update() {
		def ciphertextId = new CiphertextId(new Cipher(params.cipherId as Integer), params.ciphertextId as int)
        def ciphertextInstance = Ciphertext.findById(ciphertextId)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
            redirect(action: "list")
            return
        }

        ciphertextInstance.properties = params

        if (!ciphertextInstance.save(flush: true)) {
            render(view: "edit", model: [ciphertextInstance: ciphertextInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextInstance.id])
        redirect(action: "show", params: [cipherId:ciphertextId.cipher.id, ciphertextId:ciphertextId.ciphertextId])
    }

    def delete() {
		def ciphertextId = new CiphertextId(new Cipher(params.cipherId as Integer), params.ciphertextId as int)
        def ciphertextInstance = Ciphertext.findById(ciphertextId)
        if (!ciphertextInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
            redirect(action: "list")
            return
        }

        try {
			def cipher = ciphertextInstance.id.cipher
			cipher.getCiphertextCharacters().remove(ciphertextInstance)
            ciphertextInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ciphertext.label', default: 'Ciphertext'), ciphertextId])
            redirect(action: "show", params: [cipherId:ciphertextId.cipher.id, ciphertextId:ciphertextId.ciphertextId])
        }
    }
}
