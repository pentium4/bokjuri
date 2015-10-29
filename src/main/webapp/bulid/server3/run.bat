"C:\Program Files\Apache Software Foundation\Tomcat 7.0\bin\Tomcat7.exe" stop
copy /Y C:\lionsclub\web\bulid\server3\globals.properties C:\lionsclub\web\WEB-INF\classes\egovframework\egovProps
copy /Y C:\lionsclub\web\bulid\server3\log4j.xml C:\lionsclub\web\WEB-INF\classes
"C:\Program Files\Apache Software Foundation\Tomcat 7.0\bin\Tomcat7.exe" start