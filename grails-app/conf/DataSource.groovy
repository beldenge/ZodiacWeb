dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
	dialect = "org.hibernate.dialect.PostgreSQLDialect"
    username = "postgres"
    password = "postgres"
	logSql = false
}
hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "validate" // one of 'create', 'create-drop', 'update', 'validate', ''
            url = "jdbc:postgresql://localhost:5432/Zodiac"
        }
    }
    test {
        dataSource {
            dbCreate = "validate"
            url = "jdbc:postgresql://localhost:5432/Zodiac"
        }
    }
    production {
        dataSource {
            dbCreate = "validate"
            url = "jdbc:postgresql://localhost:5432/Zodiac"
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
