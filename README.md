# Création d'un Dockerfile simple

## Pour lancer le projet en local

Il vous faut **NodeJS 20**.

```
npm i
npm run start
```

ou pour développer avec hot reload :

```
npm run develop
```

L'application web possède une unique route `\` qui retourne un JSON avec des résultats de tests.

## Variables d'environnement 

* **PORT** Port d'écoute de l'application web
* **REDIS_HOST** Host de la base de données Redis
* **REDIS_PORT** Port de la base de donnée Redis
* **MYSQL_HOST** Host de la base de données MySQL
* **MYSQL_PORT** Port de la base de données MySQL
* **MYSQL_DB** Nom de la base de données MySQL
* **MYSQL_USERNAME** Nom d'utilisateur pour la base de données MySQL
* **MYSQL_PASSWORD** Mot de passe de l'utilisateur pour la base de données MySQL
* **FILE_PATH_TO_CHECK** Chemin du fichier dont la présence est à contrôler

## Créer un Dockerfile pour cette application Typescript

Il s'agit d'une application web basique réalisée en Typescript avec Express.

* Vous devez **créer le Dockerfile** et **build l'image** pour lancer cette application.

Vous devez optimiser votre image pour que l'étape d'installation des dépendances soit supprimée du cache **seulement si** vous modifiez le contenu du fichier `package.json` ou `package-lock.json`.

L'image doit comporter **trois** stages :
* build
* development
* production

L'image doit être la plus petite possible en taille pour le stage de production.

## Configuration du container

Une fois l'image créée vous pouvez découvrir les différents arguments disponibles pour créer et lancer un conteneur.

* Vous devez lancer votre image afin d'accéder à l'application web **depuis votre navigateur sur votre hôte**.

* Vous devez modifier la variable d'environnement `PORT` pour lancer le conteneur de l'application web avec le port **1337** à l'écoute.

* Vous devez modifier le hostname de votre conteneur pour le faire correspondre à : **mydocker**.

## Création d'un docker compose

Il faut pouvoir faire passer toutes les propriétés à **OK**, pour cela il faut utiliser docker compose pour lancer :
* Une base de données MySQL
* Une base de données Redis
* L'application web

Il faut aussi **faire en sorte que le hot reload fonctionne pour l'application web avec docker compose**.

Il faut utiliser un volume pour les données de la base MySQL.