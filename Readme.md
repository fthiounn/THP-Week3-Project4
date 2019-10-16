THP - Week3 - Project 4 - Morpion !
François THIOUNN



Il est possible d'avoir des soucis avec la gem catfix et plus en particulier la gem imagemagick
Si c'est le cas il y a un quick fix pour mac

Si il est impossible de l'installer juste commenter la ligne 138 de game.rb

system 'catpix sources/pika.png'

Quick fix for RMagick:

mac os :
brew uninstall imagemagick
brew install imagemagick@6
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
brew link --force imagemagick@6
gem install rmagick





Description du projet :

Projet : Morpion
  
1. Introduction
Rien de tel que de coder un jeu pour solidifier ses bases en POO ! Nous allons donc créer un jeu de morpion, jeu hautement stratégique et follement passionnant s'il en est.

Pour ceux qui ne sont pas passé par la case morpion dans leur enfance (ou leur adolescence pour les moins hygiéniques), on vous précise 8 comportements attendus de la part du programme (par ordre d'importance) :

Le jeu ne se joue qu'à deux joueurs humains (on ne vous demande pas de coder d'intelligence artificielle aujourd'hui…);
Le programme doit commencer en demandant le prénom de chaque joueur ;
Le plateau de jeu est composé de 9 cases, chacune désignée par sa position verticale (A, B ou C) suivie de sa position horizontale (1, 2 ou 3). Exemples : la case en haut à droite s'appelle "A3" et celle en bas à droite "C3" ;
Au début de chaque tour de jeu, le programme affiche dans le terminal le plateau de jeu. Puis il demande au joueur dont c'est le tour où il souhaite jouer ;
Les joueurs jouent à tour de rôle jusqu'à que l'un d'eux gagne ou que le plateau de jeu soit rempli ;
Le programme doit détecter la fin de la partie. Si un joueur gagne, le jeu annonce son nom. S'il y a match nul, le programme doit en informer les deux joueurs ;
À la fin d'une partie, le programme doit proposer de lancer une nouvelle partie ;
Un effort sera à faire sur l'affichage du jeu dans le terminal (par ex : board affiché de façon stylée, compteur de parties, couleurs, etc.).
2. Le projet
On va pas te mentir : c'est un gros morceau auquel tu vas t'attaquer aujourd'hui. Il y aura BEAUCOUP de méthodes à écrire et elles seront réparties en plein de classes. Mais comme d'habitude dans The Hacking Project, ce qui va te permettre de t'en sortir, c'est avant tout la collaboration. Tu vas donc réaliser ce projet en pair programming et surtout ne pas hésiter à demander de l'aide à la communauté quand tu sens que tu bloques plus de 20-30 minutes sur un point.

⚠ Fonctionnalités à implémenter ⚠ : la liste est longue et rares seront les groupes qui arriveront à proposer un Morpion avec l'ensemble des fonctionnalités. Si jamais une fonctionnalité te semble trop difficile à implémenter, fais l'impasse et tente d'en implémenter une autre. Ne reste pas bloqué au risque de ne rien produire : on préfère un morpion qui ne propose pas de nouvelle partie plutôt qu'un morpion qui ne marche pas !

Pour t'aider à adopter une approche intelligente face à ce projet complexe, on va tout d'abord te donner plusieurs astuces et méthodes de travail à suivre. Ensuite, en fonction du niveau de ton groupe de pair-programming, on va te donner des pistes pour démarrer le projet : à toi de voir si tu veux partir d'une feuille blanche, avoir quelques indices ou carrément partir d'un repo déjà structuré.

Dernières consignes : on veut un programme 100% en POO (tout dans des classes) mais sans base de données (pas de CSV / JSON ou autre).

2.1. Comment aborder ce projet ?
Tu es face à l'un des projets les plus complexes de THP : après 2 semaines intensives en Ruby, tu es au point culminant de ta formation dans ce langage ! Du coup, pour ne pas te perdre, il faut que tu procèdes par étapes. Et avant de passer à l'étape suivante, confirme bien que ce que tu viens de coder fonctionne comme tu le souhaites. Mieux vaut, en 20 minutes, écrire 1 méthode bien propre et sans bug que 3 méthodes bancales.

Première étape : se poser devant une feuille. Avant de coder, je t'invite à prendre une feuille et à essayer de décrire une partie de morpion. Identifie bien :

Quels objets physiques pourraient être codés en objets Ruby => Cela te donnera des pistes pour définir tes classes ;
Qu'est ce qui caractérise chaque objet de chaque classe identifiée (une couleur ? un nom ? un chiffre précis ?) => Cela te donnera des pistes pour définir les variables d'instance de chacune de tes classes ;
Quelles actions ces objets vont-ils subir ? Par exemple un joueur va passer du statut de "c'est ton tour" à "c'est le tour de l'autre", les cases vont se remplir, etc. => Cela te donnera des pistes de méthodes dont il va falloir définir la fonction précise et la classe qui l'hébergera ;
Liste de façon exhaustive les étapes d'une partie de morpion => Cela va t'aider à voir dans quel ordre les évènements doivent avoir lieu : on crée tel élément, on affiche ça, on modifie tel objet, etc.
À partir de la liste ci-dessus, essaye aussi d'identifier les endroits qui tournent en boucle (par exemple les joueurs qui remplissent le plateau à tour de rôle), ce qui change à chaque tour de boucle (quelle variable a changé au tour précédent ?) et les conditions qui font qu'on sort de la boucle (par exemple si tel élément arrive à telle valeur, on arrête la boucle) => Cela te permettra déjà d'identifier les endroits où tu vas coder des boucles for / each (nombre de tour défini à l'avance) ou while (nombre de tour variable – selon l'utilisateur notamment).
J'espère que tu vois l'importance de cette première étape !! Si tu la pousses bien à fond, tu en sortiras avec une idée des classes, des variables d'instances, des méthodes, de leur ordre d'exécution et même des boucles à mettre en place. T'as 90 % de l'architecture de ton programme là !

Deuxième étape : se lancer en attaquant un petit morceau du problème. Maintenant que tu as une vision globale du problème, il faut s'y attaquer morceau par morceau. Je te conseille, dans ce cas, de le faire de façon chronologique : quelle est la première chose que ton programme va faire en se lançant ? => Demander aux 2 joueurs leurs prénoms. Code cette partie-là (affichage de la question, récupération du gets.chomp, sauvegarde dans un objet Player) et teste-la. Si tout se passe bien, passe à la suite.

Troisième étape : attaquer un nouveau petit morceau du problème et ainsi de suite. On pourrait imaginer les morceaux suivants à faire, dans l'ordre :

afficher un plateau vide ;
demander à un joueur ce qu'il veut faire ;
en fonction de sa réponse remplir une case (d'abord sauver l'information dans un objet puis afficher le plateau modifié dans le terminal);
prendre en compte quelques cas particuliers : la saisie du joueur ne correspond pas à une case, le joueur choisit une case déjà occupée, etc.
etc.
Avance ainsi morceau par morceau, nouvelle fonctionnalité par nouvelle fonctionnalité. Et ne passe jamais à la suivante sans avoir pu vérifier que la fonctionnalité que tu codes marche bien comme souhaité. Cette règle s'appliquera toute ta vie de développeur, c'est même sur ce genre de principes que la méthode agile, appliquée par de nombreuses start-ups, est basée. On avance par incrément.

Quelques astuces en vrac :

Sur un projet aussi complexe, rappelle-toi, plus que jamais, qu'il faut nommer de façon explicite tes méthodes et variables. Sinon tu vas t'y perdre ! N'hésite pas notamment à identifier un array avec truc_array ou un hash avec truc_hash.
Pour faire ta view, tu vas faire tout plein de puts pour afficher le plateau de jeu sur le terminal. Pour éviter d'avoir des lignes affreusement longues du genre puts "-----------", sache que tu peux les remplacer par puts "-" * 30.
Pour un rendu sympa sur la view, sache que system "clear" or system "cls" te permet de vider l'écran de ton terminal.
Bonus (/!\ surtout ne passe pas du temps là-dessus avant d'avoir tout fini) : la gem "colorize" peut te permettre de rajouter des couleurs sur les puts de ton terminal. De même, sache que le terminal peut afficher des Émojis…
2.2. Pistes pour te lancer
Ce n'est jamais facile de devoir faire un programme en partant de rien. Voici donc des indices qui vont t'aiguiller selon ton niveau en code et tes ambitions :

2.2.1. Niveau "God mode"
Allez, vas-y sans filet et impressionne-nous ! 🤩

2.2.2. Niveau "on est chauds, on veut se creuser la tête"
Le programme va devoir comporter 6 classes.

4 classes qui correspondent à des objets qu'on va manipuler pour faire tourner le jeu :

Game : c'est le jeu. Elle initialise tout, lance une partie (qui se termine avec une victoire ou un nul), permet de jouer un tour, de chercher si la partie est finie, etc.
Player : ce sont les joueurs. Il doit y avoir 2 instances de cette classe lors d'une partie.
Board : c'est le plateau. Il doit y avoir une instance de cette classe lors d'une partie.
BoardCase : c'est une case. Il devrait y avoir 9 instances de cette classe lors d'une partie.
2 classes vont nous permettre d'organiser le programme :

Application : cette classe va nous permettre de lancer le jeu. Elle va faire une boucle infinie de parties (on joue tant que les joueurs veulent continuer) et lancer l'instanciation d'un Game.
Show : cette classe sera une sorte de view. Elle affichera l'état du plateau de jeu à un instant T.
2.2.3. Niveau "on veut réfléchir mais aide-nous un peu"
Commencez par reprendre les classes listées ci-dessus. Maintenant nous allons détailler un peu le rôle et le fonctionnement de chacune :

BoardCase : chacune des 9 instances de BoardCase correspond à l'état d'une case du plateau.
Variables d'instance : une Boardcase est définie par sa position (A1, B2, B3, etc.) et son contenu (Soit elle est vide, soit elle a comme valeur le string "x", soit elle a comme valeur le string "o").
Board : à l'initialisation du plateau, il doit instancier immédiatement 9 BoardCases (une par case).
Variables d'instance : le Board doit embarquer les 9 BoardCase du jeu afin de pouvoir les lire et les modifier facilement. Il faut les lui attribuer sous forme d'un array ou d'un hash. Aussi, il est utile de compter le nombre de coup joué pour identifier facilement si on arrive au 9ème coup sans vainqueur.
Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).
Player
Variables d'instance : un joueur a un nom (habile) et un symbole ("x" ou "o").
Game : cette classe s'occupe de gérer toute la partie. À l'initialisation elle crée 2 instances de Player, et 1 instance de Board.
Variables d'instance : tu peux lui rattacher les 2 players (sous forme d'un array), le Board, et des informations annexes comme "quel joueur doit jouer ?", "quel est le statut de la partie (en cours ? player1 a gagné ? etc.)", etc.
Méthodes : Game permet de jouer un tour (demande au joueur ce qu'il veut faire et rempli la case), s'occupe de finir la partie si un joueur a gagné et propose aux joueurs de faire une nouvelle partie ensuite.
2.2.4. Niveau "🎶 on est perduuuus 🎵"
On a pensé à vous, voici un début de programme que vous pouvez récupérer. Par simplicité, j'ai mis toutes les classes dans un même fichier, charge à vous de le redécouper en plusieurs fichiers.
J'ai indiqué le nom de plusieurs méthodes ainsi que pas mal d'indices en commentaires pour te guider. Bon courage !

3. Rendu attendu
Un repo GitHub par groupe de pair-programming (attention les loulous, chaque personne doit soumettre un lien GitHub avant minuit dans le formulaire ci-dessous sinon 💔).
Le programme doit respecter :

Les consignes de jeu données en introduction et au début de la parti 2. ;
L'architecture classique d'un projet Ruby (même si ça n'est pas un MVC) : 1 classe par fichier, un Gemfile, un dossier "lib", etc.
Un README propre présentant le projet et comment le lancer (merci pour les correcteurs !)
Les conventions classiques de Ruby sont à respecter, cela va sans dire.