

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Edit Bulletin</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list">Bulletinlista</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">Ladda upp bulletin</g:link></span>
        </div>
        <div class="body">
            <h1>&Auml;ndra bulletin</h1>
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
	                            <td class="name">Filnamn</td>
	                            <td class="value">${fieldValue(bean:bulletinInstance, field:'name')}</td>
	                        </tr>

                            <tr class="prop">
                                <td class="description">
                                    <label for="description">Beskrivning</label>
                                </td>
                                <td class="value ${hasErrors(bean:bulletinInstance,field:'description','errors')}">
                                    <input type="text" id="description" name="description" value="${fieldValue(bean:bulletinInstance,field:'description')}"/>
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" value="Spara" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Ta bort bulletinen?');" value="Ta bort" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
