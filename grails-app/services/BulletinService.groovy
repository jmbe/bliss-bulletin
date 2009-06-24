import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile, coverPage, description, buttercupPath) {
    	def filename = downloadedfile.originalFilename
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, coverPage:coverPage, description: description, buttercupPath: buttercupPath)

		bulletin.save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
