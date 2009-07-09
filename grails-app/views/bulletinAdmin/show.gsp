

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.bulletin.edit.title"/></title>
	    <g:javascript library="prototype"/>
	    <g:javascript library="bulletinAdminHandler"/>
    </head>
    <body onload="new BulletinAdminHandler()">
    	<g:applyLayout name="adminNav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="admin.bulletin.create.title"/></g:link></span>
    	</g:applyLayout>
        <div class="body">
            <h1><g:message code="admin.bulletin.edit.title"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
	        <g:hasErrors bean="${bulletin}">
		        <div class="errors">
			        <g:renderErrors bean="${bulletin}" as="list" />
		        </div>
	        </g:hasErrors>
	        <g:set var="nOpfs" value="${bulletin.opfs.size()}" />
	        <g:form method="post" enctype="multipart/form-data">
		        <input type="hidden" name="id" value="${bulletin?.id}" />
		        <input type="hidden" name="version" value="${bulletin?.version}" />
		        <input type="hidden" name="name" value="${bulletin?.name}"/>
		        <div class="dialog">
	                <table>
	                    <tbody>
                            <tr class="prop">
		                        <td class="name"><g:message code="admin.bulletin.filename"/></td>
		                        <td class="value">${fieldValue(bean:bulletin, field:'name')}</td>
	                        </tr>

                            <tr class="prop">
	                            <td class="name">
	                                <label for="title"><g:message code="admin.bulletin.title"/></label>
                                </td>
	                            <td class="value">
	                                <input type="text" id="title" name="title" value="${fieldValue(bean:bulletin,field:'title')}"/>
                                </td>
                            </tr>

							<tr class="prop">
								<td class="name">
									<label for="description"><g:message code="admin.bulletin.description"/></label>
								</td>
								<td class="value">
									<input type="text" id="description" name="description" value="${fieldValue(bean:bulletin,field:'description')}"/>
								</td>
							</tr>
							<tr class="prop">
	                            <td class="name">
	                                <label for="buttercupPath"><g:message code="admin.bulletin.buttercupPath"/></label>
                                </td>
	                            <td class="value">
	                                <input type="text" id="buttercupPath" name="buttercupPath" value="${fieldValue(bean:bulletin,field:'buttercupPath')}"/>
                                </td>
                            </tr>
							<g:each var="opf" status="i" in="${bulletin.opfs}">
							<tr class="opf">
								<td class="name">
                                    <label for="opf${i}"><g:message code="admin.bulletin.opf"/></label>
                                </td>
                                <td class="value">
                                    <input type="text" id="opf${i}" name="opfTitle" value="${opf.title}" />
                                </td>
	                            <td class="value">
                                    <input type="text" name="opfUrl" value="${opf.url}"/>
                                </td>
                            </tr>
							</g:each>
                            <tr class="opf">
								<td class="name">
                                    <label for="opf${nOpfs}"><g:message code="admin.bulletin.opf"/></label>
                                </td>
                                <td class="value">
                                    <input type="text" id="opf${nOpfs}" name="opfTitle" />
                                </td>
	                            <td class="value">
                                    <input type="text" name="opfUrl" />
                                </td>
                            </tr>
	                        <tr id="afterLastOpfPlaceholder"/>
							<tr class="prop">
                                <td class="file">
                                    <label for="bulletin"><g:message code="admin.bulletin.filename"/></label>
                                </td>
                                <td class="value">
                                    <input type="file" id="bulletin" name="bulletin" />
                                </td>
                            </tr> 
                            <tr class="prop">
                                <td class="file">
                                    <label for="coverPage"><g:message code="admin.bulletin.coverPage"/></label>
                                </td>
                                <td class="value ${hasErrors(bean:bulletin,field:'coverPage','errors')}">
                                    <input type="file" id="coverPage" name="coverPage" />
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
