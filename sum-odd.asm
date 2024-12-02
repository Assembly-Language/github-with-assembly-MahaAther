;TASK-4
;sum of odd numbers
include irvine32.inc
.data
array SWORD -3, -6, -1, -10, 10, 30, 40, 4
msg1 db "Sum of odd numbers is: ",0
msg2 db "Count of odd numbers is: ",0
sum dword 0
count dword 0
.code
main proc
call clrscr
mov esi,offset array      ;moving array offset to esi
mov ecx,LENGTHOF array    ;using array lenght as loop counter
sumloop:                  ;sumloop to sum all odd numbers
mov ax,word ptr [esi]     ;moving esi elemets to ax
test ax,1h                ;Check if the number is odd
jz skip                   ;jumo to label if number is even
movsx eax,ax              ;sign-extension
add sum,eax               ;add odd numbers to sum variable one by one
inc count                 ;Increment the count of odd numbers
skip:                     ;label if value found
add esi,2                 ;increment by 2 to move to next element
loop sumloop              ;looping
mov edx,offset msg1       ;dispaly message
call writestring
mov eax,sum               ;display sum
call writeint
call crlf
mov edx,offset msg2     
call writestring
mov eax,count             ;display couter
call writeint
call crlf
exit
main endp
end main