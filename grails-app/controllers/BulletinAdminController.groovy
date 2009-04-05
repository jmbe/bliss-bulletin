import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class BulletinAdminController {

	def bulletinService
	
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ bulletinInstanceList: Bulletin.list( params ), bulletinInstanceTotal: Bulletin.count() ]
    }

    def show = {
        def bulletinInstance = Bulletin.get( params.id )

        if(!bulletinInstance) {
            flash.message = "Bulletin not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ bulletinInstance : bulletinInstance ] }
    }
	
	def toggleVisible = {
		def bulletinInstance = Bulletin.get( params.id )
		if(!bulletinInstance) {
            flash.message = "Bulletin not found with id ${params.id}"
        } else { 
        	bulletinInstance.visible = !bulletinInstance.visible
        }
        redirect(action:list)
	}

    def delete = {
        def bulletinInstance = Bulletin.get( params.id )
        if(bulletinInstance) {
        	bulletinService.delete(bulletinInstance)
            flash.message = "Bulletin ${params.id} deleted"
            redirect(action:list)
        }
        else {
            flash.message = "Bulletin not found with id ${params.id}"
            redirect(action:list)
        }
    }


    def update = {
        def bulletinInstance = Bulletin.get( params.id )
        if(bulletinInstance) {
            if(params.version) {
                def version = params.version.toLong()
                if(bulletinInstance.version > version) {
                    
                    bulletinInstance.errors.rejectValue("version", "bulletin.optimistic.locking.failure", "Another user has updated this Bulletin while you were editing.")
                    render(view:'edit',model:[bulletinInstance:bulletinInstance])
                    return
                }
            }
            bulletinInstance.properties = params
            if(!bulletinInstance.hasErrors() && bulletinInstance.save()) {
                flash.message = "Bulletin ${params.id} updated"
                redirect(action:show,id:bulletinInstance.id)
            }
            else {
                render(view:'edit',model:[bulletinInstance:bulletinInstance])
            }
        }
        else {
            flash.message = "Bulletin not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def bulletinInstance = new Bulletin()
        bulletinInstance.properties = params
        return ['bulletinInstance':bulletinInstance]
    }

    def save = {
    	def downloadedfile = request.getFile('bulletin')
    	bulletinService.create(downloadedfile)
    	flash.message = "The bulletin was created"
		redirect(action:list,params:params)
    }
}

