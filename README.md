# rc
Rc project is collection of my rc configuration files.

## .vimrc
Vim configuration file.

## .zshrc
ZSH shell configuration file, based on [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

### Installation
To install zshrc configuation to your local machine please execute following commands (Unix):
1. Clone **rc** repo:
   ```
   git clone https://github.com/rockosov/rc.git ~/.rc
   cd ~/.rc
   git submodule init
   git submodule update
   ```

2. Install **oh-my-zsh**:
   ```
   sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
   ```

3. Install **[solarized](https://ethanschoonover.com/solarized/)** theme for your terminal

4. Install **[powerline fonts](https://github.com/powerline/fonts)**

5. Install **pygmentize**:
   ```
   pip3 install pygments --upgrade
   ```

6. Install **ZSH syntax highlighting**:
   ```
   git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
   ```

7. Initialize **zshrc** file:
   ```
   echo "source ~/.rc/zshrc\n" > ~/.zshrc
   ```

8. Source **.zshrc** file:
   ```
   source ~/.zshrc
   ```

