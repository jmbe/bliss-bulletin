import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile, description) {
    	def filename = downloadedfile.originalFilename
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, description: description).save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
