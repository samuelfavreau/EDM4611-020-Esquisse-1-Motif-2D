# EDM4611-020 - Esquisse 1 - Motif 2D

Projet réalisé à l'aide de **Processing 3.5.4**.

--

![texture-0001](https://user-images.githubusercontent.com/48024730/134047339-143531ee-68ab-4029-b33e-5c8b14fe4254.png)

--

Cette esquisse a pour but de générer automatiquement un motif pouvant s'apparenter à un morceau de tissu.

Ce motif est généré à l'aide de fonctions dessinant chacune une forme distincte. Chacune des formes est réalisée à l'aide de formes géométriques simples, positionnées les unes par-dessus les autres et répétées de façon radiale autour d'un point central à l'aide de transformateurs géométriques de rotation et de translation.

Ces formes sont ensuite répétées sous forme de matrice 2D à l'aide de deux boucles itératives imbriquées leur permettant d'être dessinés sur l'entièreté du canevas. Noter que la boucle itérative contient une condition vérifiant l'index de la forme dans la matrice afin de remplacer cette dernière par un point si la valeur de l'index est un nombre impair.

Des effets de textures sont ensuite ajoutés suite au positionnement des diverses formes afin de donner l'illusion que le motif se trouve sur une surface similaire à du jeans.
Le premier effet de texture consiste en des lignes diagonales alternant entre la transparence totale et le noir translucide se répétant sur l'entièreté du canevas.
Le second effet de texture consiste en un effet de grain créé à l'aide de l'objet PImage de processing dans lequel une matrice de points translucides de couleurs noir et blanc de la taille du canevas est créée et placée par-dessus le reste des éléments.

Tous les éléments de formes et de textures peuvent obtenir de nouvelles valeurs de tailles et de rotation lors d'un clic de souris. La taille des formes est choisie aléatoirement selon une plage de valeurs prédéterminée. Noter que les valeurs de taille des formes sont inversement proportionnelles les unes par rapport aux autres (la forme A apparaitra grande lorsque la forme B apparaitra petite et vice-versa). Leur rotation est choisie aléatoirement selon 2 états conservant la symétrie des formes. Pour ce qui est de la texture, les lignes diagonales subissent une modification d'angle et d'épaisseur causés par le transformateur géométrique de taille et tous les points de la matrice du grain obtiennent une nouvelle valeur de couleur monochrome.

--

Il est possible de sauvegarder une image au format PNG du motif généré en appuyant sur la barre d'espacement du clavier. Les images seront enregistrées dans un dossier nommé "frame" suivi de la date et de l'heure de l'ouverture du programme, permettant ainsi la possibilité de sauvegarder plusieurs images à différents moments sans écrasé les images antérieures.
