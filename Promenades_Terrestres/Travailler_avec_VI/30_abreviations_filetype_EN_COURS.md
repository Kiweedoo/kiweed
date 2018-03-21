[//]: # (-----------------------------------------------------------------)

[//]: # (Projet Kiweed - Article :  
			Corrections et Abréviations en fonction du type de fichier
			Organiser .vim en fonction des filetypes
		)

[//]: # (Auteur : georges)

[//]: # (Date : lun. 19 mars 2018 à 05:51:28)

[//]: # (-----------------------------------------------------------------)

<sub>Statut : **EN_COURS** | Complexité : intermédiaire | Temps : 1h | Mars 2018 |
Georges AKA Kiweed | Tested on Debian U</sub>


### Balade : Types de fichiers et corrections : <code>filetype</code> et <code>./vim/ftplugin</code>

#### <a name="sommaire">**Sommaire**</a>

##### &nbsp;&nbsp;&nbsp;[Objectifs](#objectifs)
##### &nbsp;&nbsp;&nbsp;[Contexte](#preambule)
<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Comprendre le fonctionnement des scripts par défaut](#fctmnt)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Organiser <code>~/.vim</code> pour gagner du temps](#orga)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Démarrage de <code>vim</code> et exécution des scripts](#dv)</sub>
##### &nbsp;&nbsp;&nbsp;[Organisation de <code>.vim</code>](#ptvim)
<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Paragraphe1](#parag1)</sub>


##### &nbsp;&nbsp;&nbsp;[Résumé](#resume)
##### &nbsp;&nbsp;&nbsp;[La minute HHGTTG : plonger dans les *inky depths*](#hhgttg)

---

### <a name="objectifs">Objectifs</a>

- [x] Comprendre et organiser le répertoire <code>~/.vim</code> 

- [x] Comprendre les <code>filetype</code>

- [x] Créer les corrections et abréviations suivant le type de fichier

##### Ce qu'on y apprend au passage...

- [x] Différencier les trois répertoire <code>after</code>, <code>ftplugin</code>, 
<code>plugin</code>, <code>syntax</code>

- [x] Garder un <code>~/.vimrc</code> propre

- [x] Lister dans l'ordre les scripts exécuter lors du démarrage de
  <code>vim</code>

- [x] Afficher l'ensemble des <code>filetype</code> reconnus par vim


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---


### <a name="preambule">Contexte</a>

Nous allons définir des actions, des abréviations (ou autre), en fonction du
type de fichier (son extension).

Si on travaille avec un fichier <code>.java</code>, le fichier spécifique
contenant les abréviations pour <code>.java</code> sera exécuté. 

Pareil pour les
<code>.c</code>, <code>.md</code> (markdown), <code>.txt</code>, <code>.tex</code> (LaTex), etc.

Parfois... Ça semble ne pas fonctionner... D'où l'intérêt du paragraphe suivant
:wink:

<br>

#### <a name="fctmnt">Comprendre l'exécution des scripts par défaut</a>

Nous l'avons déjà vu ([Démarrage de <code>vi</code>](https://github.com/Kiweedoo/kiweed/blob/master/Promenades_Terrestres/Travailler_avec_VI/20_vi_dicos_correction_ortho.md#launch)), il se passe des choses.

Si l'on s'en tient uniquement aux scripts (<code>~/.vimrc</code> en est un)...

:trident: <code>script</code> :  sont des fichiers de commandes <code>vi</code> 
qui sont lus et exécutés au lancement... Exactement comme si on exécutait, 
pas à pas, à la main, en ligne de commande <code>vi</code> (par la 
commande <code>:</code>) chacune des instructions.

La commande interne à <code>vi</code>, <code>scriptname</code> permet de lister
l'ordre de lecture et d'exécution des fichiers.

><pre>
> <b>:scriptname</b>
> 1: /usr/share/vim/vimrc
> 2: /usr/share/vim/vim80/debian.vim
> 3: /usr/share/vim/vim80/syntax/syntax.vim
> 4: /usr/share/vim/vim80/syntax/synload.vim
> 5: /usr/share/vim/vim80/syntax/syncolor.vim
> 6: /usr/share/vim/vim80/filetype.vim
> <b>7: ~/.vimrc</b>
> 8: /usr/share/vim/vim80/ftplugin.vim
> 9: /usr/share/vim/vim80/indent.vim
> [...] 
> 17: /usr/share/vim/vim80/plugin/spellfile.vim
> [...] 
> <b>22: /usr/share/vim/vim80/syntax/markdown.vim</b>
> 23: /usr/share/vim/vim80/syntax/html.vim
> [...] 
> 26: /usr/share/vim/vim80/syntax/css.vim
> <b>27: ~/.vim/ftplugin/markdown.vim</b>
> 28: /usr/share/vim/vim80/ftplugin/markdown.vim
> 29: /usr/share/vim/vim80/ftplugin/html.vim
> [...] 
> 31: ~/.vim/after/ftplugin/markdown/instant-markdown.vim
></pre>
<br>

#### <a name="orga">Organiser <code>~/.vim</code> pour gagner du temps</a>

Corrections, auto-corrections, abréviations, <code>map</code>, etc.

Suivant le contexte, développement ou rédaction d'article par exemple, la
correction n'interviendra pas sur les mêmes régions :

- sur l'ensemble du fichier, s'il s'agit d'un article

- __seulement__ sur les commentaires s'il s'agit d'un source (article dédié)

Il en est de même pour les abréviations :

- celles pour présenter un entête C, Java ou autres

- celles qui font office de raccourcis pour déclarer des fonctions ou des
  classes.

<br>

#### <a name="dv">Démarrage de <code>vim</code> et exécution des scripts</a>

Comme nous l'avons vu ([Démarrage de
<code>vi</code>](https://github.com/Kiweedoo/kiweed/blob/master/Promenades_Terrestres/vi_vim/vi_dicos_correction_ortho.md#launch))
de nombreux scripts et plugins présents par défaut dans les répertoires système
sont exécutés. Mais qu'en est-il des scripts personnels et des plugins ?

Pour voir tout ce que <code>vi</code> exécute lors de son lancement, et dans
l'ordre dans lequel il lit les répertoires et exécute leurs contenus :

><pre>
> 
></pre>

Il est important de bien comprendre d'ordre d'exécution afin de pouvoir garder
propre, et surtout sans conflit, le <code>~/.vimrc</code> et les <code>.vim</code> dédiés.


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="ptvim">Organisation de <code>.vim</code></a>


<br>

#### <a name="sujet1">Sujet 1</a>


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="resume">Résumé</a>



<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### [La minute HHGTTG : ](#hhgttg)


:metal::alien::+1:
<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>


