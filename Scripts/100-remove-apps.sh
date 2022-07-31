func_uninstall() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
        echo
  		echo "###############################################################################"
    	echo "##################  Uninstalling package" $1
      	echo "###############################################################################"
      	echo
		tput sgr0
        sudo pacman -R --noconfirm $1
	else
    	tput setaf 3
        echo
    	echo "###############################################################################"
  		echo "################## The package "$1" is not installed"
    	echo "###############################################################################"
    	echo
    	tput sgr0
    fi
}

cat "./Package Lists/remove.txt" | while read pkg || [[ -n $pkg ]]; do
   func_uninstall $pkg
done
