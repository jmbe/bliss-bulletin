import se.blissbulletinen.Account;
import se.blissbulletinen.Role;

class BootStrap {

    def authenticateService

    def init = { servletContext ->
        log.info "Init boot strap"
        createRoles()
        createDefaultUsers()
    }

    def createRoles = {
        if (!Role.findByAuthority ("ROLE_ADMIN")) {
            log.info "Creating admin role"
            def role = new Role(authority : "ROLE_ADMIN", description: "Administrator")
            if (!role.save()) {
                role.errors.each(log.error(it) )
            }
        }
    }

    def createDefaultUsers = {
        if(!Account.findByUsername("jmbe")) {
            log.info "Adding initial admin"
            def jmbe = new Account(username:"jmbe", email:"jm.bergqvist@gmail.com", userRealName: "J-M", enabled:true)
            jmbe.passwd = authenticateService.encodePassword("nqqFjXK85U")

            Role.findByAuthority ("ROLE_ADMIN").addToPeople(jmbe)
        }
    }

    def destroy = {
    }
}