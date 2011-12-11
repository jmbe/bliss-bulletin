import org.apache.log4j.DailyRollingFileAppender
import org.apache.log4j.Priority
import org.apache.log4j.helpers.OnlyOnceErrorHandler
import org.apache.log4j.net.SMTPAppender

// locations to search for config files that get merged into the main config
// config files can either be Java properties files or ConfigSlurper scripts

// grails.config.locations = [ "classpath:${appName}-config.properties",
//                             "classpath:${appName}-config.groovy",
//                             "file:${userHome}/.grails/${appName}-config.properties",
//                             "file:${userHome}/.grails/${appName}-config.groovy"]

// if(System.properties["${appName}.config.location"]) {
//    grails.config.locations << "file:" + System.properties["${appName}.config.location"]
// }

grails.app.context = "/"
grails.mime.file.extensions = true // enables the parsing of file extensions from URLs into the request format
grails.mime.use.accept.header = false
grails.mime.types = [ html: ['text/html','application/xhtml+xml'],
                      xml: ['text/xml', 'application/xml'],
                      text: 'text-plain',
                      js: 'text/javascript',
                      rss: 'application/rss+xml',
                      atom: 'application/atom+xml',
                      css: 'text/css',
                      csv: 'text/csv',
                      all: '*/*',
                      json: ['application/json','text/json'],
                      form: 'application/x-www-form-urlencoded',
                      multipartForm: 'multipart/form-data'
                    ]
// The default codec used to encode data with ${}
grails.views.default.codec="none" // none, html, base64
grails.views.gsp.encoding="UTF-8"
grails.converters.encoding="UTF-8"

// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true

// set per-environment serverURL stem for creating absolute links
environments {
    production {
        grails.serverURL = "http://www.blissbulletinen.se"
    }
    
    qa {
        grails.serverURL = "http://www-qa.blissbulletinen.se"
    }
}

// log4j configuration
log4j = {

  appenders {
        def dailyAppender = new DailyRollingFileAppender(name:'dailyAppender',
                                             datePattern: "'.'yyyy-MM-dd",
                                             file:'logs/blissbulletinen.log',
                                             layout:pattern(conversionPattern: '%d %-5p [%c] %m%n'))
        dailyAppender.threshold = Priority.INFO

        def smtpAppender = new SMTPAppender(name:'smtpAppender',
                                            to: 'asynclog@gmail.com',
                                            from: "no-reply@blissbulletinen.se",
                                            subject:"Problems with blissbulletinen",
                                            layout:pattern(conversionPattern: '%d %-5p [%c] %m%n'));
        smtpAppender.errorHandler = new OnlyOnceErrorHandler()
        smtpAppender.threshold = Priority.INFO

        console name:'stdout', layout:pattern(conversionPattern: '%d %-5p [%c] %m%n')
        appender dailyAppender
        appender smtpAppender

    }

    root {
      additivity = true
      info 'stdout','dailyAppender', 'smtpAppender'
    }

    debug 'se.blissbulletinen'

    error  'org.codehaus.groovy.grails.web.servlet',  //  controllers
	       'org.codehaus.groovy.grails.web.pages', //  GSP
	       'org.codehaus.groovy.grails.web.sitemesh', //  layouts
	       'org.codehaus.groovy.grails."web.mapping.filter', // URL mapping
	       'org.codehaus.groovy.grails."web.mapping', // URL mapping
	       'org.codehaus.groovy.grails.commons', // core / classloading
	       'org.codehaus.groovy.grails.plugins', // plugins
	       'org.codehaus.groovy.grails.orm.hibernate', // hibernate integration
	       'org.springframework',
	       'org.hibernate'

    warn   'org.mortbay.log'
}


     

//log4j.logger.org.springframework.security='off,stdout'


grails.plugin.databasemigration.updateOnStart = true
grails.plugin.databasemigration.updateOnStartFileNames = ["changelog.groovy"]
