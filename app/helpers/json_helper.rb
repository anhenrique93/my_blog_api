# json with posts params to return
module JsonHelper
    def posts_json(posts)
        return posts.to_json(include: { 
            categories: { only: [:pt_name, :en_name] },
            tags: { only: [:name] }
        })
    end

    def profile_json(profile)
        return profile.to_json(include: {
            networks: { only: [:name, :url] },
        }, except: [:password])
    end
end