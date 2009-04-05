class Bulletin {
	String name
	String description
	byte[] data
	boolean visible
	int nDownloads
	Date dateCreated
	
	static constraints = {
		data(size: 0..10000000)
		dateCreated(nullable: true)
	}
}
