class UrlMappings {

    static mappings = {
		"/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }
	"/"(controller:"main", action:"index")
        "/app"(controller:"main", action:"app")
        "/tutorials"(controller:"main", action:"tutorials")
        "/stream"(controller:"main", action: "stream")
        "/statistics"(controller:"main", action: "statistics")
	"500"(view:'/error')
    }
}
