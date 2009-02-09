class BulletinController {

    def index = { redirect(action:list,params:params) }

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ bulletinInstanceList: Bulletin.list( params ), bulletinInstanceTotal: Bulletin.count() ]
    }
}