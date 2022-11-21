program testpoly
	use Cat_class_m, only : Cat_t
	use Dog_class_m, only : Dog_t
	implicit none
	type(Cat_t) :: mycat
	type(Dog_t) :: mydog
	
	mycat=Cat_t('Sylvester','Bobtail',12)
	mydog=Dog_t('Rantanplan','Setter',3)
	call mycat%speak()
	call mydog%speak()
	call mycat%print_my_species()
	call mycat%print()
	call mydog%print()
end program testpoly