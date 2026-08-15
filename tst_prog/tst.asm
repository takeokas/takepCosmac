
	ORG 0
	DIS
	DB 0



aho:
	B4	off
	SEQ
	BR aho
off:	
	REQ
	

	BR aho


