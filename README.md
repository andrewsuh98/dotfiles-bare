
# Dotfiles Setup Guide

Follow these steps to set up your system with these dotfiles.

---

## 1. Install Xcode Command Line Tools

Run the following command (it will ask for your password):

```bash
xcode-select --install
```

---

## 2. Install Homebrew

Run the following command to install Homebrew (it will ask for your login password):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After installation, follow the on-screen instructions to add Homebrew to your `PATH`.

---

## 3. Install Oh My Zsh

Run the following command to install Oh My Zsh:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

---

## 4. Set Up the Dotfiles Repository

### 4.1 Clone the Repository

Follow [this guide](https://www.atlassian.com/git/tutorials/dotfiles) for detailed instructions.

Alternatively:

1. Create a [personal access token](https://github.com/settings/tokens).
2. Run the following commands:

    ```bash
    echo ".cfg" >> .gitignore
    git clone --bare https://github.com/andrewsuh98/dotfiles $HOME/.cfg
    ```

3. Enter your GitHub email and your personal access token as the password.

### 4.2 Define the `config` Alias

Run this command to define the alias for the current session:

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

### 4.3 Checkout Repository Content

Attempt to check out the dotfiles:

```bash
config checkout
```

If there are conflicts due to existing stock configuration files, back them up:

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | \
grep -E "^\s+\." | \
awk '{print $1}' | \
xargs -I{} mv "{}" .config-backup/
```

Re-run the checkout command:

```bash
config checkout
```

### 4.4 Configure Git to Ignore Untracked Files

Run the following command to set the flag `showUntrackedFiles` to `no`:

```bash
config config --local status.showUntrackedFiles no
```

---

## 5. Install Applications Using Homebrew

Run the following command to install all applications listed in the `Brewfile`:

```bash
brew bundle install
```

---

## 6. Configure Karabiner Elements

1. **Open Karabiner-Elements**:
   - Launch Karabiner-Elements from your Applications folder or by running:

     ```bash
     open -a "Karabiner-Elements"
     ```

2. **Grant Necessary Permissions**:
   - When prompted, grant the required permissions:
     - **Input Monitoring**: Go to **System Preferences** > **Privacy & Security** > **Input Monitoring**, and ensure `Karabiner-Elements` is checked.
     - **Accessibility Access**: Go to **System Preferences** > **Privacy & Security** > **Accessibility**, and ensure `Karabiner-Elements` is checked.

3. **Check Simple Modifications**:
   - Open Karabiner-Elements and verify that needed simple modifications are working.
   - **Note**: Configured remappings from the settings file might not work if the keyboard hardware ID has changed. If so, update the settings in to match the current keyboard.

---

## 7. Set Up Neovim

1. Open Neovim and trigger the installation of plugins.
2. Run the health check in Neovim:

    ```bash
    :checkhealth
    ```

---

## 8. Change macOS Settings

1. **Change Scrollbar Behavior**:
   - Go to **System Preferences** > **Appearance**.
   - Under **Show scroll bars**, select **"When scrolling"**.

---

That's it! Your system should now be configured with your dotfiles.
