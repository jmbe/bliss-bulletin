<head>
	<meta name="layout" content="admin" />
	<title><g:message code="admin.account.list.title"/></title>
</head>

<body>
	<g:applyLayout name="adminNav">
		<span class="menuButton"><g:link class="create" action="create"><g:message code="admin.account.create.title"/></g:link></span>
	</g:applyLayout>

	<div class="body">
		<h1><g:message code="admin.account.list.title"/></h1>
		<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
		</g:if>
		<div class="list">
			<table>
			<thead>
				<tr>
					<g:sortableColumn property="id" titleKey="admin.account.id" />
					<g:sortableColumn property="username" titleKey="admin.account.username" />
					<g:sortableColumn property="userRealName" titleKey="admin.account.name" />
					<g:sortableColumn property="enabled" titleKey="admin.account.enabled" />
					<g:sortableColumn property="description" titleKey="admin.account.description" />
					<th>&nbsp;</th>
				</tr>
			</thead>
			<tbody>
			<g:each in="${personList}" status="i" var="person">
				<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					<td>${person.id}</td>
					<td>${person.username?.encodeAsHTML()}</td>
					<td>${person.userRealName?.encodeAsHTML()}</td>
					<td>${person.enabled?.encodeAsHTML()}</td>
					<td>${person.description?.encodeAsHTML()}</td>
					<td class="actionButtons">
						<span class="actionButton">
							<g:link action="show" id="${person.id}"><g:message code="admin.account.show"/></g:link>
						</span>
					</td>
				</tr>
			</g:each>
			</tbody>
			</table>
		</div>

		<div class="paginateButtons">
			<g:paginate total="${Account.count()}" />
		</div>

	</div>
</body>
