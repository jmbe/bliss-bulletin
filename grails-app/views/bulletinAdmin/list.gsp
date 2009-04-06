

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
                        
                   	        <g:sortableColumn property="name" titleKey="admin.bulletin.filename" />

                   	        <g:sortableColumn property="description" titleKey="admin.bulletin.description" />

							<g:sortableColumn property="nDownloads" titleKey="admin.bulletin.downloads" />

							<g:sortableColumn property="dateCreated" titleKey="admin.bulletin.date" />

                   	        <g:sortableColumn property="visible" titleKey="admin.bulletin.show" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bulletinInstanceList}" status="i" var="bulletinInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bulletinInstance.id}">${fieldValue(bean:bulletinInstance, field:'name')}</g:link></td>
                        
                            <td>${fieldValue(bean:bulletinInstance, field:'description')}</td>

                            <td>${fieldValue(bean:bulletinInstance, field:'nDownloads')}</td>

                            <td>${fieldValue(bean:bulletinInstance, field:'dateCreated')}</td>

                            <td><g:link action="toggleVisible" id="${bulletinInstance.id}">${fieldValue(bean:bulletinInstance, field:'visible')}</g:link></td>
                        
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
