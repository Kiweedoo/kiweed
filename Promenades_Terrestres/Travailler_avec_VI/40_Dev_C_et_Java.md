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

##### &nbsp;&nbsp;&nbsp;[La minute HHGTTG : plonger dans les *inky depths*](#hhgttg)


## <a name="objectifs">Objectifs</a>

- [x] Installer et utiliser <code>ctags</code>

- [x] Utiliser les <code>tags</code> en C et en Java

##### Ce qu'on y apprend au passage...

- [x] Faire du Java... En ligne de commande

- [x] Construire proprement en C ou en Java


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>


<br>

## <a name="preambule">Contexte</a>

<br>

Développer proprement impose de découper son projet principal en plusieurs
modules source.

Chaque modules contenant les fonctions et/ou les classes et les méthodes qui lui
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

