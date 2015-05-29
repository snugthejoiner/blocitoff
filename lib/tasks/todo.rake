namespace :todo do
  desc "Delete expired tasks"
  task delete_items: :environment do
    Item.where("expires_at < ?", Time.now).destroy_all
  end

end
