dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "bulletin-dev"
    password = "bulletin-dev"
    dialect = org.hibernate.dialect.MySQL5InnoDBDialect
    properties {
        testOnBorrow = "true"
        validationQuery = "/* ping */ SELECT 1 FROM DUAL;"
//        defaultAutoCommit = "false"
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
            url = "jdbc:mysql://localhost/bulletin-dev"
        }
    }
    test {
        dataSource {
            dbCreate = "create"
            username = "bulletin-test"
            password = "bulletin-test"
            url = "jdbc:mysql://localhost/bulletin-test"
        }
    }
    production {
        dataSource {
            url = "jdbc:mysql://localhost/bliss-bulletin"
        }
    }

    // create database if not exists `bliss-bulletin-qa`;
    // grant all on `bliss-bulletin-qa`.* to `bulletin-qa`@'localhost' identified by 'bulletin-qa';
    qa {
        dataSource {
            username = "bulletin-qa"
            password = "bulletin-qa"
            url = "jdbc:mysql://localhost/bliss-bulletin-qa"
        }
    }
}
