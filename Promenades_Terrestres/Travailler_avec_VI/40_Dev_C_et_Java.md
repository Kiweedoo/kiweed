<sub>Statut : **EN_COURS** | Complexité : basique | Temps : 30mn | Mars 2018 |
Georges AKA Kiweed | Tested on Debian U</sub>


### Balade : Développer en C ou Java avec <code>vi</code>

#### <a name="sommaire">**Sommaire**</a>

##### &nbsp;&nbsp;&nbsp;[Objectifs](#objectifs)
##### &nbsp;&nbsp;&nbsp;[Contexte](#preambule)
##### &nbsp;&nbsp;&nbsp;[Installation de <code>ctags</code>](#ctags)
##### &nbsp;&nbsp;&nbsp;[Utilisation de <code>ctags</code>](#ctags_usage)
<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<code>ctags</code> et C : Hello World !](#ctags_c)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<code>ctags</code> et Java : Hello World !](#ctags_java)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Vérifier l'environnement pour <code>javac</code>](#javac)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Compiler et exécuter](#javarun)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Créer le fichier <code>tags</code>](#javatag)</sub>

##### &nbsp;&nbsp;&nbsp;[La minute HHGTTG : plonger dans les *inky depths*](#hhgttg)


## <a name="objectifs">Objectifs</a>

- [x] Installer et utiliser <code>ctags</code>

- [x] Utiliser les <code>tags</code> en C et en Java

##### Ce qu'on y apprend au passage...

- [x] Faire du Java... En ligne de commande

- [x] Construire proprement en C ou en Java

- [x] Prendre contact avec tout ce que cache <code>eclipse</code>... :alien:


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>


<br>

## <a name="preambule">Contexte</a>

<br>

Développer proprement impose de découper son projet principal en plusieurs
modules source.

Chaque module contenant les fonctions et/ou les classes et les méthodes qui lui
sont propres.

Ainsi, lorsqu'on est dans un source sur l'appel d'une fonction ou d'une méthode,
il est souvent intéressant de <b>se déplacer directement dans le fichier</b> qui
contient la définition de cette fonction ou méthode : **c'est ce que permettent
les <code>tags</code>**.

Exécuter la commande <code>ctags</code> pour un langage donné, sur un
répertoire donné, crée un fichier <code>tags</code> <b>contenant les définitions de
toutes les fonctions/classes/méthodes trouvées dans tous les sources de ce
répertoire et/ou sous-répertoires</b>.

Il suffit simplement d'éditer un source, de se placer sur le début de l'appel
d'une fonction ou d'une méthode, puis de faire <code>&lt;ctrl &#93;&gt;</code>
pour passer dans le fichier source qui contient la définition.

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

<br>


## <a name="ctags">Installation de <code>ctags</code></a>

Il suffit de taper la commande <code>ctags</code> pour savoir s'il faut
installer le paquet, ou non. Dans l'affirmative&nbsp;:

><pre>
> <b>sudo apt-get install exuberant-ctags -y</b>
></pre>

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

<br>

## <a name="ctags_usage">Utilisation de <code>ctags</code></a>

Les deux dossiers et leurs fichiers source sont dans <code>./ressources</code>.

### <a name="ctags_c"><code>ctags</code> et C : Hello World !</code> en C</a>

Créons un répertoire dédié au projet ; c'est essentiel pour Java, on applique la
même méthode pour le C.

Dans ce répertoire, nous développons trois fichiers source (dans le répertoire
<code>./ressources</code> du dépôt)&nbsp;:

- <code>saluer.c</code> : le module principal qui affiche 2 chaînes obtenues des
fonctions <code>debut()</code> et <code>fin()</code>.

- <code>debut.c</code> : contient la définition de <code>premiere_partie()</code>.

- <code>fin.c</code> : contient la définition de <code>seconde_partie()</code>.

- <code>public_fct.h</code> : contient les déclarations des fonctions publiques.
  Tous les modules qui l'incluent voient et peuvent invoquer ces fonctions.


Le dossier présente donc :

><pre>
>.
>├── C_Pkg_Saluer
>│   ├── debut.c
>│   ├── fin.c
>│   ├── public_fct.h
>│   └── saluer.c
></pre>

Pour compiler et obtenir l'exécutable du même nom que le projet :

><pre>
> cc debut.c saluer.c fin.c -o saluer
></pre>

Il n'y a pas d'ordre dans la ligne de commande.

L'option <code>-o</code> (*object*) permet de nommer l'exécutable obtenu ;
sinon, par défaut, tous les exécutables produits sont nommés <code>a.out</code>.
<sub>Tu pourras lire <code>cc</code> ou <code>gcc</code>... C'est pareil... Même
punition qu'avec <code>vi</code> et <code>vim</code> (<code>type cc</code>, puis
<code>ls -l resultat</code>, etc.)</sub>


Pour l'exécuter :

><pre>
> ./saluer
> Hello world !
></pre>

Créer le fichier <code>tags</code> des définitions, <b>dans le dossier principal</b>&nbsp;:

><pre>
> ctags -R --langage-force=c --exclude=.git --exclude=log
></pre>

Pour obtenir :

><pre>
> .
>├── C_Pkg_Saluer
>│   ├── debut.c
>│   ├── fin.c
>│   ├── public_fct.h
>│   ├── saluer
>│   ├── saluer.c
>│   └── <b>tags</b>
></pre>

Pour utiliser le fichier <code>tags</code> :

- éditer un source, par exemple <code>saluer.c</code>

- se placer sur le début d'un appel de fonction, par exemple
  sur le <code>p</code> de <code>premiere_partie()</code>.

- taper <b><code>ctrl &#93;</code></b>, en mode commande, pour ouvrir 
<code>debut.c</code> et se placer en début de définition.

Pour revenir dans <code>saluer.c</code> sans avoir modifié :

><pre>
> <b>:e#</b>
></pre>

Ou <code>:w</code> avant, si modifications.

Ou encore, pour revenir <b>sans sauvegarder</b> les modifications :

><pre>
> <b>:e!#</b>
></pre>

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

<br>


### <a name="ctags_java"><code>ctags</code> et Java : Hello World !</code> en Java</a>


Pour utiliser pleinement les tags avec Java, et rester proche de l'exemple en C, 
il nous faut construire un <code>package</code>.

Rapidement, et pour faire simple, un <code>package</code>&nbsp;:

- crée un espace de nommage : détermine la visibilité entre les classes ou les
  interfaces obtenues après compilation (<code>public</code>, <code>private</code>, etc.)

- concrètement, c'est un répertoire. Ce concept est le même que lorsque tu as un
  dossier pour les photos, musiques, etc.

- dans notre cas, ce sera un dossier qui comprendra 3 sources&nbsp;:

  - <code>Saluer.java</code> : le fichier qui contient la classe principe
	(obligatoirement <code>public</code>, et donc <b>obligatoirement</b> du même
	nom que celui du fichier), et sa méthode <code>main</code>.
  - <code>Debut.java</code> : définissant la classe <code>Debut</code> et sa
	méthode <code>premiere_partie()</code>
  - <code>Fin.java</code> : définissant la classe <code>Fin</code> et sa
	méthode <code>seconde_partie()</code>

<br>

#### <a name="javac">Vérifier l'environnement pour <code>javac</code></a>

<br>

Pour compiler...&nbsp;:

D'abord vérifier que tu as bien <code>javac</code> en ligne de commande.

Le cas échéant, c'est que ta variable <code>PATH</code> ne contient pas le
chemin du répertoire <code>bin</code> de la <code>jvm</code> (*java virtual
machine*). 

Ici tout est ok, mais je ne me souviens plus si on a installé
uniquement <code>eclipse</code> ou le <code>Java 9</code> avant... 
Trace... Il faut trouver où est <code>javac</code> dans <code>eclipse</code>.

tu dois trouver un truc du genre...&nbsp;:

><pre>
> type javac
> .../usr/bin/javac
> ls -l /usr/bin/javac
> .../etc/alternatives/javac
> ls -l /etc/alternatives/javac
> ...<b>/usr/lib/jvm/java-9-oracle/bin/javac</b>
></pre>

Et dans mon <code>PATH</code>, il figure bien :

><pre>
> echo $PATH
> ...:/usr/bin:/sbin:/bin:<b>/usr/lib/jvm/java-9-oracle/bin:/usr/lib/jvm/java-9-oracle/db/bin</b>
></pre>

Si tu ne parviens pas à lancer <code>javac</code> en ligne de commande, c'est
que son répertoire ne figure pas dans ta variable <code>PATH</code>.

Pour éviter trop de manipulation, et d'explications, nous allons utiliser un
répertoire qui, par défaut, figure dans ton *path*, <code>&#126;/bin</code>, et
créer un lien dedans qui pointe sur le <code>javac</code>
d'<code>eclipse</code>.

Pour cela, on utilise la commande <code>ln</code> (pour *link*) dont la syntaxe
générale est :

><pre>
> ln SOURCE DESTINATION (L <b>en minuscule</b>, pas 1...)
></pre>

- <code>SOURCE</code> vaut pour l'entrée qui sera créée dans ton <code>bin</code>

- <code>DESTINATION</code>, le chemin complet vers le <code>javac</code>
  d'<code>eclipse</code>
C'est parti, si le répertoire <code>bin</code> n'exist  pas, on le crée :

><pre>
> cd &#126;
> mkdir bin
> cd bin
> ln javac <b>/chemin/complet/vers/javac_d_eclipse/javac</b>
> ls -l
> ...
></pre>

Tu viens de créer un lien nommé <code>javac</code> dans ton répertoire
<code>bin</code> qui pointe <code>javac</code> du répertoire <code>eclipse</code>.

Tant qu'à faire, même chose pour l'interpréteur, toujours en restant sous
<code>bin</code> :

><pre>
> ln java <b>/chemin/complet/vers/java_d_eclipse/java</b> 
></pre>

:bell::pencil:

:trident: Un lien est un fichier  qui <b>pointe</b> un autre ; ce n'est <b>pas
une copie</b> : si la destination disparait, le lien pointe dans le vide... Si
le lien disparait, la destination n'est pas affectée (enfin si, son compteur de
lien est décrémenté de 1, c'est tout).

<br>

#### <a name="javarun">Compiler et exécuter</a>

<br>

La directive <code>package nom_package</code> indique que les classes de ces
trois fichiers forment un <code>package</code>, c'est-à-dire sont dans le
<b>même répertoire</b>.

Le nom du <code>package</code> doit être le même que celui du dossier.

<br>

Il faut indiquer à <code>javac</code> l'ensemble des fichiers qui définissent
les classes.

En se plaçant dans le dossier des sources <code>.java</code>

><pre>
> javac &ast;.java
></pre>

Sans préciser de destination, les fichiers <code>.class</code> seront dans le
même répertoire.

On pouvait également demander à <code>javac</code> de créer un dossier du nom du
<code>package</code> et déposer les fichiers classes compilées.

><pre>
> javac &ast;.java -d .
></pre>

<br>

Pour exécuter :

- soit on se place au dessus du dossier contenant les classes

- soit on indique avec l'option <code>-cp</code> la <code>CLASSPATH</code> en
  restant dans le répertoire.

Dans le même répertoire :

><pre>
> java -cp .. Java_Pkg_Saluer.Saluer
></pre>

Ou en remontant d'un cran :

><pre>
> cd ..
> java Java_Pkg_Saluer.Saluer
></pre>
<br>

#### <a name="javatag">Créer le fichier <code>tags</code></a>

<br>

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

<br>

---

### <a name="resume">Résumé</a>



<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### [La minute HHGTTG : ](#hhgttg)


:metal::alien::+1:
<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

