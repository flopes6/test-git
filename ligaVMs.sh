#!/bin/sh
# Versao 2: liga as VMs que tiverem 'AutoStart: sim' e que não contenha .DRP no nome
log='/tmp/ligaVMs.log'
diretorioLogRotacionado='/vmfs/volumes/pocesxi07.pocdatastore1/Scripts/Logs/'
arquivoLogRotacionado='ligaVMs.log.'`date +%Y%m%d-%H%M%S`
logRotacionado=${diretorioLogRotacionado}${arquivoLogRotacionado}

data=$(date '+%d/%m/%Y')
hora=$(date +%r)
echo "<INICIO###"$data"###"$hora">" > $log

mode=`esxcli system maintenanceMode get`
if [ "$mode" = "Enabled" ]; then
        esxcli system maintenanceMode set -e false -t 0
fi

#domainControllersVirtuais=`vim-cmd vmsvc/getallvms | sed '1d' | awk '{if ($1 > 0) print  $1"!"$2"!"$7$8}' | grep wdc | grep -v .DRP`
domainControllersVirtuais=`vim-cmd vmsvc/getallvms | sed '1d' | awk '{if ($1 > 0) print  $1"!"$2"!"$7$8}' | grep 07P | grep -v .DRP`
for domainControllerVirtual in $domainControllersVirtuais
do
	idDomainControllerVirtual=`echo $domainControllerVirtual | cut -f1 -d'!'`
	nomeDomainControllerVirtual=`echo $domainControllerVirtual | cut -f2 -d'!'`
	autoStartDomainControllerVirtual=`echo $domainControllerVirtual | cut -f3 -d'!'`
	vim-cmd vmsvc/power.getstate $idDomainControllerVirtual | grep -i "off" > /dev/null 2<&1
	status=$?
	if [ "$autoStartDomainControllerVirtual" = "AutoStart:sim" ]; then
		if [ $status -eq 0 ]; then
			echo "Inicializando controlador de dominio ID $idDomainControllerVirtual..."
			data=$(date '+%d/%m/%Y')
			hora=$(date +%r)
			vim-cmd vmsvc/power.on $idDomainControllerVirtual
			echo "<"$nomeDomainControllerVirtual"###"$data"###"$hora">" >> $log
			echo "Aguardando inicializacao do controlador de dominio..."
			sleep 60
		fi
	fi
done

servidoresVirtuais=`vim-cmd vmsvc/getallvms | sed '1d' | awk '{if ($1 > 0) print  $1"!"$2"!"$7$8}' | grep -v .DRP`
for servidorVirtual in $servidoresVirtuais
do
	idServidorVirtual=`echo $servidorVirtual | cut -f1 -d'!'`
	nomeServidorVirtual=`echo $servidorVirtual | cut -f2 -d'!'`
	autoStartServidorVirtual=`echo $servidorVirtual | cut -f3 -d'!'`
	vim-cmd vmsvc/power.getstate $idServidorVirtual | grep -i "off" > /dev/null 2<&1
	status=$?
	if [ "$autoStartServidorVirtual" = "AutoStart:sim" ]; then
		if [ $status -eq 0 ]; then
			echo "Inicializando servidor virtual ID $idServidorVirtual..."
			data=$(date '+%d/%m/%Y')
			hora=$(date +%r)
			vim-cmd vmsvc/power.on $idServidorVirtual
			echo "<"$nomeServidorVirtual"###"$data"###"$hora">" >> $log
		fi
	fi
done
data=$(date '+%d/%m/%Y')
hora=$(date +%r)
echo "<FIM###"$data"###"$hora">" >> $log

cp $log $logRotacionado
find $diretorioLogRotacionado -mtime +10 -exec rm -f {} \;

cd /var/spool/snmp && for i in $(ls | grep trp); do rm -f $i;done
