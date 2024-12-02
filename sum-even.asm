;TASK-3
;sum of even number
include irvine32.inc
.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4
msg1 db "Sum of even numbers is: ",0
msg2 db "Count of even numbers is: ",0
sum dword 0
count dword 0
.code
main proc
call clrscr
mov esi,offset array      ;mov offset of array to esi register
mov ecx,LENGTHOF array    ;using array lenght as loop pointer
sumloop:                  ;loop for adding even numbers
mov ax,word ptr [esi]     ;mov esi elemet to ax for checking
test ax,1h                ;Check if the number is even
jnz skip                  ;jump if number is odd
movsx eax,ax              ;sign-extension
add sum,eax               ;add eax(which have even numbers) to sum variable
inc count                 ;Increment the count of even numbers
skip:                     ;label if number is odd
add esi,2                 ;inceremt to move towards next elemet
loop sumloop              ;looping
mov edx,offset msg1       ;dispaly message
call writestring 
mov eax,sum               ;display sum of even numbers
call writeint
call crlf
mov edx,offset msg2
call writestring
mov eax,count             ;dispaly counter
call writeint
call crlf
exit
main endp
end main