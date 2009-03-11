import org.hibernate.Hibernate

class BulletinService {

    boolean transactional = true

    def create(downloadedfile) {
    	def filename = downloadedfile.originalFilename
		//def file = new File("bulletins", filename)
		//file.parentFile.mkdirs()
		//downloadedfile.transferTo(file)
		
		def data = getDataBytes(downloadedfile.inputStream, (int)downloadedfile.size)
		def bulletin = new Bulletin(name: filename, data: data, description: "").save()
    }
    
	def getDataBytes(stream, length) {
		byte [] data = new byte [length]
		if(stream.read(data, 0, length) < length) {
			logger.error("n bytes read from stream where fewer than requested.")
		}
		return data
	}
    
    def delete(bulletin) {
    	bulletin.delete()
    }
}
