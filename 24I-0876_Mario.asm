INCLUDE Irvine32.inc
includelib winmm.lib
PlaySoundA PROTO :PTR BYTE, :DWORD, :DWORD  ; Declare PlaySoundA manually
.data
bgmusic BYTE "bgmusic.wav",0
jumpSound db "jump.wav",0
coinSound db "coin.wav",0
gameovers db "gameover.wav",0
gamewon db "win.wav",0
gamedead db "death.wav",0
gameitsme db "itsme.wav",0
gameyeah db "yeah.wav",0
gameohno db "ohno.wav",0
gamefotress db "fotress.wav",0
gameenemy db "defeat.wav",0
gkick db "kick.wav",0
gamepower db "power.wav",0
gamebreak db "break.wav",0



highFileName   BYTE "highscore.txt",0
recordBuffer   BYTE 200 DUP(0)
lineBuffer     BYTE 10000 DUP(0)  ; Large buffer for multiple records
tempBuffer     BYTE 10000 DUP(0)  ; Temp buffer for sorting
promptName     BYTE "Enter your name: ",0
;playerName     BYTE 30 DUP(0)
msgNoFile      BYTE "No highscores found yet!",0
msgPressKey    BYTE "Press any key to continue...",0
hsHeader       BYTE "================ HIGH SCORES ====================",0
hsFormat       BYTE "Name: ",0
hsScore        BYTE " | Score: ",0
hsLevel        BYTE " | Level: ",0
hsDivider      BYTE "=================================================",0
hsRank         BYTE ". ",0

; Score array for sorting (max 50 entries)
scoreArray     DWORD 50 DUP(0)    ; scores
nameArray      BYTE 1500 DUP(0)   ; names (30 bytes each * 50)
levelArray     BYTE 50 DUP(0)     ; levels
entryCount     DWORD 0





power byte 0
head1 byte"                                         _        _                   ",0
head2 byte "   ___ _ _ ___ ___ ___    _____  __ ___|_|___   | |_ ___ ___ ___    ",0
head3 byte " |_ -| | | . | -_|  _|  |     ||. |  _| | . |  | . |  _| . |_ -|  ",0
head4 byte "|___|___|  _|___|_|    |_|_|_|___|_| |_|___|  |___|_| |___|___| ",0
head5 byte "       |_|                       plz marks dedain :)          ",0      
head6 byte "24-i0876 by Murtaza Mustafa",0
head7 byte "<START>                             ",0
head8 byte "<HIGHSCORE>                     ",0
head9 byte "<EXIT>            ",0
head10 byte "<RESUME>",0
head11 byte "GAME PAUSED",0
head13 byte "<i.INSTRUCTIONS>          ",0
player byte 'x'
h0  BYTE "                             ==================== SUPER Mario ====================                                      ",0
h1  BYTE "                      A fast-paced platformer game made entirely in MASM + Irvine32                                     ",0
h2  BYTE "------------------------------------------------------------------------------------------------------------------------",0
h3  BYTE "                                                   CONTROLS:                                                            ",0
h4  BYTE "                                                 D = Move Right                                                         ",0
h5  BYTE "                                                 A = Move Left                                                          ",0
h6  BYTE "                                                 W = Jump (5 tiles high)                                                ",0
h7  BYTE "                                                 S = Start Game                                                         ",0
h8  BYTE "                                                 P = Pause Game                                                         ",0
h9  BYTE "                                                 R = Resume Game                                                        ",0
h10 BYTE "                                                 X = Exit Game                                                          ",0
h11 BYTE "------------------------------------------------------------------------------------------------------------------------",0

h12 BYTE "                                                   GAME DETAILS:                                                        ",0
h13 BYTE "                                        '-' = Platforms  '=' & '*' = Blocks                                             ",0
h14 BYTE "                                                 'X'  = Player                                                          ",0
h15 BYTE "                                                  2 Levels Included                                                     ",0
h16 BYTE "------------------------------------------------------------------------------------------------------------------------",0

h17 BYTE "                                                   HIGHSCORE:                                                           ",0
h18 BYTE "                                                H = View Highscore                                                      ",0
h19 BYTE "                                                H = Exit Highscore                                                      ",0

h20 BYTE "========================================================================================================================",0

g0  BYTE "   _____             __  __ ______   ______ __     ___ _____ ______   ",0
g1  BYTE "  / ____|    /\\    |  \/  |  ____| |  __  |\ \    / /  ____|  __  \  ",0
g2  BYTE " | |  __    /  \\   | \  / | |__    | |  | | \ \  / /| |__  | |__) |  ",0
g3  BYTE " | | |_ |  / /\\\\  | |\/| |  __|   | |  | |  \ \/ / |  __| |  __ _/  ",0
g4  BYTE " | |__| | / ____ \\ | |  | | |____  | |__| |   \  /  | |____| | \ \   ",0
g5  BYTE "  \\____|/_/    \\_\|_|  |_|______| |______|    \/   |______|_|  \_\  ",0
g6  BYTE "                                                                      ",0
g7  BYTE "                          YOU LOST! try again !:(                     ",0
g8  BYTE "                        =========================                     ",0
g9  BYTE "                                                                      ",0
g10 BYTE 0

c0  BYTE "   _     _______  _       ________ _          _____    _____  __  __ _____  _      ______ _______ ______ _____    ",0
c1  BYTE "  | |    |  ____\\ \\    / /  ____| |        / ____|  / __ \\|  \/  |  __ \| |    |  ____|__   __|  ____|  __ \   ",0
c2  BYTE "  | |    | |___  \\ \\  / /| |__  | |       | |      | |  | || \  / | |__) | |    | |___    | |  | |__  | |  | |  ",0
c3  BYTE "  | |    |  ___|  \\ \\/ / |  __| | |       | |      | |  | ||  \/  |  ___/| |    |  ___|   | |  |  __| | |  | |  ",0
c4  BYTE "  | |____| |____   \\   /  | |____| |____   | |____  | |__| || |  | | |    | |____|______   | |  | |____| |__| |  ",0
c5  BYTE "  |______|______|   \\_/   |______|______|   \_____|  \____/ |_|  |_|_|    |______|______|  |_|  |______|_____/   ",0
c6  byte "                                                                                                                  ",0

w0  BYTE "  **     __   __  ___   _   _       __      __  ___   _  _      ",0
w1  BYTE "******   \ \ / / / _ \ | | | |      \ \    / / / _ \ | \| |  ***",0
w2  BYTE "          \   / | (_) || |_| |       \ \/\/ / | (_) || .  |  ***",0
w3  BYTE "           |_|   \___/  \___/    X    \_/\_/   \___/ |_|\_|     ",0
w4  BYTE "     **                                                         ",0
w5  BYTE "    ****                 Princess Rescued!! :)     | X! |        ",0
w6  BYTE "                      =========================                 ",0

msgPressX BYTE "Press m to menu...",0
                                                                                                

   strenimies byte "Enemies: ",0
    strScore BYTE "Your score is: ",0
    score dd 0,0
    strlive byte"LIVES:"
    live dd 3,0
    xPos BYTE 20
    yPos BYTE 26
    strlevel byte "LEVEL: "
    
    onground byte 1
    maxjump dd 5
    inputChar BYTE ?
  ; full level map: 27 rows (0–26), each 200 columns wide
  next byte 0;
  addlen dd 120
  totalsec dd 200
level0  BYTE "                                                                                                                        ",0
level1  BYTE "                                 ***                                                      **                            ",0
level2  BYTE "                               *******                                                   ****                           ",0
level3  BYTE "                             ************                                              ********                         ",0
level4  BYTE "                                                                                                                        ",0
level5  BYTE "                                                                                                                        ",0
level6  BYTE "                                                                                                                        ",0
level7  BYTE "                                                                                                                        ",0
level8  BYTE "                                            $$$$$$$              888                                                    ",0
level9  BYTE "                                                               8888888                            000                   ",0
level10 BYTE "               ***                                           88888888888                                                ",0
level11 BYTE "             *******                                                                   ---$$$-----------------          ",0
level12 BYTE "            *********                              HHH                                                                  ",0
level13 BYTE "                                                HHH000HHH                                                               ",0
level14 BYTE "                                          ------------------------                                                      ",0
level15 BYTE "                                                                                                                        ",0
level16 BYTE "                                                                          0                                             ",0
level17 BYTE "                                                                   ------------------------                             ",0
level18 BYTE "                                                                                                       =         =      ",0
level19 BYTE "                                                                                                     /   \      / \     ",0
level20 BYTE "                 0  0                       -----                        0                          /     \    /   \    ",0
level21 BYTE "                                            *****              ---------------                     /       \  /     \   ",0
level22 BYTE "                                        ---------------                                           /         \/       \  ",0                                                                                     
level23 BYTE "      =                       ---           =     =                                 >            /     \-/   \        \ ",0                                                                                   
level24 BYTE "    /   \                     ***      =  /   \  / \                           -----------      /     \\-//   \        \",0                                                                                  
level25 BYTE "   /     \    --------  ===   ***     / \/     \/   \                          *         *     /        =      \        ",0  
level26 BYTE "  /       \             ===   ***    /   \      \    \                         *         *    /         =       \       ",0
level27 BYTE "------  ------------------------------------------------     --------------------       --------------------------------",0   ;0Dh,0Ah, 
level28 BYTE "??????  ????????????????????????????????????????????????     ????????????????????       ????????????????????????????????",0
level29 BYTE "??????  ????????????????????????????????????????????????     ????????????????????       ????????????????????????????????",0
l0 BYTE "                                                                                                                        ",0
   BYTE "                                 ***                                                                                    ",0
   BYTE "                               *******                                                                                  ",0
   BYTE "                             ************                                                                               ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0  
   BYTE "                                       $$$$$$$$                                                                         ",0
   BYTE "                      00                                                                                                ",0
   BYTE "                  -----------                                      888                                                  ",0
   BYTE "                                                                 8888888                                                ",0
   BYTE "                                         ===                   88888888888                                              ",0
   BYTE "                                         ===                                                                            ",0
   BYTE "                                ------------------------                                                                ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                           ===                                                                                          ",0
   BYTE "                 000000    ===                                                                                          ",0
   BYTE "          --------------------------                                          =      =                                  ",0
   BYTE "                                           <                                 / \    / \                                 ",0                                                                                     
   BYTE "                                                                            /   \  /   \                                ",0                                                                                   
   BYTE "               \-/                        00000                            /     \/     \                               ",0                                                                                  
   BYTE "              \\-//            ------------------------------    ---      /       \      \                              ",0  
   BYTE "\               =      \ /                                       ***     /     (|  \      \                             ",0
   BYTE " \              =     \\+//         %                            ***    /       |   \      \                            ",0
   BYTE "------------------------------------------------------------------------------------------------------------------------",0 
   BYTE "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",0
   BYTE "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????",0


l10 BYTE "========================================================================================================================",0
   BYTE "=========================================================================00000000=======================================",0
   BYTE "=========================================================================00000000=======================================",0
   BYTE "=========================================================================00000000=======================================",0
   BYTE "=========================================================================00000000=======================================",0
   BYTE "======================================  000000000000000000000000000000HHH0000000000000000===============================",0
   BYTE "======================================  =================================$$$$---========================================",0
   BYTE "======================================  =================================       ========================================",0  
   BYTE "                    {                =  =                    =                                                          ",0
   BYTE "                    {                =  =                    {                --                                        ",0
   BYTE "                    {                {  =                    {                ==                                        ",0
   BYTE "                    {                {  {                    {            0   ==                                        ",0
   BYTE "                    {                {  {                    {           --                                             ",0
   BYTE "                    {                {  {                           0    ==                                             ",0
   BYTE "                                     {                          <  --    ==                                             ",0
   BYTE "                                     {                             ==                                                   ",0
   BYTE "                                                                   ==           >                                       ",0
   BYTE "    000000                0                                               ------------                                  ",0
   BYTE "   --------              000                                              ============                                  ",0
   BYTE "                        00000                    0000       ===========   ============                                  ",0
   BYTE "                                    -$$--$$      -----      ===========   ============                                  ",0
   BYTE "                                                 =====      ===========   ============                                  ",0                                                                                     
   BYTE "            ===         ------                   =====      ===========   ============                                  ",0                                                                                   
   BYTE "            ===         ======   \ /             =====      ===========   ============                       \ /        ",0                                                                                  
   BYTE "     000    ===         ======  \\L//            =====      ===========   ============                      \\@//       ",0  
   BYTE "------------------------      --------       --------------------------   ------------------$$$$$$$$$$------------------",0
   BYTE "========================      ========       ==========================   ==================          ==================",0
   BYTE "========================      ========       ==========================   ==================          ==================",0 
   BYTE "========================      ========       ==========================   ==================          ==================",0 
   BYTE "========================      ========       ==========================   ==================          ==================",0 

l20 BYTE "========================================================================================================================",0
   BYTE "=======================================================================0000000==========================================",0
   BYTE "=======================================================================0000000==========================================",0
   BYTE "=======================================================================0000000==========================================",0
   BYTE "=======================================================================         ========================================",0
   BYTE "=======================================================================         ========================================",0
   BYTE "=======================================================================  <      ========================================",0
   BYTE "=======================================================================$$$$$$$  ========================================",0  
   BYTE "        {           {                =  =                    =                                                          ",0
   BYTE "        {           {                =  =                    {                --                                        ",0
   BYTE "        {           {                {  =                    {                ==                                        ",0
   BYTE "        {                            {  {                    {          ---   ==                                        ",0
   BYTE "        {                            {  {                    {          ===                                             ",0
   BYTE "        {                            {  {                                                                               ",0
   BYTE "        {                                                           00                                                  ",0
   BYTE "        {                                                           ==                                                  ",0
   BYTE "        {                                                           ==                                                  ",0
   BYTE "        {                  0                     <                                                                      ",0
   BYTE "   &&&  {                 000                          -                                                                ",0
   BYTE "        {    0           00000                 0000          ===========  ====    000                                   ",0
   BYTE "        {    0                    $$$$$$$      ----          ===========  =====  -----                                  ",0
   BYTE "             0                                 ====          ===========  =====                                         ",0                                                                                     
   BYTE "            ===         ======                 ====          ===========  =====                               **  ***** ",0                                                                                   
   BYTE "            ===         ======                 ====          ===========  =====                >              *   (|  * ",0                                                                                  
   BYTE "     0000   ===         ======                 ====  #       ===========  =====           {{{{{!{{{{{         *    |! * ",0  
   BYTE "-----------------   ----      -------         --------------------------  =====  --------------------------  -----------",0
   BYTE "=================   ====      =======         ==========================  =====  =====                       ===========",0
   BYTE "=================   ====      =======         ==========================  =====  =====                       ===========",0 
   BYTE "=================   ====      =======         ==========================  =====  =====                       ===========",0 
   BYTE "=================   ====      =======         ==========================  =====  =====                       ===========",0


   l30 BYTE "========================================================================================================================",0
   BYTE "========================================================================================================================",0
   BYTE "========================================================================================================================",0
   BYTE "========================================================================================================================",0
   BYTE "========================================================================================================================",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0 
   BYTE "                                                                                                                        ",0
   BYTE "        {  {  {  {  {  {     {  {  {  {  {   {{{{   {   {  {   {         {{          (|                                 ",0
   BYTE "        {00{00{00{00{  {  {00{  {00{00{00{   {{{{000{   {00{000{         {{  00000    |                                 ",0
   BYTE "=====   =============  =======  ==========   ========   ========         ===============================================",0
   BYTE "                                             ========   ========   --    ===============================================",0  
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0                                                                       
   BYTE "            >     -------          <    >                   >    >                                                      ",0
   BYTE "===========================     =============    =====================        ======================           =========",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0
   BYTE "                                                                                                                        ",0

playerName BYTE 30 DUP(?)   ; space for max 19 characters + null terminator

rowsize=28
Colsizy=121
level dd 0;
lenlevel dd 0
inixpos byte 1
iniypos byte 26
changed byte 0

startTime   DWORD ?
currentTime DWORD ?
elapsedMS   DWORD ?
elapsedSec  DWORD ?
tenimies dd 7

strtime BYTE "Time: ", 0
time dd 0;
.code
main PROC

; Start looping background music

   
menujump:
 mov edi,offset bgmusic
 invoke PlaySoundA,edi, 0, 9
   call ClrScr
    call menu
    cmp inputChar,"x"
    je exitGame
    call Name1
   mov live,3
   mov score,0
   call ini
    call itsme
    call GetMseconds
    mov startTime, eax
    mov dl,0
    mov dh,0
   
gameLoop:
    cmp live,0
    jg yeslive
    call GameOver
    call SaveHighscore
    cmp inputChar,"m"
    je menujump
yeslive:

   cmp level,0
   jne changelevel
   call drawplayer
    mov bl,xPos
    cmp bl,118
   
    jl check2
 call updateplayer

    mov xpos,3
    mov ypos,26
    call drawplayer
  mov next,1
  call ClrScr
  call drawing
  call drawplayer
    jmp ok
    check2:
     cmp bl,2
     jne check6
     cmp next,1
     jne ok
     mov xpos,117
    mov ypos,26
     mov next,0
    call ClrScr
    call drawing
    call drawplayer
    jmp ok
  
  check6:
  cmp bl,6
  jne check7
  cmp ypos,28
  jne check3
  call updateplayer
    mov xpos,3
    mov ypos,10
  mov next,2
  mov onground,0
  call ClrScr
  call drawing
  call drawplayer
  jmp ok

  check7:
    cmp bl,87
    jne check3
    cmp next,2
    jne ok
     jne ok
     mov xpos,6
    mov ypos,24
     mov next,0
    call ClrScr
    call drawing
    call drawplayer

    jmp ok

    check3:

    cmp bl,80
     jne ok
     cmp next,1
     jne ok
     mov edi,offset gamefotress
     mov level,1
     mov inixpos,2
     mov iniypos,24
     mov next,0
     mov tenimies,6
     add score,1000
     call yeah
     call GetMseconds
     mov startTime, eax
     call levelcomplete
     call ini
      call itsme
    call GetMseconds
     mov startTime, eax
     invoke PlaySoundA,edi, 0, 9
    
    call drawplayer
    jmp ok




    changelevel:
   
     mov bl,xPos
    cmp bl,119
   
    jl check4
    call drawplayer
 call updateplayer

    mov xpos,3
    mov ypos,24
    call drawplayer
  mov next,1
  call ClrScr
  call drawing
  call drawplayer
    jmp ok
    check4:
     cmp bl,1
     jne check5
     cmp next,1
     jne ok
     mov xpos,117
    mov ypos,24
     mov next,0
    call ClrScr
    call drawing
    call drawplayer
    jmp ok

    check5:
    cmp bl,115
     jne ok
     cmp next,1
     jne ok
     add score,2000
     call yeah
     call youwon
     inc level
     call SaveHighscore
    cmp inputChar,"m"
    je menujump
    call ClrScr
    call drawing
    call drawplayer
    jmp ok



    
ok:
call drawscore
call calctime
cmp elapsedsec,201
jne notimedone
mov live,0
notimedone:
mov ebx,0
 
    call ReadKey 
    mov inputChar,al

    cmp inputChar,"e"
    je moveUp1
      
    cmp inputChar,"w"
    je moveUp
     
    ;cmp inputChar,"s"
    ;je moveDown

    cmp inputChar,"a"
    je moveLeft
    
    cmp inputChar,"d"
    je moveRight

 cmp inputChar,"p"
    je gamepause
 
    jmp gameLoop

; ---------- MOVEMENT ----------

moveUp1:
 mov maxjump,3
    call playJumpSound
    call moveu
    mov maxjump,5
    call downu
   invoke PlaySoundA,edi, 0, 9
   call calctime
  call drawscore

    jmp gameLoop

moveUp:
    call playJumpSound
    call moveu
    invoke PlaySoundA,edi, 0, 9
    call downu
  
  call calctime
  call drawscore
    jmp gameLoop

moveLeft:
call left
call downu
call calctime
  call drawscore
jmp gameLoop

moveRight:
  call right
  call downu
  call calctime
  call drawscore
jmp  gameLoop

gamepause:
call paused
cmp inputChar,"x"
    je exitGame
jmp  gameLoop

exitGame:
invoke PlaySoundA, 0, 0, 0  
call SaveHighscore
exit
main ENDP

; ------------------------------------------------------
;------------------------miv up------------------------
moveu proc uses ecx edx
 
mov ecx,maxjump
  
up:
     
     call UpdatePlayer
    call DrawPlayer
    call MyDelay
    call UpdatePlayer
    
    cmp yPos,1
    je noUp
    

    sub yPos,1
    call mydelay
    
    ; ------- non-blocking key check -------
    call ReadKey
    test al, al
    jz ContinueJump

    cmp al, "d"
    je AirRight

    cmp al, "a"
    je AirLeft

ContinueJump:
call collect
call stuck
call drawing
 call collision
    loop up
    jmp noUp


AirRight:
 
    call right
     call mydelay
   

   ; call right
   ; call mydelay
    jmp ContinueJump

AirLeft:
 
    call left
     call mydelay
   

   ; call left
   ; call mydelay
    jmp ContinueJump

   
 

 noUp:
  
   call stuck 
 mov onground,0
   call downu
    call collision
    call DrawPlayer
   call drawing
    call UpdatePlayer
    ret

moveu endp
;------------------------------------collect-------------------------------
collect proc uses eax ebx ecx esi edx

mov eax,0
 mov ecx,0
    mov ebx,0
   
cmp level,0
jne jump4
cmp next ,1
je part2
cmp next,2
je part4
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part4:
mov esi,offset l30
jmp l
jump4:
cmp next ,1
je part3
mov esi,offset l10
jmp l
part3:
mov esi,offset l20

l:


    movzx eax, yPos            
    mov bl, Colsizy            
    mul bl                      

    movzx ecx, xPos            
    add eax, ecx                

    mov dl, [esi + eax]      

    cmp dl, '0'                 
    jne nodone
   call playcoinSound
    add score, 200             
     mov dl,' '
    mov [esi + eax], dl
    call lmydelay
     invoke PlaySoundA,edi, 0, 9
    jmp Done
    nodone:
    cmp dl, '8'                 
    jne nodone1
    
    add score, 20              
    mov dl,' '
    mov [esi + eax], dl
   nodone1:
    cmp dl,'$'                
    jne nodone2
    inc ypos
    add score, 20             
    mov dl,'-'
    mov [esi + eax], dl
    jmp Done
    nodone2:
     cmp dl,'&'                 
    jne nodone3
    
    add live, 1             
    mov dl,' '
    mov [esi + eax], dl
    jmp Done
    nodone3:
    cmp dl,'{'                 
    jne nodone4
    sub live, 1             
    call ohno
    mov dl,' '
    mov [esi + eax], dl
    jmp Done
    nodone4:
      cmp dl,'@'                 
    jne nodone5
     mov dl,'~'
    mov [esi + eax], dl
    add live, 1
    add score,3000
    call yeah
    mov changed,1
    mov maxjump,6
    jmp Done
    nodone5:
     cmp dl,'~'                 
    jne nodone6
     mov dl,'@'
    mov [esi + eax], dl
    sub live, 1
    sub score,2000
    call ohno
    mov changed,0
    mov maxjump,5
    jmp Done
    nodone6:
    cmp dl,'%'                 
    jne nodone7
    mov dl,' '
    mov [esi + eax], dl
    call yeah
    mov player,'X'
    add maxjump,1
    call drawplayer
    jmp Done
    nodone7:
    cmp dl,'+'                
    jne nodone8
    mov dl,' '
    mov [esi + eax], dl
    call power1
    mov power,1
    jmp Done
    nodone8:
    cmp dl,'.'                 
    jne nodone9
    call kick
    push eax
    add eax,4
    mov [esi + eax], dl
    pop eax
    add score,100
    mov dl,' '
    mov [esi + eax], dl
    mov power,1
    jmp Done
    nodone9:
     cmp dl,'H' 
  
    jne nodone10
   
    mov dl,' '
    mov [esi + eax], dl
    call break
    jmp done
    nodone10:
    cmp dl,'L' 
    jne done
    add score,1000
    sub live,1
    call power1
    mov dl,' '
    mov [esi + eax], dl
    jmp done
Done:
    ret
collect endp
;----------------------------mov down---------------------------------
downu proc uses ecx eax ebx esi edx
mov eax,0
 mov ecx,0
    mov ebx,0
   
cmp level,0
jne jump4
cmp next ,1
je part2
cmp next,2
je part4
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part4:
mov esi,offset l30
jmp l
jump4:
cmp next ,1
je part3
mov esi,offset l10
jmp l
part3:
mov esi,offset l20

l:

   
    movzx eax, yPos
    inc eax        

    mov bl, Colsizy        
    mul ebx                   

    movzx ecx, xPos
    add eax, ecx             

    mov dl, [esi + eax]    

    cmp dl, '-' 

    je OnGround1  
    cmp dl,'='
    je Onground1
    mov onground, 0

FallLoop:
    call UpdatePlayer
    call DrawPlayer
    call MyDelay
    call UpdatePlayer

    ; re-check tile below before falling again
    movzx eax, yPos
    inc eax

    mov bl, Colsizy
    mul ebx

    movzx ecx, xPos
    add eax, ecx

    mov dl, [esi + eax]
    cmp dl, '-'
    je OnGround1
     cmp dl,'='
    je Onground1
    inc yPos                 

    

    
    call ReadKey
    test al, al
    jz ContinueFall

    cmp al, "d"
    je FallRight

    cmp al, "a"
    je FallLeft

ContinueFall:
call edefeat
call mydelay
    call drawing
    call collect
     call collision
      call calctime
    call drawscore
    cmp xpos,6
    jne l2
    cmp ypos,28
    jl l2
    jmp onground1
    l2:
     cmp ypos, 29
     jne FallLoop
     push edx
     mov edx,currenttime 
     call dead
     mov currenttime,edx
     pop edx
     sub live,1
     call ini
     
     
    jmp FallLoop

FallRight:
    call right
     call collision
    call mydelay
      
     call right
      call collision
     call mydelay
    jmp ContinueFall

FallLeft:
    call left
     call collision
    call mydelay
     
    call left
     call collision
    call mydelay
    jmp ContinueFall


  
OnGround1:
    mov onground, 1
    call DrawPlayer
    ret

downu endp


;------------------------------mov left-----------------------------------------
left proc uses eax ebx ecx
cmp changed,0
jne speacial
    call UpdatePlayer
    cmp xPos,1
    je noLeft
     
    sub xPos,1
     call collision
noLeft:
     call collect
     call stuck 
     call collision
     call drawing
    call DrawPlayer
    jmp ok
    speacial:
      call UpdatePlayer
    cmp xPos,199
    je noRight
    
    add xPos,1
     call collision
noRight:
call collect
   call stuck 
   call collision
   call drawing
   call DrawPlayer
  ok:
   ret
   left endp
;-----------------------------------------mov right-----------------------------------------------
right proc uses ecx ebx eax
   cmp changed,0
jne speacial
 call UpdatePlayer
    cmp xPos,199
    je noRight
     call collision
    add xPos,1
     call collision
noRight:
call collect
   call stuck 
   call collision
   call drawing
   call DrawPlayer
   
    jmp ok
    speacial:
     call UpdatePlayer
    cmp xPos,1
    je noLeft
     call collision
    sub xPos,1
     call collision
noLeft:
     call collect
     call stuck 
     call collision
     call drawing
    call DrawPlayer

   
  ok:
   ret
   right endp
; ---------- DRAW PLAYER ----------

DrawPlayer PROC uses eax edx
cmp power,0
jne  powerc
  mov eax,cyan+(blue*16)
    call SetTextColor
    jmp colorc
    powerc:
     mov eax,red+(blue*16)
    call SetTextColor
    colorc:
    mov eax,0
    mov al,xPos
    mov dl,al
    mov dh,yPos
    call Gotoxy
    mov al,player
    call WriteChar
    cmp level,0
    jne l2
    mov eax,white+(blue*16)
    call SetTextColor
    jmp l
    l2:
    mov eax,white+(8*16)
    call SetTextColor
    l:
    ret
DrawPlayer ENDP

; ---------- updateERASE PLAYER ----------

UpdatePlayer PROC uses eax edx
    mov al,xPos
   
    mov dl,al
    mov dh,yPos
    call Gotoxy
    mov al," "
    call WriteChar
    ret
UpdatePlayer ENDP

; ---------- DRAW GROUND ----------

;---------------------------dalay----------------------------------
MyDelay PROC uses ecx
    mov ecx,20000000; Adjust for timing 

MyDelayLoop:
 
   
    loop MyDelayLoop
  
    ret
MyDelay ENDP

lMyDelay PROC uses ecx
    mov ecx, 100000000; Adjust for timing

MyDelayLoop:
    loop MyDelayLoop

    ret
lMyDelay ENDP
;-----------------level---------------------------------------
levelone  proc uses ecx esi
cmp level,0
jne level04
cmp next ,1
je part2
cmp next,2
je part3
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part3:
mov esi,offset l30
l:
mov ecx,28
levels:
 mov edx, esi
    call WriteString
    add esi,lenlevel

loop levels
mov eax,white+(green*16)
    call SetTextColor
     mov edx, esi
    call WriteString
    add esi,lenlevel
     mov edx, esi
    call WriteString
  
mov eax,white+(blue*16)
    call SetTextColor
    jmp wecharliekirk

    level04:
    cmp next ,1
je part4
mov esi,offset l10
jmp lop
part4:
mov esi,offset l20
lop:
mov ecx,28
levels1:
 mov edx, esi
 call WriteString
 add esi,lenlevel

loop levels1
mov eax,12+(12*16)
    call SetTextColor
     mov edx, esi
    call WriteString
    add esi,lenlevel
     mov edx, esi
    call WriteString
  
mov eax,white+(blue*16)
call SetTextColor
wecharliekirk:

ret
levelone endp

;-----------------------------------menu------------------------------------
menu proc uses edx eax
afterinstruction:

call Clrscr
 mov eax,white+(blue*16)
    call SetTextColor
  mov dl,26
    mov dh,8
    call Gotoxy
    push edx
    mov edx, OFFSET head1
    call WriteString
    pop edx
     mov eax,red+(blue*16)
     call SetTextColor
    inc dl
    inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head2
    call WriteString
    pop edx
    mov eax,yellow+(blue*16)
     call SetTextColor
    inc dl
    inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head3
    call WriteString
    pop edx
     mov eax,red+(blue*16)
     call SetTextColor
    inc dl
    inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head4
    call WriteString
    pop edx
     mov eax,yellow+(blue*16)
     call SetTextColor
    inc dl
    inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head5
    call WriteString
    pop edx
     add dl,12
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head6
    call WriteString
    pop edx
     mov eax,yellow+(green*16)
     call SetTextColor
    add dl,3
     add dh,2
     call Gotoxy
     push edx
    mov edx, OFFSET head7
    call WriteString
    pop edx
      mov eax,white+(red*16)
     call SetTextColor
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head8
    call WriteString
    pop edx

     mov eax,green+(yellow*13)
     call SetTextColor
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head13
    call WriteString
    pop edx


     mov eax,lightblue+(lightGray*14)
     call SetTextColor
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head9
    call WriteString
    pop edx
   

show:
mov eax,0
 call ReadChar
  mov inputChar,al
  cmp inputChar,"s"
    je l2
    cmp inputChar,"x"
     je l2
      cmp inputChar,"i"
      jne lalkabotar
    call instructions
    jmp afterinstruction
lalkabotar:
cmp inputChar,"h"
jne show
call ShowHighscore
jmp afterinstruction
jmp show


l2:
 mov eax, lightMagenta + (black*16)
 call SetTextColor
call Clrscr

ret
menu endp
;--------------------------------------draw score and lives--------------------------------
   drawscore proc uses edx eax
    mov dl,0
    mov dh,0
    mov eax,0
    call Gotoxy
    mov edx,OFFSET strScore
    call WriteString
    mov eax,score
    call WriteInt
    mov al, 9      ; ASCII TAB
   call WriteChar
    mov edx,OFFSET strlive
    call WriteString
    mov eax,live
    call WriteInt
     mov al, 9      ; ASCII TAB
      call WriteChar
    mov edx,OFFSET strenimies
    call WriteString
    mov eax,tenimies
    call WriteInt
     mov al, 9      ; ASCII TAB
     call WriteChar
    mov edx,OFFSET strtime
    call WriteString
    mov eax,elapsedSec
    call WriteInt
    mov al, 9      ; ASCII TAB
    call WriteChar
      mov edx,OFFSET strlevel
    call WriteString
      mov eax,level
      add eax,1
    call WriteInt
    ret
   drawscore endp
   ;===============================================enemy deafeat====================================
   edefeat proc uses esi eax ebx ecx edx
  mov eax,0
 mov ecx,0
    mov ebx,0
   
cmp level,0
jne jump4
cmp next ,1
je part2
cmp next,2
je part4
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part4:
mov esi,offset l30
jmp l
jump4:
cmp next ,1
je part3
mov esi,offset l10
jmp l
part3:
mov esi,offset l20

l:

    movzx eax, yPos            
    ;inc eax
    mov bl, Colsizy            
    mul bl                       

    movzx ecx, xPos            
    add eax, ecx               

    mov dl, [esi + eax]     

    cmp dl, '>'               
    je f1
    
    cmp dl,'#'
    je f1
    cmp dl,'<'
    jne f
    je f1
    f1:
    sub tenimies,1
    add score,100
    call defeat
    cmp dl,'#'
    jne f67
    mov dl,'.'
    dec xpos
    mov [esi + eax],dl
    jmp f
    f67:
     mov dl,' '
    mov [esi + eax],dl
    f:
   ret 
   edefeat endp

   
   ;===============================================collision========================================
   collision proc  uses esi eax ebx ecx edx
   
    
mov eax,0
 mov ecx,0
    mov ebx,0
   
cmp level,0
jne jump4
cmp next ,1
je part2
cmp next,2
je part4
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part4:
mov esi,offset l30
jmp l
jump4:
cmp next ,1
je part3
mov esi,offset l10
jmp l
part3:
mov esi,offset l20

l:
    movzx eax, yPos             
    mov bl, Colsizy            
    mul bl                       

    movzx ecx, xPos            
    add eax, ecx               

    mov dl, [esi + eax]     

    cmp dl, '*'                
    je f1
    
    cmp dl,'='
    je f1
    cmp dl,'#'
    
    je h
    cmp dl,'>'
    
     je h
     cmp dl,'<'
    jne f
    je h
    h:
    sub live,1
    call ohno
    cmp changed,0
    jne f6
    cmp inputChar,"a"
    jne leftside1
    inc xpos
    jmp f1
    leftside1:
    dec xpos
    jmp f1
    f6:
    cmp inputChar,"a"
    jne rightside1
    dec xpos
    jmp f1
    rightside1:
    inc xpos
    jmp f1
    f1:
    cmp changed,0
    jne f5
    cmp inputChar,"a"
    jne leftside
    inc xpos
    inc xpos
    jmp f
    leftside:
    dec xpos
    dec xpos
    jmp f
    f5:
    cmp inputChar,"a"
    jne rightside
    dec xpos
    dec xpos
    jmp f
    rightside:
    inc xpos
    inc xpos
    f:
   ret 
   collision endp
   ;------------------------------------------------------stuck----------------------------------------
   stuck proc uses esi eax ebx ecx edx
    
mov eax,0
 mov ecx,0
    mov ebx,0
   
cmp level,0
jne jump4
cmp next ,1
je part2
cmp next,2
je part4
mov esi,offset level0
jmp l
part2:
mov esi,offset l0
jmp l
part4:
mov esi,offset l30
jmp l
jump4:
cmp next ,1
je part3
mov esi,offset l10
jmp l
part3:
mov esi,offset l20

l:
    movzx eax, yPos            
    mov bl, Colsizy            
    mul bl                       

    movzx ecx, xPos            
    add eax, ecx                

    mov dl, [esi + eax]     

    cmp dl, '-'                
    jne f
    dec ypos
    f:
    ret
   stuck endp

   ;-----------------------pause game--------------------------------------------------
   paused proc uses ecx edx ebx eax esi

    mov eax,white+(black*16)
    call SetTextColor
   
     mov dl,55
    mov dh,10
    call Gotoxy
    push edx
    mov edx, OFFSET head11
    call WriteString
    pop edx

    mov eax,cyan+(magenta*16)
     call SetTextColor
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head10
    call WriteString
    pop edx

   
    mov eax,cyan+(red*14)
     call SetTextColor
     inc dh
     call Gotoxy
     push edx
    mov edx, OFFSET head9
    call WriteString
    pop edx
    show:
mov eax,0
 call ReadChar
  mov inputChar,al
  cmp inputChar,"r"
    je l2
    cmp inputChar,"x"
     je l3
    
jmp show

l2:
cmp level,0
jne l4
mov eax,white+(blue*16)
call SetTextColor
jmp l3
l4:
mov eax,white+(8*16)
call SetTextColor
 call Clrscr
 call drawplayer
   call drawing
l3:
 call drawing
 ret 
paused endp
    


 ;   -============================initialze========================================
   ini proc uses eax edx ebx ecx esi edi
   cmp level,0
   jne l2
    mov eax,white+(blue*16)
    call SetTextColor
    jmp l
    l2:
    mov eax,white+(8*16)
    call SetTextColor
    l:
    call Clrscr
    mov next,0
    mov bl,inixpos
    mov xpos,bl
    mov bl,iniypos
    mov ypos,bl
    mov lenlevel,lengthof level0
    mov maxjump,5
    mov player,'x'
    call drawing
     call drawplayer
   ret
   ini endp

   ;=========================================instruction==========================
   instructions proc  uses edx ebx ecx esi edi eax
    mov eax,white+(blue*16)
    call SetTextColor
   call ClrScr

   mov edx, OFFSET h0
    call WriteString
    call Crlf

    mov edx, OFFSET h1
    call WriteString
    call Crlf

    mov edx, OFFSET h2
    call WriteString
    call Crlf

    mov edx, OFFSET h3
    call WriteString
    call Crlf

    mov edx, OFFSET h4
    call WriteString
    call Crlf

    mov edx, OFFSET h5
    call WriteString
    call Crlf

    mov edx, OFFSET h6
    call WriteString
    call Crlf

    mov edx, OFFSET h7
    call WriteString
    call Crlf

    mov edx, OFFSET h8
    call WriteString
    call Crlf

    mov edx, OFFSET h9
    call WriteString
    call Crlf

    mov edx, OFFSET h10
    call WriteString
    call Crlf

    mov edx, OFFSET h11
    call WriteString
    call Crlf

    mov edx, OFFSET h12
    call WriteString
    call Crlf

    mov edx, OFFSET h13
    call WriteString
    call Crlf

    mov edx, OFFSET h14
    call WriteString
    call Crlf

    mov edx, OFFSET h15
    call WriteString
    call Crlf

    mov edx, OFFSET h16
    call WriteString
    call Crlf

    mov edx, OFFSET h17
    call WriteString
    call Crlf

    mov edx, OFFSET h18
    call WriteString
    call Crlf

    mov edx, OFFSET h19
    call WriteString
    call Crlf

    mov edx, OFFSET h20
    call WriteString
    call Crlf
 show:
mov eax,0
 call ReadChar
  mov inputChar,al
  cmp inputChar,"i"
    je l2
jmp show
l2:
   ret
   instructions endp
   ;========================================literal draw level====================
   drawing proc  uses edx ebx ecx esi edi eax
    mov dl,0
    mov dh,0
    call Gotoxy
    call levelone
    call drawscore
   ret
   drawing endp
   ;=====================play sound==================
  
   playJumpSound proc uses edx ebx ecx esi edi eax
   invoke PlaySoundA,offset jumpsound, 0, 1
    ret
playJumpSound endp
;======play coin----
playcoinSound proc uses edx ebx ecx esi edi eax

   invoke PlaySoundA,offset coinsound, 0, 1
   mov ecx ,12
   l:
   call mydelay
   loop l
    ret
playcoinSound endp;
;============================gameover===============
GameOver PROC  uses edx ebx ecx esi edi eax
mov ebx,0
mov eax, white + (black * 16)
    call SetTextColor
    call Clrscr
     mov dl,20
    mov dh,5
    mov bl,dl
    mov bh,dh
    call Gotoxy

   mov edx, OFFSET g0
    call WriteString
   inc bh
   mov dh,bh
   mov dl,bl
   call Gotoxy
   
    mov edx, OFFSET g1
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy
    mov edx, OFFSET g2
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g3
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g4
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g5
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g6
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g7
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g8
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET g9
    call WriteString
    call Crlf

 

    ; Message
    inc dh
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET msgPressX
    call WriteString
    invoke PlaySoundA,0, 0, 0
    invoke PlaySoundA,offset gameovers, 0, 1
WaitKey:
    call ReadChar
    cmp al, 'm'

    jne WaitKey
    mov inputChar,'m'
     invoke PlaySoundA,0, 0, 0
    ret
GameOver ENDP
;===================================level completed=====================

levelcomplete PROC  uses edx ebx ecx esi edi eax
mov ebx,0
mov eax, lightmagenta + (cyan * 16)
    call SetTextColor
    call Clrscr
    mov eax, white + (red * 16)
    call SetTextColor
     mov dl,5
    mov dh,10
    mov bl,dl
    mov bh,dh
    call Gotoxy

   mov edx, OFFSET c0
    call WriteString
   inc bh
   mov dh,bh
   mov dl,bl
   call Gotoxy
   
    mov edx, OFFSET c1
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy
    mov edx, OFFSET c2
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET c3
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET c4
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET c5
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET c6
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy
    call Crlf
     invoke PlaySoundA,offset gamewon, 0, 1
     mov ecx,20
     l1:
     call lmydelay
     loop l1
     invoke PlaySoundA,0, 0, 0
    ret
levelcomplete ENDP

;========================================================================
Name1 PROC  uses edx ebx ecx esi edi eax
call Clrscr
   mov dl,20
   mov dh,5
   call Gotoxy
  
    mov edx, OFFSET promptName
    call WriteString      

    mov edx, OFFSET playerName
    mov ecx, 30            
    call ReadString        

    ret
Name1 ENDP
;=====================================you won shit=============================================
youwon PROC  uses edx ebx ecx esi edi eax
mov ebx,0
mov eax, white + (cyan * 16)
    call SetTextColor
    call Clrscr
    mov eax, white + (red * 16)
    call SetTextColor
     mov dl,30
    mov dh,8
    mov bl,dl
    mov bh,dh
    call Gotoxy

   mov edx, OFFSET w0
    call WriteString
   inc bh
   mov dh,bh
   mov dl,bl
   call Gotoxy
   
    mov edx, OFFSET w1
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy
    mov edx, OFFSET w2
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET w3
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET w4
    call WriteString
    inc bh
    mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET w5
    call WriteString
     inc bh
     mov dl,bl
   mov dh,bh
   call Gotoxy

    mov edx, OFFSET w6
    call WriteString
   
    call Crlf


    inc dh
    mov dl, 25
    call Gotoxy
    mov edx, OFFSET msgPressX
    call WriteString
    invoke PlaySoundA,offset gamewon, 0, 1
WaitKey:
    call ReadChar
    cmp al, 'm'

    jne WaitKey
    mov inputChar,'m'
     invoke PlaySoundA,0, 0, 0
    ret
youwon ENDP
;=================================mario is dead :)========
dead proc uses edx ebx ecx esi edi eax
 invoke PlaySoundA,offset gamedead, 0, 1
 mov ecx,23
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9
  ret
dead endp


itsme proc uses edx ebx ecx esi edi eax
invoke PlaySoundA,offset gameitsme, 0, 1
 mov ecx,19
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9
  ret
  itsme endp

yeah proc uses edx ebx ecx esi edi eax
invoke PlaySoundA,offset gameyeah, 0, 1
 mov ecx,10
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9
  ret
  yeah endp

  ohno proc uses edx ebx ecx esi edi eax
invoke PlaySoundA,offset gameohno, 0, 1
 mov ecx,12
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9
  ret
  ohno endp 

defeat proc uses edx ebx ecx esi edi eax
invoke PlaySoundA,offset gameenemy, 0, 1
 mov ecx,12
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9

  ret
  defeat endp 

  power1 proc uses edx ebx ecx esi edi eax
invoke PlaySoundA,offset gamepower, 0, 1
 mov ecx,12
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9

  ret
  power1 endp 

 kick proc uses edx ebx ecx esi edi eax
 invoke PlaySoundA,0, 0, 1
invoke PlaySoundA,offset gkick, 0, 3
 mov ecx,3
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9

  ret
  kick endp 

   break proc uses edx ebx ecx esi edi eax
 invoke PlaySoundA,0, 0, 1
invoke PlaySoundA,offset gamebreak, 0, 3
 mov ecx,3
 l:
 call lmydelay
 loop l
 
  invoke PlaySoundA,0, 0, 0
  invoke PlaySoundA,edi, 0, 9

  ret
  break endp 
  ;========================================calculate time==============================
  
  calctime proc uses edx eax ecx esi edi ebx
    call GetMseconds
    mov currentTime, eax

    mov eax, currentTime
    sub eax, startTime
    mov elapsedMS, eax

    mov eax, elapsedMS
    mov ebx, 1000
    xor edx, edx
    div ebx
    mov elapsedSec, eax
    ret
  calctime endp
;==========================================highscore baby==================================
; ==================== PROCEDURES ====================


ParseNumber PROC USES ebx ecx edx
    xor eax, eax        ; result = 0
    xor ebx, ebx        ; clear ebx
    
parse_loop:
    mov bl, [esi]
    cmp bl, '0'
    jb done_parse
    cmp bl, '9'
    ja done_parse
    
    ; result = result * 10 + digit
    mov ecx, 10
    mul ecx
    sub bl, '0'
    add eax, ebx
    inc esi
    jmp parse_loop
    
done_parse:
    ret
ParseNumber ENDP


LoadAndSortHighscores PROC USES eax ebx ecx edx esi edi

    ; Clear entry count
    mov entryCount, 0
    
    ; Open file
    mov edx, OFFSET highFileName
    call OpenInputFile
    cmp eax, -1
    je load_done
    
    mov ebx, eax        ; save handle
    
    ; Read entire file
    mov eax, ebx
    mov edx, OFFSET lineBuffer
    mov ecx, 10000
    call ReadFromFile
    
    cmp eax, 0
    je close_and_done
    
    push eax            ; save bytes read
    
    ; Null terminate
    mov esi, OFFSET lineBuffer
    pop ecx
    add esi, ecx
    mov BYTE PTR [esi], 0
    
    ; Close file
    mov eax, ebx
    call CloseFile
    
    ; Parse each line
    mov esi, OFFSET lineBuffer
    mov edi, 0      
    
parse_line_start:
    ; Check if we're at end
    mov al, [esi]
    cmp al, 0
    je sort_entries
    cmp al, 13
    je skip_char_parse
    cmp al, 10
    je skip_char_parse
    
    ; We have data - parse this entry
    ; Get pointer to name storage for this entry
    push edi
    mov eax, edi
    mov ebx, 30
    mul ebx
    lea edi, nameArray[eax]
    
    ; Copy name until '|'
copy_name_parse:
    mov al, [esi]
    cmp al, '|'
    je end_name_parse
    cmp al, 0
    je abort_entry
    cmp al, 13
    je abort_entry
    cmp al, 10
    je abort_entry
    mov [edi], al
    inc esi
    inc edi
    jmp copy_name_parse
    
end_name_parse:
    mov BYTE PTR [edi], 0   ; null terminate
    inc esi                 ; skip '|'
    pop edi                 ; restore entry index
    
    ; Parse score (number until '|')
    call ParseNumber        ; returns number in EAX, updates ESI
    mov ebx, edi
    shl ebx, 2
    mov scoreArray[ebx], eax
    
    ; Skip '|'
    cmp BYTE PTR [esi], '|'
    jne skip_to_next
    inc esi
    
    ; Parse level
    call ParseNumber
    mov levelArray[edi], al
    
    ; Move to next entry
    inc edi
    
skip_to_next:
    ; Skip to end of line
find_newline:
    mov al, [esi]
    cmp al, 0
    je sort_entries
    cmp al, 10
    je found_eol
    inc esi
    jmp find_newline
    
found_eol:
    inc esi
    jmp parse_line_start
    
abort_entry:
    pop edi
    jmp skip_to_next
    
skip_char_parse:
    inc esi
    jmp parse_line_start
    
sort_entries:
    mov entryCount, edi
    
    ; Bubble sort
    cmp edi, 2
    jb load_done
    
    mov ecx, edi
sort_outer:
    dec ecx
    cmp ecx, 0
    jle load_done
    
    xor edi, edi
sort_inner:
    cmp edi, ecx
    jge sort_outer
    
    ; Compare scores[edi] with scores[edi+1]
    mov ebx, edi
    shl ebx, 2
    mov eax, scoreArray[ebx]
    mov edx, scoreArray[ebx+4]
    
    cmp eax, edx
    jge no_swap_load
    
    ; Swap scores
    mov scoreArray[ebx], edx
    mov scoreArray[ebx+4], eax
    
    ; Swap levels
    mov al, levelArray[edi]
    mov dl, levelArray[edi+1]
    mov levelArray[edi], dl
    mov levelArray[edi+1], al
    
    ; Swap names
    push ecx
    push edi
    mov eax, edi
    mov ebx, 30
    mul ebx
    mov esi, eax
    add esi, OFFSET nameArray
    lea edi, [esi+30]
    mov ecx, 30
swap_chars:
    mov al, [esi]
    mov dl, [edi]
    mov [esi], dl
    mov [edi], al
    inc esi
    inc edi
    loop swap_chars
    pop edi
    pop ecx
    
no_swap_load:
    inc edi
    jmp sort_inner
    
close_and_done:
    mov eax, ebx
    call CloseFile
    
load_done:
    ret
LoadAndSortHighscores ENDP


ConvertDecToBuf PROC USES ebx ecx edx
    cmp eax, 0
    jne notZero
    mov BYTE PTR [edi], '0'
    inc edi
    mov eax, edi
    ret

notZero:
    xor ecx, ecx        ; digit count
    
convert_loop:
    xor edx, edx
    mov ebx, 10
    div ebx             ; EAX = EAX/10, EDX = remainder
    add dl, '0'
    push edx
    inc ecx
    test eax, eax
    jnz convert_loop

write_loop:
    pop edx
    mov [edi], dl
    inc edi
    loop write_loop

    mov eax, edi
    ret
ConvertDecToBuf ENDP


SaveHighscore PROC USES eax ebx ecx edx esi edi

    ; Build the record string in recordBuffer
    mov esi, OFFSET recordBuffer
    
    ; Copy player name
    mov edi, OFFSET playerName
copy_name:
    mov al, [edi]
    cmp al, 0
    je after_name
    mov [esi], al
    inc edi
    inc esi
    jmp copy_name

after_name:
    ; Add pipe separator
    mov BYTE PTR [esi], '|'
    inc esi

    ; Convert and write score
    mov eax, score
    mov edi, esi
    call ConvertDecToBuf
    mov esi, eax

    ; Add pipe separator
    mov BYTE PTR [esi], '|'
    inc esi

    ; Convert and write level (0 or 1)
    movzx eax, BYTE PTR level  ; zero-extend byte to dword
    mov edi, esi
    call ConvertDecToBuf
    mov esi, eax

    ; Add CR LF (newline)
    mov BYTE PTR [esi], 13
    inc esi
    mov BYTE PTR [esi], 10
    inc esi
    
    ; Calculate total length
    mov ecx, esi
    sub ecx, OFFSET recordBuffer

    ; Calculate total length to write
    mov ecx, esi
    sub ecx, OFFSET recordBuffer
    push ecx            

    ; Try to open existing file
    mov edx, OFFSET highFileName
    call OpenInputFile
    cmp eax, -1
    je create_new_file

    ; File exists - close it and reopen for append
    mov ebx, eax
    call CloseFile
    
    ; Read entire file into memory
    mov edx, OFFSET highFileName
    call OpenInputFile
    mov ebx, eax
    
   
    mov eax, ebx
    mov edx, OFFSET lineBuffer
    mov ecx, 10000
    call ReadFromFile
    push eax            ; save bytes read
    
    ; Close input file
    mov eax, ebx
    call CloseFile
    
    ; Create new file (overwrites old)
    mov edx, OFFSET highFileName
    call CreateOutputFile
    mov ebx, eax
    
    ; Write back old content
    pop ecx             ; bytes read
    cmp ecx, 0
    je write_new_record
    mov eax, ebx
    mov edx, OFFSET lineBuffer
    call WriteToFile
    
write_new_record:
    ; Write new record
    pop ecx             ; restore length
    mov eax, ebx
    mov edx, OFFSET recordBuffer
    call WriteToFile
    
    ; Close file
    mov eax, ebx
    call CloseFile
    jmp save_done

create_new_file:
    pop ecx             ; restore length
    mov edx, OFFSET highFileName
    call CreateOutputFile
    cmp eax, -1
    je save_failed
    mov ebx, eax
    
    ; Write the record
    mov eax, ebx
    mov edx, OFFSET recordBuffer
    call WriteToFile
    
    ; Close file
    mov eax, ebx
    call CloseFile

save_done:
save_failed:
    ret
SaveHighscore ENDP



ShowHighscore PROC USES eax ebx ecx edx esi edi
    mov eax,white (black* 16)
    call SetTextColor
    call Clrscr
    
   
    mov eax, white + ( blue* 16)
    call SetTextColor
    mov edx, OFFSET hsHeader
    call WriteString
    call Crlf
    mov edx, OFFSET hsDivider
    call WriteString
    call Crlf
   
    call LoadAndSortHighscores
    
    mov ecx, entryCount
    cmp ecx, 0
    je no_scores
    
    ; Display each entry
    mov edi,0       
    mov ebx, 1         
    
display_loop:
    cmp edi, ecx
    jge done_display
    
    ; Display rank number
    mov eax, ebx
    call WriteDec
    mov edx, OFFSET hsRank
    call WriteString
    
    ; Display "Name: "
    mov edx, OFFSET hsFormat
    call WriteString
    
    ; Display name
    push ebx
    push ecx
    mov eax, edi
    mov ebx, 30
    mul ebx
    lea edx, nameArray[eax]
    call WriteString
    pop ecx
    pop ebx
    
    ; Display " | Score: "
    mov edx, OFFSET hsScore
    call WriteString
    
    ; Display score
    push ebx
    push ecx
    mov eax, edi
    shl eax, 2
    mov eax, scoreArray[eax]
    call WriteDec
    pop ecx
    pop ebx
    
    ; Display " | Level: "
    mov edx, OFFSET hsLevel
    call WriteString
    
    ; Display level
    movzx eax, levelArray[edi]
    call WriteDec
    
    call Crlf
    
    inc edi
    inc ebx
    jmp display_loop

done_display:
    ; Display footer
    call Crlf
  
    mov edx, OFFSET hsDivider
    call WriteString
    call Crlf
    
 
    mov edx, OFFSET msgPressKey
    call WriteString
    call ReadChar
    ret

no_scores:
    mov eax, red + (blue * 16)
    call SetTextColor
    mov edx, OFFSET msgNoFile
    call WriteString
    call Crlf
    call Crlf
    mov eax, white + (blue * 16)
    call SetTextColor
    mov edx, OFFSET msgPressKey
    call WriteString
    call ReadChar
    ret

ShowHighscore ENDP

end main