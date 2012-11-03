package com.ciphertool.zodiacengine.entities



import org.junit.*
import grails.test.mixin.*

@TestFor(CiphertextController)
@Mock(Ciphertext)
class CiphertextControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ciphertext/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ciphertextInstanceList.size() == 0
        assert model.ciphertextInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ciphertextInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ciphertextInstance != null
        assert view == '/ciphertext/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ciphertext/show/1'
        assert controller.flash.message != null
        assert Ciphertext.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ciphertext/list'

        populateValidParams(params)
        def ciphertext = new Ciphertext(params)

        assert ciphertext.save() != null

        params.id = ciphertext.id

        def model = controller.show()

        assert model.ciphertextInstance == ciphertext
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ciphertext/list'

        populateValidParams(params)
        def ciphertext = new Ciphertext(params)

        assert ciphertext.save() != null

        params.id = ciphertext.id

        def model = controller.edit()

        assert model.ciphertextInstance == ciphertext
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ciphertext/list'

        response.reset()

        populateValidParams(params)
        def ciphertext = new Ciphertext(params)

        assert ciphertext.save() != null

        // test invalid parameters in update
        params.id = ciphertext.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ciphertext/edit"
        assert model.ciphertextInstance != null

        ciphertext.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ciphertext/show/$ciphertext.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ciphertext.clearErrors()

        populateValidParams(params)
        params.id = ciphertext.id
        params.version = -1
        controller.update()

        assert view == "/ciphertext/edit"
        assert model.ciphertextInstance != null
        assert model.ciphertextInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ciphertext/list'

        response.reset()

        populateValidParams(params)
        def ciphertext = new Ciphertext(params)

        assert ciphertext.save() != null
        assert Ciphertext.count() == 1

        params.id = ciphertext.id

        controller.delete()

        assert Ciphertext.count() == 0
        assert Ciphertext.get(ciphertext.id) == null
        assert response.redirectedUrl == '/ciphertext/list'
    }
}
