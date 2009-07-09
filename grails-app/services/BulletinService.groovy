import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile, coverPage, title, description, opfs) {
    	def filename = downloadedfile.originalFilename
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, coverPage:coverPage, title: title, description: description, opfs: opfs)

		bulletin.save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
