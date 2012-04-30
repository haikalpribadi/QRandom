package qrandom

class AppTagLib {
    def currentPage = { attr, body ->
        if(attr['test']==params.action) {
            out << "currentItem";
        }
    }
}
