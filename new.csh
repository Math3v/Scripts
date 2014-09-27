#! /bin/csh
#
# Matej Minarik
# Skriptik, ktory by mal hladat nove subory na Dropboxe - FIIT INFO
#
#
#
# Mam stary vystup findu, urobim novy vystup findu a potom diff.
#

unset execute

if($#argv > 0) then
	foreach param ( $* ) 
		switch($param)
			case -h: 
				 echo "Matej Minarik (C) CoJeNove na Dropboxe"
				 echo ""
				 echo "Usage:"
				 echo "       -h       -display this help"
				 echo "       -e       -execute, otherwise only display"
				 exit 0
				 breaksw
			case -e: 
				 set execute
				 breaksw
		endsw
	end
endif

echo "Co je nove: (zatial testovanie)"
printf "\r\n"

find /home/matej/Dropbox/FIIT_INFO_2011/ -type f > ./new.src

set trebanovy = `diff ./old.src ./new.src | wc -l`

if($trebanovy == 0) then
	echo "Nie je nove nic"
	rm ./new.src
	exit 0
endif

#toto treba skontrolovat este
echo "Pridane: "
printf "\r\n"
diff ./old.src ./new.src | grep '>' | tr -d '>' | tr -d ' '

echo "Vymazane: "
printf "\r\n"
diff ./old.src ./new.src | grep '<' | tr -d '<' | tr -d ' '

# Iba ak je spustene s -e prepinacom, tak sa premazu subory, inak sa iba zobrazi co je nove.
if($?execute) then
	rm ./old.src
	mv ./new.src ./old.src
else
	rm ./new.src
endif


printf "\r\n"
date 

exit 0
