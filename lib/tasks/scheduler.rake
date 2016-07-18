namespace :scheduler do

  desc 'This task is called by the Heroku Scheduler add-on'
  task publish_posts: :environment do
    puts 'checking to see if any posts are scheduled to be published today...'

    Post.publish_scheduled_posts(DateTime.now)

    puts 'done.'
  end

end
