// Place your Spring DSL code here
beans = {
    authenticationEntryPoint(org.springframework.security.ui.basicauth.BasicProcessingFilterEntryPoint) { realmName = 'Bliss bulletin' }
    // multipartResolver(org.springframework.web.multipart.commons.CommonsMultipartResolver) {    //  maxUploadSize = 100 * 1024 * 1024    // }
}
