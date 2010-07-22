# http://blog.lathi.net/articles/2007/11/07/navigating-your-projects-in-emacs
module CTags
  RUBY_FILES = FileList['**/*.rb'].exclude("pkg")
end

namespace "tags" do
  desc "Emacs tags generator"
  task :emacs => CTags::RUBY_FILES do
    puts "Making Emacs TAGS file"
    sh "ctags -e #{CTags::RUBY_FILES}", :verbose => false
  end
end

task :tags => ["tags:emacs"]
