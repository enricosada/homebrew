require "formula"

class Fsharp < Formula
  homepage "http://fsharp.org/"

  url "https://github.com/fsharp/fsharp/archive/3.1.1.1.tar.gz"
  sha1 "7b83606f03e651d342520e17e23c3dbf18dc942f"

  head 'https://github.com/enricosada/fsharp.git', :branch => 'homebrew31'

  depends_on :automake
  depends_on :autoconf
  #depends_on 'pkg-config'

  def install

    #pkg-config need to locate mono.pc
    ENV.append 'PKG_CONFIG_LIBDIR', "/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/"

    system "./autogen.sh", "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    `system "#{bin}/fsharpc", "--help"`
  end
end
