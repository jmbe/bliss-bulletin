

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Bulletin List</title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="bulletin.list.title"/></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                   	        
                   	        <th></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bulletinInstanceList}" status="i" var="bulletinInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean:bulletinInstance, field:'id')}</td>
                        
                            <td>${fieldValue(bean:bulletinInstance, field:'description')}</td>
                        	
                        	<td><g:link action="data" id="${bulletinInstance.id}">Ladda ner</g:link></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${Bulletin.count()}" />
            </div>
        </div>
    </body>
</html>
