<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.bulletin.create.title"/></title>
	    <g:javascript library="prototype"/>
	    <g:javascript library="bulletinAdminHandler"/>
    </head>
    <body onload="new BulletinAdminHandler()">
    	<g:applyLayout name="adminNav" />

        <div class="body">
            <h1><g:message code="admin.bulletin.create.title"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <g:if test="${params['errors'] || params['error']}">
            <div class="errors">
            	<g:if test="${params['errors']}">
                <g:each in="${params['errors']}">
                	<p><g:message code="${it}"/></p>
                </g:each>
            	</g:if>
            	<g:else>
            		<p><g:message code="${params['error']}"/></p>
            	</g:else>
            </div>
            </g:if>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td class="name">
                                    <label for="bulletin"><g:message code="admin.bulletin.file"/></label>
                                </td>
                                <td  class="value">
                                    <input id="bulletin" type="file" name="bulletin" />
                                </td>
                            </tr>
                            <tr class="prop">
                                <td class="name">
                                    <label for="coverPage"><g:message code="admin.bulletin.coverPage"/></label>
                                </td>
                                <td  class="value">
                                    <input id="coverPage" type="file" name="coverPage" />
                                </td>
                            </tr>
							<tr>
                            	<td valign="middle" class="name">
                                    <label for="title"><g:message code="admin.bulletin.title"/></label>
                                </td>
                            	<td>
                            		<input type="text" id="title" name="title" value="${params['title']}"/>
                            	</td>
                            </tr>
                            <tr>
                            	<td valign="middle" class="name">
                                    <label for="description"><g:message code="admin.bulletin.description"/></label>
                                </td>
                            	<td>
                            		<input type="text" id="description" name="description" value="${params['description']}"/>
                            	</td>
                            </tr>
                            <tr class="opf">
								<td class="name">
                                    <label for="opf"><g:message code="admin.bulletin.opf"/></label>
                                </td>
                                <td class="value">
                                    <input type="text" id="opf" name="opfTitle" />
                                </td>
	                            <td class="value">
                                    <input type="text" name="opfUrl" />
                                </td>
                            </tr>
                            <tr id="afterLastOpfPlaceholder"/>
                        </tbody>
                    </table>
                </div>
                <div class="buttons" style="text-align: right;">
                    <span class="button"><input class="save" type="submit" value="${message(code:'admin.bulletin.upload')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
