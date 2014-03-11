require "formula"

class Fsharp < Formula
  homepage "http://fsharp.org/"

  url "https://github.com/fsharp/fsharp/archive/3.1.1.6.tar.gz"
  sha1 "f9bee238fa8701f742940291d0d3129673a39ebc"

  head 'https://github.com/fsharp/fsharp.git', :branch => 'master'

  depends_on :automake
  depends_on :autoconf
  #depends_on 'pkg-config'

  def install

    #pkg-config need to locate mono.pc
    ENV.append 'PKG_CONFIG_LIBDIR', "/Library/Frameworks/Mono.framework/Versions/Current/lib/pkgconfig/", ":"

    system "./autogen.sh", "--prefix=#{prefix}"

    system "make"
    system "make", "install"
  end

  test do
    `fsharpc --help`
  end
end
