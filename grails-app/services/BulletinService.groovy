class BulletinService {

    boolean transactional = true

    def create(downloadedfile) {
    	def filename = downloadedfile.originalFilename
		def file = new File("bulletins", filename)
		file.parentFile.mkdirs()
		downloadedfile.transferTo(file)
		def bulletin = new Bulletin(name: filename, path: file.absolutePath).save()
    }
    
    def delete(bulletin) {
    	def file = new File(bulletin.path)
    	file.delete()
    	bulletin.delete()
    }
}
