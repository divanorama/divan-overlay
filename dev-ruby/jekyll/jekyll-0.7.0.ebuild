EAPI=2

USE_RUBY="ruby18"

RUBY_FAKEGEM_TASK_TEST=""
RUBY_FAKEGEM_TASK_DOC=""

RUBY_FAKEGEM_EXTRADOC=""

inherit ruby-fakegem eutils

DESCRIPTION="Blog-aware, static site generator in Ruby."
HOMEPAGE="http://github.com/mojombo/jekyll"

RDEPEND="${RDEPEND}
        dev-ruby/redcloth
        dev-ruby/liquid
        dev-ruby/maruku"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
