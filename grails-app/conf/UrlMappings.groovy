class UrlMappings {
    static mappings = {
      "/"(controller:"bulletin")
      "/$controller/$action?/$id?"{
	      constraints {
			 // apply constraints here
		  }
	  }
	  "500"(view:'/error')
	}
}
