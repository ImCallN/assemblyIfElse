		AREA |.text|, CODE, READONLY
		EXPORT __main
			
__main
		;loads our registers
		MOVS R0, #1		;a = 1 in R0
		MOVS R1, #2		;b = 2 in R1
		MOVS R2, #3		;c = 3 in R3
		
		;does a comparison to set flags
		;here we are checking if a == 1
		;if it does, then b = b * 4 + 2
		CMP R0, #1
		BEQ doThing		;should branch if it is equal
		;This will mess up our math big time if it doesnt branch,
		;letting us know that it didn't branch
		MOVS R0, #0
		MOVS R1, #0
		MOVS R2, #0
		
doThing
		LSLS R1, #2		;Multiplies R1 by 4
		ADDS R1, R1, #2	;adds 2 to R1
		MOVS R0, R1		;moves R1 into R0
		MOVS R1, #2		;makes R1 back into 2
endif
		
		;This is the other comparison
		;if (a <= b) {b = c + 4}
		CMP R1, R0
		BLS doOtherThing	
		;Some more debugging in case anything goes wrong
		MOVS R0, #100
		MOVS R1, #100
		MOVS R2, #100
doOtherThing		;This will run if a is less than or the same as b
		
		ADDS R1, R2, #4		;adds 4 to c
		MOVS R0, R1			;R0 is where the return value ends up
		
done	B done
		END