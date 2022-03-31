import Foundation

public struct Post {
    public let author:String
    public let description: String
    public let image: String
    public let likes: Int
    public let views: Int
}


public let postArray = [
    Post(author: "Mario",
         description: "New Super Mario Bros",
         image: "mario",
         likes: 50,
         views: 50),
    
    Post(author: "GhostBusters",
         description: "GhostBusters videogame",
         image: "ghostbusters",
         likes: 100,
         views: 150),
    
    Post(author: "Chip",
         description: "Chip'n'Dale Rescue",
         image: "chip", likes: 200,
         views: 250),
    
    Post(author: "Darkwing Duck",
         description: "Darkwing Duck videogame",
         image: "duck",
         likes: 10,
         views: 20)
]

