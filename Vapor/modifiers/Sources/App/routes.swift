import Vapor

func routes(_ app: Application) throws {
        app.get { req async in
        "It works!"
    }

    app.get("hello") { req async -> String in
        "Hello, world!"
    }
    
    app.get("items") { req async -> [Item] in
        Item.sample
    }
    
    app.get("details", ":id") { req async throws -> ItemDetails in
        guard let itemId = req.parameters.get("id"),
                let details = Item.createDetails(itemId: itemId)  else {
            throw Abort(.badRequest, reason: "invalid id")
        }
        
        return details
    }
}
