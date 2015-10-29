"C:\Program Files\Apache Software Foundation\Tomcat 7.0\bin\Tomcat7.exe" stop
copy /Y D:\lionsclub\web\bulid\server2\globals.properties D:\lionsclub\web\WEB-INF\classes\egovframework\egovProps
copy /Y D:\lionsclub\web\bulid\server2\log4j.xml D:\lionsclub\web\WEB-INF\classes
"C:\Program Files\Apache Software Foundation\Tomcat 7.0\bin\Tomcat7.exe" start