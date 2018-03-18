<sub>Statut : ok | Complexité : basique | Temps : 15mn | Création : Mars 2018 | Georges AKA Kiweed</sub>


### `vi` ou `vim` ? Les commandes `type` et `file`

#### <a name="sommaire">**Sommaire**</a>

##### &nbsp;&nbsp;&nbsp;[Objectifs](#objectifs)
##### &nbsp;&nbsp;&nbsp;[Préambule](#preambule)
<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Contexte et application](#contexte)

<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Démarche](#demarche)</sub>

<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[La commande `ls`](#ls)</sub>
##### &nbsp;&nbsp;&nbsp;[À propos de `vi` et `vim`](#vi)
<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Quelques mots sur les commandes
internes et/ou externes](#commint)</sub>

<sub>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Revenons à `vi` et `vim`](#retvi)
##### &nbsp;&nbsp;&nbsp;[Résumé](#resume)
##### [La minute HHGTTG : comment remodeler le concept même de l'espace-temps ?](#hhgttg)


---


#### <a name="objectifs">Objectifs</a>

- [x] Déterminer le programme qui sera chargé et exécuté lors de l'invocation d'une commande.

- [x] Déterminer le type d'un fichier.

- [x] Utiliser les commandes *bash* `type` et `file`, et la commande `ls`

&nbsp;

##### Ce qu'on y apprend au passage...

- [x] Poser un alias dans `~/.bashrc`

- [x] Différencier les commandes internes et externes

- [x] Sourcer (recharger) le fichier sans fermer/rouvrir un terminal

- [x] Tracer l'invocation d'une commande

- [x] Déterminer le type d'un fichier



<sub>[(**sommaire ^**)](#sommaire)</sub>

---

#### <a name="preambule">Préambule</a>

Le mot ***programme*** désigne le fichier physique sur disque, tandis que
***processus*** désigne l'image mémoire de ce fichier en cours d'exécution.

Invoquer une commande correspondant à demander le chargement en mémoire, puis l'exécution, 
d'un fichier exécutable situé sur disque. On dit donc qu'**un processus est l'image
mémoire d'un programme en cours d'exécution**.

Les mots ***bash*** et ***shell*** sont indifféremment employés, ils désignent de façon génériques les interpréteurs de commandes.

###### <a name="contexte">Contextes et application</a>

Sans précision particulière, tout se passe sous *Ubuntu* avec l'interpréteur de commande
`/bin/bash`.

###### <a name="demarche">Démarche</a>

Tout comme il existe plusieurs éditeurs de texte, certains disponibles par défaut dans
les distributions, il en est de même  pour les interpréteurs de commandes. 

Nous suivons donc la piste de `vi` <sub>(*vi* pour *VIsual*)</sub> puis celle de `bash` 
<sub>(*Bourne Again SHell*, en
référence à Steeve Bourne, le développeur du 1er *shell* Unix)</sub>

###### <a name="ls">À propos de la commande `ls`</a>

Pour plus de lisibilité des champs <code>taille</code> et <code>date</code> de la 
commande `ls`, j'utilise un alias pour obtenir un champ unique bien distinct de la taille.

En ajoutant à la fin du fichier `.bashrc` du répertoire de connexion la ligne&nbsp;:

><pre>alias ls='ls --time-style=+%F-%H:%M --color=auto'</pre>

Puis en le rechargeant dans la session en cours, avec la commande `.`&nbsp;:

><pre>
>. ~/.bashrc
></pre>

Quel que soit l'emplacement d'où on source puisque `~` vaut pour le chemin absolu du répertoire de connexion.

On obtient alors&nbsp;:


><pre>
>ls -l 
>total 8
>drwxrwxr-x 6 georges georges 4096 2018-03-12-02:22 kiweed
>-rw-rw-r-- 1 georges georges 3548 2018-03-12-10:16 vi_vim_gvim.md
></pre>

Au lieu de&nbsp;:
><pre>
>ls -l
>total 8
>drwxrwxr-x 6 georges georges 4096 mars  12 02:22 kiweed
>-rw-rw-r-- 1 georges georges 3192 mars  12 10:09 vi_vim_gvim.md
></pre>

L'exemple ci-dessous est plus parlant...


><pre>
>lrwxrwxrwx 1 root root 17 déc.  13 19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
></pre>

Quelle est la taille, 17 ou 13 ?

><pre>
>lrwxrwxrwx 1 root root 17 2017-12-13-19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
></pre>

Maintenant c'est plus clair... :+1:


<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="vi">À propos de `vi` et `vim`</a>


#### <a name="commint">Quelques mots sur les commandes internes et/ou externes</a>

<sub>Notes : sujet très riche, beaucoup de choses à présenter ; futur article dédié. L'essentiel pour commencer.</sub>

Deux types de commandes sur un système Unix/Linux : les commandes internes, et les commandes externes.

Il existe plusieurs manières de déterminer si une commande est une fonction interne (une primitive) 
ou un programme externe.  Il existe également deux contextes différents :

   - Interactif, c'est-à-dire  en ligne de commande : ma commande est bizarre... Quel est le programme associé ? 
   Quel est le programme vraiment lancé lorsque je tape `ma_commande` ?

   - *Scripting*, programmation *shell* pour enchaîner des commandes : c'est un peu différent car la seule chose dont nous ayons 
   réellement besoin est le PATH de la commande ; éventuellement pour trouver des informations relativement à ce chemin.


La commande `type` indique quel programme sera chargé et exécuté si son argument était invoqué. Par exemple&nbsp;:


><pre>
>type mkdir
>mkdir est /bin/mkdir
></pre>

><pre>
>type vi
>vi est haché (/usr/bin/vi)
></pre>

><pre>
>type cd
>cd est une primitive du shell
></pre>

><pre>
>type pwd
>pwd est une primitive du shell
></pre>

><pre>
>type type
>type est une primitive du shell
></pre>




Pour rester simple, il y des *primitives* (*builtin* si version anglaise), ce sont tout simplement des fonctions 
appartenant au code source du *shell*. Elles sont exécutées dans le même processus. Elles sont un héritages du `sh` de Steeve
Bourne : elles permettent de modifier l'environnement du *shell* (ses variables d'environnement par exemple) ; ce qui ne serait
pas possible ou difficile à faire avec une commande externe (chargée et exécutée dans un processus différent). 

Des commandes externes, indiquées par leur chemin d'accès absolu (c'est-à-dire à partir de la racine)

Des commandes *hashées*... En fait lorsqu'une commande commande appartient à un des répertoire de la variable PATH mais que le
*bash* a déjà eu à la chercher, il garde sont entrée dans une table de hachage. C'est très bien expliqué dans `man bash`&nbsp;:

<sub><i>
>If the name is neither a shell function nor a builtin, and contains no slashes, bash searches each element  of  the  PATH
>for  a  directory  containing  an executable file by that name.  Bash uses a hash table to remember the full pathnames of
>executable files (see hash under SHELL BUILTIN COMMANDS below).  A full search of the directories in  PATH  is
> performed only  if  the  command  is  not found in the hash table.  
</i>
</sub>


Les options de `type`, notamment `-P`, permettent de forcer la recherche dans les répertoires de la variable PATH, me s'il
s'agit d'un alias&nbsp;:

><pre>
>type ls
>ls est un alias vers « ls --time-style=+%F-%H:%M --color=auto »
>type -P ls
>/bin/ls
></pre>

et pour finir

><pre>
>type kill
>kill est une primitive du shell
></pre>

Pourtant 

><pre>
>ls -l /bin/kill
>-rwxr-xr-x 1 root root 26704 2016-07-12-08:07 /bin/kill
></pre>

Il y a donc également des primitives qui existent en tant que commandes externes. Plus de détails dans l'article dédié. 

Si aucun chemin n'est précisé, c'est bien entendu la *builtin* qui est exécutée en priorité.

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

#### <a name="retvi">Revenons à `vi` et `vim`</a>

&nbsp;

><pre>type vi</pre>

Donne 

><pre>vi est /usr/bin/vi</pre>

En tapant `vi` en ligne de commande, ce ser*ait* le fichier
`/usr/bin/vi` qui ser*ait* chargé et exécuté.

Utilisons `ls -l` <sub>(`ls` fera l'objet un
TP ultérieur)</sub> pour plus de détails&nbsp;:



><pre>ls -l /usr/bin/vi
>lrwxrwxrwx 1 root root      20 déc.  11 18:07 /usr/bin/vi -> /etc/alternatives/vi</pre>

Nous avons **un lien**&nbsp;: le fichier `/usr/bin/vi` pointe sur le fichier 
`/etc/alternatives/vi`.

Continuons l'enquête...

><pre>
>ls -l /etc/alternatives/vi
>lrwxrwxrwx 1 root root       17 déc. 13 19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
></pre>

Un nouveau lien... Pointant sur `vim` cette fois... Continuons&nbsp;:

><pre>
>ls -l /usr/bin/vim.gtk3
>-rwxr-xr-x 1 root root 3005224 juil. 26  2017 /usr/bin/vim.gtk3
></pre>

Pour visualiser que ce sont bien trois fichiers différents, utilisons l'option `-i` de
`ls` pour afficher le numéro d'*inode* des fichiers (leur **identifiant unique** sur tout
le système, fichiers, répertoires périphériques, etc. - correspond à un emplacement physique ; l'*inode* est unique mais peut
néanmoins être pointé par plusieurs **noms de fichier**... *more on this later* :smile:)&nbsp;:

><pre>
>ls -il /usr/bin/vi /etc/alternatives/vi /usr/bin/vim.gtk3
>15729133 lrwxrwxrwx 1 root root      17 2017-12-13-19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
>27657805 lrwxrwxrwx 1 root root      20 2017-12-11-18:07 /usr/bin/vi -> /etc/alternatives/vi
>27660725 -rwxr-xr-x 1 root root 3005224 2017-07-26-22:13 /usr/bin/vim.gtk3
></pre>

Le premier champ est le **numéro d'_inode_**. 

Les trois *inodes* sont différents, ce sont bien **trois fichiers physiquement différents**.

&nbsp;

La commande `file` permet  également d'arriver à la même conclusion ; elle retourne le type du fichier passé en 
argument (en précisant son chemin, absolu pour faire unique)

><pre>
>file /usr/bin/vi
>/usr/bin/vi: symbolic link to /etc/alternatives/vi
>file /etc/alternatives/vi
>/etc/alternatives/vi: symbolic link to /usr/bin/vim.gtk3
>file /usr/bin/vim.gtk3
>/usr/bin/vim.gtk3: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter  [...]
></pre>


Nous terminerons simplement en précisant que **ELF**, aujourd'hui pour *Executable AND Linkable Format* 
(historiquement *Extensible Linking Format*), **est le format des exécutables** UNIX/Linux... **UNIX/Linux**... 
Pas uniquement Linux.

**LSB**, la *Linux Standard Base* gérée par la *Linux Fundation* qui s'appuie sur les travaux POSIX de l'IEEE <sub>(lire
i3E)</sub> 
pour la standardisation des Unix.<sub>(on lit souvent en anglais *unices* pour *unix* au pluriel)</sub>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="resume">Résumé</a>

Demander l'exécution d'une commande fût-elle historique et apparemment disponible ne
garantit pas forcément d'exécuter réellement la commande historique.

La commande `type programme` détermine quel fichier sera chargé et exécuté si `programme` était invoqué directement en ligne
de commande.

La commande `ls -l *resultat_de_type*` détermine si le programme fourni en réponse  par `type` 
sera vraiment invoqué ou s'il pointe sur un autre fichier.<sub>(on parle alors de lien)</sub>

La commande `file fichier` détermine le type du fichier ; pour ce faire, elle s'appuie sur le fichier 
magique `/usr/share/misc/magic.mgc` <sub>(dans sa version compilée, futur article dédié :alien:)</sub>. 

On pourra faire&nbsp;:


><pre>
>ls -l /usr/share/misc/magic
>lrwxrwxrwx 1 root root 13 2017-12-11-18:08 /usr/share/misc/magic -> ../file/magic
></pre>

<sub>[(**sommaire ^**)](#sommaire)</sub>

<br>

---

#### <a name="hhgttg">La minute qui remodèle le concept même du temps et de l'espace</a>

<br>

>“So you see,” <br>
>said Slartibartfast, slowly stirring his artificially constructed coffee, and thereby also stirring the whirlpool
>interfaces between real and unreal numbers, between the interactive perceptions of mind and Universe, and   thus generating the
>restructured matrices of implicitly enfolded subjectivity which allowed his ship to reshape the very concept of time and space,
><br>
>“how it is.”

<sub>(The HHGTTG, T3, Life, the Universe, and Everything, p.73 )</sub>

<sub>[(**sommaire ^**)](#sommaire)</sub>


:metal::alien::+1:
