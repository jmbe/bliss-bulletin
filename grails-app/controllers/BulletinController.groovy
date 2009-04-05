class BulletinController {

    def index = {
		redirect(action:list, params:params)
    }

    def list = {
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ bulletinInstanceList: Bulletin.findAllByVisible(true), bulletinInstanceTotal: Bulletin.count() ]
    }
    
    def data = {
    	def bulletin = Bulletin.get( params.id )

    	bulletin.nDownloads++
    	
    	println "Getting file content " + bulletin.name;
    	response.setHeader("Content-Disposition", "attachment; filename=\"" + bulletin.name + "\"")
    	response.outputStream << bulletin.data
    }
}
