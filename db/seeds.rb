if Profile.count <= 0
    # Criar um perfil
    profile = Profile.create(name: "Henrique", last_name: "Henrique Araújo Neto",
    email: "anhenrique93@gmail.com", image: "http://image.url", password_digest: "password", pt_description: "Bem vindo!")

    if profile.save
        # Criar networks associada ao perfil
        3.times do |i|
            profile.networks.create(name: "network - #{i}", url: "http://netowek-#{i}.com")
        end
    end
end

if Post.count <= 0
    PostCategory.delete_all
    PostTag.delete_all

    Post.delete_all

    if Category.count <= 0
        Category.delete_all
        
        #Create Categories
        5.times do |i|
            Category.find_or_create_by(pt_name: "Category - #{i}")
        end
    end

    if Tag.count <= 0
        Tag.delete_all

        #Create Tags
        5.times do |i|
            Tag.find_or_create_by(name: "Tag - #{i}")
        end
    end
    
    categories = Category.pluck(:id)
    tags = Tag.pluck(:id)

    #Create Posts
    5.times do |i|
        Post.create(pt_title: "My #{i} Post", pt_excerpt: "This is my #{i} Post",
        pt_body: "This post #{i} is for test only", author: "Henrique", 
        date: Time.now, category_ids: categories, tag_ids: tags     
        )
    end
end