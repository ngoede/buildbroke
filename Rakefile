task :default => :serve

task :setup do
    sh 'sudo apt-get -qq update'
    sh 'sudo apt-get install awscli -y'
end

task :generate do
    sh 'jekyll build -s ./src -d ./_site'
end

task :serve => :generate do
    sh 'jekyll serve --skip-initial-build -s ./src -d ./_site'
end

task :deploy => :generate do
    sh 'aws s3 sync --region us-east-1 --acl public-read --sse --delete ./_site/ s3://www.nickgoede.com'
    sh 'aws configure set preview.cloudfront true'
    sh 'aws cloudfront create-invalidation --distribution-id E2I2RDRYS7RAK0 --paths \'/*\''
end