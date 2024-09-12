class Jample < Formula
  desc "Jample: A tool for music sampling and integration with Ableton Live"
  homepage "https://github.com/famulus/jample"
  url "https://github.com/famulus/jample/archive/v1.0.tar.gz"
  version "1.0"
  sha256 "<SHA256 checksum>"

  depends_on "postgresql"
  depends_on "ffmpeg"
  depends_on "aubio"
  depends_on "mp3splt"
  depends_on "youtube-dl"
  depends_on "ruby"
  depends_on "node"

  def install
    system "bundle", "install"
    system "npm", "install"
    bin.install "bin/jample"
  end

  def post_install
    system "createdb jample_db"
    system "rails", "db:migrate"
  end

  test do
    system "rails", "server"
  end
end
