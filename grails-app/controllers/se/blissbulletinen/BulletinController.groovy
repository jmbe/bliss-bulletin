package se.blissbulletinen
import se.blissbulletinen.Bulletin;

class BulletinController {

    def index = {
        redirect(action:list, params:params)
    }

    def list = {
        [ bulletinInstanceList: Bulletin.findAllByVisible(true,[sort:"id", order:"desc"]), bulletinInstanceTotal: Bulletin.count() ]
    }

    def data = {
        def bulletin = Bulletin.get( params.id )

        bulletin.nDownloads++

        response.setHeader("Content-Disposition", "attachment; filename=\"" + bulletin.name + "\"")
        response.outputStream << bulletin.data
    }

    def coverPage = {
        def bulletin = Bulletin.get( params.id )

        response.outputStream << bulletin.coverPage
    }
}
