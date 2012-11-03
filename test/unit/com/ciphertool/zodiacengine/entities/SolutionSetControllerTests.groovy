package com.ciphertool.zodiacengine.entities



import org.junit.*
import grails.test.mixin.*

@TestFor(SolutionSetController)
@Mock(SolutionSet)
class SolutionSetControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/solutionSet/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.solutionSetInstanceList.size() == 0
        assert model.solutionSetInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.solutionSetInstance != null
    }

    void testSave() {
        controller.save()

        assert model.solutionSetInstance != null
        assert view == '/solutionSet/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/solutionSet/show/1'
        assert controller.flash.message != null
        assert SolutionSet.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/solutionSet/list'

        populateValidParams(params)
        def solutionSet = new SolutionSet(params)

        assert solutionSet.save() != null

        params.id = solutionSet.id

        def model = controller.show()

        assert model.solutionSetInstance == solutionSet
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/solutionSet/list'

        populateValidParams(params)
        def solutionSet = new SolutionSet(params)

        assert solutionSet.save() != null

        params.id = solutionSet.id

        def model = controller.edit()

        assert model.solutionSetInstance == solutionSet
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/solutionSet/list'

        response.reset()

        populateValidParams(params)
        def solutionSet = new SolutionSet(params)

        assert solutionSet.save() != null

        // test invalid parameters in update
        params.id = solutionSet.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/solutionSet/edit"
        assert model.solutionSetInstance != null

        solutionSet.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/solutionSet/show/$solutionSet.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        solutionSet.clearErrors()

        populateValidParams(params)
        params.id = solutionSet.id
        params.version = -1
        controller.update()

        assert view == "/solutionSet/edit"
        assert model.solutionSetInstance != null
        assert model.solutionSetInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/solutionSet/list'

        response.reset()

        populateValidParams(params)
        def solutionSet = new SolutionSet(params)

        assert solutionSet.save() != null
        assert SolutionSet.count() == 1

        params.id = solutionSet.id

        controller.delete()

        assert SolutionSet.count() == 0
        assert SolutionSet.get(solutionSet.id) == null
        assert response.redirectedUrl == '/solutionSet/list'
    }
}
