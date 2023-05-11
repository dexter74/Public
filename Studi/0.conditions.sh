#################################################################
# Script de configuration des machines complets avec conditions #
#################################################################
MODULE_ENVIRONNEMENT=2


#######################################
# Module 1: Variables d'environnement #
#######################################
##########################
# Activation des modules #
##########################
if [ $MODULE_ENVIRONNEMENT = "0" ]
 then
  echo "Code retour = $?"
elif [ $MODULE_ENVIRONNEMENT = "1" ]
 then
  echo "Code retour = $?"
elif [ $MODULE_ENVIRONNEMENT = "2" ]
 then
  echo "Code retour = $?"
else
	echo "Fin du script"	
fi
#######################################
