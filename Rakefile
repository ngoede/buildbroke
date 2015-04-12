task :rebuild do
  sh "jekyll build -s src -d src/_site"
end

task :deploy => :rebuild do
  sh "rsync -avz src/_site/* azureuser@buildbroke.com:/data/www/site"
end