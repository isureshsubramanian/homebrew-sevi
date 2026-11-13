# Homebrew tap for Sevi

[Sevi](https://github.com/isureshsubramanian/Sevi) shows the sound levels of the
microphone and the system output in your zsh prompt on macOS.

## Install

```
brew install --cask isureshsubramanian/sevi/sevi
```

Then run `sevi init zsh` and add the line it prints to `~/.zshrc`, after your
theme is loaded. macOS asks once for the microphone and once for system audio.

Sevi needs macOS 14.2 or later on a Mac with Apple silicon.

## Upgrade and remove

```
brew upgrade --cask sevi
brew uninstall --cask sevi          # removes the app and the sevi command
brew uninstall --zap --cask sevi    # also removes the permissions macOS stored
```

If you remove Sevi, also delete its line from `~/.zshrc`.

## Licence

Apache License 2.0. See [LICENSE](LICENSE).
