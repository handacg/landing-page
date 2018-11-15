# 📩 Landing pages & growth hacking pour THP 📩

### 🍻 Présentation de l'équipe 🍻
Projet THP réalisé avec :heart: par Handa, Hugo & Damien. 

### 💻 Présentation du projet 💻
Les objectifs de l'application sont de
1- faire la promotion de THP auprès de différents publics et via plusieurs canaux
2- présenter une landing page adaptée à chaque public
3- obtenir leur email pour envoyer la newsletter THP
4- tracker l'attitude des visiteurs de notre site et analyser les résultats

Pour chaque objectif, voici ce que nous avons obtenu :
1- deux moyens d'obtenir des nouveaux clients : scrap d'emails pour faire une campagne et bot twitter pour envoyer un message 
2- trois landing pages créées, pour nos publics : maires, étudiants, expatriés
3- intégration via Mailchimp : form via html et connection à l'API réussie, mais pas de connexion directe du form à l'API - campagne envoyée automatiquement pour toute nouvelle subscription
4- tracking fait via google analytics

### Comment utiliser l'app
En local :
* Download or clone repo
* Run a little `bundle install`
* Run `rails db:create`and `rails db:migrate` 

Pour faire des actions précises :
- obtenir plus d'emails via le scrap : en local, aller dans app/services/scrap_mairie.rb, modifier la page du département et lancer le scrap avec la commande `ScrapMairie.new.perform` 
- utiliser le bot twitter pour toucher de nouveaux publics : remplir ses twitter APIkeys et run la commande une des commandes `TwitterLead.new.perform('mairie')` `TwitterLead.new.perform('etudiant')` `TwitterLead.new.perform('expatries')`
- lancer une nouvelle campagne mailchimp : se connecter via ses APIkeys et créer une nouvelle campagne
- tracker l'activité via le compte Google analytics

### Lien du site en production sur Heroku
https://decouvre-thp.herokuapp.com/
