task :default => :serve

task :generate do
    sh 'jekyll build -s ./src -d ./_site'
end

task :serve => :generate do
    sh 'jekyll serve --skip-initial-build -s ./src -d ./_site'
end
