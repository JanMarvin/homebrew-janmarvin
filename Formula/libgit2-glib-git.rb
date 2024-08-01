class Libgit2GlibGit < Formula
  desc "Glib wrapper library around libgit2 git access library"
  homepage "https://github.com/GNOME/libgit2-glib"
  version "1.2.0"
  url "https://gitlab.gnome.org/GNOME/libgit2-glib/-/archive/master/libgit2-glib-master.zip"
  sha256 "cdeeda9cd428202187ee844066be417f6c74dc4eb7ba261261156e08bb7afb55"
  license "LGPL-2.1-only"
  revision 5
  head "https://github.com/GNOME/libgit2-glib.git", branch: "master"

  livecheck do
    url :stable
    regex(/libgit2-glib[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  # bottle do
  #   sha256 cellar: :any, arm64_ventura:  "b30006198b771b53f422e82bd9ee182901377f53cb12074e50c086dafaf5816a"
  #   sha256 cellar: :any, arm64_monterey: "be1d0ce4dd8c25160c8f22e528ae31edd00e273d230b6c7ae1ade7279e809d97"
  #   sha256 cellar: :any, arm64_big_sur:  "b7cb5c1d6ffd664094cb7d541e05aacc2b21dc6d12389217dd37acc630f96489"
  #   sha256 cellar: :any, ventura:        "d580b6f2f45af85ff7672f08f9171f27f6af60f8754e51dc5d71a0d74270554d"
  #   sha256 cellar: :any, monterey:       "532651b558b63fcb13d917ed9a6d6ff70bdbf0f9c6bb62e82c1695a1d6eae776"
  #   sha256 cellar: :any, big_sur:        "6ad50fd6ef1550c2c6f46d695f8cf15dbdef83a90ddfa0d48701e6f46d910e94"
  #   sha256               x86_64_linux:   "bda1c02e3bbc93eddca94a575da7666f350f0548ae8fc168a9d664ca037aa1dc"
  # end

  depends_on "gobject-introspection" => :build
  depends_on "meson" => :build
  depends_on "ninja" => :build
  depends_on "pkg-config" => :build
  depends_on "python@3" => :build
  depends_on "vala" => :build
  depends_on "gettext"
  depends_on "glib"
  depends_on "libgit2@1.7"

  on_macos do
    depends_on "gettext"
  end

  def install
    ENV.append "LDFLAGS", "-Wl,-rpath,#{rpath}"
    system "meson", "setup", "build", *std_meson_args,
                                      "-Dpython=false",
                                      "-Dvapi=true"
    system "meson", "compile", "-C", "build", "--verbose"
    system "meson", "install", "-C", "build"
    libexec.install (buildpath/"build/examples").children
  end

  test do
    mkdir "horatio" do
      system "git", "init"
    end
    system "#{libexec}/general", testpath/"horatio"
  end
end
