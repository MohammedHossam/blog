class HardWorker
  include Sidekiq::Worker

  def perform(*id)
    Post.destroy(id)
  end
end
