<head>
	<meta name="layout" content="admin" />
	<title><g:message code="admin.account.show.title"/></title>
</head>

<body>
	<g:applyLayout name="adminNav">
		<span class="menuButton"><g:link class="create" action="create"><g:message code="admin.account.create.title"/></g:link></span>
	</g:applyLayout>

	<div class="body">
		<h1><g:message code="admin.account.show.title"/></h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="dialog">
			<table>
			<tbody>
				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.id"/>:</td>
					<td valign="top" class="value">${person.id}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.username"/>:</td>
					<td valign="top" class="value">${person.username?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.name"/>:</td>
					<td valign="top" class="value">${person.userRealName?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.enabled"/>:</td>
					<td valign="top" class="value">${person.enabled}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.description"/>:</td>
					<td valign="top" class="value">${person.description?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.email"/>:</td>
					<td valign="top" class="value">${person.email?.encodeAsHTML()}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.email.show"/>:</td>
					<td valign="top" class="value">${person.emailShow}</td>
				</tr>

				<tr class="prop">
					<td valign="top" class="name"><g:message code="admin.account.roles"/>:</td>
					<td valign="top" class="value">
						<ul>
						<g:each in="${roleNames}" var='name'>
							<li>${name}</li>
						</g:each>
						</ul>
					</td>
				</tr>

			</tbody>
			</table>
		</div>

		<div class="buttons">
			<g:form>
				<input type="hidden" name="id" value="${person.id}" />
				<span class="button"><g:actionSubmit class="edit" value="${message(code:'admin.account.edit')}" action="edit"/></span>
				<span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="${message(code:'admin.account.delete')}" action="delete"/></span>
			</g:form>
		</div>

	</div>
</body>
