class Bulletin {
	String name
	byte[] data
	boolean visible
	int nDownloads
	
	static constraints = {
		data(size: 0..10000000)
	}
}
