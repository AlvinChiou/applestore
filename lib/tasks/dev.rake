namespace :dev do
  desc "Rebuild system"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

  desc "demo"
  task :demo => :environment do
    Category.create!(:name => "請選擇...")
    ProductStatus.create!(:name => "請選擇...")
    ProductStatus.create!(:name => "未上架")
    ProductStatus.create!(:name => "上架-公開")
    ProductStatus.create!(:name => "上架-不公開")
    ProductStatus.create!(:name => "已下架")
  end
end