cask "sevi" do
  version "0.1.3"
  sha256 "df7f8b69857ad52c2686a6d6209a07641aed13e6d701136fdc8ba91b35eb00e7"

  url "https://github.com/isureshsubramanian/Sevi/releases/download/v#{version}/Sevi-#{version}.zip"
  name "Sevi"
  desc "Sound levels of the microphone and system output in the zsh prompt"
  homepage "https://github.com/isureshsubramanian/Sevi"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Sevi.app"
  binary "#{appdir}/Sevi.app/Contents/MacOS/sevi"

  # An upgrade does not run the uninstall step, so a helper that is listening
  # would keep running the previous version. Stopping it here lets the next
  # terminal start the new one. On a first install nothing is listening.
  postflight_steps do
    run "Sevi.app/Contents/MacOS/sevi",
        args: ["stop"],
        base: :appdir
  end

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
