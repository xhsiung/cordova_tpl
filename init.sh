#!/bin/bash

pkname=myapp2
package=com.example.$pkname
pkgdomain=`echo $package|sed 's/\./\//g'`

projectDir=/home/alex/AndroidStudioProjects/$pkname

libs=$projectDir/app/libs
mainDir=$projectDir/app/src/main
xml=$projectDir/app/src/main/res/xml

echo wait
cp -a libs/* $libs/
cp -a assets $mainDir
cp -a  app/MainActivity.kt      $mainDir/java/$pkgdomain/

cp -a  app/AndroidManifest.xml  $mainDir/
cat app/AndroidManifest.xml | sed -e "s/PKGNAME/$package/g" > $mainDir/AndroidManifest.xml


mkdir -p $xml
cat xml/config.xml | sed -e "s/PKGNAME/$package/g" > $xml/config.xml


echo done
