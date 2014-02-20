require "formula"

class Fsharp < Formula
  homepage "http://fsharp.org/"

  url "https://github.com/fsharp/fsharp/archive/3.1.1.1.tar.gz"
  sha1 "7b83606f03e651d342520e17e23c3dbf18dc942f"

  depends_on :autoconf

  def install
    system "./autogen.sh", "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    `system "#{bin}/fsharpc", "--help"`
  end
end
