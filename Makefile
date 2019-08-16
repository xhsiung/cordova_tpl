pkname=myapp2
#projectDir=/home/alex/AndroidStudioProjects/${pkname}
projectDir=`pwd`/${pkname}

package=com.example.${pkname}
#pkgdomain= $(package: ?.=/ )
pkgdomain=$(subst .,/,$(package))


libs=${projectDir}/app/libs
mainDir=${projectDir}/app/src/main
xml=${projectDir}/app/src/main/res/xml

install:
	cp -a libs/* ${libs}/
	cp -a assets ${mainDir}
	cat app/MainActivity.kt | sed -e "s/PKGNAME/${package}/g" >  ${mainDir}/java/${pkgdomain}/MainActivity.kt
	cat app/AndroidManifest.xml | sed -e "s/PKGNAME/${package}/g" > ${mainDir}/AndroidManifest.xml
	mkdir -p ${xml}
	cat xml/config.xml | sed -e "s/PKGNAME/${package}/g" > ${xml}/config.xml
	@echo done

test:
	@echo ${projectDir}	
