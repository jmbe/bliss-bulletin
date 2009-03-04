dataSource {
	pooled = true
	driverClassName = "org.hsqldb.jdbcDriver"
	username = "sa"
	password = ""
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			dbCreate =  "update"
			
			username = "bulletin-dev"
			password = "bulletin-dev"
			url = "jdbc:mysql://localhost/bliss-bulletin"
		}
	}
	test {
		dataSource {
			dbCreate = "create"
			url = "jdbc:hsqldb:mem:testDb"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:hsqldb:file:prodDb;shutdown=true"
		}
	}
}
