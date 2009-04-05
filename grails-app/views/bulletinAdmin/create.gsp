

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Ladda upp bulletin</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list">Bulletinlista</g:link></span>
        </div>
        <div class="body">
            <h1>Ladda upp bulletin</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${bulletinInstance}">
            <div class="errors">
                <g:renderErrors bean="${bulletinInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" enctype="multipart/form-data">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td class="name">
                                    <label for="file">Bulletinfil</label>
                                </td>
                                <td  class="value">
                                    <input id="file" type="file" name="bulletin" />
                                </td>
                            </tr>
                            <tr>
                            	<td valign="middle" class="name">
                                    <label for="description">Beskrivning</label>
                                </td>
                            	<td>
                            		<input type="text" id="description" name="description"/>
                            	</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="buttons" style="text-align: right;">
                    <span class="button"><input class="save" type="submit" value="Ladda upp" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
