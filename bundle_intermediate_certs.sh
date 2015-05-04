#!/bin/bash

while getopts "p:i:" OPTION
do
 case $OPTION in
   p)
     PFX=$OPTARG
     ;;
   i)
     INTERMEDIATE=$OPTARG
     ;;
 esac
done

if [[ -z $PFX ]] || [[ -z $INTERMEDIATE ]]
then
  echo ""
  echo "  Pass the path to your PFX file with the -p flag and the path to your"
  echo "  intermediate certificate with the -i flag. This script will create a"
  echo "  PFX file using them saved in the current directory named \"full-chain.pfx\""
  echo ""
  exit 1
fi

echo "# Exporting key from source PFX"
openssl pkcs12 -in $PFX -out source.tmp.key -nocerts
echo "# Exporting certificate from source PFX"
openssl pkcs12 -in $PFX -out source.tmp.cer -nokeys
echo "# Bundling certificates into new PFX"
openssl pkcs12 -export -out full-chain.pfx -inkey source.tmp.key -in source.tmp.cer -certfile $INTERMEDIATE
echo "# Cleaning up unneeded exports"
rm source.tmp.key
rm source.tmp.cer
echo "# Your new PFX file is located at $PWD/full-chain.pfx"
