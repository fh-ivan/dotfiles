if [ ! -f ~/.vim/autoload/plug.vim ]; then
	echo "Installing vim plug"
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -f ~/.ssh/github_work ]; then
    echo "Creating github keys"
    ssh-keygen -t rsa -N '' -C `git config user.email` -f ~/.ssh/github_work
    echo -e "\nCopy and paste this at https://github.com/settings/keys\n---------\n"
    cat ~/.ssh/github_work.pub
    echo -e "\n\n---------"
fi

if ! command -v terraform &> /dev/null
then
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
fi

