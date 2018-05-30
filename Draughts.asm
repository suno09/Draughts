        data segment
    ;partie de declaration des variables
    saut db 0ah, 0dh, 24h  
    msg db "                        ", 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 0ah, 0dh, "                        ", 0fh, 6h, 0fh, 6h, 0fh, " Jeu de Dames ", 6h, 0fh, 6h, 0fh, 6h, 0ah, 0dh, "                        ", 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 0ah, 0dh, 24h
    msgm1 db "           ", 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 0ah, 0dh, "           ", 0fh, "     0-Retourne la ligne de la case noire       ", 6h, 0ah, 0dh, "           ", 6h, "     1-Retourne la colonne de la case noire     ", 0fh, 0ah, 0dh, "           ", 0fh,"     2-Retourne le numero de la case noire      ", 6h, 0ah, 0dh, "           ", 6h, "     3-Initialiser les cases du damier          ", 0fh, 0ah, 0dh, "           ", 0fh, "     4-Afficher la couleur d'une case           ", 6h, 0ah, 0dh, "           ", 6h, "     5-Affiche l'etat de la case                ", 0fh, 0ah, 0dh, "           ", 0fh, "     6-La possibilite d'un deplacement          ", 6h, 0ah, 0dh, "           ", 6h, "     7-Faire un deplacement                     ",  0fh, 0ah, 0dh, "           ", 0fh, "     8-Afficher le damier                       $"
    msgm2 db 6h, 0ah, 0dh, "           ", 6h, "     9-Quitter                                  ", 0fh, 0ah, 0dh, "           ", 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 6h, 0fh, 24h
    msgch db "               Votre choix : $"
    msgerch db "             Erreur de choix !!!$"
    msgq db "            Vouler vous quitter ?", 0ah, 0dh, "            [o/O]-Quitter", 0ah, 0dh, "            [n/N]-Continuer", 0ah, 0dh, 24h
    msgdn db "               Donner le nombre: $" 
    msgn db "               Le nombre est : $"
    msgei db "           Erreur, il faut initialiser les cases avant !!!$"
    msginit1 db "           Initialisation en cours, veuillez patienter...$"
    msginit2 db "           Initialisation termine ^_^$"
    msgi db "               Donner l'indice i: $"
    msgj db "               Donner l'indice j: $"  
    msgid db "           Donner les indices d'une case de depart: $"
    msgif db "           Donner les indices d'une case d'arrive: $"
    msgcb db "               Case blanche$"
    msgcn db "               Case noire$"
    msgep1 db "               Case noire libre$"
    msgep2 db "               Case de pion noir$"
    msgep3 db "               Case de pion blanc$" 
    msgep4 db "               Case de dame noire$"
    msgep5 db "               Case de dame blanche$"
    msgerr db "           Erreur ! $"
    msgor db "           Ou,$"
    msgerror db "           Erreur d'indice !!!, l'indice doit etre entre (1..10)$"
    msgerror1 db "           C'est des indices d'une case blanche !!!$"
    msgerror2 db "            Attention @_@, ce n'est pas un nombre !!!$" 
    msgerror3 db "            Erreur nombre !!!", 0ah, 0dh, "            Le nombre de la case noire doit etre entre (1..50) !$"
    msgerror4 db "            Attention @_@, l'un des deux indices n'est pas un nombre !!!$"
    msgdpp db "               Deplacement possible ^_^$"
    msgdpi db "               Deplacement impossible !!!$" 
    msgdpdi db "              Deplacement impossible pour les dames !!!$"
    msgdpe db "               Deplacement effectue ^_^$" 
    msgbye db "             Au revoir ^_^$"            
    dmi db "                              12345678910$"
    dml db "                             ------------$"
    ind db 17h, 1eh                  
    espace db "                           $"
    saut2 db "               Appuyer sur une touche pour continuer...$"
    mat db 55 dup ?
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea dx, msg
    mov ah, 9
    int 21h           
    
    ; partie d'affichage menu
    
    mov bp, 0 ; la matrice n'est pas initialise
beg:call Newl
    call Newl ; mettre saut de ligne
    call Menu
    
    ; partie des actions des choix
    ; partie retourne la ligne de la case noire
     
ch0:call Newl
    call Newl
    lea dx, msgdn ; afficher message donner le nombre
    mov ah, 9
    int 21h      
    call LireN ; lire le nombre et mettre dans bx 
    cmp bx, 21h ; s'il bx contient le caractere speciale "!" d'erreur de frape (n'est pas un numero)
    jnz ch01 ; s'il bx est un nombre
    ; bx n'est pas un nombre
    call Newl
    lea dx, msgerror2 ; afficher message d'erreur de tape de nombre
    mov ah, 9
    int 21h
    jmp ch0
ch01:call RetLigne  ; fonction qui retourne la ligne
    cmp si, 0
    jnz afn ; s'il n'y a pas d'erreur nombre (1 <= si <= 50) on affiche  
    call Newl
    lea dx, msgerror3 ; afficher message d'erreur 
    mov ah, 09
    int 21h
    jmp ch0
afn:call Newl
    lea dx, msgn
    mov ah, 9
    int 21h
    call AfficheN ; afficher le nombre a l'ecran
    call Newl
    jmp qut
    
    ; partie retourne la colonne de la case noire
    
ch1:call Newl
    call Newl
    lea dx, msgdn
    mov ah, 9
    int 21h      
    call LireN 
    cmp bx, 21h
    jnz ch11 ; s'il bx est un nombre
    ; bx n'est pas un nombre
    call Newl
    lea dx, msgerror2 ; afficher message d'erreur de tape de nombre
    mov ah, 9
    int 21h
    jmp ch1
ch11:call RetColonne ; fonction qui retourne la colonne
    cmp si, 0
    jnz afn   
    call Newl
    lea dx, msgerror3
    mov ah, 09
    int 21h  
    jmp ch1  
    
    ; partie de retourne le numero de la case noire
    
ch2:call Newl
    call Newl
    call Lire2N ; lire les indices (i, j) et mettre dans bx(bh=i et bl=j) 
    call RetNombre ; fonction qui retourne le nombre de i et j
    cmp si, 0
    jnz afn   
    call Newl
    lea dx, msgerror
    mov ah, 09
    int 21h
    call Newl
    lea dx, msgor
    mov ah, 9
    int 21h 
    call Newl
    lea dx, msgerror1
    mov ah, 9
    int 21h  
    jmp ch2 
    
    ; partie de l'initialisation des case du damier
    
ch3:call Newl
    call Newl
    lea dx, msginit1 ; message que l'initialisation est commence, il faut patienter
    mov ah, 9
    int 21h
    call InitCase ; fonction qui initialiser les cases du damier
    call Newl
    lea dx, msginit2 ; message que l'initialistion est termine
    mov ah, 9
    int 21h
    call Newl
    jmp qut     
    
    ; parite d'affichage de la couleur d'une case
    
ch4:call Newl
    call Newl
    cmp bp, 0 ; si la matrice n'est pas initialise
    jnz ch41
    lea dx, msgei
    mov ah, 9
    int 21h  
    call Newl
    jmp qut
ch41:call Lire2N
    call CouleurCase ; fonction qui donne la couleur d'une case
    cmp cx, 0
    jz ch4 ; s'il y a erreur, refaire
    call Newl
    jmp qut                                      
    
    ; partie d'affichage de l'etat d'une case
    
ch5:call Newl
    call Newl
    cmp bp, 0 ; si la matrice n'est pas initialise
    jnz ch51
    lea dx, msgei
    mov ah, 9
    int 21h  
    call Newl
    jmp qut
ch51:call Lire2N
    call EtatPion ; fonction qui donne etat de case
    cmp cx, 0
    jz ch5 ; s'il y a erreur, refaire
    call Newl
    jmp qut                                  
    
    ; partie de verification de la possibilite d'un deplacement d'un pion
    
ch6:call Newl
    call Newl
    cmp bp, 0 ; si la matrice n'est pas initialise
    jnz ch61
    lea dx, msgei
    mov ah, 9
    int 21h  
    call Newl
    jmp qut
ch61:lea dx, msgid
    mov ah, 9
    int 21h 
    call Newl
    call Lire2N ; les indices de debut
    call Newl 
    call Newl
    lea dx, msgif
    mov ah, 9
    int 21h                           
    push bx ; sauvegarde les indices de debut
    call Newl
    call Lire2N ; lire les indices de fin
    mov dx, bx ; mettre les indices de fin dans dx
    pop bx ; reprendre les indices de debut dans bx 
    call DepPionPoss ; fonction qui qui affiche la possibilite d'un deplacement d'un pion ou non
    ; cl a le resultat de la possibilite
    cmp cl, 0
    jnz ch62
    lea dx, msgdpi ; deplacement impossible
    mov ah, 9
    int 21h
    jmp ch64
ch62:cmp cl, 2 ; erreur sur les indices
    jnz ch65
    lea dx, msgdpi
    mov ah, 9
    int 21h
    call Newl 
    lea dx, msgerror ; erreur d'indice
    mov ah, 9
    int 21h
    call Newl
    lea dx, msgor
    mov ah, 9
    int 21h 
    call Newl
    lea dx, msgerror1
    mov ah, 9
    int 21h 
    jmp ch6
ch65:cmp cl, 3
    jnz ch63
    lea dx, msgdpdi
    mov ah, 9
    int 21h
    jmp ch64
ch63:call Newl
    lea dx, msgdpp ; deplacement possible
    mov ah, 9
    int 21h  
ch64:call Newl
    jmp qut
    
    ; partie d'effecter le deplacement d'un pion si possible
    
ch7:call Newl
    call Newl
    cmp bp, 0 ; si la matrice n'est pas initialise
    jnz ch71
    lea dx, msgei
    mov ah, 9
    int 21h
    call Newl
    jmp qut
ch71:lea dx, msgid
    mov ah, 9
    int 21h  
    call Newl
    call Lire2N ; les indices de debut
    call Newl 
    call Newl
    lea dx, msgif
    mov ah, 9
    int 21h
    push bx     
    call Newl
    call Lire2N ; les indices de fin
    mov dx, bx
    pop bx
    ; la lecture pour ch7 est comme ch6
    call DeplacePion ; fonction qui fait un deplacement d'un pion si possible
    cmp cx, 0
    jz ch7 ; s'il y a erreur, refaire
    call Newl
    jmp qut
    
    ; partie de dessiner la matrice 
    
ch8:call Newl
    call Newl
    cmp bp, 0 ; si la matrice n'est pas initialise
    jnz ch81
    lea dx, msgei
    mov ah, 9
    int 21h  
    call Newl
    jmp qut
ch81:call Newl
    call Newl
    call DessinMat ; fonction qui afficher la matrice de dame
    call Newl
    call Newl
    jmp qut                     
    
    ; partie de sortir ou continuer dans programme
    
ch9:call Newl
    call Newl
    lea dx, msgbye
    mov ah, 9
    int 21h
    mov ah, 1 ; confirmation de quitter
    int 21h
    mov ax, 4c00h ; exit to operating system.
    int 21h  
    call Newl
qut:call Newl
    lea dx, msgq ; message pour quitter
    mov ah, 9
    int 21h
    ; partie de verification de quitter ou continuer 
qut2:call Newl
    call Newl
    lea dx, msgch
    mov ah, 9
    int 21h
    mov ah, 1
    int 21h ; lecture d'un caractere
    cmp al, 'o'
    jz ch9 ; si egal donc quitter
    cmp al, 'O'
    jz ch9 ; si egal donc quitter
    cmp al, 'n'
    jz beg ; si egal donc continuer l'execution du programme
    cmp al, 'N'
    jz beg ; si egal donc continuer l'execution du programme
    ; partie erreur de caractere (caractere != n,N,o,O)
    call Newl
    lea dx, msgerch
    mov ah, 9
    int 21h ; message erreur caractere non connu
    jmp qut2 ; reprendre la verification de quitter ou continuer         
    
    ; fin de partie des actions
               
    InitCase proc
        mov bp, 1 ; la matrice initialise 
        mov si, 0 ; si prend l'indice sur le tableau
        mov cx, 20 ; on remplie juste les 20 premiers cases
        mov dl, 1 ; dl contient pion noir
        ; remplissage des cases noires et on commence par pions noirs
    ic1:mov byte ptr mat[si], dl
        inc si
        loop ic1
        cmp dl, 1
        jnz ic2
        ; remplissage des cases par cases noires libres
        mov dl, 0 ; dl contient case noire libre
        mov cx, 10
        jmp ic1
    ic2:cmp dl, 2
        jz ic3 ; si on a termine remplissage
        ; remplissage des cases par pions blancs
        mov dl, 2 ; dl contient pion blanc
        mov cx, 20
        jmp ic1
    ic3:ret
    endp
    
    ; lire indice ou nombre
    
    LireN proc
        ; lire le nombre comme chaine a partir mat[50]
        ; lire le nombre
        mov byte ptr mat+50, 3
        lea dx, mat+50
        mov ah, 0ah
        int 21h
        mov ax, 0 
        ; verifier est ce que le contenu est un chiffre
        cmp byte ptr mat[52], '0'
        jb ln2 ; s'il y a erreur de frape que signifie n'est pas un chiffre
        cmp byte ptr mat[52], '9'
        ja ln2 ; s'il y a erreur de frape que signifie n'est pas un chiffre
        mov al, mat[52]
        sub al, 30h
        ; verifier est ce que chaine contient 1 ou 2 chiffres
        cmp byte ptr mat+53, 0dh
        jz ln1 ; s'il tape entrer
        ; traduiser les 2 caracteres tapes en un nombre si le 2eme caractere est un chiffre
        cmp byte ptr mat[53], '0'
        jb ln2 ; s'il y a erreur de frape que signifie n'est pas un chiffre
        cmp byte ptr mat[53], '9'
        ja ln2 ; s'il y a erreur de frape que signifie n'est pas un chiffre
        mov dh, 10
        mul dh
        sub byte ptr mat+53, 30h 
        add al, byte ptr mat[53]
        jmp ln1
    ln2:mov ax, 21h ; caractere speciale "!" indique que ce n'est pas un caractere de chiffre mat[52] ou mat[53]
    ln1:mov bx, ax ;le nombre se trouve dans bx
        ret
    endp
    
    ; lire les indices i et j
    
    Lire2N proc  
   l2n0:call Newl
        lea dx, msgi
        mov ah, 9
        int 21h       
        call LireN ; lire l'indice i 
        push bx ; sauvegarde l'indice i
        call Newl
        lea dx, msgj
        mov ah, 9
        int 21h ; lire l'indice j     
        call LireN ; lire l'indice j
        cmp bx, 21h ; s'il bx contient le caractere speciale "!" d'erreur de frape (n'est pas un numero)
        jnz l2n1 ; s'il bx est un nombre
        ; bx n'est pas un nombre
        call Newl
        lea dx, msgerror4 ; afficher message d'erreur de tape de nombre
        mov ah, 9
        int 21h  
        pop bx 
        call Newl
        jmp l2n0 
   l2n1:pop dx ; recuperer l'indice i
        cmp dx, 21h ; s'il dx contient le caractere speciale "!" d'erreur de frape (n'est pas un numero)
        jnz l2n2 ; s'il dx est un nombre
        ; dx n'est pas un nombre
        call Newl
        lea dx, msgerror4 ; afficher message d'erreur de tape de nombre
        mov ah, 9
        int 21h
        call Newl
        jmp l2n0
   l2n2:mov bh, dl ; mettre l'indice i dans bh
        ; bh = i et bl = j 
        ret
    endp
    
    ; afficher un nombre
    
    AfficheN proc
        ; le nombre que nous affichons est dans si en decimale
        mov dh, 10
        mov cx, 0
        mov ax, si
    an1:div dh
        mov dl, ah
        push dx
        inc cx
        mov ah, 0
        cmp al, 0
        jnz an1
    an2:pop dx
        add dl, 30h
        mov ah, 02
        int 21h
        loop an2
    endp
    
    ; retourne la ligne d'un nombre    
    
    RetLigne proc
        ; le nombre n est dans bx
        ; la ligne se trouve dans si
        mov si, 0
        cmp bx, 0
        jz rl1 ; si bx = 0 erreur indice
        cmp bx, 50
        ja rl1 ; si bx > 50 erreur indice
        mov dl, 5
        mov ax, bx
        div dl
        cmp ah, 0
        jz rl2
        inc al    
        mov ah, 0
    rl2:mov si, ax
    rl1:ret
    endp
               
    ; retourne la colonne d'un nombre               
    
    RetColonne proc
        mov si, 0 ; si contient la colonne
        cmp bx, 0 
        jz rc1 ; si bx=0 aller a rc1 (erreur indicd alors quitter la procedure)
        cmp bx, 50
        ja rc1 ; si bx>50 aller a rc1
        mov ax, bx
        mov dl, 10
        div dl
        mov bl, ah ; bx contient le reste de division le nombre / 10
        mov ax, 6  ; al contient nombre de colonne
    rc2:inc si
        cmp bx, ax
        jz rc1
        inc si 
        cmp ax, 0
        jnz rc3
        mov ax, 10
    rc3:sub ax, 5
        cmp bx, ax
        jz rc1
        add ax, 6
        div dl
        mov al, ah
        mov ah, 0
        jmp rc2
    rc1:ret
    endp
    
    ; retourne le nombre d'une case noire d'une ligne et colonne
    
    RetNombre proc
        ; bh contient ligne et bl contient colonne
        ; si contient numero de la case noire de i et j
        ;verifier si i et j egal a 0 ou superieur a 10
        push bx 
        mov si, 0
        cmp bh, 0
        jz rn3
        cmp bh, 10
        ja rn3
        cmp bl, 0
        jz rn3
        cmp bl, 10
        ja rn3    
        mov al, bl
        add al, bh
        mov ah, 0
        mov cl, 2
        div cl
        cmp ah, 0 
        jz rn3 ; verifier si al pair(est_t_elle une case blanche ?)
        ; elle est une case noire on peut retourne le nombre
        dec bh
        mov ax, 0
        mov al, 5
        mul bh
        mov si, ax
    rn2:inc si
        sub bl, 2
        jz rn3 ; si zf = 1 <=> si bl = 0
        jns rn2 ; si sf = 0 <=> si bl > 0
    rn3:pop bx
        ret
    endp
    
    ; afficher la couleur d'une case
    
    CouleurCase proc
        ; bh contient ligne et bl contient colonne
        call Newl   
        mov cx, 1 ; cx est verifie est ce qu'il y a erreur d'indice, (cx = 1) => il n'y a pas erreur d'indice
        cmp bh, 0
        jz cc3
        cmp bh, 10
        ja cc3
        cmp bl, 0
        jz cc3
        cmp bl, 10
        ja cc3
        call RetNombre
        cmp si, 0
        jz cc1 ; aller a cc1 si est une case blanche
        lea dx, msgcn ; afficher une case noire
        mov ah, 9
        int 21h
        jmp cc2
    cc1:lea dx, msgcb ; afficher une case blanche
        mov ah, 9
        int 21h
        jmp cc2
    cc3:lea dx, msgerror ; afficher erreur d'indice
        mov ah, 9
        int 21h
        mov cx, 0 ; il y a erreur d'indice
    cc2:ret
    endp
    
    ; afficher l'etat de la case
    
    EtatPion proc
        ; bh contient ligne et bl contient colonne 
        mov cx, 1 ; cx est verifie est ce qu'il y a erreur d'indice, (cx = 1) => il n'y a pas erreur d'indice
        call Newl                                 
        mov cx, 1
        cmp bh, 0
        jz ep7
        cmp bh, 10
        ja ep7
        cmp bl, 0
        jz ep7
        cmp bl, 10
        ja ep7
        call RetNombre
        cmp si, 0 ; verifier est ce que une case blanche
        jnz ep1 ; si est indice d'une case noire
        lea dx, msgerr
        mov ah, 9
        int 21h   
        call Newl
        lea dx, msgerror1
        mov ah, 9
        int 21h
        mov cx, 0  ; c'est une case blanche
        jmp ep6 ; quitter
        ; cas d'une case noire
    ep1:dec si ; prend l'indice de tableau en memoire
        cmp byte ptr mat[si], 0 ; verifier est ce que une case noire libre
        jnz ep2
        lea dx, msgep1
        mov ah, 9
        int 21h
        jmp ep6
    ep2:cmp byte ptr mat[si], 1 ; verifier est ce que un pion noir
        jnz ep3
        lea dx, msgep2
        mov ah, 9
        int 21h
        jmp ep6
    ep3:cmp byte ptr mat[si], 2 ; verifier est ce que un pion blanc
        jnz ep4
        lea dx, msgep3
        mov ah, 9
        int 21h
        jmp ep6
    ep4:cmp byte ptr mat[si], 3 ; ; verifier est ce que une dame noire
        jnz ep5
        lea dx, msgep4
        mov ah, 9
        int 21h
        jmp ep6
    ep5:lea dx, msgep5 ; afficher est une dame blanche
        mov ah, 9
        int 21h
        jmp ep6
    ep7:lea dx, msgerror ; erreur d'indice
        mov ah, 9
        int 21h
        mov cx, 0 ; il y a erreur d'indice 
    ep6:ret
    endp
    
    ; affiche la possibilite d'un deplacement d'un pion
    
    DepPionPoss proc
        ; bx contient les indices de la case de depart
        ; dx contient les indices de la case d'arrive
        ; cl pend le resultat de la possibilite de deplacement
        ; ch prend l'etat de case (pion noir ou blanc)
        push bx
        push dx
        mov bp, sp
        call Newl
        call RetNombre ; retour nombre d'indices de debut
        cmp si, 0
        jz dpp1 ; erreur d'indice
        mov bx, [bp] ; bx prend dx
        call RetNombre ; retour nombre d'indices de fin
        cmp si, 0
        jz dpp1 ; erreur d'indice
        mov bx, word ptr [bp+2]
        mov dx, word ptr [bp]
        call RetNombre ; si prend l'indice de debut dans tableau  
        dec si ; prend l'indice du tableau en memoire
        cmp byte ptr mat[si], 0 ; verifier est ce que une case noire libre
        jz dpp2 ; aucun deplacement effectue
        cmp byte ptr mat[si], 3 ; verifier est ce que une case de dame noire
        jae dpp10 ; le deplacement juste pour les pions pas les dames 
        push si ; sauvegarde la valeur de si (l'indice de debut)
        mov bh, dh
        mov bl, dl
        call RetNombre ; si prend l'indice de fin dans tableau 
        dec si ; prend l'indice du tableau en memoire
        mov di, si ; di prend l'indice de fin dans tableau
        pop si ; retourne la valeur de si (l'indice de debut)
        cmp byte ptr mat[di], 0 ; verifier est ce que une case noire libre
        jnz dpp2 ; aucun deplacement effectue 
        ; cas ou peut etre deplacement possible avec des cas speciaux
        mov ch, 2 ; ici ch prend pion blanc
        cmp byte ptr mat[si], 1 ; verifier est ce que un pion noir
        jnz dpp3 ; n'est pas pion noir
        ; partie que la case de debut a un pion noir
        ; partie verification de 3 pions 
  dpp33:mov bx, word ptr [bp+2]
        mov dx, word ptr [bp]
        add si, 33
        cmp si, di
        jz dpp333 ; si le deplacement de 3 pion de distance 33
        sub si, 6
        cmp si, di
        jz dpp327 ; si le deplacement de 3 pion de distance 27
        add si, 4
        cmp si, di
        jz dpp331 ; si le deplacement de 3 pion de distance 31
        sub si, 2              
        cmp si, di
        jz dpp329 ; si le deplacement de 3 pion de distance 29
        ; partie verification de 2 pions
        sub si, 7
        cmp si, di
        jz dpp222 ; si le deplacement de 2 pion de distance 22
        sub si, 2
        cmp si, di
        jz dpp220 ; si le deplacement de 2 pion de distance 20
        sub si, 2
        cmp si, di
        jz dpp218 ; si le deplacement de 2 pion de distance 18
        ; partie verification d' 1 pion
        sub si, 9
        cmp si, di
        jz dpp8
        add si, 2
        cmp si, di
        jz dpp8
        sub si, 7 
        cmp si, di ; retourne au indice de debut
        jz dpp40 ; deplacement normale
        inc si
        cmp si, di
        jz dpp40
        inc si
        cmp si, di
        jnz dpp2 
        jmp dpp40
   dpp8:; cette partie dans cas d'un deplacement on a
        ; pion apres pion adverse apres case noire libre
        mov ax, 0
        mov cl, 2 
        add bh, dh
        add bl, dl
        mov al, bh
        div cl
        mov bh, al
        mov al, bl
        div cl
        mov bl, al
        call RetNombre 
        dec si ; prend l'indice de tableau en memoire
        cmp byte ptr mat[si], ch ; (ch=1)=>pion noir,(ch=2)=>pion blanc
        jnz dpp2 ; aucun deplacement effectue 
        jmp dpp41 ; deplacement possible
        ; partie que la case de debut a un pion blanc
        ; inverse les indices pour fonctionne comme cas de pion noir
   dpp3:pop dx
        pop bx
        push dx
        push bx 
        mov ch, 1
        mov ax, si
        mov si, di
        mov di, ax              
        jmp dpp33
 dpp327:mov di, 2
dpp3271:call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp2
        dec di
        jnz dpp3271 ; si le deplacement de 3 pion de distance 27 de forme 1 
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2
        mov cl, 31 ; deplacement de 3 pion de forme 1
        jmp dpp7 ; deplacement possible 
 dpp333:mov bx, word ptr [bp+2]
        mov di, 2
         ; si le deplacement de 3 pion de distance 33 de forme 1
dpp3331:call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp2
        dec di
        jnz dpp3331
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2
        mov cl, 32 ; deplacement de 3 pion de forme 2
        jmp dpp7 ; deplacement possible
         ; si le deplacement de 3 pion de distance 31 de forme 1
 dpp331:mov bx, word ptr [bp+2]
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp3312 ; si le deplacement de 3 pion de distance 31 de forme 2
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp3312
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp3312 ; si le deplacement de 3 pion de distance 31 de forme 2
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp3312
        call VerifPionAdverse2
        cmp cl, 1 
        jnz dpp3312
        mov cl, 36 ; deplacement de 3 pion de forme 6
        jmp dpp7 ; deplacement possible
dpp3312:mov bx, word ptr [bp+2]
        mov di, 2
dpp3312p:call VerifPionAdverse2
        cmp cl, 1
        jnz dpp3313 ; si le deplacement de 3 pion de distance 31 de forme 3
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp3313 ; si le deplacement de 3 pion de distance 31 de forme 2 
        dec di
        jnz dpp3312p
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp3313
        mov cl, 34 ; deplacement de 3 pion de forme 4
        jmp dpp7
dpp3313:mov bx, word ptr [bp+2]
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp2
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        mov cl, 38 ; deplacement de 3 pion de forme 8
        jmp dpp7
 dpp329:mov bx, word ptr [bp+2]
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp3292 ; si le deplacement de 3 pion de distance 29 forme 2
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp3292 ; si le deplacement de 3 pion de distance 29 forme 2
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp3292 ; si le deplacement de 3 pion de distance 29 forme 2
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp3292 
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp3292
        mov cl, 37 ; deplacement de 3 pion forme 7
        jmp dpp7
dpp3292:mov bx, word ptr [bp+2]
        mov di, 2
dpp3292p:call VerifPionAdverse1
        cmp cl, 1
        jnz dpp3293 ; si le deplacement de 3 pion de distance 29 forme 3
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp3293
        dec di
        jnz dpp3292p
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp3293
        mov cl, 33 ; deplacement 3 pion forme 3
        jmp dpp7  
dpp3293:mov bx, word ptr [bp+2]
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp2 
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp2
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2
        mov cl, 35 ; deplacement de 3 pion de forme 5
        jmp dpp7
 dpp218:mov bx, word ptr [bp+2]
        mov di, 2
dpp2181:call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp2
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2
        mov cl, 21 ; deplacement de 2 pion de forme 1
        jmp dpp7
 dpp222:mov bx, word ptr [bp+2]
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2 ; deplacement impossible
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp2
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2
        mov cl, 22 ; deplacement de 2 pion de forme 2
        jmp dpp7
 dpp220:mov bx, word ptr [bp+2]
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2202 ; si le deplacement de 2 pion de distance 20 forme 2
        call VerifCaseLibre1
        cmp cl, 1
        jnz dpp2202
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2202
        mov cl, 23 ; deplacement 2 pion forme 3
        jmp dpp7
dpp2202:mov bx, word ptr [bp+2]
        call VerifPionAdverse2
        cmp cl, 1
        jnz dpp2
        call VerifCaseLibre2
        cmp cl, 1
        jnz dpp2
        call VerifPionAdverse1
        cmp cl, 1
        jnz dpp2
        mov cl, 24 ; deplacement 2 pion forme 4
        jmp dpp7
  dpp40:mov cl, 1 ; deplacement possible normale
        jmp dpp7                    
  dpp41:mov cl, 11 ; deplacement d'un pion 
        jmp dpp7
   dpp2:mov cl, 0 ; deplacement impossible
        jmp dpp7 
  dpp10:mov cl, 3 ; deplacement impossible pour les dames
        jmp dpp7                     
   dpp1:mov cl, 2 ; erreur d'indice
   dpp7:pop dx
        pop bx
        ret
    endp
    
    ; verifier est ce que case libre a gauche de pion      
    
    VerifCaseLibre1 proc
    	inc bh
    	dec bl
    	call RetNombre   
    	mov cl, 1 ; retourne vrai
    	dec si
    	cmp byte ptr mat[si], 0
    	jz vcl1
    	mov cl, 0 ; inegalite
   vcl1:ret
    endp 
    
    ; verifier est ce que case libre a droite de pion
    	
    VerifCaseLibre2 proc
    	inc bh
    	inc bl
    	call RetNombre
    	mov cl, 1 ; retourne vrai
    	dec si
    	cmp byte ptr mat[si], 0
    	jz vcl2
    	mov cl, 0 ; inegalite
   vcl2:ret
    endp
    
    ; verifier est ce que la case a pion adverse a gauche de la case libre
    
    VerifPionAdverse1 proc
    	inc bh
    	dec bl
    	call RetNombre
    	mov cl, 1 ; retourne vrai
    	dec si
    	cmp byte ptr mat[si], ch
    	jz vpa1
    	mov cl, 0 ; inegalite
   vpa1:ret
    endp   
    
    ; verifier est ce que la case a pion adverse a droite de la case libre
    	
    VerifPionAdverse2 proc
    	inc bh
    	inc bl
    	call RetNombre 
    	mov cl, 1 ; retourne vrai
    	dec si
    	cmp byte ptr mat[si], ch
    	jz vpa2
    	mov cl, 0 ; inegalite
   vpa2:ret
    endp      
    
    ; fonction de faire le deplacement d'un pion
    
    DeplacePion proc
        ; bx contient les indices de la case de depart
        ; dx contient les indices de la case d'arrive
        ; cl contient le resultat de deplacement
        ; ch contient le pion adverse
        push bx
        push dx
        call DepPionPoss
        cmp cl, 0
        jz dp2 ; si le deplacement impossible
        cmp cl, 2
        jz dp1 ; si il y a erreur d'indice
        cmp cl, 3
        jz dp5 ; si le deplacement impossible pour les dames
        ; cas ou deplacement possible 
        mov bp, sp
        mov bx, word ptr [bp+2]
        mov dx, word ptr [bp]
        push cx 
        call RetNombre  
        dec si
        push si
        mov bx, dx
        call RetNombre
        dec si
        mov di, si ; di prend l'indice de la case d'arrive
        pop si
        mov dl, byte ptr mat[si] 
        mov byte ptr mat[si], 0
        mov byte ptr mat[di], dl
        cmp di, 45
        jae dp8
        cmp di, 5
        jb dp9 
        jmp dp10
    dp8:mov byte ptr mat[di], 3 ; le pion devient dame noire
        jmp dp10
    dp9:mov byte ptr mat[di], 4 ; le pion devient dame blanche                
   dp10:pop cx
        mov bx, word ptr [bp+2]
        mov dx, word ptr [bp]
        cmp ch, 2
        jnz dpb
   dp23:cmp cl, 1
        jz dp4 ; si un deplacement normale
        cmp cl, 11
        jnz dp11 ; si un deplacement d'un pion  
        mov ax, 0
        mov cl, 2 
        add bh, dh
        add bl, dl
        mov al, bh
        div cl
        mov bh, al
        mov al, bl
        div cl
        mov bl, al
        call AffDep1Pion
        jmp dp4 ; deplacement effectue ^_^
   dp11:cmp cl, 31
        jnz dp12 ; si ce n'est pas un deplacement de 3 pion forme 1
        inc bh
        dec bl
        call AffDep1Pion
        mov cx, 2
   dp31:add bh, 2
        sub bl, 2
        call AffDep1Pion
        loop dp31
        jmp dp4
   dp12:cmp cl, 32
        jnz dp13 ; si ce n'est pas un deplacement de 3 pion forme 2
        inc bh
        inc bl
        call AffDep1Pion
        mov cx, 2
   dp32:add bh, 2
        add bl, 2
        call AffDep1Pion
        loop dp32
        jmp dp4
   dp13:cmp cl, 33 
        jnz dp14 ; si ce n'est pas un deplacement de 3 pion forme 3
        inc bh
        dec bl
        call AffDep1Pion
        add bh, 2
        sub bl, 2
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4    
   dp14:cmp cl, 34 ; si ce n'est pas un deplacement de 3 pion forme 4 
        jnz dp15
        inc bh
        inc bl
        call AffDep1Pion
        add bh, 2
        add bl, 2
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4
   dp15:cmp cl, 35 
        jnz dp16 ; si ce n'est pas un deplacement de 3 pion forme 5
        inc bh
        inc bl
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        add bh, 2
        sub bl, 2
        call AffDep1Pion
        jmp dp4
   dp16:cmp cl, 36 ; si ce n'est pas un deplacement de 3 pion forme 6 
        jnz dp17
        inc bh
        dec bl
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        add bh, 2
        add bl, 2
        call AffDep1Pion
        jmp dp4  
   dp17:cmp cl, 37 ; si ce n'est pas un deplacement de 3 pion forme 7 
        jnz dp18
        inc bh
        dec bl
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4
   dp18:cmp cl, 38 ; si ce n'est pas un deplacement de 3 pion forme 8 
        jnz dp19
        inc bh
        inc bl
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4
   dp19:cmp cl, 21
        jnz dp20 ; si ce n'est pas un deplacement de 2 pion forme 1
        inc bh
        dec bl 
        call AffDep1Pion
        add bh, 2
        sub bl, 2
        call AffDep1Pion
        jmp dp4
   dp20:cmp cl, 22
        jnz dp21 ; si ce n'est pas un deplacement de 2 pion forme 2
        inc bh
        inc bl 
        call AffDep1Pion
        add bh, 2
        add bl, 2
        call AffDep1Pion
        jmp dp4
   dp21:cmp cl, 23
        jnz dp22 ; si ce n'est pas un deplacement de 2 pion forme 3
        inc bh
        dec bl 
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4
        ; ici un deplacement de 2 pion forme 4     
   dp22:inc bh
        inc bl 
        call AffDep1Pion
        add bh, 2
        call AffDep1Pion
        jmp dp4
    dpb:mov ax, bx
        mov bx, dx
        mov dx, ax
        jmp dp23
    dp4:call Newl 
        mov cx, 1 ; il n' y a pas d'erreur
        lea dx, msgdpe
        jmp dp7
    dp2:call Newl
        lea dx, msgdpi
        mov cx, 1 ; deplacement impossible mais il n'y a pas d'erreur
        jmp dp7
    dp1:call Newl
        lea dx, msgdpi
        mov ah, 9
        int 21h
        call Newl
        lea dx, msgerror
        mov ah, 9
        int 21h
        call Newl
        lea dx, msgor
        mov ah, 9
        int 21h 
        call Newl
        lea dx, msgerror1 
        mov cx, 0 ; il y a erreur
        jmp dp7
    dp5:call Newl
        lea dx, msgdpdi ; deplacement impossible pour les dames
    dp7:mov ah, 9
        int 21h
        pop dx
        pop bx
        ret
    endp 
    
    ; affecter deplacement d'un pion en case libre
                            
    AffDep1Pion proc
        call RetNombre
        dec si
        mov byte ptr mat[si], 0
        ret
    endp
                              
    ; afficher le menu de choix 
    
    Menu proc
        lea dx, msgm1 ; afficher la 1er partie de menu
        mov ah, 9
        int 21h
        lea dx, msgm2 ; afficher la 2eme partie de menu
        mov ah, 9
        int 21h
     m1:call Newl
        call Newl
        lea dx, msgch
        mov ah, 09
        int 21h
        mov ah, 1
        int 21h ; lire le choix
        sub al, 30h            
        ; verifier le choix
        cmp al, 0
        jz ch0
        cmp al, 1
        jz ch1
        cmp al, 2
        jz ch2
        cmp al, 3
        jz ch3
        cmp al, 4
        jz ch4
        cmp al, 5
        jz ch5
        cmp al, 6
        jz ch6
        cmp al, 7
        jz ch7
        cmp al, 8
        jz ch8 
        cmp al, 9
        jz ch9
        call Newl
        lea dx, msgerch ; erreur de choix
        mov ah, 9
        int 21h
        jmp m1
        ret
    endp
    
    ; desiner la matrice a l'ecran
    
    DessinMat proc  
        ; afficher les indices de colonnes
        lea dx, dmi
        mov ah, 9
        int 21h
        call Newl
        lea dx, dml
        mov ah, 9 
        int 21h
        call Newl
        ; ind prend l'indice du ligne sur l'ecran
        ; ind+1 prend l'indice du colonne sur l'ecran
        ; word ptr ind commence par la ligne 23 et la colonne 30 sur l'ecran
        ; afficher les indices des lignes (bh), bl contient les indices de colonnes par rapport la matrice du damier
        mov bh, 1 
        mov bl, 1    
  loop2:lea dx, espace
        mov ah, 9
        int 21h
        mov dl, bh
        add dl, 30h
        cmp dl, 3ah ; si dl = caractere de la tabe ASCII 40d => si dl=10
        jnz dm2
        mov dl, 31h
        mov ah, 2
        int 21h  
        mov dl, 30h
        mov ah, 2
        int 21h  
        mov dl, '|'
        mov ah, 2
        int 21h             
        jmp loop3
    dm2:mov ah, 2
        int 21h
        mov dl, ' '
        mov ah, 2
        int 21h
        mov dl, '|'
        mov ah, 2
        int 21h 
        ; afficher les elements de la matrice (tableau)
  loop3:push bx
        call RetNombre
        pop bx
        cmp si, 0 ; si la case est blanche
        jnz dm
        mov dl, 5 ; case blanche
        jmp dm9
     dm:dec si
        mov dl, byte ptr mat[si]
    dm9:call DCase
        inc byte ptr ind+1 ; passe a la colonne suivante de l'ecran
        inc bl ; inc la colonne de la matrice
        cmp bl, 11
        jnz loop3 ; si on a pas termine avec la ligne courante
        mov dl, '|'
        mov ah, 2
        int 21h
        call Newl 
        inc bh
        mov byte ptr ind+1, 1eh ; mettre a la colonne la valeur 30 de l'ecran
        mov bl, 1 
        cmp bh, 11
        jnz loop2
        lea dx, dml
        mov ah, 9
        int 21h 
        ret 
    endp
    
    ; dessiner la case avec couleurs
    
    DCase proc  
        ; cette procedure travail juste avec 1 seul caractere qui est dans dl
        ; sauvegarde les donnees precedants
        push es
        push cs
        pop es
        push ax
        push bx
        push cx
        push dx
        ; dl contient l'etat de la case
        ; bh numero de page sur l'ecran, cas normale on a sur la page 0 dans toute l'execution du programme
        ; bl prend la couleur de la place de caractere et le caractere 
        ; on mettre en bp la chaine que nous avons l'afficher
        mov ah, dl
        mov al, 1 ; pour int 10h
	    mov bh, 0 ; numero de page sur l'ecran
	    mov cx, 1 ; la taille de la chaine que nous avons afficher 
	    mov dl, byte ptr ind+1 ; la colonne sur l'ecran pour int 10h
	    mov dh, byte ptr ind ; la ligne sur l'ecran pour int 10h
        ; dessiner la case sur l'ecran et sa proprietes
        cmp ah, 0
        jnz p1 ; si n'est pas case noire libre 
        ; cas est une case noire libre
        lea bp, cmat1 ; mettre en bp une chaine
	    mov bl, 0000_0000b ; la couleur noire en arriere de caractere ( ) et aussi pour le caractere
        jmp p4
     p1:cmp ah, 1
        jnz p2 ; si n'est pas pion noir
        ; cas est une case de pion noir
        lea bp, cmat2 
        mov bl, 0000_1100b ; la couleur noire en arriere de caractere (o) et en rouge(light red) aussi pour le pion(a la place de noir)
        ; cas est une case de pion noir
        jmp p4
     p2:cmp ah, 2
        jnz p3 ; si n'est pas pion blanc
        ; cas est une case de pion blanc
        lea bp, cmat2
        mov bl, 0000_1111b ; la couleur noire en arriere de caractere (o) et en blanche aussi pour le pion
        jmp p4 
     p3:cmp ah, 3
        jnz p5 ; si n'est pas dame noire
        ; cas est une case de dame noire
        lea bp, cmat3
        mov bl, 0000_1100b ; la couleur noire en arriere de caractere (06h) et en rouge(light red) aussi pour la dame
        jmp p4
     p5:cmp ah, 4
        jnz p6 ; si n'est pas dame blanche 
        ; cas est une case de dame blanche
        lea bp, cmat3
        mov bl, 0000_1111b ; la couleur noire en arriere de caractere (06h) et en blanche pour la dame
        jmp p4
        ; cas est une case blanche
     p6:lea bp, cmat1
        mov bl, 1111_0000b ; la couleur noire en arriere de caractere ( ) et aussi pour le caractere        
        ; affichage de la case
     p4:mov ah, 13h
	    int 10h 
	    ;restauration des registres (les donnees precedentes)
	    pop dx
	    pop cx
	    pop bx
	    pop ax
	    pop es
	    ret 
	    ; chaines de caracteres
	    cmat1 db " " ; correspond a case noire ou blanche
        cmat2 db 0Fh ; correspond a pion noir ou blanc
        cmat3 db 06h ; correspond a dame noire ou blanche
    endp
    
    ; fonction mettre saut de ligne
    
    Newl proc
        lea dx, saut
        mov ah, 9
        int 21h
        ret
    endp
        
ends

end start ; set entry point and stop the assembler.                                           