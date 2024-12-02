;TASK-1
;sum of positive number
include irvine32.inc
.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4
msg1 db "Sum of positive numbers is: ",0
msg2 db "Count of positive numbers is: ",0
sum dword 0
count dword 0
.code
main proc
call clrscr
mov esi,offset array        ;move offset of array to esi (pointer)
mov ecx,LENGTHOF array
sumloop:
mov ax,word ptr [esi]       ;move current elemet of array to ax (ax have current element t0 process)
test ax,8000h               ;Check if the number is positive
jnz skip                    ;jump if number is negative
movsx eax,ax                ;sign-extension 
add sum,eax                 ;add the positive values in sum variable
inc count                   ;Increment the count of positive numbers
skip:                       ;label if number is negative
add esi,2                   ;incremenet to next number
loop sumloop                ;looping
mov edx,offset msg1         ;display message
call writestring 
mov eax,sum                 ;display sum
call writeint
call crlf
mov edx,offset msg2 
call writestring
mov eax,count               ;display counter 
call writeint
call crlf
exit
main endp
end main