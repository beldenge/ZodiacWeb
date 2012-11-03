package com.ciphertool.zodiacengine.entities



import org.junit.*
import grails.test.mixin.*

@TestFor(CipherController)
@Mock(Cipher)
class CipherControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/cipher/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.cipherInstanceList.size() == 0
        assert model.cipherInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.cipherInstance != null
    }

    void testSave() {
        controller.save()

        assert model.cipherInstance != null
        assert view == '/cipher/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/cipher/show/1'
        assert controller.flash.message != null
        assert Cipher.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/cipher/list'

        populateValidParams(params)
        def cipher = new Cipher(params)

        assert cipher.save() != null

        params.id = cipher.id

        def model = controller.show()

        assert model.cipherInstance == cipher
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/cipher/list'

        populateValidParams(params)
        def cipher = new Cipher(params)

        assert cipher.save() != null

        params.id = cipher.id

        def model = controller.edit()

        assert model.cipherInstance == cipher
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/cipher/list'

        response.reset()

        populateValidParams(params)
        def cipher = new Cipher(params)

        assert cipher.save() != null

        // test invalid parameters in update
        params.id = cipher.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/cipher/edit"
        assert model.cipherInstance != null

        cipher.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/cipher/show/$cipher.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        cipher.clearErrors()

        populateValidParams(params)
        params.id = cipher.id
        params.version = -1
        controller.update()

        assert view == "/cipher/edit"
        assert model.cipherInstance != null
        assert model.cipherInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/cipher/list'

        response.reset()

        populateValidParams(params)
        def cipher = new Cipher(params)

        assert cipher.save() != null
        assert Cipher.count() == 1

        params.id = cipher.id

        controller.delete()

        assert Cipher.count() == 0
        assert Cipher.get(cipher.id) == null
        assert response.redirectedUrl == '/cipher/list'
    }
}
