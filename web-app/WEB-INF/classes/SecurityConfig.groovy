security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties

	active = true

	loginUserDomainClass = "Account" 
	authorityDomainClass = "Role"

	useRequestMapDomainClass = false
	useControllerAnnotations = true 
	
	basicProcessingFilter = true
}