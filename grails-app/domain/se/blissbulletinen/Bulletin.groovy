package se.blissbulletinen
class Bulletin {
    String name
    String title
    String description
    byte[] coverPage
    byte[] data
    boolean visible
    int nDownloads
    Date dateCreated

    List opfs
    static hasMany = [opfs : Opf]

    static constraints = {

        /* MySQL max packet size is normally 16 MB so data is limited to that for now. */
        data(size: 0..16000000,
                validator:  {
                    return (it.length > 0)
                })
        coverPage(size: 0..16000000,
                validator:  {
                    return (it.length > 0)
                })
        dateCreated(nullable: true)
    }
}
