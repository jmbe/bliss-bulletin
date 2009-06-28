import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile, coverPage, title, description, buttercupPath) {
    	def filename = downloadedfile.originalFilename
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, coverPage:coverPage, title: title, description: description, buttercupPath: buttercupPath)

		bulletin.save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
