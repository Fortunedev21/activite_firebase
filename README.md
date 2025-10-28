# 📰 Application de Gestion des Rédacteurs – Magazine Infos

## 📱 Description du projet
Cette application **Flutter** permet la **gestion des rédacteurs** d’un magazine numérique intitulé *Magazine Infos*.  
Elle a été développée dans le cadre du **cours de Développement Mobile (Niveau approfondi)** — *Activité n°3 : Gestion des rédacteurs pour Magazine Infos*.

L’objectif de cette activité est d’ajouter un module complet de **gestion des rédacteurs** à l’application existante, en intégrant **Firebase Firestore** pour le stockage des données en temps réel.

---

## 🎯 Objectifs pédagogiques
À la fin de cette activité, vous serez capable de :
- Créer et configurer un **projet Firebase**.
- Créer et manipuler une **base de données Firestore**.
- Configurer un projet **Flutter pour Firebase (Android)**.
- Réaliser des opérations **CRUD (Create, Read, Update, Delete)** sur Firestore.
- Utiliser différents **widgets Flutter** pour créer une interface intuitive et réactive.

---

## ⚙️ Fonctionnalités principales

### 🏠 Page d’accueil
- Affiche le **titre du magazine**, une **image de couverture**, et une **brève description**.
- Contient un **menu de navigation (Drawer)** avec deux options principales :
  - **Ajouter un rédacteur**
  - **Informations des rédacteurs**

### ➕ Ajouter un rédacteur
- Formulaire permettant d’ajouter un nouveau rédacteur avec :
  - Nom ✍️  
  - Spécialité 🧠  
- Enregistre les informations dans Firestore.
- Affiche une boîte de dialogue de succès à la fin de l’ajout.

### 📋 Informations des rédacteurs
- Affiche la **liste complète des rédacteurs** depuis Firestore via un `StreamBuilder`.
- Chaque rédacteur est affiché dans une **carte (Card)** avec :
  - Nom
  - Spécialité
  - Boutons **Modifier** ✏️ et **Supprimer** 🗑️

### 🗑️ Suppression d’un rédacteur
- Affiche une **page de confirmation** avant suppression.
- Supprime le rédacteur de Firestore après validation.
- Affiche une boîte de dialogue confirmant la suppression réussie.

### ✏️ Modification d’un rédacteur
- Permet de **modifier le nom ou la spécialité** d’un rédacteur existant.
- Met à jour les données correspondantes dans Firestore.
- Affiche une boîte de dialogue confirmant la mise à jour.

---

## 🧩 Structure du projet

```

lib/
│
├── main.dart                  # Point d'entrée de l'application
├── page_accueil.dart          # Page principale avec le Drawer
├── ajout_redacteur.dart       # Page pour ajouter un rédacteur
├── redacteur_info.dart        # Page pour afficher les rédacteurs
├── modifier_redacteur.dart    # Page pour modifier un rédacteur
└── supprimer_redacteur.dart   # Page de confirmation de suppression

````

---

## 🔥 Technologies utilisées
- **Flutter** (Framework mobile multiplateforme)
- **Firebase Firestore** (Base de données NoSQL en temps réel)
- **Firebase Core** (Initialisation et configuration Firebase)
- **Dart** (Langage principal)

---

## 🛠️ Installation et configuration

### 1️⃣ Cloner le dépôt

```bash
git clone https://github.com/Fortunedev21/activite_firebase.git
cd activite_firebase
````

---

### 2️⃣ Installer les dépendances Flutter

```bash
flutter pub get
```

Cela installe toutes les dépendances nécessaires (firebase_core, cloud_firestore, etc.).

---

### 3️⃣ Créer le projet Firebase

1. Allez sur **[Firebase Console](https://console.firebase.google.com)**
2. Cliquez sur **“Ajouter un projet”** et nommez-le `activitefirebase`.
3. Cliquez sur **“Ajouter une application Android”**.
4. Entrez votre **Application ID** (visible dans `android/app/build.gradle`, ligne `applicationId`).
5. Téléchargez le fichier **google-services.json**.
6. Copiez ce fichier dans le dossier suivant :

   ```
   android/app/
   ```

---

### 4️⃣ Configurer Firebase dans Android

#### Fichier : `android/build.gradle`

Ajoutez dans la section `dependencies` :

```gradle
classpath 'com.google.gms:google-services:4.4.2'
```

#### Fichier : `android/app/build.gradle`

Ajoutez à la fin du fichier :

```gradle
apply plugin: 'com.google.gms.google-services'
```

Et assurez-vous que :

```gradle
defaultConfig {
    minSdkVersion 23
}
```

---

### 5️⃣ Nettoyer et relancer le projet

```bash
flutter clean
flutter pub get
```

---

### 6️⃣ Lancer l’application

#### ▶️ Sur un émulateur Android

1. Lancez un **émulateur Android** via Android Studio.
2. Exécutez la commande suivante :

   ```bash
   flutter run
   ```

#### 📱 Sur un téléphone physique

1. Activez le **mode développeur** et le **débogage USB**.
2. Branchez le téléphone à l’ordinateur.
3. Exécutez :

   ```bash
   flutter run
   ```

---

## 🚀 Utilisation

Une fois l’application lancée, vous verrez :

* **La page d’accueil** avec le titre et les informations du magazine.
* Le **menu Drawer** contenant :

  * "Ajouter un rédacteur"
  * "Informations des rédacteurs"

Vous pouvez :

* Ajouter de nouveaux rédacteurs.
* Consulter la liste des rédacteurs.
* Modifier ou supprimer leurs informations.

Toutes les données sont sauvegardées et mises à jour **en temps réel** dans **Firebase Firestore**.

---

## 🧰 Dépannage courant

| Problème                                                         | Cause probable                               | Solution                                                                        |
| ---------------------------------------------------------------- | -------------------------------------------- | ------------------------------------------------------------------------------- |
| ❌ `Unable to resolve host firestore.googleapis.com`              | Connexion Internet inactive dans l’émulateur | Ouvrir Chrome dans l’émulateur pour tester la connexion                         |
| ⚠️ `uses-sdk:minSdkVersion 21 cannot be smaller than version 23` | SDK trop bas                                 | Modifier `minSdkVersion` à 23 dans `android/app/build.gradle`                   |
| 🔥 `Firebase not initialized`                                    | Oubli de l’initialisation de Firebase        | Vérifier que `await Firebase.initializeApp()` est présent dans `main.dart`      |
| ⚙️ `google-services.json missing`                                | Fichier Firebase manquant                    | Télécharger le fichier depuis Firebase Console et le placer dans `android/app/` |

---

## 👨‍💻 Auteur

Projet réalisé par **Fortuné AÏOUNOU**
Dans le cadre du **cours de Développement Mobile – Niveau approfondi (Activité 3)**
Encadré par : *M. Farouk SABIOU*

---

## 📜 Licence

Ce projet est développé à des fins **pédagogiques** et peut être librement consulté et modifié à des fins d’apprentissage.

