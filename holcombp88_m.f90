module Animal_class_m
	implicit none
	private
	public :: Animal_t
	integer, parameter :: MAX_LEN=80
	
	type Animal_t
		private
		character(len=MAX_LEN), public :: species
	contains
		procedure, public :: speak
		procedure, public :: print_my_species
	end type Animal_t
	
	interface Animal_t
		module procedure init_animal
	end interface
	
contains
	type(Animal_t) function init_animal(what_animal)
		character(len=MAX_LEN), intent(in) :: what_animal
		init_animal%species=what_animal
	end function init_animal
	
	subroutine speak(self)
		class(Animal_t), intent(in) :: self
		print *, 'Base class does not implement this method'
	end subroutine speak
	subroutine print_my_species(self)
		class(Animal_t), intent(in) :: self
		print *, trim(self%species)
	end subroutine print_my_species
end module Animal_class_m

module Cat_class_m
	use Animal_class_m
	implicit none
	private
	public :: Cat_t
	integer, parameter :: MAX_LEN=80
	
	type, extends(Animal_t) :: Cat_t
		private
		character(len=MAX_LEN) :: breed
		character(len=MAX_LEN) :: name
		integer :: age
	contains
		procedure :: speak
		procedure :: print=>print_me
	end type Cat_t
	
	interface Cat_t
		module procedure init_cat
	end interface
contains
	type(Cat_t) function init_cat(my_name,breed,age)
		character(len=*), intent(in) :: breed
		character(len=*), intent(in) :: my_name
		integer, intent(in) :: age
		init_cat%Animal_t=Animal_t('Felis sylvestris catus')
		init_cat%name=my_name
		init_cat%breed=breed
		init_cat%age=age
	end function init_cat
	
	subroutine print_me(self)
		class(Cat_t), intent(in) :: self
		print *, 'I am ',trim(self%name)//",I am a " &
				// trim(self%breed)//", ", self%age, " years old"
	end subroutine print_me
	subroutine speak(self)
		class(Cat_t), intent(in) :: self
		print *, 'Meow'
	end subroutine speak
end module Cat_class_m

module Dog_class_m
	use Animal_class_m
	implicit none
	private
	public :: Dog_t
	integer, parameter :: MAX_LEN=80
	
	type, extends(Animal_t) :: Dog_t
		private
		character(len=MAX_LEN) :: breed
		character(len=MAX_LEN) :: name
		integer :: age
	contains
		procedure :: speak
		procedure :: print=>print_me
	end type Dog_t
	
	interface Dog_t
		module procedure init_dog
	end interface
contains
	type(Dog_t) function init_dog(my_name,breed,age)
		character(len=*), intent(in) :: breed
		character(len=*), intent(in) :: my_name
		integer, intent(in) :: age
		init_dog%Animal_t=Animal_t('Canis familiaris')
		init_dog %name=my_name
		init_dog%breed=breed
		init_dog%age=age
	end function init_dog
	
	subroutine print_me(self)
		class(Dog_t), intent(in) :: self
		print *, 'I am ',trim(self%name)//", I am a " &
				// trim(self%breed)//", ", self%age, " years old"
	end subroutine print_me
	
	subroutine speak(self)
		class(Dog_t), intent(in) :: self
		print *, 'Woof'
	end subroutine speak
end module Dog_class_m
