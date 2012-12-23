package se.blissbulletinen
import org.codehaus.groovy.grails.plugins.springsecurity.Secured

import se.blissbulletinen.Bulletin;
import se.blissbulletinen.BulletinService;
import se.blissbulletinen.Opf;

@Secured(['ROLE_ADMIN'])
class BulletinAdminController {

    def bulletinService = new BulletinService()

    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ bulletinInstanceList: Bulletin.list( params ), bulletinInstanceTotal: Bulletin.count() ]
    }

    def show = {
        def bulletin = Bulletin.get( params.id )

        if (!bulletin) {
            flash.message = "Bulletin not found with id ${params.id}"
            redirect(action: list)
        } else {
            [bulletin: bulletin]
        }
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
        def bulletin = Bulletin.get( params.id )
        if(bulletin) {
            if(params.version) {
                def version = params.version.toLong()
                if(bulletin.version > version) {

                    bulletin.errors.rejectValue("version", "bulletin.optimistic.locking.failure", "Another user has updated this Bulletin while you were editing.")
                    render(view:'edit',model:[bulletinInstance:bulletin])
                    return
                }
            }
            def coverPage = request.getFile('coverPage').getBytes()
            if(coverPage.length <= 0) {
                coverPage = bulletin.coverPage
            }

            def file = request.getFile('bulletin')
            def data = file.getBytes()
            def filename = file.originalFilename
            if(data.length <= 0) {
                data = bulletin.data
                filename = bulletin.name
            }

            def opfs = getOpfs(request)

            bulletin.properties = params
            bulletin.coverPage = coverPage
            bulletin.data = data
            bulletin.name = filename
            bulletin.opfs = opfs

            if(!bulletin.hasErrors() && bulletin.save()) {
                flash.message = "Bulletin ${bulletin.name} uppdaterad"
                //redirect(action:show,id:bulletinInstance.id)
                redirect(action:list)
            }
            else {
                render(view:'edit',model:[bulletinInstance:bulletin])
            }
        }
        else {
            flash.message = "Bulletin not found with id ${params.id}"
            redirect(action:edit,id:params.id)
        }
    }

    def create = {
        def bulletin = new Bulletin()
        bulletin.properties = params
        return ['bulletin':bulletin]
    }

    def save = {
        def downloadedfile = request.getFile('bulletin')
        def coverPage = request.getFile('coverPage')
        def title = params['title']
        def description = params['description']
        def opfs = getOpfs(request)

        def errors = []
        if(downloadedfile.getBytes().length <= 0) {
            errors.add "bulletin.errors.data.missing"
        }
        if(coverPage.getBytes().length <= 0) {
            errors.add "bulletin.errors.coverPage.missing"
        }
        if(!title) {
            errors.add "bulletin.errors.title.missing"
        }
        if(!description) {
            errors.add "bulletin.errors.description.missing"
        }

        if(!errors.isEmpty()) {
            flash.message = "There where errors"
            if(errors.size() > 1) {
                params['errors'] = errors
            } else {
                params['error'] = errors
            }
            redirect action:create, params:params
        } else {
            bulletinService.create(downloadedfile, coverPage, title, description, opfs)
            flash.message = "The bulletin was created"
            redirect(action:list,params:params)
        }
    }

    private List getOpfs(javax.servlet.http.HttpServletRequest request) {
        def opfTitles = request.getParameterValues("opfTitle")
        def opfUrls = request.getParameterValues("opfUrl")
        def opfs = new LinkedList()

        if (opfTitles.length != opfUrls.length)
            return opfs

        def index = 0
        while(index < opfTitles.length) {
            String title = opfTitles[index]
            String url = opfUrls[index]
            if(title.length() > 0 && url.length() > 0) {
                def opf = new Opf(title: title, url: url)
                opfs.add(opf)
            }
            index++
        }

        return opfs
    }
}

