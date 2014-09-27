#! /bin/csh

if($#argv > 0) then
	
	foreach param ( $* ) 
		
		switch ($param)
			case -d: 
				set delete
				breaksw
			case -f:
				set folder
				breaksw

			case -h:
				echo "Matej Minarik (C) Dropbox Management"
				echo ""
				echo "Usage: -h - print this help"
				echo "       -d - delete conflicted copies "
				echo "          - if file conflicted.txt is moved, this script have to be changed"
				echo "       -f - delete conflicted copies of folders"
				echo ""
				exit 0
				breaksw
		endsw
		
	end

endif

find "/home/matej/Dropbox/FIIT_INFO_2011" -type f \(  -name "*conflicted*" -and -not -name "conflicted.txt" \)

set pocet = `find "/home/matej/Dropbox/FIIT_INFO_2011" -type f \( -name "*conflicted*" -and -not -name "conflicted.txt" \) | wc -l`

printf "\r\n"
echo "Pocet conflicted copy suborov je $pocet"
printf "\r\n"
# echo "Uzivatelia s takymito kopiami a ich pocty su: "
# printf "\r\n"
# find "/home/matej/Dropbox/FIIT_INFO_2011" -type f \( -name "*conflicted*" -and -not -name "conflicted.txt" \) | cut -d " " -f 4,5 | tr -d "(" | cut -d "'" -f 1 | sort  | uniq -c | sort -n

if($?delete) then
	set subory = ( "`find '/home/matej/Dropbox/FIIT_INFO_2011' -type f -name '*conflicted*'`" )
	
	foreach subor ( $subory:q )
		#toto sa da ovela lepsie poriesit urcite, ale nenapadlo ma ze ako. Ak sa zmeni nejako priecinok, treba to prepisat.
		if( "$subor" == "/home/matej/Dropbox/FIIT_INFO_2011/conflicted.txt" ) then 
			continue 
		endif
		echo "Mazem subor $subor"
		printf "\r\n"
		rm "$subor"

	end

endif

echo "Directories: "
find "/home/matej/Dropbox/FIIT_INFO_2011" -type d \( -name "*Conflict*" -and -not -name "conflicted.txt" \)


if($?delete) then
	set foldre = ( "`find '/home/matej/Dropbox/FIIT_INFO_2011' -type d -name '*Conflict*'`" )
	foreach folder ( $foldre:q )
		echo "Mazem folder $folder -test"
		printf "\r\n"
		#rm -r "$folder"
	end
endif

set date = `date`
echo "Modification time: $date"

exit 0
