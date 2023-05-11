#!/bin/bash
##############################################################################################
# Script de lancement avec des paramètres qui conditionne les actions                        #
#                                                                                            #
# Guide d'utilisation:                                                                       #
# - Commande 1:   sh Condition_if_else__OR_parametre.sh <NULL> (Le Paramètre 1 est Vide")    #
# - Commande 2:   sh Condition_if_else__OR_parametre.sh A      (Le Paramètre 1 est sur A)    #
# - Commande 2:   sh Condition_if_else__OR_parametre.sh B      (Le Paramètre 1 est sur B)    #
# - Commande 3:   sh Condition_if_else__OR_parametre.sh TEST   (Le Paramètre 1 est sur TEST) #
#                                                                                            #
##############################################################################################
#
# Nettoyage de la console
clear ;
#
##########################################################################
# SI le paramètre 1 est sur <NULL> alors #
##########################################
if [ -z $1 ]
 then
  echo "Le Paramètre 1 est Vide"

##########################################################################
 # Sinon le paramètre 1 est sur A alors #
 ########################################
 elif [ $1 = "A" ]
  then
   echo "Le Paramètre 1 est sur A"
 ##########################################################################
 # Sinon le paramètre 1 est sur B alors #
 ########################################
 elif [ $1 = "B" ]
  then
   echo "Le Paramètre 1 est sur B"
   
 ##########################################################################
 # Sinon le paramètre 1 est différent de A ou B #
 ################################################
 elif [ $1 != "A" ] | [ $1 != "B" ]
  then
   echo "Le Paramètre 1 est sur %1"
fi
##########################################################################
