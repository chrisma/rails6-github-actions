# Generate new 'blog' project, skip not needed gems, ignore possible .railsrc file
rails new blog --database=sqlite3 --skip-webpack-install --skip-spring --skip-listen --no-rc

# Get Gemfile with custom dependencies, overwriting generated Gemfile
wget https://raw.githubusercontent.com/hpi-swt2/rolodex-portal/preparation/Gemfile -O blog/Gemfile

# Get updated dependencies in Gemfile, exclude gems in the deployment category
blog/bin/bundle install --no-deployment

# Generate initial controller
blog/bin/rails generate controller Welcome index

# Start the dev server, check if everything is ok
blog/bin/rails server -u puma