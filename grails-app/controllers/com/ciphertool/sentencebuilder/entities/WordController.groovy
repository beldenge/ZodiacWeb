package com.ciphertool.sentencebuilder.entities

import org.springframework.dao.DataIntegrityViolationException
import org.hibernate.FetchMode

class WordController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
		def maxToDisplay = Math.min(params.max as Integer ?: 10, 100)
		def offset = params.offset as Integer ?: 0
		def sortBy = params.sort as String ?: "id"
		def direction = params.order as String ?: "asc"
		def wordCriteria = Word.createCriteria()
		def words = wordCriteria.list {
			maxResults(maxToDisplay)
			firstResult(offset)
			order(sortBy, direction)
		}
        [wordInstanceList: words, wordInstanceTotal: Word.count()]
    }

    def create() {
        [wordInstance: new Word()]
    }

    def save() {
		def wordId = new WordId(params.word, params.partOfSpeech.charAt(0))
        def wordInstance = new Word(wordId, params.frequencyWeight as int)
        if (!wordInstance.save(flush: true, insert:true)) {
            render(view: "create", model: [wordInstance: wordInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'word.label', default: 'Word'), wordId])
        redirect(action: "show", params: [word:wordId.word, partOfSpeech:wordId.partOfSpeech])
    }

    def show() {
		def wordId = new WordId(params.word, params.partOfSpeech.charAt(0))
        def wordInstance = Word.findById(wordId)
        if (!wordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "list")
            return
        }

        [wordInstance: wordInstance]
    }

    def edit() {
		def wordId = new WordId(params.word, params.partOfSpeech.charAt(0))
        def wordInstance = Word.findById(wordId)
        if (!wordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "list")
            return
        }

        [wordInstance: wordInstance]
    }

    def update() {
		def wordId = new WordId(params.word, params.partOfSpeech.charAt(0))
        def wordInstance = Word.findById(wordId)
        if (!wordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "list")
            return
        }

        wordInstance.properties = params

        if (!wordInstance.save(flush: true)) {
            render(view: "edit", model: [wordInstance: wordInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'word.label', default: 'Word'), wordId])
        redirect(action: "show", params: [word:wordId.word, partOfSpeech:wordId.partOfSpeech])
    }

    def delete() {
		def wordId = new WordId(params.word, params.partOfSpeech.charAt(0))
        def wordInstance = Word.findById(wordId)
        if (!wordInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "list")
            return
        }

        try {
            wordInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'word.label', default: 'Word'), wordId])
            redirect(action: "show", params: [word:wordId.word, partOfSpeech:wordId.partOfSpeech])
        }
    }
}
