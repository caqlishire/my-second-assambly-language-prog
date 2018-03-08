
.begin
.org    2048            ! Start program at 2048
a_length     .equ    3000
b_length     .equ    3040	

ld		[a_length], %r1
ld		[a_length+4], %r2
ld		[a_length+8], %r3
ld		[a_length+12], %r4
ld		[a_length+16], %r5
ld		[b_length], %r6
ld		[b_length+4], %r7
ld		[b_length+8], %r8
ld		[b_length+12], %r9
ld		[b_length+16], %r10
call	subarrays
halt

!Add the two arrays and sum the elements together.
subarrays:
	addcc  	%r1, %r6, %r1
	addcc  	%r2, %r7, %r2
	addcc  	%r3, %r8, %r3
	addcc  	%r4, %r9, %r4
	addcc  	%r5, %r10, %r5

	st  	%r1, [a_length]
	st  	%r2, [a_length+4]
	st  	%r3, [a_length+8]
	st  	%r4, [a_length+12]
	st  	%r5, [a_length+16]

	ld 		[c], %r20
	addcc  	%r1, %r20, %r20
	addcc  	%r2, %r20, %r20
	addcc  	%r3, %r20, %r20
	addcc  	%r4, %r20, %r20
	addcc  	%r5, %r20, %r20
	st		%r20, [c]
	jmpl	%r15 + 4, %r0

	
c: 0 ! Should equal 30 at end

AAddress:    a_length
            .org    a_length         ! length of array a
a:          1                      
            2
            3
            4
            5
		
BAddress:    b_length
            .org    b_length         ! length of array b
b:          1                      
            2
            3
            4
            5
            .end
