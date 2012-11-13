<%@ page import="com.ciphertool.zodiacengine.entities.Cipher" %>

<div class="fieldcontain ${hasErrors(bean: cipherInstance, field: 'id', 'error')} ">
	<label for="id">
		<g:message code="cipher.id.label" default="Id" />
		
	</label>
	<g:fieldValue bean="${cipherInstance}" field="id"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cipherInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="cipher.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${cipherInstance?.name}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cipherInstance, field: 'rows', 'error')} ">
	<label for="rows">
		<g:message code="cipher.rows.label" default="Rows" />
		
	</label>
	<g:field type="number" name="rows" value="${cipherInstance.rows}" />
</div>

<div class="fieldcontain ${hasErrors(bean: cipherInstance, field: 'columns', 'error')} ">
	<label for="columns">
		<g:message code="cipher.columns.label" default="Columns" />
		
	</label>
	<g:field type="number" name="columns" value="${cipherInstance.columns}" />
</div>