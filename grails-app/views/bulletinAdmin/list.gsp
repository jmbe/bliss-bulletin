<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="admin" />
        <title><g:message code="admin.bulletin.list.title"/></title>
    </head>
    <body>
    	<g:applyLayout name="adminNav">
            <span class="menuButton"><g:link class="create" action="create"><g:message code="admin.bulletin.create.title"/></g:link></span>
    	</g:applyLayout>
        <div class="body">
            <h1><g:message code="admin.bulletin.list.title"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        	<th><g:message code="admin.bulletin.coverPage"/></th>
                        
                   	        <g:sortableColumn property="name" titleKey="admin.bulletin.filename" />

	                        <g:sortableColumn property="title" titleKey="admin.bulletin.title" />   

                   	        <g:sortableColumn property="description" titleKey="admin.bulletin.description" />

							<g:sortableColumn property="nDownloads" titleKey="admin.bulletin.downloads" />

							<g:sortableColumn property="dateCreated" titleKey="admin.bulletin.date" />

                   	        <g:sortableColumn property="visible" titleKey="admin.bulletin.show" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bulletinInstanceList}" status="i" var="bulletin">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        	<td><img class="coverPage" src="${createLink(controller:'bulletin', action:'coverPage', id:bulletin.id)}" alt="${message(code:'bulletin.coverPage')}"/></td>
                        	
                            <td><g:link action="show" id="${bulletin.id}">${fieldValue(bean:bulletin, field:'name')}</g:link></td>

	                        <td>${fieldValue(bean:bulletin, field:'title')}</td>

                            <td>${fieldValue(bean:bulletin, field:'description')}</td>

                            <td>${fieldValue(bean:bulletin, field:'nDownloads')}</td>

                            <td>${fieldValue(bean:bulletin, field:'dateCreated')}</td>

                            <td>
                              <g:form action="toggleVisible">
                                <g:hiddenField name="id" value="${bulletin.id}"/>
                                <g:submitButton class="toggleVisible" name="toggleVisible" value="${fieldValue(bean:bulletin, field:'visible')}"/>
                              </g:form>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bulletinInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
