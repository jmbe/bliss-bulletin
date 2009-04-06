

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.bulletin.edit.title"/></title>
    </head>
    <body>
    	<g:applyLayout name="adminNav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="admin.bulletin.create.title"/></g:link></span>
    	</g:applyLayout>
        <div class="body">
            <h1><g:message code="admin.bulletin.edit.title"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bulletinInstance}">
            <div class="errors">
                <g:renderErrors bean="${bulletinInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <input type="hidden" name="id" value="${bulletinInstance?.id}" />
                <input type="hidden" name="version" value="${bulletinInstance?.version}" />
                <input type="hidden" name="name" value="${bulletinInstance?.name}"/>
                <div class="dialog">
                    <table>
                        <tbody>
	                        <tr class="prop">
	                            <td class="name"><g:message code="admin.bulletin.filename"/></td>
	                            <td class="value">${fieldValue(bean:bulletinInstance, field:'name')}</td>
	                        </tr>

                            <tr class="prop">
                                <td class="description">
                                    <label for="description"><g:message code="admin.bulletin.description"/></label>
                                </td>
                                <td class="value ${hasErrors(bean:bulletinInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:bulletinInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit action="update" class="save" value="${message(code:'admin.bulletin.save')}" /></span>
                    <span class="button"><g:actionSubmit action="delete" class="delete" onclick="return confirm('Ta bort bulletinen?');" value="${message(code:'admin.bulletin.delete')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
