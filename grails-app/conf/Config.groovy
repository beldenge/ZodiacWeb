// locations to search for config files that get merged into the main config;
// config files can be ConfigSlurper scripts, Java properties files, or classes
// in the classpath in ConfigSlurper format

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if (System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [
    all:           '*/*',
    atom:          'application/atom+xml',
    css:           'text/css',
    csv:           'text/csv',
    form:          'application/x-www-form-urlencoded',
    html:          ['text/html','application/xhtml+xml'],
    js:            'text/javascript',
    json:          ['application/json', 'text/json'],
    multipartForm: 'multipart/form-data',
    rss:           'application/rss+xml',
    text:          'text/plain',
    xml:           ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// The default codec used to encode data with ${}
grails.views.default.codec = "none" // none, html, base64
grails.views.gsp.encoding = "UTF-8"
grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart=false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// configure auto-caching of queries by default (if false you can cache individual queries with 'cache: true')
grails.hibernate.cache.queries = false

environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    // Example of changing the log pattern for the default console appender:
    //
    //appenders {
    //    console name:'stdout', layout:pattern(conversionPattern: '%c{2} %m%n')
    //}

	root {
		info()
	}
	
    error  'org.codehaus.groovy.grails.web.servlet',        // controllers
           'org.codehaus.groovy.grails.web.pages',          // GSP
           'org.codehaus.groovy.grails.web.sitemesh',       // layouts
           'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
           'org.codehaus.groovy.grails.web.mapping',        // URL mapping
           'org.codehaus.groovy.grails.commons',            // core / classloading
           'org.codehaus.groovy.grails.plugins',            // plugins
           'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
           'org.springframework',
           'org.hibernate',
           'net.sf.ehcache.hibernate'
}

cipher.name='zodiac408'

// ---------------------------------------
// Thermal control properties
// ---------------------------------------
app.commands.before='powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 99,powercfg -setactive SCHEME_CURRENT'
app.commands.after='powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX 100,powercfg -setactive SCHEME_CURRENT'

// ---------------------------------------
// Spring taskExecutor Properties
// ---------------------------------------
taskExecutor.corePoolSize=8
taskExecutor.maxPoolSize=8
taskExecutor.queueCapacity=2000

// ---------------------------------------
// Genetic algorithm properties
// ---------------------------------------
genetic.population.size=100
genetic.algorithm.survivalRate=0.9
genetic.algorithm.mutationRate=0.001
genetic.algorithm.crossoverRate=0.05
genetic.algorithm.maxGenerations=50
genetic.algorithm.finalSurvivorCount=10


// ---------------------------------------
// English language properties
// ---------------------------------------
// Source: (http://www.math.cornell.edu/~mec/2003-2004/cryptography/subs/frequencies.html)
language.english.frequency.a=0.0812
language.english.frequency.b=0.0149
language.english.frequency.c=0.0271
language.english.frequency.d=0.0432
language.english.frequency.e=0.1202
language.english.frequency.f=0.0230
language.english.frequency.g=0.0203
language.english.frequency.h=0.0592
language.english.frequency.i=0.0731
language.english.frequency.j=0.0010
language.english.frequency.k=0.0069
language.english.frequency.l=0.0398
language.english.frequency.m=0.0261
language.english.frequency.n=0.0695
language.english.frequency.o=0.0768
language.english.frequency.p=0.0182
language.english.frequency.q=0.0011
language.english.frequency.r=0.0602
language.english.frequency.s=0.0628
language.english.frequency.t=0.0910
language.english.frequency.u=0.0288
language.english.frequency.v=0.0111
language.english.frequency.w=0.0209
language.english.frequency.x=0.0017
language.english.frequency.y=0.0211
language.english.frequency.z=0.0007