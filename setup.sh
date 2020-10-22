# Generate new 'blog' project, skip not needed gems, ignore possible .railsrc file
rails new blog --database=sqlite3 --skip-webpack-install --skip-spring --skip-listen --no-rc

# Get Gemfile with custom dependencies, overwriting generated Gemfile
wget https://raw.githubusercontent.com/hpi-swt2/rolodex-portal/preparation/Gemfile -O blog/Gemfile