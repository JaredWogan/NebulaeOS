func_install_pacman() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
        echo
  		echo "###############################################################################"
    	echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
        echo
    	echo "###############################################################################"
  		echo "##################  Installing package" $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
        sudo pacman -S --noconfirm --needed $1
    fi
}

func_install_yay() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
        echo
  		echo "###############################################################################"
    	echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
        echo
    	echo "###############################################################################"
  		echo "##################  Installing package" $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
        yay -S --noconfirm --needed $1
    fi
}

# Install packages from standard repositories
cat "./Packages/pacman-install.txt" | while read pkg || [[ -n $pkg ]]; do
   func_install_pacman $pkg
done

# Install packages from Arch User Repository
cat "./Packages/yay-install.txt" | while read pkg || [[ -n $pkg ]]; do
   func_install_yay $pkg
done

# Install oh-my-fish
if [ ! -d ~/.local/share/omf ]; then
    tput setaf 3
    echo
	echo "###############################################################################"
	echo "##################  Installing package Oh My Fish"
	echo "###############################################################################"
	echo
    tput sgr0

    echo "curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > omf_install" > install_script
    echo "fish omf_install --noninteractive --path=~/.local/share/omf --config=~/.config/omf" >> install_script
    echo "rm omf_install" >> install_script
    echo "exit" >> install_script
    fish -c "sh install_script"&
    wait $!
    fish -c "omf install bobthefish"
else
    tput setaf 2
    echo
	echo "###############################################################################"
	echo "##################  The package Oh My Fish is already installed"
	echo "###############################################################################"
	echo
    tput sgr0
fi

# Install Anaconda
if [ ! -d ~/anaconda3 ]; then
    tput setaf 3
    echo
	echo "###############################################################################"
	echo "##################  Installing package Anaconda"
	echo "###############################################################################"
	echo
    tput sgr0
    curl https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh > anaconda_install
    bash anaconda_install -b -f
    rm anaconda_install
    export PATH=~/anaconda3/bin:$PATH
    conda init
    conda init fish
    conda config --set channel_priority strict
    conda create -c conda-forge --name ROOT root
else
    tput setaf 2
    echo
	echo "###############################################################################"
	echo "##################  The package Anaconda is already installed"
	echo "###############################################################################"
	echo
    tput sgr0
fi

# Install OpenMPI
if [ ! -d /usr/bin/mpicc ]; then
    tput setaf 3
    echo
	echo "###############################################################################"
	echo "##################  Installing package OpenMPI"
	echo "###############################################################################"
	echo
    tput sgr0
    curl https://download.open-mpi.org/release/open-mpi/v4.1/openmpi-4.1.4.tar.gz > openmpi-4.1.4.tar.gz
	gunzip -c openmpi-4.1.4.tar.gz | tar xf -
	rm -rf openmpi-4.1.4.tar.gz
	cd openmpi-4.1.4
	sh ./configure --prefix=/usr/local/
	sudo make all install
	cd ..
	sudo rm -rf ./openmpi-4.1.4
else
    tput setaf 2
    echo
	echo "###############################################################################"
	echo "##################  The package OpenMPI is already installed"
	echo "###############################################################################"
	echo
    tput sgr0
fi

