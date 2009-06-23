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
    	
    	println "Getting file content " + bulletin.name;
    	response.setHeader("Content-Disposition", "attachment; filename=\"" + bulletin.name + "\"")
    	response.outputStream << bulletin.data
    }
    
    def coverPage = {
    	def bulletin = Bulletin.get( params.id )
    	
    	println "Showing the coverPage image"
    	response.outputStream << bulletin.coverPage
    }
}
