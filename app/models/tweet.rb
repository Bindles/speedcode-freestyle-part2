# app/models/tweet.rb
class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 280 }
  broadcasts_to ->(tweet) { "tweets" }, locals: { from_stream: true }

  # after_create_commit do
  #   broadcast_prepend_to(
  #     "tweets",
  #     target: "tweets",
  #     partial: "tweets/tweet",
  #     locals: { tweet: self, from_stream: true })
  # broadcast_replace_to "actions_tweet_#{id}", target: "actions_tweet_#{id}", partial: "tweets/actions", locals: { tweet: self }
  # update_count
  # broadcast_append_to :posts_list, target: "tweets", partial: "tweets/tweet", locals: { tweet: self, from_stream: true }
  # broadcast_prepend_to :tweets, target: "#{dom_id(self, 'actions')}", locals: { tweet: self, from_stream: true }
  # end
  # after_update_commit do
  #   broadcast_replace_to :posts_list, target: self, partial: "tweets/tweet", locals: { tweet: self, from_stream: true }
  # end
  # after_destroy_commit do
  #   update_count
  #   broadcast_remove_to :posts_list, target: self
  # end


  # def update_count
  #   # broadcast_update_to :posts_list, target: 'posts_count', html: Post.count
  #   broadcast_update_to :posts_list, target: "counter", html: Tweet.count
  # end

  # after_create_commit { broadcast_prepend_to "tweets", locals: { from_stream: true } }
  # after_update_commit { broadcast_replace_to "tweets", locals: { from_stream: true }  }
end
