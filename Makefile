pkname=myapp2
#projectDir=/home/alex/AndroidStudioProjects/${pkname}
projectDir=`pwd`/../../${pkname}

package=com.example.${pkname}
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

test:
	@echo ${projectDir}	
