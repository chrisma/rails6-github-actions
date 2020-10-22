# Generate new 'blog' project, skip not needed gems, ignore possible .railsrc file
rails new blog --database=sqlite3 --skip-webpack-install --skip-spring --skip-listen --no-rc

# Get Gemfile with custom dependencies, overwriting generated Gemfile
cp default/Gemfile blog/Gemfile

# Get updated dependencies in Gemfile, exclude gems in the deployment category
blog/bin/bundle install --no-deployment

# Generate initial controller
blog/bin/rails generate controller Welcome index --test-framework=rspec --no-helper --no-helper-specs

# Unfortunately, webpack includes are still generated...
sed -i 's/javascript_pack_tag/javascript_include_tag/g' blog/app/views/layouts/application.html.erb
# Copy missing application.js (not generated because assuming webpack)
mkdir -p blog/app/assets/javascripts/
cp default/app/assets/javascripts/application.js blog/app/assets/javascripts/application.js
# Tell sprockets that it's now also responsible for JS again (instead of webpacker doing that)
echo '//= link_directory ../javascripts .js' >> blog/app/assets/config/manifest.js

# Start the dev server, check if everything is ok
blog/bin/rails server -u puma