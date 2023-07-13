if Post.count <= 0
    PostCategory.delete_all

    if Category.count <= 0
        Category.delete_all
    end

    Post.delete_all

    #Create Categories
    5.times do |i|
        Category.find_or_create_by(pt_name: "Category - #{i}")
    end
    
    #Create Posts
    5.times do |i|
        Post.create(pt_title: "My #{i} Post", pt_excerpt: "This is my #{i} Post",
        pt_body: "This post #{i} is for test only", author: "Henrique", date: Time.now)
    end
    
    posts = Post.all
    categories = Category.all;
    
    #Add categories to all posts
    posts.each do |post|
        categories.each do |cat|
            post.categories << cat
        end
    end
end