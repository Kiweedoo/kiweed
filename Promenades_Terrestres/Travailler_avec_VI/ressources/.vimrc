" pour empêcher l'exécution du plugin d'appariement
let loaded_matchparen = 1
filetype plugin indent on
set ai wm=4 ts=4 sw=4  tw=80 ignorecase complete+=k hlsearch incsearch
" ai : autoindent
" ts : tabstop, la largeur de la tabulation (par défaut 8 caractères)
" sw : shift width, largeur du décalage avec >> ou <<
" tw : textwidth, la longueur de ligne, 80 c'est compatible avec tout
" ignorecas : ignoe la casse, Propre == propre
" complete : pour la complétion avec <c-k> poru java ou c par exemple... sujet
" dédié
" hlsearch : highlight search, tous les mots **après** la saisie
" incsearch : idem **en cours de saisie**
au BufRead,BufEnter,BufNewFile *.txt setlocal spell spelllang=fr
au BufRead,BufEnter,BufNewFile *.md setlocal spell spelllang=fr
au BufRead,BufEnter,BufNewFile *.c setlocal spell spelllang=fr
au BufRead,BufEnter,BufNewFile *.tex setlocal spell spelllang=fr
au BufRead,BufEnter,BufNewFile *.txt syntax match noms_propres +\<[A-ZÉÈÀÔ]\k*\>+ contains=@NoSpell
au BufRead,BufEnter,BufNewFile *.tex syntax match noms_propres +\<[A-ZÉÈÀÔ]\k*\>+ contains=@NoSpell
" les syntaxes de langages priment !
" applicable uniquement dans les portions **commentaires** des langages.
" En outre, parfois, seules les formes atomiques de description sont valides
au BufRead,BufEnter,BufNewFile *.md syntax match noms_propres +\<\u\k*\>+ contains=@NoSpell
au BufRead,BufEnter,BufNewFile *.c syntax match noms_propres +\<\u\k*\>+ contains=@NoSpell

"vim ne reconnaît pas les alias bash à moins de les rendre interactifs
"reconnaître les alias et obtenir **dans** le fichier "avec !!commande :
" ************************
" ATTENTION : avec !! ou :! vi est stoppé et mis en arrière plan (pas terminé), 
" on se retrouve dans l'interpréteur... 
" "est stoppé"... fg<return> pour revenir (foreground)
" ************************
set shellcmdflag=-ic

map <silent> <f6> "<esc>:silent setlocal spell! spelllang=en<cr>"
map <silent> <f7> "<esc>:silent setlocal spell! spelllang=fr<cr>"
map <silent> <tab> "<esc>]s"
map <silent> <s-tab> "<esc>[s"
map <silent> <s-up> "<esc>z="
