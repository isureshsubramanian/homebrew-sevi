cask "sevi" do
  version "0.1.1"
  sha256 "eda4f5d032867f237c2e7d176df3a311a013d4a6333150f5a5b665053d35933a"

  url "https://github.com/isureshsubramanian/Sevi/releases/download/v#{version}/Sevi-#{version}.zip"
  name "Sevi"
  desc "Sound levels of the microphone and system output in the zsh prompt"
  homepage "https://github.com/isureshsubramanian/Sevi"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Sevi.app"
  binary "#{appdir}/Sevi.app/Contents/MacOS/sevi"

  uninstall signal: ["TERM", "com.nerttiyana.sevi"]

  zap script: {
    executable: "/usr/bin/tccutil",
    args:       ["reset", "All", "com.nerttiyana.sevi"],
  }

  caveats <<~EOS
    Sevi shows its reading in your zsh prompt. To turn it on, run:
      sevi init zsh
    and add the line it prints to ~/.zshrc, after your theme is loaded.

    macOS asks once for the microphone and once for system audio.
    Sevi listens only while a terminal that uses it is open; `sevi stop` ends it at once.
  EOS
end
