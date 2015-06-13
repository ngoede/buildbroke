task :rebuild do
  sh "jekyll build -s src -d src/_site"
end

task :deploy => :rebuild do
  deploy("azureuser@direct.buildbroke.com")
end

namespace :local do
  task :deploy => :rebuild do
    deploy("vagrant@vagrantserver")
  end
end

def deploy(destination)
  sh "rsync -avz src/_site/* #{destination}:/data/www/site"
end
