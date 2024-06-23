Include irvine32.inc
includelib Winmm.lib

ExitProcess PROTO, dExitCode:DWORD

.data
    pacman_beginning db 'pacman_beginning.wav',0
    PlaySound PROTO, pszSound:PTR BYTE, hmod: DWORD, fdwSound: DWORD

    ;start
    prompt_gamename_1 byte "                               ****      **       ***         *     *     **     *     *                               ",10,0
    prompt_gamename_2 byte "                               *   *    *  *     *    *       **   **    *  *    **    *                               ",10,0
    prompt_gamename_3 byte "                               *   *   *    *   *             * * * *   *    *   * *   *                               ",10,0
    prompt_gamename_4 byte "                               ****    ******   *             *  *  *   ******   *  *  *                               ",10,0
    prompt_gamename_5 byte "                               *       *    *   *             *     *   *    *   *   * *                               ",10,0
    prompt_gamename_6 byte "                               *       *    *    *    *       *     *   *    *   *    **                               ",10,0
    prompt_gamename_7 byte "                               *       *    *     ***         *     *   *    *   *     *                               ",10,0
    prompt_gamestart byte 10, "Enter Your Name: ",0 
    playername BYTE 255 dup (?)
    namelength dd ?



    ;menu
    menu_prompt1 db 10,10,10,10,10,10,10,10,10,10,"                                                    1. Start                           ",10,0
    menu_prompt2 db "                                                    2. Option                          ",10,0
    menu_prompt3 db "                                                    3. Exit                            ",10,0
    menu_prompt4 db "Enter your choice: ",0

    ;EditMyFile
    filename BYTE "C:\COAL LAB 10\COAL LAB 10\myHighScore.txt",0
    file_handle HANDLE ?
    levelstr db " ",0
    scorestring db "  ",0
    comma db ",",0
    bar db "|",0

    ;endGame
    hello db "Hello ",0
    scorestr db "! Your Score is ",0

    ;options
    options_prompt1 db 10,10,10,10,10,10,10,10,10,10,"                                                    1. Instructions                           ",10,0
    options_prompt2 db "                                                    2. High Score                          ",10,0
    options_prompt3 db "                                                    3. Credits                          ",10,0
    options_prompt4 db "                                                    4. Play                             ",10,0
    options_prompt5 db "Enter your choice: ",0

    ;instructions
    instructions_prompt1 db 10,10,10,10,10,10,10,10,10,10,"                                           1. Movement using (A,S,W,D) keys                           ",10,0
    instructions_prompt2 db "                                           2. Stay away from ghosts                          ",10,0
    instructions_prompt3 db "                                           3. Speed increases with level                          ",10,0
    instructions_prompt4 db "                                           4. Enter '10' to go back                          ",10,0

    ;credits
    credits_prompt1 db 10,10,10,10,10,10,10,10,10,10,"                                           Name: Muhammad Bilal Khawar                           ",10,0
    credits_prompt2 db "                                           Roll Number: 22i-0786                          ",10,0
    credits_prompt3 db "                                           COAL PROJECT                          ",10,0
    credits_prompt4 db "                                           Enter '10' to go back                          ",10,0
    
    ;Pause
    pause_prompt1 db "Press P to Resume game",0

    ;generateMaze
    maze_prompt1  db "    ---                                                                         ",10,0
    maze_prompt2  db "    | |                                                                         ",10,0
    maze_prompt3  db "    | |                                                                         ",10,0
    maze_prompt4  db "    | |                                                                         ",10,0
    maze_prompt5  db "    | |                            ______________________________               ",10,0
    maze_prompt6  db "    | |                           |                              |              ",10,0
    maze_prompt7  db "    | |                            ------------------------------               ",10,0
    maze_prompt8  db "    | |________________                                                         ",10,0
    maze_prompt9  db "    |________________ |                             ___                         ",10,0
    maze_prompt10 db "                    | |                             | |                         ",10,0
    maze_prompt11 db "                    | |                             | |                         ",10,0
    maze_prompt12 db "                    ---                             | |                         ",10,0
    maze_prompt13 db "                                                    ---                         ",10,0
    maze_prompt14 db "                                                                                ",10,0
    maze_prompt15 db "                       ___                   ______________________             ",10,0
    maze_prompt16 db "                       | |                  |  __________________  |            ",10,0
    maze_prompt17 db "                       | |                  | |                  | |            ",10,0
    maze_prompt18 db "                       | |                  | |                  | |            ",10,0
    maze_prompt19 db "                       ---                  | |                  | |            ",10,0
    maze_prompt20 db "                                 ___________| |                  | |            ",10,0
    maze_prompt21 db "                                |             |                  | |            ",10,0
    maze_prompt22 db "                                 -------------                   | |            ",10,0
    maze_prompt23 db "                                                                 | |            ",10,0
    maze_prompt24 db "                                                                 | |            ",10,0
    maze_prompt25 db "                                                                 | |            ",10,0
    
    ;generateComplexMaze
    ComplexMaze_prompt1  db "    ---                                                                 ___     ",10,0
    ComplexMaze_prompt2  db "    | |       ___            _________________            ___           | |     ",10,0
    ComplexMaze_prompt3  db "    | |       | |           |  _____________  |           | |           | |     ",10,0
    ComplexMaze_prompt4  db "    | |       | |           | |_____________| |           | |           | |     ",10,0
    ComplexMaze_prompt5  db "    | |       ---           |_________________|           ---           | |     ",10,0
    ComplexMaze_prompt6  db "    | |                                                                 | |     ",10,0
    ComplexMaze_prompt7  db "    | |                                                                 | |     ",10,0
    ComplexMaze_prompt8  db "    | |_________________________             ___________________________| |     ",10,0
    ComplexMaze_prompt9  db "    |__________________________ |            |  __________________________|     ",10,0
    ComplexMaze_prompt10 db "                              | |            | |                                ",10,0
    ComplexMaze_prompt11 db "           ___                | |            | |                  ___           ",10,0
    ComplexMaze_prompt12 db "           | |                ---            ---                  | |           ",10,0
    ComplexMaze_prompt13 db "           | |                                                    | |           ",10,0
    ComplexMaze_prompt14 db "           ---                                                    ---           ",10,0
    ComplexMaze_prompt15 db "                       ___                          ___                         ",10,0
    ComplexMaze_prompt16 db "                       | |                          | |                         ",10,0
    ComplexMaze_prompt17 db "                       | |                          | |                         ",10,0
    ComplexMaze_prompt18 db "                       | |                          | |                         ",10,0
    ComplexMaze_prompt19 db "                       ---                          ---                         ",10,0
    ComplexMaze_prompt20 db "                                                                                ",10,0
    ComplexMaze_prompt21 db "         ______________________________________________________________         ",10,0
    ComplexMaze_prompt22 db "        |                                                              |        ",10,0
    ComplexMaze_prompt23 db "         --------------------------------------------------------------         ",10,0
    ComplexMaze_prompt24 db "                                                                                ",10,0
    ComplexMaze_prompt25 db "                                                                                ",10,0
	
    ;Level3 Maze
    Level3_maze_prompt1  db "                                             | |                                ",10,0
    Level3_maze_prompt2 db  "     ________________________________        | |        __________________      ",10,0
    Level3_maze_prompt3 db  "    |  ______________________________|       | |       | _________________|     ",10,0
    Level3_maze_prompt4 db  "    | |                                      | |       | |                      ",10,0
    Level3_maze_prompt5 db  "    | |                      __________      ---       | |                      ",10,0
    Level3_maze_prompt6 db  "    | |                     |___ ______|               | |       ___      ___   ",10,0
    Level3_maze_prompt7 db  "    | |                        | |                     | |       | |      | |   ",10,0
    Level3_maze_prompt8 db  "    | |_______________         | |                     | |       | |______| |   ",10,0
    Level3_maze_prompt9 db  "    |________________ |        | |                     | |       |          |   ",10,0
    Level3_maze_prompt10 db "                    | |        | |                     | |       |  ________|   ",10,0
    Level3_maze_prompt11 db "                    | |        | |_____________________| |       |  |           ",10,0
    Level3_maze_prompt12 db "                    | |        |_________________________|       |  |           ",10,0
    Level3_maze_prompt13 db "                    | |                                          |  |           ",10,0
    Level3_maze_prompt14 db "                    | |                                          |  |           ",10,0
    Level3_maze_prompt15 db "                    | |                    ______________________|  |           ",10,0
    Level3_maze_prompt16 db "        ____________| |                   |_________________________|           ",10,0
    Level3_maze_prompt17 db "       | _____________|                                                ___      ",10,0
    Level3_maze_prompt18 db "       | |                                                             | |      ",10,0
    Level3_maze_prompt19 db "       | |_________________________________                            | |      ",10,0
    Level3_maze_prompt20 db "       |___________________________________|                           | |      ",10,0
    Level3_maze_prompt21 db "                                                                       | |      ",10,0
    Level3_maze_prompt22 db "              ________________________        _________________________| |      ",10,0
    Level3_maze_prompt23 db "             |_______________________ |______| __________________________|      ",10,0
    Level3_maze_prompt24 db "                                    |__________|                                ",10,0
    Level3_maze_prompt25 db "                                                                                ",10,0
    


    ;Player Setup
    setup_prompt1 db "Chose a Character For PACMAN (Enter Number)",0
    setup_prompt2 db "                                        1. 'X'",0
    setup_prompt3 db "                                        2. 'A'",0
    setup_prompt4 db "                                        3. 'B'",0
    setup_prompt5 db "                                        4. 'C'",0
    setup_prompt6 db "                                        Your Choice: ",0
    chrChoice db 1
    playerchr db 'X'

    ;game1
	ground BYTE "------------------------------------------------------------------------------------------------------------------------",0
    ground1 BYTE "|",0ah,0
    ground2 BYTE "|",0
    space BYTE " ",0

    temp byte ?

    strScore BYTE "Your score is: ",0
    strLives BYTE "                    Lives: ",0
    strLevel BYTE "                    Level: ",0
    score BYTE 0
    lives BYTE 3
    level BYTE 1

    xPos BYTE 20
    yPos BYTE 20

    xCoinPos BYTE ?
    yCoinPos BYTE ?

    xCoinPos2 BYTE ?
    yCoinPos2 BYTE ?

    xCoinPos3 BYTE ?
    yCoinPos3 BYTE ?

    xCoinPos4 BYTE ?
    yCoinPos4 BYTE ?

    xCoinPos5 BYTE ?
    yCoinPos5 BYTE ?

    xFruitPos BYTE ?
    yFruitPos BYTE ?

    xGhostPos BYTE 40
    yGhostPos BYTE 14
    Ghost1_Direction BYTE 0   ;0 means left, 1 means right

    xGhostPos2 BYTE 25
    yGhostPos2 BYTE 3
    Ghost2_Direction BYTE 0   ;0 means down, 1 means up

    xGhostPos3 BYTE 40
    yGhostPos3 BYTE 8
    Ghost3_Direction BYTE 1   ;0 means left, 1 means right

    xGhostPos4 BYTE ?
    yGhostPos4 BYTE ?
    Ghost4_Direction BYTE 1   ;0 means down, 1 means up

    xGhostPos5 BYTE ?
    yGhostPos5 BYTE ?
    Ghost5_Direction BYTE 1   ;0 means left, 1 means right

    fruitVal BYTE 1           ;generate fruit when this value is 200
    fruitExist BYTE ?

    inputChar BYTE ?


.code
start PROC
    call clrscr
    
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf

    mov eax,green (black * 16)
    call SetTextColor

    mov edx, OFFSET prompt_gamename_1
	call writestring

    mov edx, OFFSET prompt_gamename_2
	call writestring

    mov edx, OFFSET prompt_gamename_3
	call writestring

    mov edx, OFFSET prompt_gamename_4
	call writestring

    mov edx, OFFSET prompt_gamename_5
	call writestring

    mov edx, OFFSET prompt_gamename_6
	call writestring

    mov edx, OFFSET prompt_gamename_7
	call writestring

    mov eax,white (black * 16)
    call SetTextColor

    mov edx, OFFSET prompt_gamestart
	call writestring

    mov edx, OFFSET playername
	mov ecx,255
	call readstring

    mov esi, OFFSET playername
	mov ebx, 0
	L1:
		inc ebx
		mov al, [esi]
		inc esi
		cmp al,0
		jne L1

	dec ebx
    mov namelength, ebx

    call crlf
    call crlf

;    call EditMyFile

    call WaitMsg
    ret
start ENDP

menu PROC

    call clrscr

    mov edx, OFFSET menu_prompt1
	call writestring

    mov edx, OFFSET menu_prompt2
	call writestring

    mov edx, OFFSET menu_prompt3
	call writestring

    mov edx, OFFSET menu_prompt4
	call writestring

    mov eax,0
	call readint

    cmp eax, 3
    je L3
    cmp eax, 2
    je L2
    cmp eax, 1
    je L1
    L1:
        call game
        jmp L4
    L2:
        call options
        jmp L4
    L3:
        call endGame
        jmp L4
    L4:
    ret
menu ENDP

EditMyFile PROC
    create_File:
        push 0
        push FILE_ATTRIBUTE_NORMAL
        push OPEN_ALWAYS
        push 0
        push 0
        push FILE_SHARE_WRITE
        push offset filename
        call CreateFileA
        jc endFun
        mov file_handle, eax

    set_file_pointer:
        push FILE_END
        push 0
        push 0
        push file_handle
        call SetFilePointer

    write_text_to_file:
;        push offset playername
;        call lstrlen

        push 0
        push 0
        push namelength
        push offset playername
        push file_handle
        call WriteFile

        push 0
        push 0
        push 1
        push offset comma
        push file_handle
        call WriteFile

        movzx eax, level
        add eax, 48
        mov esi, OFFSET levelstr
        mov [esi], eax

        push 0
        push 0
        push 1
        push offset levelstr
        push file_handle
        call WriteFile

        push 0
        push 0
        push 1
        push offset comma
        push file_handle
        call WriteFile

        movzx eax, score
        cmp score, 10
        jl L1
        jge L2

        L1:
            mov esi, OFFSET scorestring
            mov eax, 0
            add eax, 48
            mov [esi], eax
            inc esi
            movzx eax, score
            add eax, 48
            mov [esi], eax
            jmp L3
        L2:
            mov esi, OFFSET scorestring
            mov bl, 10
            div bl
            movzx ebx, al
            add ebx, 48
            mov [esi], ebx
            inc esi
            movzx ebx, ah
            add ebx, 48
            mov [esi], ebx
        L3:

        push 0
        push 0
        push 2
        push offset scorestring
        push file_handle
        call WriteFile

        push 0
        push 0
        push 1
        push offset bar
        push file_handle
        call WriteFile

        endFun:
    ret
EditMyFile ENDP


endGame PROC
    call clrscr

    mov eax,green (black * 16)
    call SetTextColor

    mov dh, 20
    mov dl, 40
    call gotoxy

    mov edx, OFFSET hello
    call WriteString

    mov edx, OFFSET playername
    call WriteString

    mov edx, OFFSET scorestr
    call WriteString

    movzx eax, score
    call WriteDec


    call EditMyFile

    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    call crlf
    mov eax,white (black * 16)
    call SetTextColor
    ret
endGame ENDP


options PROC

    call clrscr

    mov edx, OFFSET options_prompt1
	call writestring

    mov edx, OFFSET options_prompt2
	call writestring

    mov edx, OFFSET options_prompt3
	call writestring

    mov edx, OFFSET options_prompt4
	call writestring

    mov edx, OFFSET options_prompt5
	call writestring

    mov eax,0
	call readint

    cmp eax, 4
    je L4
    cmp eax, 3
    je L3
    cmp eax, 2
    je L2
    cmp eax, 1
    je L1
    L1:
        call instructions
        jmp L5
    L2:
        ;call highscore
        jmp L5
    L3:
        call credits
        jmp L5
    L4:
        call game
        jmp L5
    L5:

    ret
options ENDP

instructions PROC

    call clrscr

    mov edx, OFFSET instructions_prompt1
	call writestring

    mov edx, OFFSET instructions_prompt2
	call writestring

    mov edx, OFFSET instructions_prompt3
	call writestring

    mov edx, OFFSET instructions_prompt4
	call writestring

    mov eax,0
	call readint

    cmp eax, 10
    jne L1
    call menu

    L1:
    ret
instructions ENDP


credits PROC

    call clrscr

    mov edx, OFFSET credits_prompt1
	call writestring

    mov edx, OFFSET credits_prompt2
	call writestring

    mov edx, OFFSET credits_prompt3
	call writestring

    mov edx, OFFSET credits_prompt4
	call writestring

    mov eax,0
	call readint

    cmp eax, 10
    jne L1
    call menu

    L1:

    ret
credits ENDP


generateMaze PROC
    mov eax,yellow ;(black * 16)
    call SetTextColor

    call crlf
    call crlf

    mov edx, OFFSET maze_prompt1
    call writestring

    mov edx, OFFSET maze_prompt2
    call writestring

    mov edx, OFFSET maze_prompt3
    call writestring

    mov edx, OFFSET maze_prompt4
    call writestring

    mov edx, OFFSET maze_prompt5
    call writestring

    mov edx, OFFSET maze_prompt6
    call writestring

    mov edx, OFFSET maze_prompt7
    call writestring

    mov edx, OFFSET maze_prompt8
    call writestring

    mov edx, OFFSET maze_prompt9
    call writestring

    mov edx, OFFSET maze_prompt10
    call writestring

    mov edx, OFFSET maze_prompt11
    call writestring

    mov edx, OFFSET maze_prompt12
    call writestring

    mov edx, OFFSET maze_prompt13
    call writestring

    mov edx, OFFSET maze_prompt14
    call writestring

    mov edx, OFFSET maze_prompt15
    call writestring

    mov edx, OFFSET maze_prompt16
    call writestring

    mov edx, OFFSET maze_prompt17
    call writestring

    mov edx, OFFSET maze_prompt18
    call writestring

    mov edx, OFFSET maze_prompt19
    call writestring

    mov edx, OFFSET maze_prompt20
    call writestring

    mov edx, OFFSET maze_prompt21
    call writestring

    mov edx, OFFSET maze_prompt22
    call writestring

    mov edx, OFFSET maze_prompt23
    call writestring

    mov edx, OFFSET maze_prompt24
    call writestring

    mov edx, OFFSET maze_prompt25
    call writestring


    mov eax,white ;(black * 16)
    call SetTextColor
    ret
generateMaze ENDP

generateComplexMaze PROC
    mov eax,yellow ;(black * 16)
    call SetTextColor

    call crlf
    call crlf

    mov edx, OFFSET ComplexMaze_prompt1
    call writestring

    mov edx, OFFSET ComplexMaze_prompt2
    call writestring

    mov edx, OFFSET ComplexMaze_prompt3
    call writestring

    mov edx, OFFSET ComplexMaze_prompt4
    call writestring

    mov edx, OFFSET ComplexMaze_prompt5
    call writestring

    mov edx, OFFSET ComplexMaze_prompt6
    call writestring

    mov edx, OFFSET ComplexMaze_prompt7
    call writestring

    mov edx, OFFSET ComplexMaze_prompt8
    call writestring

    mov edx, OFFSET ComplexMaze_prompt9
    call writestring

    mov edx, OFFSET ComplexMaze_prompt10
    call writestring

    mov edx, OFFSET ComplexMaze_prompt11
    call writestring

    mov edx, OFFSET ComplexMaze_prompt12
    call writestring

    mov edx, OFFSET ComplexMaze_prompt13
    call writestring

    mov edx, OFFSET ComplexMaze_prompt14
    call writestring

    mov edx, OFFSET ComplexMaze_prompt15
    call writestring

    mov edx, OFFSET ComplexMaze_prompt16
    call writestring

    mov edx, OFFSET ComplexMaze_prompt17
    call writestring

    mov edx, OFFSET ComplexMaze_prompt18
    call writestring

    mov edx, OFFSET ComplexMaze_prompt19
    call writestring

    mov edx, OFFSET ComplexMaze_prompt20
    call writestring

    mov edx, OFFSET ComplexMaze_prompt21
    call writestring

    mov edx, OFFSET ComplexMaze_prompt22
    call writestring

    mov edx, OFFSET ComplexMaze_prompt23
    call writestring

    mov edx, OFFSET ComplexMaze_prompt24
    call writestring

    mov edx, OFFSET ComplexMaze_prompt25
    call writestring

    mov eax,white ;(black * 16)
    call SetTextColor
    ret
generateComplexMaze ENDP

generateLevel3Maze PROC
    mov eax,yellow ;(black * 16)
    call SetTextColor

    call crlf
    call crlf

    mov edx, OFFSET Level3_Maze_prompt1
    call writestring

    mov edx, OFFSET Level3_Maze_prompt2
    call writestring

    mov edx, OFFSET Level3_Maze_prompt3
    call writestring

    mov edx, OFFSET Level3_Maze_prompt4
    call writestring

    mov edx, OFFSET Level3_Maze_prompt5
    call writestring

    mov edx, OFFSET Level3_Maze_prompt6
    call writestring

    mov edx, OFFSET Level3_Maze_prompt7
    call writestring

    mov edx, OFFSET Level3_Maze_prompt8
    call writestring

    mov edx, OFFSET Level3_Maze_prompt9
    call writestring

    mov edx, OFFSET Level3_Maze_prompt10
    call writestring

    mov edx, OFFSET Level3_Maze_prompt11
    call writestring

    mov edx, OFFSET Level3_Maze_prompt12
    call writestring

    mov edx, OFFSET Level3_Maze_prompt13
    call writestring

    mov edx, OFFSET Level3_Maze_prompt14
    call writestring

    mov edx, OFFSET Level3_Maze_prompt15
    call writestring

    mov edx, OFFSET Level3_Maze_prompt16
    call writestring

    mov edx, OFFSET Level3_Maze_prompt17
    call writestring

    mov edx, OFFSET Level3_Maze_prompt18
    call writestring

    mov edx, OFFSET Level3_Maze_prompt19
    call writestring

    mov edx, OFFSET Level3_Maze_prompt20
    call writestring

    mov edx, OFFSET Level3_Maze_prompt21
    call writestring

    mov edx, OFFSET Level3_Maze_prompt22
    call writestring

    mov edx, OFFSET Level3_Maze_prompt23
    call writestring

    mov edx, OFFSET Level3_Maze_prompt24
    call writestring

    mov edx, OFFSET Level3_Maze_prompt25
    call writestring
    mov eax,white ;(black * 16)
    call SetTextColor
    ret
generateLevel3Maze ENDP


checkPacmanOnMaze_Upper PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET maze_prompt1

    sub eax, 3
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnMaze_Upper ENDP



checkPacmanOnMaze_Lower PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET maze_prompt1

    sub eax, 1
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnMaze_Lower ENDP


checkPacmanOnMaze_Left PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    sub ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnMaze_Left ENDP


checkPacmanOnMaze_Right PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnMaze_Right ENDP


CheckGhost4Collision_Left PROC
    cmp xGhostPos4, 1
    jne CanMoveLeft
    mov edx, 1
    jmp endMaze

    CanMoveLeft:

    movzx eax, yGhostPos4
    movzx ebx, xGhostPos4

    mov esi, OFFSET Level3_Maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xGhostPos4
    sub ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

CheckGhost4Collision_Left ENDP


CheckGhost4Collision_Right PROC
    cmp xGhostPos4, 79
    jne CanMoveRight
    mov edx, 1
    jmp endMaze

    CanMoveRight:

    movzx eax, yGhostPos4
    movzx ebx, xGhostPos4

    mov esi, OFFSET Level3_Maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xGhostPos4
    add ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

CheckGhost4Collision_Right ENDP

CheckGhost4Collision_Down PROC
    cmp yGhostPos4, 26
    jne CanMoveDown
    mov edx, 1
    jmp endMaze

    CanMoveDown:

    movzx eax, yGhostPos4
    movzx ebx, xGhostPos4

    mov esi, OFFSET Level3_Maze_prompt1

    sub eax, 1
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xGhostPos4
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

CheckGhost4Collision_Down ENDP

CheckGhost4Collision_Up PROC
    cmp yGhostPos4, 3
    jne CanMoveUp
    mov edx, 1
    jmp endMaze

    CanMoveUp:

    movzx eax, yGhostPos4
    movzx ebx, xGhostPos4

    mov esi, OFFSET Level3_Maze_prompt1

    sub eax, 3
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xGhostPos4
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

CheckGhost4Collision_Up ENDP

CheckGhost4Distance PROC
    mov edx, 0
    mov eax,0
    mov ebx,0
    ; Calculate squared distance between player and second ghost

    mov cl, xPos
    mov ch, xGhostPos4
    cmp cl, ch
    jg L1
    jle L2
    L1:
        mov al, cl
        sub al, ch
        jmp L3
    L2:
        mov al, ch
        sub al, cl
        jmp L3
    L3:

;    mov al, xGhostPos4
;    sub al, xPos
    imul eax, eax

    mov cl, yPos
    mov ch, yGhostPos4
    cmp cl, ch
    jg L4
    jle L5
    L4:
        mov al, cl
        sub al, ch
        jmp L6
    L5:
        mov al, ch
        sub al, cl
        jmp L6
    L6:

;    mov bl, yGhostPos4
;    sub bl, yPos

    imul ebx, ebx
    add eax, ebx

    cmp eax, 10
    jge L7
    mov edx, 1
    L7:
    ret

CheckGhost4Distance ENDP

checkGhostCollision PROC
    mov edx, 0
    mov al, xPos
    mov bl, xGhostPos
    cmp al, bl
    je L1
    jne L2

    L1:
        mov al, yPos
        mov bl, yGhostPos
        cmp al, bl
        jne L2
        mov edx, 1
        jmp L6
    L2:
        mov al, xPos
        mov bl, xGhostPos2
        cmp al, bl
        je L3
        jne L4

    L3:
        mov al, yPos
        mov bl, yGhostPos2
        cmp al, bl
        jne L4
        mov edx, 1
        jmp L6
    L4: 
        mov al, xPos
        mov bl, xGhostPos3
        cmp al, bl
        je L5
        jne L6

    L5:
        mov al, yPos
        mov bl, yGhostPos3
        cmp al, bl
        jne L6
        mov edx, 1
    L6: 
        ret
checkGhostCollision ENDP


checkGhostCollisionLevel3 PROC
    mov edx, 0
    mov al, xPos
    mov bl, xGhostPos
    cmp al, bl
    je L1
    jne L2

    L1:
        mov al, yPos
        mov bl, yGhostPos
        cmp al, bl
        jne L2
        mov edx, 1
        jmp L10
    L2:
        mov al, xPos
        mov bl, xGhostPos2
        cmp al, bl
        je L3
        jne L4

    L3:
        mov al, yPos
        mov bl, yGhostPos2
        cmp al, bl
        jne L4
        mov edx, 1
        jmp L10
    L4: 
        mov al, xPos
        mov bl, xGhostPos3
        cmp al, bl
        je L5
        jne L6

    L5:
        mov al, yPos
        mov bl, yGhostPos3
        cmp al, bl
        jne L6
        mov edx, 1
        jmp L10
    L6: 
        mov al, xPos
        mov bl, xGhostPos4
        cmp al, bl
        je L7
        jne L8

    L7:
        mov al, yPos
        mov bl, yGhostPos4
        cmp al, bl
        jne L8
        mov edx, 1
        jmp L10
    L8:
        mov al, xPos
        mov bl, xGhostPos5
        cmp al, bl
        je L9
        jne L10

    L9:
        mov al, yPos
        mov bl, yGhostPos5
        cmp al, bl
        jne L10
        mov edx, 1
        jmp L10
    L10: 
        ret
checkGhostCollisionLevel3 ENDP


PlayerSetup PROC
    
    call clrscr

    mov dh, 10
    mov dl, 40
    call gotoxy

    mov edx, OFFSET setup_prompt1
    call WriteString
    call crlf

    mov edx, OFFSET setup_prompt2
    call WriteString
    call crlf

    mov edx, OFFSET setup_prompt3
    call WriteString
    call crlf

    mov edx, OFFSET setup_prompt4
    call WriteString
    call crlf

    mov edx, OFFSET setup_prompt5
    call WriteString
    call crlf

    call crlf
    mov edx, OFFSET setup_prompt6
    call WriteString

    mov eax, 0
    call ReadInt
    mov chrChoice, al

    cmp chrChoice, 1
    jne L1
    mov playerchr, 'X'
    jmp endSetup

    L1:
        cmp chrChoice, 2
        jne L2
        mov playerchr, 'A'
        jmp endSetup

    L2:
        cmp chrChoice, 3
        jne L3
        mov playerchr, 'B'
        jmp endSetup
    L3:
        cmp chrChoice, 4
        jne L4
        mov playerchr, 'C'
        jmp endSetup
    L4:
    endSetup:
        ret
PlayerSetup ENDP

GhostCollisionWithFood PROC
    mov edx, 0
    mov al, xCoinPos
    mov bl, xGhostPos
    cmp al, bl
    je L1
    jne L2

    L1:
        mov al, yCoinPos
        mov bl, yGhostPos
        cmp al, bl
        jne L2
        mov edx, 1
        jmp L6
    L2:
        mov al, xCoinPos
        mov bl, xGhostPos2
        cmp al, bl
        je L3
        jne L4

    L3:
        mov al, yCoinPos
        mov bl, yGhostPos2
        cmp al, bl
        jne L4
        mov edx, 1
        jmp L6
    L4: 
        mov al, xCoinPos
        mov bl, xGhostPos3
        cmp al, bl
        je L5
        jne L6

    L5:
        mov al, yCoinPos
        mov bl, yGhostPos3
        cmp al, bl
        jne L6
        mov edx, 1
    L6:
    ret
GhostCollisionWithFood ENDP

game1 PROC
    call PlayerSetup

    mov xPos, 40
    mov yPos, 26

    mov xGhostPos, 40
    mov yGhostPos, 14
    mov Ghost1_Direction, 0

    mov xGhostPos2, 25
    mov yGhostPos2, 3
    mov Ghost2_Direction, 0
    
    mov xGhostPos3, 10
    mov yGhostPos3, 22
    mov Ghost3_Direction, 0

    call CreateRandomCoin
    call CreateRandomCoin2
    call CreateRandomCoin3
    call CreateRandomCoin4
    call CreateRandomCoin5

    call clrscr

    ResumeLabel:
    mov dh, 0
    mov dl, 0
    call gotoxy
    call clrscr
    call generateMaze

    ; draw ground at (0,27):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,27
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,25
    mov dh,2
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l1


    mov ecx,25
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,80
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2

    call DrawPlayer

    call DrawGhost

    
    

    call Randomize

    ;--------------------------------------------------------
    gameLoop:
        
        call DrawCoin
        call DrawCoin2
        call DrawCoin3
        call DrawCoin4
        call DrawCoin5
        cmp lives, 0
        je exitGame
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        cmp score, 5
        jl ScoreLess
            inc level
            jmp exitGame
        ScoreLess:
        call CreateRandomCoin
        call DrawCoin
        notCollecting:


        ; getting points2:
        mov bl,xPos
        cmp bl,xCoinPos2
        jne notCollecting2
        mov bl,yPos
        cmp bl,yCoinPos2
        jne notCollecting2
        ; player is intersecting coin:
        inc score
        cmp score, 5
        jl ScoreLess2
            inc level
            jmp exitGame
        ScoreLess2:
        call CreateRandomCoin2
        call DrawCoin2

        notcollecting2:


        ; getting points3:
        mov bl,xPos
        cmp bl,xCoinPos3
        jne notCollecting3
        mov bl,yPos
        cmp bl,yCoinPos3
        jne notCollecting3
        ; player is intersecting coin:
        inc score
        cmp score, 5
        jl ScoreLess3
            inc level
            jmp exitGame
        ScoreLess3:
        call CreateRandomCoin3
        call DrawCoin3

        notcollecting3:


        ; getting points4:
        mov bl,xPos
        cmp bl,xCoinPos4
        jne notCollecting4
        mov bl,yPos
        cmp bl,yCoinPos4
        jne notCollecting4
        ; player is intersecting coin:
        inc score
        cmp score, 5
        jl ScoreLess4
            inc level
            jmp exitGame
        ScoreLess4:
        call CreateRandomCoin4
        call DrawCoin4

        notcollecting4:


        ; getting points5:
        mov bl,xPos
        cmp bl,xCoinPos5
        jne notCollecting5
        mov bl,yPos
        cmp bl,yCoinPos5
        jne notCollecting5
        ; player is intersecting coin:
        inc score
        cmp score, 5
        jl ScoreLess5
            inc level
            jmp exitGame
        ScoreLess5:
        call CreateRandomCoin5
        call DrawCoin5

        notcollecting5:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteDec

        ;draw lives:
        mov edx,OFFSET strLives
        call WriteString
        mov al,lives
        call WriteDec

        ;draw level:
        mov edx,OFFSET strLevel
        call WriteString
        mov al,level
        call WriteDec

;        ; gravity logic:
;        gravity:
;        cmp yPos,27
;        jg onGround
;        ; make player fall:
;        call UpdatePlayer
;        inc yPos
;        call DrawPlayer
;        mov eax,80
;        call Delay
;        jmp gravity
;        onGround:
        
        ;Ghost1 Movement
        call UpdateGhost
        cmp Ghost1_Direction, 0
        je Ghost1_Left
        cmp xGhostPos, 50
        je NoRightGhost1
        inc xGhostPos
        jmp EndGhost1RightLabel
        
        NoRightGhost1:
            mov Ghost1_Direction, 0
            dec xGhostPos
        EndGhost1RightLabel:
            jmp EndGhost1MovementLabel

        Ghost1_Left:
            cmp xGhostPos, 25
            je NoLeftGhost1
            dec xGhostPos
            jmp EndGhost1MovementLabel

            NoLeftGhost1:
                mov Ghost1_Direction, 1
                inc xGhostPos
        EndGhost1MovementLabel:
            call DrawGhost
 ;           call GhostCollisionWithFood
 ;           cmp edx, 1
 ;           jne NoCollisionWithFood1
 ;           call DrawCoin

 ;           NoCollisionWithFood1:

        ;Ghost2 Movement
        call UpdateGhost2
        cmp Ghost2_Direction, 0
        je Ghost2_Down
        cmp yGhostPos2, 3
        je NoUpGhost2
        dec yGhostPos2
        jmp EndGhost2UpLabel
        
        NoUpGhost2:
            mov Ghost2_Direction, 0
            inc yGhostPos2
        EndGhost2UpLabel:
            jmp EndGhost2MovementLabel

        Ghost2_Down:
            cmp yGhostPos2, 13
            je NoDownGhost2
            inc yGhostPos2
            jmp EndGhost2MovementLabel

            NoDownGhost2:
                mov Ghost2_Direction, 1
                dec yGhostPos2
        EndGhost2MovementLabel:
            call DrawGhost2
;           call GhostCollisionWithFood
;           cmp edx, 1
;           jne NoCollisionWithFood2
;           call DrawCoin
;
;           NoCollisionWithFood2:

        ;Ghost3 Movement
        call UpdateGhost3
        cmp Ghost3_Direction, 0
        je Ghost3_Left
        cmp xGhostPos3, 30
        je NoRightGhost3
        inc xGhostPos3
        jmp EndGhost3RightLabel
        
        NoRightGhost3:
            mov Ghost3_Direction, 0
            dec xGhostPos3
        EndGhost3RightLabel:
            jmp EndGhost3MovementLabel

        Ghost3_Left:
            cmp xGhostPos3, 5
            je NoLeftGhost3
            dec xGhostPos3
            jmp EndGhost3MovementLabel

            NoLeftGhost3:
                mov Ghost3_Direction, 1
                inc xGhostPos3
        EndGhost3MovementLabel:
            call DrawGhost3
;           call GhostCollisionWithFood
;           cmp edx, 1
;           jne NoCollisionWithFood3
;           call DrawCoin
;
;           NoCollisionWithFood3:




        push eax
        mov al,180
        call delay
        pop eax
        ; get user key input:
        call ReadKey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je PauseLabel

        jmp nxt
        moveUp:
        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            call checkPacmanOnMaze_Upper
            cmp edx, 1
            je NoUp

            cmp yPos, 2
            jl NoUp
            je UpBoundry
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,10
            call Delay
            jmp NoUp
            UpBoundry:
            mov yPos, 2
            NoUp:
        loop jumpLoop

        


        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost1
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost1:
        jmp gameLoop

        moveDown:
        call checkPacmanOnMaze_Lower
        cmp edx, 1
        je NoDown

        cmp yPos, 26
        jg NoDown
        je DownBoundry
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        jmp NoDown
        DownBoundry:
        mov yPos, 26
        NoDown:
        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost2
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        NoCollisionWithGhost2:
        jmp gameLoop

        moveLeft:
        call checkPacmanOnMaze_Left
        cmp edx, 1
        je NoLeft

        cmp xPos, 1
        jl NoLeft
        je LeftBoundry
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp NoLeft
        LeftBoundry:
        mov xPos, 1
        NoLeft:
        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost3
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
        call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost3:
        jmp gameLoop

        moveRight:
        call checkPacmanOnMaze_Right
        cmp edx, 1
        je NoRight

        cmp xPos, 79
        jg NoRight
        je RightBoundry
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp NoRight
        RightBoundry:
        mov xPos, 79
        NoRight:
        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost4
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------

        NoCollisionWithGhost4:
        jmp gameLoop
    nxt:
    call checkGhostCollision
    cmp edx, 1
    jne NoCollisionInNXT
    call UpdatePlayer
    mov yPos, 26
    mov xPos, 40
    call DrawPlayer
    dec lives
    NoCollisionInNXT:
    jmp gameLoop

    PauseLabel:
        call clrscr
        mov eax,green (black * 16)
        call SetTextColor

        mov dh, 13
        mov dl, 47
        call gotoxy

        mov edx, OFFSET pause_prompt1
        call WriteString

        PauseInternal:
        call ReadChar
        mov inputChar,al

        cmp inputChar,"p"
        je ResumeLabel
        jmp PauseInternal

    exitGame:
;    call endGame
    call clrscr
    ret


    ;ret
game1 ENDP

checkPacmanOnComplexMaze_Upper PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 3
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnComplexMaze_Upper ENDP

checkPacmanOnComplexMaze_Lower PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 1
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnComplexMaze_Lower ENDP


checkPacmanOnComplexMaze_Left PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    sub ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnComplexMaze_Left ENDP


checkPacmanOnComplexMaze_Right PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnComplexMaze_Right ENDP

;------------------------------------------------------------------------------------------------------------------------------
game2 PROC

    mov xPos, 40
    mov yPos, 26

    mov xGhostPos, 40
    mov yGhostPos, 14
    mov Ghost1_Direction, 0

    mov xGhostPos2, 75
    mov yGhostPos2, 13
    mov Ghost2_Direction, 0
    
    mov xGhostPos3, 40
    mov yGhostPos3, 8
    mov Ghost3_Direction, 1

    call CreateRandomComplexCoin
    call CreateRandomComplexCoin2
    call CreateRandomComplexCoin3
    call CreateRandomComplexCoin4
    call CreateRandomComplexCoin5

    call clrscr

    ResumeLabel:
    mov dh, 0
    mov dl, 0
    call gotoxy
    call clrscr
    call generateComplexMaze

    ; draw ground at (0,27):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,27
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,25
    mov dh,2
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l1


    mov ecx,25
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,80
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2

    call DrawPlayer

    call DrawGhost

    call Randomize

    ;--------------------------------------------------------
    gameLoop:
        call DrawComplexFruit
        call DrawComplexCoin
        call DrawComplexCoin2
        call DrawComplexCoin3
        call DrawComplexCoin4
        call DrawComplexCoin5

        inc fruitVal
        cmp fruitExist, 1
        je NoFruitGeneration
        cmp fruitVal, 120
        jl NoFruitGeneration
        call CreateRandomComplexFruit
        call DrawComplexFruit
        mov fruitExist, 1
        mov fruitVal, 1

        NoFruitGeneration:

        cmp lives, 0
        je exitGame
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        call CreateRandomComplexCoin
        call DrawComplexCoin
        notCollecting:

        ; getting points2:
        mov bl,xPos
        cmp bl,xCoinPos2
        jne notCollecting2
        mov bl,yPos
        cmp bl,yCoinPos2
        jne notCollecting2
        ; player is intersecting coin:
        inc score
        call CreateRandomComplexCoin2
        call DrawComplexCoin2
        notCollecting2:

        ; getting points3:
        mov bl,xPos
        cmp bl,xCoinPos3
        jne notCollecting3
        mov bl,yPos
        cmp bl,yCoinPos3
        jne notCollecting3
        ; player is intersecting coin:
        inc score
        call CreateRandomComplexCoin3
        call DrawComplexCoin3
        notCollecting3:

        ; getting points4:
        mov bl,xPos
        cmp bl,xCoinPos4
        jne notCollecting4
        mov bl,yPos
        cmp bl,yCoinPos4
        jne notCollecting4
        ; player is intersecting coin:
        inc score
        call CreateRandomComplexCoin4
        call DrawComplexCoin4
        notCollecting4:

        ; getting points5:
        mov bl,xPos
        cmp bl,xCoinPos5
        jne notCollecting5
        mov bl,yPos
        cmp bl,yCoinPos5
        jne notCollecting5
        ; player is intersecting coin:
        inc score
        call CreateRandomComplexCoin5
        call DrawComplexCoin5
        notCollecting5:

        cmp fruitExist, 1
        jne FruitDoesNotExist
        mov bl,xPos
        cmp bl,xFruitPos
        jne notCollectingFruit
        mov bl,yPos
        cmp bl,yFruitPos
        jne notCollectingFruit
        ; player is intersecting coin:
        mov fruitExist, 0
        mov xFruitPos, 0
        mov yFruitPos, 0
        add score, 5
        notCollectingFruit:

        FruitDoesNotExist:

        cmp score, 20
        jl ScoreLess
            inc level
            jmp exitGame
        ScoreLess:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteDec

        ;draw lives:
        mov edx,OFFSET strLives
        call WriteString
        mov al,lives
        call WriteDec

        ;draw level:
        mov edx,OFFSET strLevel
        call WriteString
        mov al,level
        call WriteDec

;        ; gravity logic:
;        gravity:
;        cmp yPos,27
;        jg onGround
;        ; make player fall:
;        call UpdatePlayer
;        inc yPos
;        call DrawPlayer
;        mov eax,80
;        call Delay
;        jmp gravity
;        onGround:
        
        ;Ghost1 Movement
        call UpdateGhost
        cmp Ghost1_Direction, 0
        je Ghost1_Left
        cmp xGhostPos, 50
        jge NoRightGhost1
        inc xGhostPos
        jmp EndGhost1RightLabel
        
        NoRightGhost1:
            mov Ghost1_Direction, 0
            dec xGhostPos
        EndGhost1RightLabel:
            jmp EndGhost1MovementLabel
 
        Ghost1_Left:
            cmp xGhostPos, 25
            jle NoLeftGhost1
            dec xGhostPos
            jmp EndGhost1MovementLabel
 
            NoLeftGhost1:
                mov Ghost1_Direction, 1
                inc xGhostPos
        EndGhost1MovementLabel:
            call DrawGhost
 
        ;Ghost2 Movement
        call UpdateGhost2
        cmp Ghost2_Direction, 0
        je Ghost2_Down
        cmp yGhostPos2, 13
        jle NoUpGhost2
        dec yGhostPos2
        jmp EndGhost2UpLabel
        
        NoUpGhost2:
            mov Ghost2_Direction, 0
            inc yGhostPos2
        EndGhost2UpLabel:
            jmp EndGhost2MovementLabel
 
        Ghost2_Down:
            cmp yGhostPos2, 23
            jge NoDownGhost2
            inc yGhostPos2
            jmp EndGhost2MovementLabel
 
            NoDownGhost2:
                mov Ghost2_Direction, 1
                dec yGhostPos2
        EndGhost2MovementLabel:
            call DrawGhost2
 
 
        ;Ghost3 Movement
        call UpdateGhost3
        cmp Ghost3_Direction, 0
        je Ghost3_Left
        cmp xGhostPos3, 50
        jge NoRightGhost3
        inc xGhostPos3
        jmp EndGhost3RightLabel
        
        NoRightGhost3:
            mov Ghost3_Direction, 0
            dec xGhostPos3
        EndGhost3RightLabel:
            jmp EndGhost3MovementLabel
 
        Ghost3_Left:
            cmp xGhostPos3, 25
            jle NoLeftGhost3
            dec xGhostPos3
            jmp EndGhost3MovementLabel
 
            NoLeftGhost3:
                mov Ghost3_Direction, 1
                inc xGhostPos3
        EndGhost3MovementLabel:
            call DrawGhost3

        push eax
        mov al,100
        call delay
        pop eax

        ; get user key input:
        call ReadKey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je PauseLabel

        jmp nxt
        moveUp:
        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            call checkPacmanOnComplexMaze_Upper
            cmp edx, 1
            je NoUp

            cmp yPos, 2
            jl NoUp
            je UpBoundry
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,70
            call Delay
            jmp NoUp
            UpBoundry:
            mov yPos, 2
            NoUp:
        loop jumpLoop

        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost1
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost1:
        jmp gameLoop

        moveDown:
        call checkPacmanOnComplexMaze_Lower
        cmp edx, 1
        je NoDown

        cmp yPos, 26
        jg NoDown
        je DownBoundry
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        jmp NoDown
        DownBoundry:
        mov yPos, 26
        NoDown:
        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost2
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        NoCollisionWithGhost2:
        jmp gameLoop

        moveLeft:
        call checkPacmanOnComplexMaze_Left
        cmp edx, 1
        je NoLeft

        cmp xPos, 1
        jl NoLeft
        je LeftBoundry
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp NoLeft
        LeftBoundry:
        mov xPos, 1
        NoLeft:
        call checkGhostCollision
        cmp edx, 1
        jne NoCollisionWithGhost3
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost3:
        jmp gameLoop

        moveRight:
        call checkPacmanOnComplexMaze_Right
        cmp edx, 1
        je NoRight

        cmp xPos, 79
        jg NoRight
        je RightBoundry
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp NoRight
        RightBoundry:
        mov xPos, 79
        NoRight:
       call checkGhostCollision
       cmp edx, 1
       jne NoCollisionWithGhost4
       call UpdatePlayer
       mov yPos, 26
       mov xPos, 40
       call DrawPlayer
       dec lives
;      call UpdateGhost
;      mov yGhostPos, 14
;      mov xGhostPos, 40
;      call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost4:
        jmp gameLoop

    nxt:
    call checkGhostCollision
    cmp edx, 1
    jne NoCollisionInNXT
    call UpdatePlayer
    mov yPos, 26
    mov xPos, 40
    call DrawPlayer
    dec lives
    NoCollisionInNXT:
    jmp gameLoop

    PauseLabel:
        call clrscr
        mov eax,green (black * 16)
        call SetTextColor

        mov dh, 13
        mov dl, 47
        call gotoxy

        mov edx, OFFSET pause_prompt1
        call WriteString

        PauseInternal:
        call ReadChar
        mov inputChar,al

        cmp inputChar,"p"
        je ResumeLabel
        jmp PauseInternal


    exitGame:
    call clrscr

    ret
game2 ENDP

checkPacmanOnLevel3Maze_Upper PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 3
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnLevel3Maze_Upper ENDP



checkPacmanOnLevel3Maze_Lower PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 1
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnLevel3Maze_Lower ENDP


checkPacmanOnLevel3Maze_Left PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    sub ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnLevel3Maze_Left ENDP


checkPacmanOnLevel3Maze_Right PROC
    movzx eax, yPos
    movzx ebx, xPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    mul ebx
    add esi, eax

    movzx ebx, xPos
    add ebx, 1
    add esi, ebx
    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze
    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkPacmanOnLevel3Maze_Right ENDP

game3 PROC

    mov xPos, 40
    mov yPos, 26
    
    mov xGhostPos, 40
    mov yGhostPos, 15
    mov Ghost1_Direction, 0

    mov xGhostPos2, 76
    mov yGhostPos2, 16
    mov Ghost2_Direction, 0
    
    mov xGhostPos3, 50
    mov yGhostPos3, 19
    mov Ghost3_Direction, 1

    mov xGhostPos4, 4
    mov yGhostPos4, 16
    mov Ghost4_Direction, 1

    mov xGhostPos5, 42
    mov yGhostPos5, 5
    mov Ghost5_Direction, 0

    call CreateRandomLevel3Coin
    call CreateRandomLevel3Coin2
    call CreateRandomLevel3Coin3
    call CreateRandomLevel3Coin4
    call CreateRandomLevel3Coin5


    call clrscr

    ResumeLabel:
    mov dh, 0
    mov dl, 0
    call gotoxy
    call clrscr
    call generateLevel3Maze

    ; draw ground at (0,27):
    mov eax,blue ;(black * 16)
    call SetTextColor
    mov dl,0
    mov dh,27
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString
    mov dl,0
    mov dh,1
    call Gotoxy
    mov edx,OFFSET ground
    call WriteString

    mov ecx,25
    mov dh,2
    mov temp,dh
    l1:
    mov dh,temp
    mov dl,0
    call Gotoxy
    mov edx,OFFSET ground1
    call WriteString
    inc temp
    loop l1


    mov ecx,25
    mov dh,2
    mov temp,dh
    l2:
    mov dh,temp
    mov dl,80
    call Gotoxy
    mov edx,OFFSET ground2
    call WriteString
    inc temp
    loop l2

    ;Space for Secret Pocket
    mov dl,0
    mov dh, 13
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,0
    mov dh, 14
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,0
    mov dh, 15
    call gotoxy
    mov edx, OFFSET space
    call WriteString


    mov dl,80
    mov dh, 13
    call gotoxy
    mov edx, OFFSET space
    call WriteString
    
    mov dl,80
    mov dh, 14
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,80
    mov dh, 15
    call gotoxy
    mov edx, OFFSET space
    call WriteString




    mov dl,37
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,38
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,39
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,40
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,41
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,42
    mov dh, 1
    call gotoxy
    mov edx, OFFSET space
    call WriteString



    mov dl,37
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,38
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,39
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,40
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,41
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    mov dl,42
    mov dh, 27
    call gotoxy
    mov edx, OFFSET space
    call WriteString

    call DrawPlayer

    call DrawGhost
    call Randomize

    ;--------------------------------------------------------
    gameLoop:

        call DrawLevel3Coin
        call DrawLevel3Coin2
        call DrawLevel3Coin3
        call DrawLevel3Coin4
        call DrawLevel3Coin5
        call DrawLevel3Fruit
        inc fruitVal

        cmp fruitExist, 1
        je NoFruitGeneration
        cmp fruitVal, 120
        jl NoFruitGeneration

        call CreateRandomLevel3Fruit
        call DrawLevel3Fruit
        mov fruitExist, 1
        mov fruitVal, 1

        NoFruitGeneration:

        cmp lives, 0
        je exitGame
        ; getting points:
        mov bl,xPos
        cmp bl,xCoinPos
        jne notCollecting
        mov bl,yPos
        cmp bl,yCoinPos
        jne notCollecting
        ; player is intersecting coin:
        inc score
        call CreateRandomLevel3Coin
        call DrawLevel3Coin
        notCollecting:

        ; getting points2:
        mov bl,xPos
        cmp bl,xCoinPos2
        jne notCollecting2
        mov bl,yPos
        cmp bl,yCoinPos2
        jne notCollecting2
        ; player is intersecting coin:
        inc score
        call CreateRandomLevel3Coin2
        call DrawLevel3Coin2
        notCollecting2:

        ; getting points3:
        mov bl,xPos
        cmp bl,xCoinPos3
        jne notCollecting3
        mov bl,yPos
        cmp bl,yCoinPos3
        jne notCollecting3
        ; player is intersecting coin:
        inc score
        call CreateRandomLevel3Coin3
        call DrawLevel3Coin3
        notCollecting3:

        ; getting points4:
        mov bl,xPos
        cmp bl,xCoinPos4
        jne notCollecting4
        mov bl,yPos
        cmp bl,yCoinPos4
        jne notCollecting4
        ; player is intersecting coin:
        inc score
        call CreateRandomLevel3Coin4
        call DrawLevel3Coin4
        notCollecting4:

        ; getting points5:
        mov bl,xPos
        cmp bl,xCoinPos5
        jne notCollecting5
        mov bl,yPos
        cmp bl,yCoinPos5
        jne notCollecting5
        ; player is intersecting coin:
        inc score
        call CreateRandomLevel3Coin5
        call DrawLevel3Coin5
        notCollecting5:

        cmp fruitExist, 1
        jne FruitDoesNotExist
        mov bl,xPos
        cmp bl,xFruitPos
        jne notCollectingFruit
        mov bl,yPos
        cmp bl,yFruitPos
        jne notCollectingFruit
        ; player is intersecting coin:
        mov fruitExist, 0
        add score, 5
        mov yFruitPos, 0
        mov xFruitPos, 0
        notCollectingFruit:

        FruitDoesNotExist:
            mov bl,xPos
            cmp bl,xFruitPos
            jne nofruit
            mov bl,yPos
            cmp bl,yFruitPos
            jne nofruit
            ; player is intersecting coin:
            mov fruitExist, 0
            add score, 5
            mov yFruitPos, 0
            mov xFruitPos, 0
            nofruit:

;        cmp score, 25
;        jl ScoreLess
;            inc level
;            jmp exitGame
;        ScoreLess:
;        call CreateRandomComplexCoin
;        call DrawComplexCoin
;        notCollecting:

        mov eax,white (black * 16)
        call SetTextColor

        ; draw score:
        mov dl,0
        mov dh,0
        call Gotoxy
        mov edx,OFFSET strScore
        call WriteString
        mov al,score
        call WriteDec

        ;draw lives:
        mov edx,OFFSET strLives
        call WriteString
        mov al,lives
        call WriteDec

        ;draw level:
        mov edx,OFFSET strLevel
        call WriteString
        mov al,level
        call WriteDec

;        ; gravity logic:
;        gravity:
;        cmp yPos,27
;        jg onGround
;        ; make player fall:
;        call UpdatePlayer
;        inc yPos
;        call DrawPlayer
;        mov eax,80
;        call Delay
;        jmp gravity
;        onGround:
        
        ;Ghost1 Movement
        call UpdateGhost
        cmp Ghost1_Direction, 0
        je Ghost1_Left
        cmp xGhostPos, 50
        jge NoRightGhost1
        inc xGhostPos
        jmp EndGhost1RightLabel
        
        NoRightGhost1:
            mov Ghost1_Direction, 0
            dec xGhostPos
        EndGhost1RightLabel:
            jmp EndGhost1MovementLabel
 
        Ghost1_Left:
            cmp xGhostPos, 25
            jle NoLeftGhost1
            dec xGhostPos
            jmp EndGhost1MovementLabel
 
            NoLeftGhost1:
                mov Ghost1_Direction, 1
                inc xGhostPos
        EndGhost1MovementLabel:
            call DrawGhost
 
        ;Ghost2 Movement
        call UpdateGhost2
        cmp Ghost2_Direction, 0
        je Ghost2_Down
        cmp yGhostPos2, 12
        jle NoUpGhost2
        dec yGhostPos2
        jmp EndGhost2UpLabel
        
        NoUpGhost2:
            mov Ghost2_Direction, 0
            inc yGhostPos2
        EndGhost2UpLabel:
            jmp EndGhost2MovementLabel
 
        Ghost2_Down:
            cmp yGhostPos2, 25
            jge NoDownGhost2
            inc yGhostPos2
            jmp EndGhost2MovementLabel
 
            NoDownGhost2:
                mov Ghost2_Direction, 1
                dec yGhostPos2
        EndGhost2MovementLabel:
            call DrawGhost2
 
 
        ;Ghost3 Movement
        call UpdateGhost3
        cmp Ghost3_Direction, 0
        je Ghost3_Left
        cmp xGhostPos3, 65
        jge NoRightGhost3
        inc xGhostPos3
        jmp EndGhost3RightLabel
        
        NoRightGhost3:
            mov Ghost3_Direction, 0
            dec xGhostPos3
        EndGhost3RightLabel:
            jmp EndGhost3MovementLabel
 
        Ghost3_Left:
            cmp xGhostPos3, 30
            jle NoLeftGhost3
            dec xGhostPos3
            jmp EndGhost3MovementLabel
 
            NoLeftGhost3:
                mov Ghost3_Direction, 1
                inc xGhostPos3
        EndGhost3MovementLabel:
            call DrawGhost3

        ;Ghost4 Movement
        mov edx, 0
        
        call UpdateGhost4
        call CheckGhost4Distance
        cmp edx, 0
        je NoMovementForGhost4
        ; Calculate direction towards the player
        mov al, xPos
        sub al, xGhostPos4
        mov bl, yPos
        sub bl, yGhostPos4
    
        ; Adjust the sign of the movement based on player's position
        cmp al, 0
        jl moveGhostLeft
        jg moveGhostRight

        cmp bl, 0
        jl moveGhostUp
        jg moveGhostDown

        moveGhostLeft:
            ;add al,1
            call CheckGhost4Collision_Left
            cmp edx,1
            je collisionDetected
            ; Move the ghost towards the player (left)
            sub xGhostPos4, 1
            jmp updateAndDrawGhost

        moveGhostRight:
            ;add al,1
            call CheckGhost4Collision_Right
            cmp edx,1
            je collisionDetected
            ; Move the ghost towards the player (left)
            add xGhostPos4, 1
            jmp updateAndDrawGhost

        moveGhostDown:
            ;add al,1
            call CheckGhost4Collision_Down
            cmp edx,1
            je collisionDetected
            ; Move the ghost towards the player (left)
            add yGhostPos4, 1
            jmp updateAndDrawGhost

        moveGhostUp:
            ;add al,1
            call CheckGhost4Collision_Up
            cmp edx,1
            je collisionDetected
            ; Move the ghost towards the player (left)
            sub yGhostPos4, 1
            jmp updateAndDrawGhost

        collisionDetected:

        updateAndDrawGhost:
        NoMovementForGhost4:
   ;     cmp Ghost4_Direction, 0
   ;     je Ghost4_Down
   ;     cmp yGhostPos4, 11
   ;     jle NoUpGhost4
   ;     dec yGhostPos4
   ;     jmp EndGhost4UpLabel
   ;     
   ;     NoUpGhost4:
   ;         mov Ghost4_Direction, 0
   ;         inc yGhostPos4
   ;     EndGhost4UpLabel:
   ;         jmp EndGhost4MovementLabel
   ;
   ;     Ghost4_Down:
   ;         cmp yGhostPos4, 25
   ;         jge NoDownGhost4
   ;         inc yGhostPos4
   ;         jmp EndGhost4MovementLabel
   ;
   ;         NoDownGhost4:
   ;             mov Ghost4_Direction, 1
   ;             dec yGhostPos4
   ;     EndGhost4MovementLabel:
            call DrawGhost4
        

        ;Ghost5 Movement
        call UpdateGhost5
        cmp Ghost5_Direction, 0
        je Ghost5_Down
        cmp yGhostPos5, 2
        jle NoUpGhost5
        dec yGhostPos5
        jmp EndGhost5UpLabel
        
        NoUpGhost5:
            mov Ghost5_Direction, 0
            inc yGhostPos5
        EndGhost5UpLabel:
            jmp EndGhost5MovementLabel
 
        Ghost5_Down:
            cmp yGhostPos5, 11
            jge NoDownGhost5
            inc yGhostPos5
            jmp EndGhost5MovementLabel
 
            NoDownGhost5:
                mov Ghost5_Direction, 1
                dec yGhostPos5
        EndGhost5MovementLabel:
            call DrawGhost5

        push eax
        mov al,100
        call delay
        pop eax

        ; get user key input:
        call ReadKey
        mov inputChar,al

        ; exit game if user types 'x':
        cmp inputChar,"x"
        je exitGame

        cmp inputChar,"w"
        je moveUp

        cmp inputChar,"s"
        je moveDown

        cmp inputChar,"a"
        je moveLeft

        cmp inputChar,"d"
        je moveRight

        cmp inputChar,"p"
        je PauseLabel

        jmp nxt

        moveUp:
        ; allow player to jump:
        mov ecx,1
        jumpLoop:
            call checkPacmanOnLevel3Maze_Upper
            cmp edx, 1
            je UpLess

            cmp yPos, 2
            jl NoUp
            je UpBoundry
            call UpdatePlayer
            dec yPos
            call DrawPlayer
            mov eax,70
            call Delay
            jmp UpLess
            UpBoundry:
            mov yPos, 2
            NoUp:
                cmp xPos, 37
                jl UpLess
                cmp xPos, 42
                jg UpMore
                call UpdatePlayer
                mov yPos, 26
                call DrawPlayer
                UpLess:
                UpMore:
        loop jumpLoop

        call checkGhostCollisionLevel3
        cmp edx, 1
        jne NoCollisionWithGhost1
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
        ;----------------------------------------------------------------
        NoCollisionWithGhost1:
        jmp gameLoop

        moveDown:
        call checkPacmanOnLevel3Maze_Lower
        cmp edx, 1
        je DownLess

        cmp yPos, 26
        jg DownLess
        je DownBoundry
        call UpdatePlayer
        inc yPos
        call DrawPlayer
        jmp DownLess
        DownBoundry:
        mov yPos, 26
        NoDown:
            cmp xPos, 37
            jl DownLess
            cmp xPos, 42
            jg DownMore
            call UpdatePlayer
            mov yPos, 2
            call DrawPlayer
            DownLess:
            DownMore:

        call checkGhostCollisionLevel3
        cmp edx, 1
        jne NoCollisionWithGhost2
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        NoCollisionWithGhost2:
        jmp gameLoop

        moveLeft:
        call checkPacmanOnLevel3Maze_Left
        cmp edx, 1
        je LeftLess

        cmp xPos, 1
        jl NoLeft
        je LeftBoundry
        call UpdatePlayer
        dec xPos
        call DrawPlayer
        jmp LeftLess
        LeftBoundry:
        mov xPos, 1
        NoLeft:
            cmp yPos, 13
            jl LeftLess
            cmp yPos, 15
            jg LeftMore
            call UpdatePlayer
            mov xPos, 79
            call DrawPlayer
            LeftLess:
            LeftMore:

        call checkGhostCollisionLevel3
        cmp edx, 1
        jne NoCollisionWithGhost3
        call UpdatePlayer
        mov yPos, 26
        mov xPos, 40
        call DrawPlayer
        dec lives
;       call UpdateGhost
;       mov yGhostPos, 14
;       mov xGhostPos, 40
;       call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost3:
        jmp gameLoop

        moveRight:
        call checkPacmanOnLevel3Maze_Right
        cmp edx, 1
        je RightLess

        cmp xPos, 79
        jg NoRight
        je RightBoundry
        call UpdatePlayer
        inc xPos
        call DrawPlayer
        jmp RightLess
        RightBoundry:
        mov xPos, 79
        NoRight:
            cmp yPos, 13
            jl RightLess
            cmp yPos, 15
            jg RightMore
            call UpdatePlayer
            mov xPos, 1
            call DrawPlayer
            RightLess:
            RightMore:
       call checkGhostCollisionLevel3
       cmp edx, 1
       jne NoCollisionWithGhost4
       call UpdatePlayer
       mov yPos, 26
       mov xPos, 40
       call DrawPlayer
       dec lives
;      call UpdateGhost
;      mov yGhostPos, 14
;      mov xGhostPos, 40
;      call DrawGhost
;       call UpdateGhost2
;       mov yGhostPos2, 3
;       mov xGhostPos2, 25
;       call DrawGhost2
;       call UpdateGhost3
;       mov yGhostPos3, 22
;       mov xGhostPos3, 10
;       call DrawGhost3
        ;----------------------------------------------------------------
        NoCollisionWithGhost4:
        jmp gameLoop

    nxt:
    call checkGhostCollisionLevel3
    cmp edx, 1
    jne NoCollisionInNXT
    call UpdatePlayer
    mov yPos, 26
    mov xPos, 40
    call DrawPlayer
    dec lives
    NoCollisionInNXT:
    jmp gameLoop

    PauseLabel:
        call clrscr
        mov eax,green (black * 16)
        call SetTextColor

        mov dh, 13
        mov dl, 47
        call gotoxy

        mov edx, OFFSET pause_prompt1
        call WriteString

        PauseInternal:
        call ReadChar
        mov inputChar,al

        cmp inputChar,"p"
        je ResumeLabel
        jmp PauseInternal

    exitGame:
    call endGame

    ret

game3 ENDP

game PROC
    call game1
    cmp level, 2
    jl exitGame
    call game2
    cmp level, 3
    jl exitGame
    call game3

    exitGame:
    call endGame
    exit

game ENDP

DrawPlayer PROC
	; draw player at (xPos,yPos):
    mov eax,white (black * 16)
    call SetTextColor
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al,playerchr
	call WriteChar
	ret
DrawPlayer ENDP

DrawGhost PROC
	; draw ghost at (xGhostPos,yGhostPos):
    mov eax,red (black * 16)
    call SetTextColor
	mov dl,xGhostPos
	mov dh,yGhostPos
	call Gotoxy
	mov al,"G"
	call WriteChar
	ret
DrawGhost ENDP

DrawGhost2 PROC
	; draw ghost at (xGhostPos,yGhostPos):
    mov eax,red (black * 16)
    call SetTextColor
	mov dl,xGhostPos2
	mov dh,yGhostPos2
	call Gotoxy
	mov al,"G"
	call WriteChar
	ret
DrawGhost2 ENDP

DrawGhost3 PROC
	; draw ghost at (xGhostPos,yGhostPos):
    mov eax,red (black * 16)
    call SetTextColor
	mov dl,xGhostPos3
	mov dh,yGhostPos3
	call Gotoxy
	mov al,"G"
	call WriteChar
	ret
DrawGhost3 ENDP

DrawGhost4 PROC
	; draw ghost at (xGhostPos,yGhostPos):
    mov eax,magenta (black * 16)
    call SetTextColor
	mov dl,xGhostPos4
	mov dh,yGhostPos4
	call Gotoxy
	mov al,"G"
	call WriteChar
	ret
DrawGhost4 ENDP

DrawGhost5 PROC
	; draw ghost at (xGhostPos,yGhostPos):
    mov eax,red (black * 16)
    call SetTextColor
	mov dl,xGhostPos5
	mov dh,yGhostPos5
	call Gotoxy
	mov al,"G"
	call WriteChar
	ret
DrawGhost5 ENDP

UpdatePlayer PROC
	mov dl,xPos
	mov dh,yPos
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdatePlayer ENDP

UpdateGhost PROC
	mov dl,xGhostPos
	mov dh,yGhostPos
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdateGhost ENDP

UpdateGhost2 PROC
	mov dl,xGhostPos2
	mov dh,yGhostPos2
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdateGhost2 ENDP

UpdateGhost3 PROC
	mov dl,xGhostPos3
	mov dh,yGhostPos3
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdateGhost3 ENDP

UpdateGhost4 PROC
	mov dl,xGhostPos4
	mov dh,yGhostPos4
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdateGhost4 ENDP

UpdateGhost5 PROC
	mov dl,xGhostPos5
	mov dh,yGhostPos5
	call Gotoxy
	mov al," "
	call WriteChar
	ret
UpdateGhost5 ENDP

DrawCoin PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos
	mov dh,yCoinPos
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawCoin ENDP


checkCoinInMaze_UpDown PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInMaze_UpDown ENDP
    

checkCoinInMaze_RightLeft PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInMaze_RightLeft ENDP

checkCoinOnMaze PROC
    movzx eax, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoinOnMaze ENDP

CreateRandomCoin PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos,al
    call checkCoinInMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoinInMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoinOnMaze
    cmp edx, 1
    je L1
	ret
CreateRandomCoin ENDP

DrawCoin2 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos2
	mov dh,yCoinPos2
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawCoin2 ENDP


checkCoin2InMaze_UpDown PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InMaze_UpDown ENDP
    

checkCoin2InMaze_RightLeft PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos2
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InMaze_RightLeft ENDP

checkCoin2OnMaze PROC
    movzx eax, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos2
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2OnMaze ENDP

CreateRandomCoin2 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos2,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos2,al
    call checkCoin2InMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin2InMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin2OnMaze
    cmp edx, 1
    je L1
	ret
CreateRandomCoin2 ENDP

DrawCoin3 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos3
	mov dh,yCoinPos3
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawCoin3 ENDP


checkCoin3InMaze_UpDown PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InMaze_UpDown ENDP
    

checkCoin3InMaze_RightLeft PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos3
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InMaze_RightLeft ENDP

checkCoin3OnMaze PROC
    movzx eax, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos3
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3OnMaze ENDP

CreateRandomCoin3 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos3,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos3,al
    call checkCoin3InMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin3InMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin3OnMaze
    cmp edx, 1
    je L1
	ret
CreateRandomCoin3 ENDP

DrawCoin4 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos4
	mov dh,yCoinPos4
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawCoin4 ENDP


checkCoin4InMaze_UpDown PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InMaze_UpDown ENDP
    

checkCoin4InMaze_RightLeft PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos4
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InMaze_RightLeft ENDP

checkCoin4OnMaze PROC
    movzx eax, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos4
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4OnMaze ENDP

CreateRandomCoin4 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos4,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos4,al
    call checkCoin4InMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin4InMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin4OnMaze
    cmp edx, 1
    je L1
	ret
CreateRandomCoin4 ENDP

DrawCoin5 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos5
	mov dh,yCoinPos5
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawCoin5 ENDP


checkCoin5InMaze_UpDown PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InMaze_UpDown ENDP
    

checkCoin5InMaze_RightLeft PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET maze_prompt1
    mov edi, OFFSET maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos5
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InMaze_RightLeft ENDP

checkCoin5OnMaze PROC
    movzx eax, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos5
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5OnMaze ENDP

CreateRandomCoin5 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos5,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos5,al
    call checkCoin5InMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin5InMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin5OnMaze
    cmp edx, 1
    je L1
	ret
CreateRandomCoin5 ENDP

DrawComplexCoin PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos
	mov dh,yCoinPos
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawComplexCoin ENDP

CreateRandomComplexFruit PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
	inc al
    mov xFruitPos,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yFruitPos,al
    call checkFruitInComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkFruitInComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkFruitOnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexFruit ENDP

DrawComplexFruit PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xFruitPos
	mov dh,yFruitPos
	call Gotoxy
	mov al,"@"
	call WriteChar
	ret
DrawComplexFruit ENDP


checkCoinInComplexMaze_UpDown PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInComplexMaze_UpDown ENDP

checkCoinOnComplexMaze PROC
    movzx eax, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoinOnComplexMaze ENDP
    

checkCoinInComplexMaze_RightLeft PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInComplexMaze_RightLeft ENDP


checkFruitInComplexMaze_UpDown PROC
    movzx eax, yFruitPos
    movzx ecx, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xFruitPos
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkFruitInComplexMaze_UpDown ENDP

checkFruitOnComplexMaze PROC
    movzx eax, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xFruitPos
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkFruitOnComplexMaze ENDP
    

checkFruitInComplexMaze_RightLeft PROC
    movzx eax, yFruitPos
    movzx ecx, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xFruitPos
    sub ebx, 1
    add esi, ebx
    movzx ebx, xFruitPos
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkFruitInComplexMaze_RightLeft ENDP


CreateRandomComplexCoin PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos,al
    call checkCoinInComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoinInComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoinOnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexCoin ENDP

CreateRandomComplexCoin2 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos2,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos2,al
    call checkCoin2InComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin2InComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin2OnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexCoin2 ENDP

DrawComplexCoin2 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos2
	mov dh,yCoinPos2
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawComplexCoin2 ENDP

checkCoin2InComplexMaze_UpDown PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InComplexMaze_UpDown ENDP

checkCoin2OnComplexMaze PROC
    movzx eax, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos2
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2OnComplexMaze ENDP
    

checkCoin2InComplexMaze_RightLeft PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos2
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InComplexMaze_RightLeft ENDP


CreateRandomComplexCoin3 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos3,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos3,al
    call checkCoin3InComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin3InComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin3OnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexCoin3 ENDP

DrawComplexCoin3 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos3
	mov dh,yCoinPos3
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawComplexCoin3 ENDP

checkCoin3InComplexMaze_UpDown PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InComplexMaze_UpDown ENDP

checkCoin3OnComplexMaze PROC
    movzx eax, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos3
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3OnComplexMaze ENDP
    

checkCoin3InComplexMaze_RightLeft PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos3
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InComplexMaze_RightLeft ENDP

CreateRandomComplexCoin4 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos4,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos4,al
    call checkCoin4InComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin4InComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin4OnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexCoin4 ENDP

DrawComplexCoin4 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos4
	mov dh,yCoinPos4
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawComplexCoin4 ENDP

checkCoin4InComplexMaze_UpDown PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InComplexMaze_UpDown ENDP

checkCoin4OnComplexMaze PROC
    movzx eax, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos4
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4OnComplexMaze ENDP
    

checkCoin4InComplexMaze_RightLeft PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos4
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InComplexMaze_RightLeft ENDP


CreateRandomComplexCoin5 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos5,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos5,al
    call checkCoin5InComplexMaze_UpDown
    cmp edx, 1
    je L1
    call checkCoin5InComplexMaze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin5OnComplexMaze
    cmp edx, 1
    je L1
	ret
CreateRandomComplexCoin5 ENDP

DrawComplexCoin5 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos5
	mov dh,yCoinPos5
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawComplexCoin5 ENDP

checkCoin5InComplexMaze_UpDown PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InComplexMaze_UpDown ENDP

checkCoin5OnComplexMaze PROC
    movzx eax, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET ComplexMaze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos5
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5OnComplexMaze ENDP
    

checkCoin5InComplexMaze_RightLeft PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET ComplexMaze_prompt1
    mov edi, OFFSET ComplexMaze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos5
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InComplexMaze_RightLeft ENDP























;Level 3
CreateRandomLevel3Fruit PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
	inc al
    mov xFruitPos,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yFruitPos,al
    call checkFruitInLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkFruitInLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkFruitOnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Fruit ENDP

DrawLevel3Fruit PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xFruitPos
	mov dh,yFruitPos
	call Gotoxy
	mov al,"@"
	call WriteChar
	ret
DrawLevel3Fruit ENDP


checkCoinInLevel3Maze_UpDown PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInLevel3Maze_UpDown ENDP

checkCoinOnLevel3Maze PROC
    movzx eax, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoinOnLevel3Maze ENDP
    

checkCoinInLevel3Maze_RightLeft PROC
    movzx eax, yCoinPos
    movzx ecx, yCoinPos
    movzx ebx, xCoinPos

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoinInLevel3Maze_RightLeft ENDP


checkFruitInLevel3Maze_UpDown PROC
    movzx eax, yFruitPos
    movzx ecx, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xFruitPos
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkFruitInLevel3Maze_UpDown ENDP

checkFruitOnLevel3Maze PROC
    movzx eax, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xFruitPos
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkFruitOnLevel3Maze ENDP
    

checkFruitInLevel3Maze_RightLeft PROC
    movzx eax, yFruitPos
    movzx ecx, yFruitPos
    movzx ebx, xFruitPos

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xFruitPos
    sub ebx, 1
    add esi, ebx
    movzx ebx, xFruitPos
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkFruitInLevel3Maze_RightLeft ENDP


CreateRandomLevel3Coin PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos,al
    call checkCoinInLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkCoinInLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkCoinOnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Coin ENDP

DrawLevel3Coin PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos
	mov dh,yCoinPos
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawLevel3Coin ENDP


CreateRandomLevel3Coin2 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos2,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos2,al
    call checkCoin2InLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkCoin2InLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin2OnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Coin2 ENDP

DrawLevel3Coin2 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos2
	mov dh,yCoinPos2
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawLevel3Coin2 ENDP

checkCoin2InLevel3Maze_UpDown PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InLevel3Maze_UpDown ENDP

checkCoin2OnLevel3Maze PROC
    movzx eax, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos2
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2OnLevel3Maze ENDP
    

checkCoin2InLevel3Maze_RightLeft PROC
    movzx eax, yCoinPos2
    movzx ecx, yCoinPos2
    movzx ebx, xCoinPos2

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos2
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos2
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin2InLevel3Maze_RightLeft ENDP

CreateRandomLevel3Coin3 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos3,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos3,al
    call checkCoin3InLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkCoin3InLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin3OnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Coin3 ENDP

DrawLevel3Coin3 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos3
	mov dh,yCoinPos3
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawLevel3Coin3 ENDP

checkCoin3InLevel3Maze_UpDown PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InLevel3Maze_UpDown ENDP

checkCoin3OnLevel3Maze PROC
    movzx eax, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos3
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3OnLevel3Maze ENDP
    

checkCoin3InLevel3Maze_RightLeft PROC
    movzx eax, yCoinPos3
    movzx ecx, yCoinPos3
    movzx ebx, xCoinPos3

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos3
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos3
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin3InLevel3Maze_RightLeft ENDP

CreateRandomLevel3Coin4 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos4,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos4,al
    call checkCoin4InLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkCoin4InLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin4OnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Coin4 ENDP

DrawLevel3Coin4 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos4
	mov dh,yCoinPos4
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawLevel3Coin4 ENDP

checkCoin4InLevel3Maze_UpDown PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InLevel3Maze_UpDown ENDP

checkCoin4OnLevel3Maze PROC
    movzx eax, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos4
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4OnLevel3Maze ENDP
    

checkCoin4InLevel3Maze_RightLeft PROC
    movzx eax, yCoinPos4
    movzx ecx, yCoinPos4
    movzx ebx, xCoinPos4

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos4
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos4
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin4InLevel3Maze_RightLeft ENDP

CreateRandomLevel3Coin5 PROC
	L1:
    mov eax,79
	;inc eax
	call RandomRange
    add al, 1
	mov xCoinPos5,al
    mov eax,25
    call RandomRange
    add eax,2
	mov yCoinPos5,al
    call checkCoin5InLevel3Maze_UpDown
    cmp edx, 1
    je L1
    call checkCoin5InLevel3Maze_RightLeft
    cmp edx, 1
    je L1
    call checkCoin5OnLevel3Maze
    cmp edx, 1
    je L1
	ret
CreateRandomLevel3Coin5 ENDP

DrawLevel3Coin5 PROC
	mov eax,yellow (black * 16)
	call SetTextColor
	mov dl,xCoinPos5
	mov dh,yCoinPos5
	call Gotoxy
	mov al,"o"
	call WriteChar
	ret
DrawLevel3Coin5 ENDP

checkCoin5InLevel3Maze_UpDown PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 3
    sub eax, 1
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    add esi, ebx
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InLevel3Maze_UpDown ENDP

checkCoin5OnLevel3Maze PROC
    movzx eax, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET Level3_maze_prompt1

    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    add esi, eax

    movzx ebx, xCoinPos5
    add esi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5OnLevel3Maze ENDP
    

checkCoin5InLevel3Maze_RightLeft PROC
    movzx eax, yCoinPos5
    movzx ecx, yCoinPos5
    movzx ebx, xCoinPos5

    mov esi, OFFSET Level3_maze_prompt1
    mov edi, OFFSET Level3_maze_prompt1

    sub ecx, 2
    sub eax, 2
    mov ebx, 82
    imul eax, ebx
    imul ecx, ebx
    add esi, eax
    add edi, ecx

    movzx ebx, xCoinPos5
    sub ebx, 1
    add esi, ebx
    movzx ebx, xCoinPos5
    add ebx, 1
    add edi, ebx

    mov dl, "|"
    cmp [esi], dl
    je Maze
    mov dl, "_"
    cmp [esi], dl
    je Maze
    mov dl, "-"
    cmp [esi], dl
    je Maze
    mov edx, 0
    jmp endMaze

    Maze:
        mov dl, "|"
        cmp [edi], dl
        je Maze2
        mov dl, "_"
        cmp [edi], dl
        je Maze2
        mov dl, "-"
        cmp [edi], dl
        je Maze2
        mov edx, 0
        jmp endMaze

    Maze2:
    mov edx, 1
    
    endMaze:
    ret

checkCoin5InLevel3Maze_RightLeft ENDP

main PROC
    INVOKE PlaySound, OFFSET pacman_beginning, NULL, 11

    call start
    call menu




;    call game3

    INVOKE ExitProcess, 0
main ENDP
END main