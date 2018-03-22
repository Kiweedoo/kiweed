[//]: # (-----------------------------------------------------------------)

[//]: # (Projet Kiweed - Article :  
			Corrections et Abréviations en fonction du type de fichier
			Organiser .vim en fonction des filetypes
		)

[//]: # (Auteur : georges)

[//]: # (Date : lun. 19 mars 2018 à 05:51:28)

[//]: # (-----------------------------------------------------------------)

<sub>Statut : **EN_COURS** | Complexité : basique | Temps : 1h | Mars 2018 |
Georges AKA Kiweed | Tested on Debian U</sub>


### Balade : plugins et types de fichiers</code>

#### <a name="sommaire">**Sommaire**</a>

##### &nbsp;&nbsp;&nbsp;[Objectifs](#objectifs)
##### &nbsp;&nbsp;&nbsp;[Contexte](#preambule)
##### &nbsp;&nbsp;&nbsp;[Exécution des scripts par défaut](#fctmnt)
<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Arbrescence de <code>vim</code>](#orga)</sub>

<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Progression pour bien comprendre](#progression)</sub>

##### &nbsp;&nbsp;&nbsp;[<code>~/.vimrc</code> et <code>.vim</code>](#ptvim)
<sub> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[<code>~/.vimrc</code> : déscativer un plugin par défaut](#delplug)</sub>

##### &nbsp;&nbsp;&nbsp;[Le <code>~/.vimrc</code>](#vimrc)

##### &nbsp;&nbsp;&nbsp;[La minute HHGTTG : plonger dans les *inky depths*](#hhgttg)

---

### <a name="objectifs">Objectifs</a>

- [x] Comprendre et organiser le répertoire <code>~/.vim</code> 

- [x] Comprendre les <code>filetype</code>

- [x] Créer son propre <code>filetype</code>

- [x] Préparer la création d'abréviations dédiées (<code>.java</code>,
  <code>c</code>, <code>.md</code>, etc.

##### Ce qu'on y apprend au passage...

- [x] Différencier les trois répertoire <code>after</code>, <code>ftplugin</code>, 
<code>plugin</code>, <code>syntax</code>

- [x] Lister dans l'ordre les scripts exécuter lors du démarrage de
  <code>vim</code>

- [x] Garder un <code>~/.vimrc</code> propre

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

Parfois... Ça semble ne pas fonctionner... D'où l'intérêt de cet article.
:wink:

<br>

De la même façon, corrections, auto-corrections, abréviations, <code>map</code>, etc. 
sont liées au type de fichier, son extension.

Suivant le contexte, développement ou rédaction d'article par exemple, la
correction n'interviendra pas sur les mêmes régions :

- sur l'ensemble du fichier, s'il s'agit d'un article

- __seulement__ sur les commentaires s'il s'agit d'un source (article dédié)

Il en est de même pour les abréviations :

- celles pour présenter un entête C, Java ou autre

- celles qui font office de raccourcis pour déclarer des fonctions ou des
  classes.

- ou encore les abréviations d'auto-correction pour les fichiers <code>.txt</code>, voire d'autres.

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### <a name="fctmnt">L'exécution des scripts par défaut</a>

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

(le résultat diffère suivant l'extension du fichier...)

<br>

<code>~/.vimrc</code> est lu est exécuté **avant** d'autres scripts système...

Si ces scripts contiennent une des commandes <code>~/.vimrc</code>, cette
dernière sera écrasée.

Le paragraphe suivant explique comment est organisée l'arborescence de <code>~/.vim</code>.

<br>

#### <a name="orga">Arborescence de <code>~/.vim</code></a>

<br>

:trident: L'arborescence de <code>~/.vim</code> contient les répertoires dont les contenus
vont compléter, ou remplacer, les actions exécutées par défaut (celles des
scripts système lus avant).

À ma connaissance, il y en a cinq (probablement d'autres) :

- <code><b>~/.vim/after</b></code> : pour tout ce qui est fait après, en dernier. C'est
  celui que nous utiliserons pour le *previewer* markdown.

- <code><b>~/.vim/ftplugin</b></code> : les actions (commandes) à exécuter **en fonction** du
  *filetype* (déterminer par l'extension).

- <code><b>~/.vim/plugin</b></code> : celles qui s'appliquent à tous les fichiers quelle qu'en
  soit l'extension.

- <code><b>~/.vim/syntax</b></code> : les fichiers spécifiques de syntaxes... Un exemple plus
  bas.

- <code><b>~/.vim/ftdetect</b></code> : pour définir notre propre type de fichier, d'extension
  particulière... Exemple ci-dessous.


:bell::pencil:
:trident: Ces répertoires sont lus **avant** les scripts système correspondant. Leur
contenu peut éventuellement être écrasé.

<br>

#### <a name="progression">Progression pour bien comprendre</a>

<br>

Au départ, j'ai les répertoires suivant sous <code>~/.vim</code>

><pre>
> drwxrwxr-x 3 georges georges 4096 2018-03-10-17:10 after
> drwxrwxr-x 2 georges georges 4096 2018-03-21-10:38 ftdetect
> drwxrwxr-x 2 georges georges 4096 2018-03-20-18:23 ftplugin
> drwxrwxr-x 2 georges georges 4096 2018-03-18-19:46 plugin
> drwxr-xr-x 2 georges georges 4096 2018-03-18-09:11 spell
> drwxrwxr-x 2 georges georges 4096 2018-03-20-13:22 syntax
></pre>

On se crée un petit répertoire de tests, et on s'y place :

><pre>
> mkdir vim_tests
> cd vim_tests
></pre>

On crée un fichier bidon, pour lancer la commande <code>:scriptname</code>, en
lui donnant l'extension <code>.md</code> (markdown) puisque c'est mon activité
du moment :

><pre>
> vi prout.md
> <b>:scriptname</b>

></pre>

:trident: Bien entendu le résultat est différent si on donne une autre extension
connue...


><pre>
> 1: /usr/share/vim/vimrc
> 2: /usr/share/vim/vim80/debian.vim
> 3: /usr/share/vim/vim80/syntax/syntax.vim
> 4: /usr/share/vim/vim80/syntax/synload.vim
> 5: /usr/share/vim/vim80/syntax/syncolor.vim
> 6: /usr/share/vim/vim80/filetype.vim
> <b>7: ~/.vim/ftdetect/pad.vim</b>
> <b>8: ~/.vimrc</b>
> 9: /usr/share/vim/vim80/ftplugin.vim
> 10: /usr/share/vim/vim80/indent.vim
> 11: /usr/share/vim/vim80/plugin/getscriptPlugin.vim
> 12: /usr/share/vim/vim80/plugin/gzip.vim
> 13: /usr/share/vim/vim80/plugin/logiPat.vim
> 14: /usr/share/vim/vim80/plugin/manpager.vim
> 15: /usr/share/vim/vim80/plugin/matchparen.vim
> 16: /usr/share/vim/vim80/plugin/netrwPlugin.vim
> 17: /usr/share/vim/vim80/plugin/rrhelper.vim
> 18: /usr/share/vim/vim80/plugin/spellfile.vim
> 19: /usr/share/vim/vim80/plugin/tarPlugin.vim
> 20: /usr/share/vim/vim80/plugin/tohtml.vim
> 21: /usr/share/vim/vim80/plugin/vimballPlugin.vim
> 22: /usr/share/vim/vim80/plugin/zipPlugin.vim
> 23: /usr/share/vim/vim80/syntax/markdown.vim
> 24: /usr/share/vim/vim80/syntax/html.vim
> 25: /usr/share/vim/vim80/syntax/javascript.vim
> 26: /usr/share/vim/vim80/syntax/vb.vim
> 27: /usr/share/vim/vim80/syntax/css.vim
> <b>28: ~/.vim/ftplugin/markdown.vim</b>
> <b>29: /usr/share/vim/vim80/ftplugin/markdown.vim</b>
> 30: /usr/share/vim/vim80/ftplugin/html.vim
> 31: /usr/share/vim/vim80/autoload/htmlcomplete.vim
> <b>32: ~/.vim/after/ftplugin/markdown/instant-markdown.vim</b>
> ></pre>

Bien... On voit qu'i lfait __beaucoup__ de choses... Purgeons !

Revenons à une situation dans laquelle nous n'avons, ni <code>~/.vimrc</code>,
ni <code>~/.vim</code> (car même sans
<code>~/.vimrc</code>, le _par défaut_ gère la détection des types de fichiers)


><pre>
> mv ~/.vimrc ~/.vimrc.ORI
> mv ~/.vim ~/.vim.ORI
></pre>

Maintenant que nous n'avons ni <code>~/.vimrc</code>, ni répertoire <code>~/.vim</code>,
relançons un <code>vi prout.md</code> en exécutant <code>:scriptname</code>

><pre>
> 1: /usr/share/vim/vimrc
> 2: /usr/share/vim/vim80/debian.vim
> 3: /usr/share/vim/vim80/syntax/syntax.vim
> 4: /usr/share/vim/vim80/syntax/synload.vim
> 5: /usr/share/vim/vim80/syntax/syncolor.vim
> 6: /usr/share/vim/vim80/filetype.vim
> 7: /usr/share/vim/vim80/defaults.vim
> 8: /usr/share/vim/vim80/syntax/nosyntax.vim
> 9: /usr/share/vim/vim80/ftplugin.vim
> 10: /usr/share/vim/vim80/indent.vim
> 11: /usr/share/vim/<vim80/plugin/getscriptPlugin.vim
> 12: /usr/share/vim/vim80/plugin/gzip.vim
> 13: /usr/share/vim/vim80/plugin/logiPat.vim
> 14: /usr/share/vim/vim80/plugin/manpager.vim
> 15: /usr/share/vim/vim80/plugin/matchparen.vim
> 16: /usr/share/vim/vim80/plugin/netrwPlugin.vim
> 17: /usr/share/vim/vim80/plugin/rrhelper.vim
> 18: /usr/share/vim/vim80/plugin/spellfile.vim
> 19: /usr/share/vim/vim80/plugin/tarPlugin.vim
> 20: /usr/share/vim/vim80/plugin/tohtml.vim
> 21: /usr/share/vim/vim80/plugin/vimballPlugin.vim
> 22: /usr/share/vim/vim80/plugin/zipPlugin.vim
> 23: /usr/share/vim/vim80/syntax/markdown.vim
> 24: /usr/share/vim/vim80/syntax/html.vim
> 25: /usr/share/vim/vim80/syntax/javascript.vim
> 26: /usr/share/vim/vim80/syntax/vb.vim
> 27: /usr/share/vim/vim80/syntax/css.vim
> 28: /usr/share/vim/vim80/ftplugin/markdown.vim
> 29: /usr/share/vim/vim80/ftplugin/html.vim 
> 30: /usr/share/vim/vim80/autoload/htmlcomplete.vim
></pre>

Ok, voilà donc la liste de tous les scripts exécutés par défaut lors du
lancement d'une session **pour un fichier <code>.md</code>**

Toujours pareil, le résultat est différent avec ou sans extension, puisque 
des actions sont exécutées par défaut. Lançons :

><pre>
> vi prout
> <b>:sciptname</b>
> 1: /usr/share/vim/vimrc
> 2: /usr/share/vim/vim80/debian.vim
> 3: /usr/share/vim/vim80/syntax/syntax.vim
> 4: /usr/share/vim/vim80/syntax/synload.vim
> 5: /usr/share/vim/vim80/syntax/syncolor.vim
> 6: /usr/share/vim/vim80/filetype.vim
> 7: /usr/share/vim/vim80/defaults.vim
> 8: /usr/share/vim/vim80/syntax/nosyntax.vim
> 9: /usr/share/vim/vim80/ftplugin.vim
> 10: /usr/share/vim/vim80/indent.vim
> 11: /usr/share/vim/vim80/plugin/getscriptPlugin.vim
> 12: /usr/share/vim/vim80/plugin/gzip.vim
> 13: /usr/share/vim/vim80/plugin/logiPat.vim
> 14: /usr/share/vim/vim80/plugin/manpager.vim
> 15: /usr/share/vim/vim80/plugin/matchparen.vim
> 16: /usr/share/vim/vim80/plugin/netrwPlugin.vim
> 17: /usr/share/vim/vim80/plugin/rrhelper.vim
> 18: /usr/share/vim/vim80/plugin/spellfile.vim
> 19: /usr/share/vim/vim80/plugin/tarPlugin.vim
> 20: /usr/share/vim/vim80/plugin/tohtml.vim
> 21: /usr/share/vim/vim80/plugin/vimballPlugin.vim
> 22: /usr/share/vim/vim80/plugin/zipPlugin.vim
> 23: /usr/share/vim/vim80/scripts.vim
></pre>

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---
<br>

#### <a name="ptvim"><code>~/.vimrc</code> et <code>.vim</code></a>


<br>

Les deux sont intimement liés.

La lecture du <code>~/.vimrc</code> **avant** les plugins par défaut, et donc
**avant** l'exécution des contenus de <code>~/.vim</code>, **permet de gérer les
plugins chargés par défaut**.

<br>

##### <a name="delplug"><code>~/.vimrc</code> : déscativer un plugin par défaut</a>


<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

#### <a name="vimrc">Exécution du script <code>~/.vimrc</code></a>

<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

---

### [La minute HHGTTG : ](#hhgttg)


:metal::alien::+1:
<br>

<sub>[(**sommaire ^**)](#sommaire)</sub>

