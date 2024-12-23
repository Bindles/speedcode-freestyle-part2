                                                                                ◒  
▶ rails generate scaffold Post user:references content:text                                 
      invoke  active_record
      create    db/migrate/20241214224835_create_posts.rb
      create    app/models/post.rb
      invoke    test_unit
      create      test/models/post_test.rb
      create      test/fixtures/posts.yml
      invoke  resource_route
       route    resources :posts
      invoke  scaffold_controller
      create    app/controllers/posts_controller.rb
      invoke    erb
      create      app/views/posts
      create      app/views/posts/index.html.erb
      create      app/views/posts/edit.html.erb
      create      app/views/posts/show.html.erb
      create      app/views/posts/new.html.erb
      create      app/views/posts/_form.html.erb
      create      app/views/posts/_post.html.erb
      invoke    resource_route
      invoke    test_unit
      create      test/controllers/posts_controller_test.rb
      create      test/system/posts_test.rb
      invoke    helper
      create      app/helpers/posts_helper.rb
      invoke      test_unit
      invoke    jbuilder
      create      app/views/posts/index.json.jbuilder
      create      app/views/posts/show.json.jbuilder
      create      app/views/posts/_post.json.jbuilder

▶ rails g resource Profile user:references bio:text avatar_url                             
      invoke  active_record
      create    db/migrate/20241214225041_create_profiles.rb
      create    app/models/profile.rb
      invoke    test_unit
      create      test/models/profile_test.rb
      create      test/fixtures/profiles.yml
      invoke  controller
      create    app/controllers/profiles_controller.rb
      invoke    erb
      create      app/views/profiles
      invoke    test_unit
      create      test/controllers/profiles_controller_test.rb
      invoke    helper
      create      app/helpers/profiles_helper.rb
      invoke      test_unit
      invoke  resource_route
       route    resources :profiles