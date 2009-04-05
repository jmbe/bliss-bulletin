import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile) {
    	def filename = downloadedfile.originalFilename
		//def file = new File("bulletins", filename)
		//file.parentFile.mkdirs()
		//downloadedfile.transferTo(file)
		
		def data = downloadedfile.getBytes()
		def bulletin = new Bulletin(name: filename, data: data, description: "").save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
