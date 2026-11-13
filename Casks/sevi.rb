cask "sevi" do
  version "0.1.2"
  sha256 "02fe0ceb726989a7299cdbb9ce345cc85dbcc736f3e982752128a6b9b0d20149"

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
