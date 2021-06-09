#!/bin/bash
TIME=`date +%b-%d-%y`
FILENAME=backup-rstudio-$TIME.tar.gz  					#nombre del archivo
SRCDIR=/home/rstudio-user/R/x86_64-pc-linux-gnu-library/3.4     	#directorio donde se encuentra el archivo a backapear
DESDIR=/home/rstudio-user/backup-rstudio		        	# directorio de destino del archivo ya comprimido
tar -cpzf $DESDIR/$FILENAME $SRCDIR					#compresion del archivo
gsutil cp -r /home/rstudio-user/backup-rstudio gs://rstudio-backup	#comando en gcloud para enviar a un bucket el archivo
rm /home/rstudio-user/backup-rstudio/$FILENAME				#elimina el archivo que se genero dentro de la carpeta que ya se envio
