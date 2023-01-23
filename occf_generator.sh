#!/bin/bash

printf "\n"
printf "
 ██████╗  ██████╗ ██████╗███████╗    ███████╗ ██████╗ ██████╗ ███╗   ███╗    
██╔═══██╗██╔════╝██╔════╝██╔════╝    ██╔════╝██╔═══██╗██╔══██╗████╗ ████║    
██║   ██║██║     ██║     █████╗      █████╗  ██║   ██║██████╔╝██╔████╔██║    
██║   ██║██║     ██║     ██╔══╝      ██╔══╝  ██║   ██║██╔══██╗██║╚██╔╝██║    
╚██████╔╝╚██████╗╚██████╗██║         ██║     ╚██████╔╝██║  ██║██║ ╚═╝ ██║    
 ╚═════╝  ╚═════╝ ╚═════╝╚═╝         ╚═╝      ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝    
                                                                             
 ██████╗ ███████╗███╗   ██╗███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗ 
██╔════╝ ██╔════╝████╗  ██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
██║  ███╗█████╗  ██╔██╗ ██║█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝
██║   ██║██╔══╝  ██║╚██╗██║██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗
╚██████╔╝███████╗██║ ╚████║███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
 ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝\033[m\n"
printf "\n                            By : \x1b[33m junik1337\033[m [ayassir]\n"
printf "\n"

echo -ne "|->\x1b[32m Current Directory : \033[m"
pwd

#Variables
PATH=""
CLASS=""
OPTION=""

#PATH
printf "\n"
echo -ne "|->\x1b[33m Enter Path Of Creation : \033[m"
read PATH

if [ -d $PATH ] &> /dev/null
then 
	cd $PATH
	if [ -z "$PATH" ]
	then
		echo -ne "\n\t\x1b[32m Changing Directory to :\033[m Current Directory\n"
	else
		echo -ne "\n\t\x1b[32m Changing Directory to :\033[m" $PATH
		printf "\n"
	fi
	echo -ne "\n|->\x1b[33m Enter Class Name : \033[m"
	read CLASS
	if [ $CLASS != "" ] 2> /dev/null
	then
		printf "\n"
		echo -e "\t\x1b[32m Class Name :\033[m" $CLASS
		printf "\n"
		/usr/bin/touch $CLASS.cpp $CLASS.hpp 

		#	***		Printing To Class.hpp	***

		echo "#ifndef _"$CLASS"_HPP_" >> $CLASS.hpp
		echo "#define _"$CLASS"_HPP_" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp
		echo "#include <iostream>" >> $CLASS.hpp
		printf "\n" >> $CLASS.hpp

		echo "// ******************************************************** //" >> $CLASS.hpp
		echo "//                         CLASSES                         //" >> $CLASS.hpp
		echo "// ****************************************************** //" >> $CLASS.hpp

		printf "\nclass	$CLASS
{
	public	:
		$CLASS ();
		$CLASS ($CLASS const &obj);
		~$CLASS ();
		$CLASS &operator= (const $CLASS &obj);

	private	:
		//	DataType	attributes.
};\n\n" >> $CLASS.hpp

		printf "// ******************************************************** //
//                        FUNCTIONS                        //
// ****************************************************** //\n\n" >> $CLASS.hpp

		echo "#endif" >> $CLASS.hpp

		#	***		Printing To Class.cpp	***

		printf "#include \"$CLASS.hpp\"

$CLASS::$CLASS()
{
	std::cout << \"$CLASS : Default Constructor Called\" << std::endl;
}

$CLASS::~$CLASS()
{
	std::cout << \"$CLASS : Destructor Called\" << std::endl;
}

$CLASS::$CLASS($CLASS const &obj)
{
	std::cout << \"Copy Constructor Called\" << std::endl;
	if (this != &obj)
		*this = obj;
}

$CLASS	&$CLASS::operator= (const $CLASS &obj)
{
	std::cout << \"Copy Assignment Operator Called\" << std::endl;
	if (this != &obj)
	{
		//	this->attributes = obj.attributes;
		//	...
	}
	return (*this);
}\n" > $CLASS.cpp

	echo -ne "|->\x1b[33m Create Main and Makefile \033[m[\x1b[1;32my\033[m/\x1b[1;31mn\033[m] : "
	read OPTION
	if [ $OPTION == "y" ] || [ $OPTION == "yes" ] &> /dev/null
	then
		/usr/bin/touch main.cpp Makefile
		#	***		Printing To Makefile	***

			printf "NAME = $CLASS \n
CXXFLAGS = -Wall -Wextra -Werror \n
CC = c++ \n
STD = -std=c++98 \n
SRC = $CLASS.cpp main.cpp \n
INC = $CLASS.hpp \n
OBJ = \$(SRC:.cpp=.o) \n
all : \$(NAME) \n
\$(NAME) : \$(OBJ)
	\$(CC) \$(CXXFLAGS) \$(STD) \$(OBJ) -o \$(NAME) \n\n" >> Makefile

		echo %.o : %.cpp "\$(INC)" >> Makefile
		printf "	\$(CC) \$(CXXFLAGS) -c \$< -o \$@ \n
clean :
	rm -rf \$(OBJ) \n
fclean : clean
	rm -rf \$(NAME) \n
re : fclean all \n
.PHONY : all clean fclean re\n" >> Makefile

			#	***		Printing To main.cpp	***

			printf "#include \"$CLASS.hpp\"\n
int main()
{
	//	You Code\n
	std::cout << \"******	JUNIK1337 CREATION √	******\" << std::endl;\n
	return (0);
}\n" > main.cpp
	fi
		printf "\n
    ____  ____  _   ________
   / __ \/ __ \/ | / / ____/
  / / / / / / /  |/ / __/   
 / /_/ / /_/ / /|  / /___   
/_____/\____/_/ |_/_____/\n\n"
		echo -e "|-> "$CLASS"\x1b[32m : Files Created !\033[m\n"
	else
		echo -ne "\n"
		echo -e "\t\x1b[31mNo Class Name Entred\033[m\n"
	fi
	else
		echo -ne "\n"
		echo -e "\t$PATH\x1b[31m : Invalid path\033[m\n"
fi
