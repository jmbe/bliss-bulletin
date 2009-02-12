

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Bulletin List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Bulletin</g:link></span>
        </div>
        <div class="body">
            <h1>Bulletin List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />

							<g:sortableColumn property="nDownloads" title="Nedladdningar" />

                   	        <g:sortableColumn property="visible" title="Visible" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bulletinInstanceList}" status="i" var="bulletinInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bulletinInstance.id}">${fieldValue(bean:bulletinInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:bulletinInstance, field:'name')}</td>

                            <td>${fieldValue(bean:bulletinInstance, field:'nDownloads')}</td>

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
