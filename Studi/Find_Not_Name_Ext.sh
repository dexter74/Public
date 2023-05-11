#####################################################################################
# Script permettant de recherche des fichiers ne portant pas les extensions choisis #
# > sh Find_Not_Name_Ext.sh /volume1/Disk1/ rar txt docx ....                       #
#####################################################################################

# html html css asp aspx json xml vbs ico browser webp py cfg  config
# ini exe msi bat sh SH cmd dll DLL lnk adm adml inf sys rtl nls drv acm tlb cpl list dic aff map tasks
# mp4
# 
# txt TXT docx DOCX xlsx XLSX rtf RTF dat DAT iso ISO KEY pl com artx psd pdf reg targets rsp mdb xsd props vxd ocx
# jpg JPG png PNG gif GIF bmp jfif themepack webp logonxp cop cof cot cocatalogdb 
# rar RAR zip ZIP 7z 7ZIP cab xz gz
# zst raw qcow2 lzo EFI mbr bak
# tmp log db ldb LST rbp nc tcl msg lng mnu url c32 info xpi

# sh test.sh /volume1/Disk1 
# sh test.sh /share/USB1-2

# Nettoyage de la console :
clear ;

# Déclaration de variable
DESTINATION=$1

# Lancement de la recherche des fichiers avec exclusions d'extension.
find $DESTINATION \
-type f \
-not -type d \
-not -name "*.$2" \
-not -name "*.$3" \
-not -name "*.$4" \
-not -name "*.$5" \
-not -name "*.$6" \
-not -name "*.$7" \
-not -name "*.$8" \
-not -name "*.$9" \
-not -name "*.$10" \
-not -name "*.$11" \
-not -name "*.$12" \
-not -name "*.$13" \
-not -name "*.$14" \
-not -name "*.$15" \
-not -name "*.$16" \
-not -name "*.$17" \
-not -name "*.$18" \
-not -name "*.$19" \
-not -name "*.$20" \
-not -name "*.$21" \
-not -name "*.$22" \
-not -name "*.$23" \
-not -name "*.$24" \
-not -name "*.$25" \
-not -name "*.$26" \
-not -name "*.$27" \
-not -name "*.$28" \
-not -name "*.$29" \
-not -name "*.$30" \
-not -name "*.$31" \
-not -name "*.$32" \
-not -name "*.$33" \
-not -name "*.$34" \
-not -name "*.$35" \
-not -name "*.$36" \
-not -name "*.$37" \
-not -name "*.$38" \
-not -name "*.$38" \
-not -name "*.$40" \
-not -name "*.$41" \
-not -name "*.$42" \
-not -name "*.$43" \
-not -name "*.$44" \
-not -name "*.$45" \
-not -name "*.$46" \
-not -name "*.$47" \
-not -name "*.$48" \
-not -name "*.$49" \
-not -name "*.$50" \
-not -name "*.$51" \
-not -name "*.$52" \
-not -name "*.$53" \
-not -name "*.$54" \
-not -name "*.$55" \
-not -name "*.$56" \
-not -name "*.$57" \
-not -name "*.$58" \
-not -name "*.$60" \
-not -name "*.$61" \
-not -name "*.$62" \
-not -name "*.$63" \
-not -name "*.$64" \
-not -name "*.$65" \
-not -name "*.$66" \
-not -name "*.$67" \
-not -name "*.$68" \
-not -name "*.$69" \
-not -name "*.$70" \
-not -name "*.$71" \
-not -name "*.$72" \
-not -name "*.$73" \
-not -name "*.$74" \
-not -name "*.$75" \
-not -name "*.$76" \
-not -name "*.$77" \
-not -name "*.$78" \
-not -name "*.$79" \
-not -name "*.$80" \
-not -name "*.$81" \
-not -name "*.$82" \
-not -name "*.$82" \
-not -name "*.$83" \
-not -name "*.$84" \
-not -name "*.$85" \
-not -name "*.$86" \
-not -name "*.$87" \
-not -name "*.$88" \
-not -name "*.$89" \
-not -name "*.$90" \
