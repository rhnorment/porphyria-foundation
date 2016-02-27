ActiveAdmin.register Post do

  menu  priority: 5

  form do
    f.semantic_errors


  end

  permit_params   :author, :body, :image, :post_url, :published, :published_at, :title

end
