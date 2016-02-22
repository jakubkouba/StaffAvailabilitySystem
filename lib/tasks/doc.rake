require 'rdoc/task'

Rake::RDocTask.new(:rdoc_dev) do |rd|
  rd.main = 'README.doc'
  rd.rdoc_files.include('README.rdoc', 'doc/doc_md/**/*')
  rd.rdoc_dir = 'doc/html'
end
