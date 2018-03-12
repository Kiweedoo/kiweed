##### Status : en cours de rédaction...


### Balade : `vi` ou `vim`, `bash` ou `dash` ?


#### Objectifs

Déterminer le programme qui sera chargé et exécuté lors de l'invocation d'une commande.

Déterminer le type d'un fichier.

##### Ce qu'on y apprend au passage...

- [x] Poser un alias dans `~/.bashrc`

- [x] Différencier les commandes internes et externes

- [x] Sourcer (recharger) le fichier sans fermer/rouvrir un terminal

- [x] Tracer l'invocation d'une commande

- [x] Déterminer le type d'un fichier

---

#### <a name="sommaire">**Sommaire**</a>

##### [Préambule](#preambule)
##### [À propos de `vi` et `vim`](#vi)


---

#### <a name="preambule">Préambule</a>

Le mot ***programme*** désigne le fichier physique sur disque, tandis que
***processus*** désigne l'image mémoire de ce fichier en cours d'exécution.

Invoquer une commande correspondant à demander le chargement en mémoire, puis l'exécution, 
d'un fichier exécutable situé sur disque. On dit donc qu'**un processus est l'image
mémoire d'un programme en cours d'exécution**.

Les mots ***bash*** et ***shell*** sont indifféremment employés, ils désignent de façon génériques les interpréteurs de commandes.

###### Contextes et application

Sans précision particulière, tout se passe sous *Ubuntu* avec l'interpréteur de commande
`/bin/bash`.

###### Démarche

Tout comme il existe plusieurs éditeurs de texte, certains disponibles par défaut dans
les distributions, il en est de même  pour les interpréteurs de commandes. 

Nous suivons donc la piste de `vi` <sub>(*vi* pour *VIsual*)</sub> puis celle de `bash` 
<sub>(*Bourne Again SHell*, en
référence à Steeve Bourne, le développeur du 1er *shell* Unix)</sub>

###### À propos de la commande `ls`

Pour plus de lisibilité des champs <code>taille</code> et <code>date</code> de la 
commande `ls`, j'utilise un alias pour obtenir un champ unique bien distinct de la taille.

En ajoutant à la fin du fichier `.bashrc` du répertoire de connexion la ligne&nbsp;:

><pre>alias ls='ls --time-style=+%F-%H:%M --color=auto'</pre>

Puis en le rechargeant dans la session en cours, avec la commande `.`&nbsp;:

><pre>
. ~/.bashrc
</pre>

Quel que soit l'emplacement d'où on source puisque `~` vaut pour le chemin absolu du répertoire de connexion.

On obtient alors&nbsp;:


><pre>
ls -l 
total 8
drwxrwxr-x 6 georges georges 4096 2018-03-12-02:22 kiweed
-rw-rw-r-- 1 georges georges 3548 2018-03-12-10:16 vi_vim_gvim.md
></pre>

Au lieu de&nbsp;:
<pre>
ls -l
total 8
drwxrwxr-x 6 georges georges 4096 mars  12 02:22 kiweed
-rw-rw-r-- 1 georges georges 3192 mars  12 10:09 vi_vim_gvim.md
</pre>

L'exemple ci-dessous est plus parlant...


<pre>
lrwxrwxrwx 1 root root 17 déc.  13 19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
</pre>

Quelle est la taille, 17 ou 13 ?

<pre>
lrwxrwxrwx 1 root root 17 2017-12-13-19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
</pre>

Maintenant c'est plus clair... :+1:


<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="vi">À propos de `vi` et `vim`</a>


#### Quelques mots sur les commandes internes et/ou externes


Deux types de commandes sur un système Unix/Linux : les commandes internes, et les commandes externes.

Il existe plusieurs manières de déterminer si une commande est une fonction interne (une primitive) 
ou un programme externe.  Il existe également deux contextes différents :

   - Interactif, c'est-à-dire  en ligne de commande : ma commande est bizarre... Quel est le programme associé ? 
   Quel est le programme vraiment lancé lorsque je tape `ma_commande` ?

   - *Scripting*, programmation *shell* pour enchaîner des commandes : c'est un peu différent car la seule chose dont nous ayons 
   réellement besoin est le PATH de la commande ; éventuellement pour trouver des informations relativement à ce chemin.

Ainsi nous n'aborderons que `type` en ligne de commande et très aborderons très rapidement `command -v` pour la portabilité
POSIX (*Portable Operating System Interface uniX*).  [POSIX sur l'OpenGroup](http://pubs.opengroup.org/onlinepubs/9699919799/).
<sub>(balade intergalactique dédiée...:alien:)</sub>



La commande `type` indique quel programme sera chargé et exécuté si son argument était invoqué. Par exemple&nbsp;:


<pre>
type mkdir
mkdir est /bin/mkdir
</pre>

><pre>
type vi
vi est haché (/usr/bin/vi)
></pre>

><pre>
type cd
cd est une primitive du shell
></pre>

><pre>
type pwd
pwd est une primitive du shell
</pre>

><pre>
type type
type est une primitive du shell
</pre>

><pre>
type ls
ls est un alias vers « ls --time-style=+%F-%H:%M --color=auto »
</pre>

et pour finir

><pre>
type kill
kill est une primitive du shell
</pre>

pourtant 

><pre>
ls -l /bin/kill
-rwxr-xr-x 1 root root 26704 2016-07-12-08:07 /bin/kill
</pre>



Pour rester simple, il y des *primitives*, ce sont tout simplement des fonctions appartenant au code source du *shell*. Elles
sont exécutées dans le même processus.

Des commandes externes, indiquées par leur chemin d'accès absolu (c'est-à-dire à partir de la racine)

Des commandes *hashées*... En fait lorsqu'une commande commande appartient à un des répertoire de la variable PATH mais que le
*bash* a déjà eu à la chercher, il garde sont entrée dans une table de hachage. C'est très bien expliqué dans `man bash`&nbsp;:


&nbsp;



#### Revenons à `vi` et `vim`

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
ls -l /etc/alternatives/vi
lrwxrwxrwx 1 root root       17 déc. 13 19:50 /etc/alternatives/vi -> /usr/bin/vim.gtk3
></pre>

Un nouveau lien... Pointant sur `vim` cette fois... Continuons&nbsp;:

><pre>
ls -l /usr/bin/vim.gtk3
-rwxr-xr-x 1 root root 3005224 juil. 26  2017 /usr/bin/vim.gtk3
></pre>

Pour visualiser que ce sont bien deux fichiers différents, utilisons l'option `-i` de
`ls` pour afficher le numéro d'*inode* des fichiers (leur **identifiant unique** sur tout
le système)&nbsp;:

En fa

/usr/bin/vim.gtk3: ELF 64-bit LSB shared object, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=e3e651772f506ed784855855e68f851d8fc87927, stripped


#### Résumé 

Demander l'exécution d'une commande fût-elle historique et apparemment disponible ne
garantit pas forcément d'exécuter réellement la commande historique.

La commande `type nom_commande` détermine quel fichier se chargé et exécuté.

Avec la commande `ls -l *resultat_de_type*` détermine si le fichier indiqué par type sera
vraiment invoqué ou s'il pointe sur un autre fichier. (on parle alors de lien)

La commande `file nom_fichier` détermine le type du fichier ; elle s'appuie sur le
fichier texte de description des types : `/etc/filetypes`
