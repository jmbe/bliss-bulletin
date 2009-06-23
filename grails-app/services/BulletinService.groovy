import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile, coverPage, description) {
    	def filename = downloadedfile.originalFilename
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, coverPage:coverPage, description: description).save()

		if (!bulletin) {
			println "Bulletin could not be saved!"
		}
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
