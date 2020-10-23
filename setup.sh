# Generate new 'blog' project, skip not needed gems, ignore possible .railsrc file
rails new blog --database=sqlite3 --skip-webpack-install --no-rc

# Get Gemfile with custom dependencies, overwriting generated Gemfile
cp default/Gemfile blog/Gemfile

# Get updated dependencies in Gemfile, exclude gems in the deployment category
blog/bin/bundle install --no-deployment

# Generate initial controller
# https://guides.rubyonrails.org/getting_started.html#say-hello-rails
blog/bin/rails generate controller Welcome index --test-framework=rspec --no-helper --no-helper-specs

# Unfortunately, webpack includes are still generated...
sed -i 's/javascript_pack_tag/javascript_include_tag/g' blog/app/views/layouts/application.html.erb
# Copy missing application.js (not generated because assuming webpack)
mkdir -p blog/app/assets/javascripts/
cp default/app/assets/javascripts/application.js blog/app/assets/javascripts/application.js
# Tell sprockets that it's now also responsible for JS again (instead of webpacker doing that)
echo '//= link_directory ../javascripts .js' >> blog/app/assets/config/manifest.js

# modify routes.rb
# https://guides.rubyonrails.org/getting_started.html#setting-the-application-home-page

# rails generate controller Articles --no-helper --no-helper-specs
# https://guides.rubyonrails.org/getting_started.html#laying-down-the-groundwork

# add new, create, show & index actions to blog/app/controllers/articles_controller.rb
# https://guides.rubyonrails.org/getting_started.html#creating-articles
# https://guides.rubyonrails.org/getting_started.html#saving-data-in-the-controller
# https://guides.rubyonrails.org/getting_started.html#showing-articles
# https://guides.rubyonrails.org/getting_started.html#listing-all-articles

# Create app/views/articles/new.html.erb
# https://guides.rubyonrails.org/getting_started.html#the-first-form

# rails generate model Article title:string text:text
# https://guides.rubyonrails.org/getting_started.html#creating-the-article-model

# rails db:migrate
# https://guides.rubyonrails.org/getting_started.html#running-a-migration

# Create app/views/articles/show.html.erb
# https://guides.rubyonrails.org/getting_started.html#showing-articles

# Create app/views/articles/index.html.erb
# https://guides.rubyonrails.org/getting_started.html#listing-all-articles
# https://guides.rubyonrails.org/getting_started.html#updating-articles

# Add validation to app/models/article.rb
# https://guides.rubyonrails.org/getting_started.html#adding-some-validation

# Create app/views/articles/edit.html.erb
# https://guides.rubyonrails.org/getting_started.html#updating-articles

# Create app/views/articles/_form.html.erb
# https://guides.rubyonrails.org/getting_started.html#using-partials-to-clean-up-duplication-in-views

# rails generate model Comment commenter:string body:text article:references
# https://guides.rubyonrails.org/getting_started.html#generating-a-model
# rails db:migrate

# rails generate controller Comments --no-helper --no-helper-specs
# https://guides.rubyonrails.org/getting_started.html#generating-a-controller

# Edit blog/app/controllers/comments_controller.rb
# https://guides.rubyonrails.org/getting_started.html#generating-a-controller

# Start the dev server, check if everything is ok
blog/bin/rails server -u puma