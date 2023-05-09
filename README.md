1. Create directory

```bash
mkdir ~/.dotfiles
cd ~/.dotfiles
```

2. Clone repo

```bash
git clone https://github.com/killbasa/dotfiles.git .
```

3. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. Install the packages from the `Brewfile`

```bash
brew bundle
```

5. Run the installation script

```bash
/bin/bash ./scripts/install.sh
```
