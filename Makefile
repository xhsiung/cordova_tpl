pkname=myapp3
package=com.example.${pkname}

#projectDir=/home/alex/AndroidStudioProjects/${pkname}
projectDir=`pwd`/../../${pkname}

#replace axsoho.com to axsoho/com
pkgdomain=$(subst .,/,$(package))


libs=${projectDir}/app/libs
mainDir=${projectDir}/app/src/main
xml=${projectDir}/app/src/main/res/xml

install:
	cp -a libs/* ${libs}/
	cat app/MainActivity.kt | sed -e "s/PKGNAME/${package}/g" >  ${mainDir}/java/${pkgdomain}/MainActivity.kt
	cat app/WeChat.kt | sed -e "s/PKGNAME/${package}/g" >  ${mainDir}/java/${pkgdomain}/WeChat.kt
	cat app/AndroidManifest.xml | sed -e "s/PKGNAME/${package}/g" > ${mainDir}/AndroidManifest.xml
	mkdir -p ${xml}
	cat xml/config.xml | sed -e "s/PKGNAME/${package}/g" > ${xml}/config.xml
	
	cp -a assets ${mainDir}
	rm -rf ${mainDir}/assets/www/plugins/* ; mkdir -p ${mainDir}/assets/www/plugins/${package}
	cat assets/www/cordova_plugins.js | sed -e "s/PKGNAME/${package}/g" > ${mainDir}/assets/www/cordova_plugins.js
	cat assets/www/plugins/axsoho.com.wechat/wechat.js | sed -e "s/PKGNAME/${package}/g" > ${mainDir}/assets/www/plugins/${package}/wechat.js

	@echo done

plugin:
	./build-cordova-plugin.py com.axsoho.hello.Hello greet

test:
	@echo ${projectDir}	
