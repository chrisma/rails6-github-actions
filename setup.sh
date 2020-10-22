# Generate new 'blog' project, skip not needed gems, ignore possible .railsrc file
rails new blog --database=sqlite3 --skip-webpack-install --skip-spring --skip-listen --no-rc
