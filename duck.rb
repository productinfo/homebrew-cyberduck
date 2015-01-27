class Duck < Formula
  homepage "https://duck.sh/"
  url "https://dist.duck.sh/duck-4.6.4.16610.tar.gz"
  sha1 "2ec4ed51e260e1faea5725d6905af4d2de576097"

  def install
    # Because compiling would need a JDK and xcodebuild we just use the pre-compiled binary.
    libexec.install Dir["*"]
    bin.install_symlink "#{libexec}/Contents/MacOS/duck" => "duck"
  end

  test do
    unless "Cyberduck 4.6.4 (16610)\n".eql? %x(#{bin}/duck -version)
      fail "Version mismatch"
    end
    filename = (testpath/"test")
    system "#{bin}/duck", "--download", stable.url, filename
    filename.verify_checksum stable.checksum
  end
end
