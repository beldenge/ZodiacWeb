package com.ciphertool.zodiacengine.entities



import org.junit.*
import grails.test.mixin.*

@TestFor(PlaintextController)
@Mock(Plaintext)
class PlaintextControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/plaintext/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.plaintextInstanceList.size() == 0
        assert model.plaintextInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.plaintextInstance != null
    }

    void testSave() {
        controller.save()

        assert model.plaintextInstance != null
        assert view == '/plaintext/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/plaintext/show/1'
        assert controller.flash.message != null
        assert Plaintext.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/plaintext/list'

        populateValidParams(params)
        def plaintext = new Plaintext(params)

        assert plaintext.save() != null

        params.id = plaintext.id

        def model = controller.show()

        assert model.plaintextInstance == plaintext
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/plaintext/list'

        populateValidParams(params)
        def plaintext = new Plaintext(params)

        assert plaintext.save() != null

        params.id = plaintext.id

        def model = controller.edit()

        assert model.plaintextInstance == plaintext
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/plaintext/list'

        response.reset()

        populateValidParams(params)
        def plaintext = new Plaintext(params)

        assert plaintext.save() != null

        // test invalid parameters in update
        params.id = plaintext.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/plaintext/edit"
        assert model.plaintextInstance != null

        plaintext.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/plaintext/show/$plaintext.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        plaintext.clearErrors()

        populateValidParams(params)
        params.id = plaintext.id
        params.version = -1
        controller.update()

        assert view == "/plaintext/edit"
        assert model.plaintextInstance != null
        assert model.plaintextInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/plaintext/list'

        response.reset()

        populateValidParams(params)
        def plaintext = new Plaintext(params)

        assert plaintext.save() != null
        assert Plaintext.count() == 1

        params.id = plaintext.id

        controller.delete()

        assert Plaintext.count() == 0
        assert Plaintext.get(plaintext.id) == null
        assert response.redirectedUrl == '/plaintext/list'
    }
}
