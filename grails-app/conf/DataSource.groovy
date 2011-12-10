dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "bulletin-dev"
    password = "bulletin-dev"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
    properties {
        testOnBorrow = "true"
        validationQuery = "/* ping */ SELECT 1 FROM DUAL;"
        defaultAutoCommit = "false"
    }
}

hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class = "net.sf.ehcache.hibernate.EhCacheProvider"
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate =  "update"
            url = "jdbc:mysql://localhost/bulletin-dev"
        }
    }
    test {
        dataSource {
            dbCreate = "create"
            url = "jdbc:mysql://localhost/bulletin-test"
        }
    }
    production {
        dataSource {
            dbCreate =  "update"
            url = "jdbc:mysql://localhost/bliss-bulletin"
        }
    }
}
