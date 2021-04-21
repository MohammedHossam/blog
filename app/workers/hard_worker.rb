class HardWorker
  include Sidekiq::Worker

  def perform(*id)
    Post.destroy(id)

    # post = Post.where('created_at <= :one_day_ago', one_day_ago: Time.now - 1.days)
    # puts(post)
    # # post.destroy
    puts("hello")
    puts(id)
  end
end
