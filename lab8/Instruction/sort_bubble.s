.data
array:  .dword  323, 123, -455, 2, 98, 125, 10, 65, -56, 0
N:      .dword  10

.text
.global _start
_start:
    ldr r4, =array       @ r4 = base address of array
    ldr r5, =N           @ r5 = address of N
    ldr r5, [r5]         @ r5 = N (size of array)
    sub r5, r5, #1       @ r5 = N-1 (outer loop limit)

outer_loop:
    mov r6, #0           @ i = 0

inner_loop:
    sub r7, r6, r5       @ if i >= N-1, exit inner loop
    bge outer_continue

    @ Load array[i] and array[i+1]
    mov r8, r6           @ load index of outer loop
    lsl r8, r8, #2       @ r8 = i * 4 (word offset)
    add r9, r4, r8       @ r9 = address of array[i]
    ldr r10, [r9]        @ r10 = array[i]
    ldr r11, [r9, #4]    @ r11 = array[i+1]

    sub r12, r10, r11    @ r12 = array[i] - array[i+1]
    ble no_swap          @ If array[i] <= array[i+1], no swap

    str r11, [r9]        @ array[i] = array[i+1]
    str r10, [r9, #4]    @ array[i+1] = array[i]

no_swap:
    add r6, r6, #1       @ i++
    b inner_loop

outer_continue:
    sub r5, r5, #1       @ Reduce loop limit (N-1, N-2, ...)
    bgt outer_loop       @ If still positive, loop again

end:
    b end                @ Infinite loop (halt)
