# Homebrew cask for Contrail. The release workflow fills in version and sha256;
# scripts/update-tap.sh copies the result into the tap (Kiril-P/homebrew-tap).
cask "contrail" do
  version "0.5.0"
  sha256 "6794137eb7716e2c9c76f62c88e2c797525a3030ee6fd4f90d670cc34a007b36"

  url "https://github.com/Kiril-P/contrail/releases/download/v#{version}/Contrail-#{version}.dmg"
  name "Contrail"
  desc "Glowing trail that follows your cursor, for demos and screen recordings"
  homepage "https://github.com/Kiril-P/contrail"

  # Contrail updates itself (Sparkle); brew upgrade leaves it alone.
  auto_updates true
  depends_on macos: :ventura

  app "Contrail.app"

  zap trash: [
    "~/Library/Caches/io.github.kiril-p.contrail",
    "~/Library/HTTPStorages/io.github.kiril-p.contrail",
    "~/Library/Preferences/io.github.kiril-p.contrail.plist",
  ]

  # Releases are not notarised yet. Remove this once they are.
  caveats <<~EOS
    Contrail is not notarised. On first launch macOS will refuse to open it:
    open System Settings > Privacy & Security and click "Open Anyway" next to
    Contrail. You only need to do this once; after that Contrail updates itself.
  EOS
end
