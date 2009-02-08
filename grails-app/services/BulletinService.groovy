import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile) {
    	def filename = downloadedfile.originalFilename
		//def file = new File("bulletins", filename)
		//file.parentFile.mkdirs()
		//downloadedfile.transferTo(file)
		
		def data = Hibernate.createBlob(downloadedfile.inputStream)
		def bulletin = new Bulletin(name: filename, data: data).save()
    }
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
