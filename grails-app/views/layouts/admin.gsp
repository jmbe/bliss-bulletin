<html>
    <head>
        <title><g:layoutTitle default="Bliss bulletin" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />				
    </head>
    <body onload="${pageProperty(name:'body.onload')}">
    	<h1 style="margin-left:15px; font-size: xx-large;">Blissbulletin Admin</h1>
        <g:layoutBody />		
    </body>	
</html>
