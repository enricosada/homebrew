require "formula"

class Fsharp < Formula
  homepage "http://fsharp.org/"

  url "https://github.com/fsharp/fsharp/archive/3.1.1.6.tar.gz"
  sha1 "f9bee238fa8701f742940291d0d3129673a39ebc"

  head 'https://github.com/fsharp/fsharp.git', :branch => 'master'

  option 'replace-mono-current', 'Replace Fsharp installed by Mono (version: Current)'

  depends_on :automake
  depends_on :autoconf
  #depends_on 'pkg-config'

  def install
    mono_dir = File.readlink("/Library/Frameworks/Mono.framework/Versions/Current")

    #pkg-config need to locate mono.pc
    ENV.append 'PKG_CONFIG_LIBDIR', "#{mono_dir}/lib/pkgconfig/", ":"

    prefix = mono_dir if build.include? 'replace-mono-current'

    system "./autogen.sh", "--prefix=#{prefix}"

    system "make"
    system "sudo", "make", "install"
  end

  test do
    system "fsharpc", "--help"
    system "fsharpi", "--help"
  end
end
