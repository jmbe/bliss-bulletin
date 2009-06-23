class Bulletin {
	String name
	String description
	byte[] coverPage
	byte[] data
	boolean visible
	int nDownloads
	Date dateCreated
	
	static constraints = {
		/* MySQL max packet size is normally 16 MB so data is limited to that for now. */
		data(size: 0..16000000)
		coverPage(size: 0..16000000)
		dateCreated(nullable: true)
	}
}
