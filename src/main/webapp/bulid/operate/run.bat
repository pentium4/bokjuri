"D:\lionsclub\Tomcat 7.0\bin\Tomcat7.exe" stop
copy /Y D:\lionsclub\web\bulid\operate\globals.properties D:\lionsclub\web\WEB-INF\classes\egovframework\egovProps
copy /Y D:\lionsclub\web\bulid\operate\log4j.xml D:\lionsclub\web\WEB-INF\classes
"D:\lionsclub\Tomcat 7.0\bin\Tomcat7.exe" start