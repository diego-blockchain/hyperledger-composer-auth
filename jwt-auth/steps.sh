#!/bin/bash

#base on:
#https://www.codementor.io/gangachris125/passport-jwt-authentication-for-hyperledger-composer-rest-server-jqfgkoljn

#import postman requests from:
#https://www.getpostman.com/collections/49118afffd8a886c2078

#create & install bna in the network
composer archive create -t dir -n .
composer network install --card PeerAdmin@hlfv1 --archiveFile tutorial-network@0.0.1.bna
composer network start --networkName tutorial-network --networkVersion 0.0.1 --networkAdmin admin --networkAdminEnrollSecret adminpw --card PeerAdmin@hlfv1 --file networkadmin.card

#setup identity
composer card import --file myproject.card
composer network ping --card admin@myproject

#start from cli in global
#composer-rest-server -c admin@tutorial-network -n always -a true -m true -w true

#create a participant
source participant.txt
composer participant add -c admin@tutorial-network  -d "$participantData";
composer identity issue -c admin@tutorial-network -f gangachris.card -u $participantId -a "resource:${PARTICIPANT_CLASS}#${participantId}" -x true

