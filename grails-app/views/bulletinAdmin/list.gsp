

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Bulletinlista</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="create" action="create">Ladda upp bulletin</g:link></span>
        </div>
        <div class="body">
            <h1>Bulletinlista</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="name" title="Filnamn" />

                   	        <g:sortableColumn property="description" title="Beskrivning" />

							<g:sortableColumn property="nDownloads" title="Nedladdningar" />

							<g:sortableColumn property="dateCreated" title="Datum" />

                   	        <g:sortableColumn property="visible" title="Visa" />
                        
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
