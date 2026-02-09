CREATE DATABASE [sesion3]
GO
USE [sesion3]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CookingStage]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CookingStage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DishId] [int] NOT NULL,
	[ProcessDescription] [nvarchar](1000) NOT NULL,
	[TimeInMinutes] [int] NULL,
 CONSTRAINT [PK_CookingStage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[BaseServingsQuantity] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[RecipeLink] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[FinalPriceInCents] [int] NOT NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ingredient]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ingredient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CostInCents] [int] NOT NULL,
	[UnitId] [int] NOT NULL,
	[AvailableCount] [float] NOT NULL,
 CONSTRAINT [PK_Ingredient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IngredientOfStage]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngredientOfStage](
	[CookingStageId] [int] NOT NULL,
	[IngredientId] [int] NOT NULL,
	[Quantity] [float] NOT NULL,
 CONSTRAINT [PK_IngredientOfStage] PRIMARY KEY CLUSTERED 
(
	[CookingStageId] ASC,
	[IngredientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[CreatedDT] [datetime] NOT NULL,
	[ClientId] [int] NOT NULL,
	[AppointedDT] [datetime] NOT NULL,
	[AppointedAddress] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderedDish]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedDish](
	[OrderId] [int] NOT NULL,
	[DishId] [int] NOT NULL,
	[ServingsNumber] [int] NULL,
	[StartCookingDT] [datetime] NULL,
	[EndCookingDT] [datetime] NULL,
 CONSTRAINT [PK_OrderedDish] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[DishId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 3/1/2021 7:18:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ShortName] [nvarchar](5) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Snacks')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Bread')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Soups')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Desserts')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (5, N'Fruites')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (6, N'Drinks')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (7, N'Meat')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (8, N'Pasta')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (9, N'Salads')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (10, N'Seafood')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Client] ON 
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (1, N'Bruce Montgomery', N'(326)-176-7483', N'bruce.montgomery@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (2, N'Tonya Howard', N'(550)-156-5343', N'tonya.howard@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (3, N'Meghan West', N'(971)-581-4179', N'meghan.west@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (4, N'Rafael Gonzales', N'(782)-987-6958', N'rafael.gonzales@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (5, N'Diana Medina', N'(672)-322-6008', N'diana.medina@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (6, N'Kristen Simmmons', N'(567)-316-1242', N'kristen.simmmons@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (7, N'Terry Baker', N'(893)-940-6526', N'terry.baker@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (8, N'Stephen Snyder', N'(131)-218-3882', N'stephen.snyder@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (9, N'Kurt Arnold', N'(747)-145-9400', N'kurt.arnold@example.com')
GO
INSERT [dbo].[Client] ([Id], [Name], [Phone], [Email]) VALUES (10, N'Aiden Wallace', N'(122)-049-0745', N'aiden.wallace@example.com')
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[CookingStage] ON 
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (1, 1, N'Using a damp cloth, gently clean mushrooms. Remove stems and discard.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (2, 1, N'Mince scallions and separate white and green parts.', 2)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (3, 1, N'Preheat an air fryer to 360 degrees F (182 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (4, 1, N'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (5, 1, N'Spray the air fryer basket with cooking spray and set mushrooms inside. Depending on the size of your air fryer, you may have to do 2 batches.', 2)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (6, 1, N'Cook mushrooms until filling is lightly browned, about 8 minutes. Repeat with remaining mushrooms.', 8)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (7, 1, N'Sprinkle mushrooms with scallion greens and let cool for 5 minutes before serving.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (8, 2, N'Whisk the flour, salt, and baking powder together in a mixing bowl. ', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (9, 2, N'Mix in the lard with your fingers until the flour resembles cornmeal.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (10, 2, N'Add the water and mix until the dough comes together; place on a lightly floured surface and knead a few minutes until smooth and elastic.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (11, 2, N'Divide the dough into 24 equal pieces and roll each piece into a ball.', 12)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (12, 2, N'Preheat a large skillet over medium-high heat.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (13, 2, N'Use a well-floured rolling pin to roll a dough ball into a thin, round tortilla.', 24)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (14, 2, N'Place into the hot skillet, and cook until bubbly and golden; flip and continue cooking until golden on the other side.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (15, 2, N'Place the cooked tortilla in a tortilla warmer; continue rolling and cooking the remaining dough.', 2)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (16, 3, N'Combine chocolate chips, salt, and cayenne in a heat-proof measuring cup; set aside.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (17, 3, N'Separate eggs by cracking one egg into your hand over a bowl. Open your fingers slightly and gently jiggle your hand until the egg white falls into the bowl below. Transfer the yolk to a skillet. Repeat with remaining eggs. Reserve egg whites for another use.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (18, 3, N'Add sugar, milk, and cream to egg yolks. Whisk thoroughly, breaking egg yolks first, until well combined.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (19, 3, N'Place skillet on the stove over medium or medium-low heat. Cook, stirring constantly with a silicone spoon, until very hot and thick enough to coat the back of the spoon, about 5 minutes. An instant-read thermometer should read at least 175 degrees F (79 degrees C). Remove from the heat.', 6)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (20, 3, N'Set a fine sieve over the bowl of reserved chocolate. Strain the custard sauce into the chocolate and let sit for 2 minutes. Whisk until chocolate has melted and custard sauce is smooth and shiny, about 2 minutes. Add vanilla and butter; stir until butter has melted, about 1 minute.', 8)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (21, 3, N'Pour warm custard sauce into 6 serving glasses. Tilt each glass and rotate it around so the warm chocolate coats another 1/2 inch of the glass. Cover with plastic and place in the refrigerator until completely chilled, at least 3 to 4 hours.', 240)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (22, 3, N'Combine cream and vanilla extract for topping in a metal bowl and whisk until thickened; make sure no peaks form. Spoon cream into the glasses, then tilt and twirl to coat the sides a bit.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (23, 3, N'Garnish with shaved chocolate and serve.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (24, 4, N'Preheat oven to 350 degrees F (175 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (25, 4, N'In a medium bowl, blend together softened butter, 2 cups flour and 1/2 cup sugar. Press into the bottom of an ungreased 9x13 inch pan.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (26, 4, N'Bake for 15 to 20 minutes in the preheated oven, or until firm and golden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.', 22)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (27, 4, N'Bake for an additional 20 minutes in the preheated oven. The bars will firm up as they cool. For a festive tray, make another pan using limes instead of lemons and adding a drop of green food coloring to give a very pale green.', 20)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (28, 4, N'After both pans have cooled, cut into uniform 2 inch squares and arrange in a checker board fashion.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (29, 5, N'Preheat oven to 375 degrees F (190 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (30, 5, N'Roll puff pastry out on a lightly floured surface to 1/4-inch thickness; place in the refrigerator.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (31, 5, N'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.', 6)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (32, 5, N'Pears need to be peeled, cored, and halved, or more as needed. Place one pear half, cut side up, into the center of skillet. Cut remaining pear halves in half again; arrange pear quarters around the center pear, cut sides up.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (33, 5, N'Place skillet over medium-low heat; cook pears, basting with syrup mixture, until they begin to soften, about 5 minutes. Remove skillet from heat.', 6)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (34, 5, N'Remove puff pastry from refrigerator; place pastry over pears, tucking edges of pastry around pears inside skillet.', 2)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (35, 5, N'Bake in the preheated oven until pastry is puffed and golden, about 20 minutes; allow to cool for 5 minutes. Place a serving plate over skillet; invert to remove tart (skillet will still be hot). Serve warm.', 25)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (36, 6, N'Preheat the oven to 375 degrees F (190 degrees C). Grease a baking sheet.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (37, 6, N'Pound skinless, boneless chicken breasts to 1/2-inch thickness or less.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (38, 6, N'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (39, 6, N'Dip each chicken breast in egg, then roll in bread crumb mixture to coat evenly. Place on the prepared baking sheet.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (40, 6, N'Bake in the preheated oven for 10 minutes. Turn and continue to cook until chicken is no longer pink in the center and juices run clear, about 10 minutes more. Let cool, 20 to 30 minutes.', 40)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (41, 6, N'Freeze in a 1-gallon resealable bag with smaller bags of tomato sauce and shredded mozzarella cheese.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (42, 6, N'To serve: Thaw in the refrigerator overnight. Reheat chicken at 375 degrees F (190 degrees C) until heated through and crispy, 15 to 20 minutes. Top chicken with tomato sauce, sprinkle with mozzarella cheese, and bake until cheese is melted, an additional 3 minutes.', 30)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (43, 7, N'Set an oven rack about 6 inches from the heat source and preheat the oven''s broiler. Grease a broiler pan with 1/2 tablespoon olive oil.', 2)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (44, 7, N'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (45, 7, N'Place on the prepared broiler pan, sprinkle garlic over top, and sprinkle onions around the base of the chicken, with several smaller pieces on top.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (46, 7, N'Cook under the preheated broiler for 5 minutes. Flip and continue to cook, checking often, until no longer pink in the center and the juices run clear, 5 to 10 more minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).', 20)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (47, 8, N'Preheat oven to 350 degrees F (175 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (48, 8, N'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (49, 8, N'Season with salt and pepper to taste and place in a lightly greased 9x5-inch loaf pan, or form into a loaf and place in a lightly greased 9x13-inch baking dish.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (50, 8, N'In a separate small bowl, combine the brown sugar, mustard and ketchup. Mix well and pour over the meatloaf.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (51, 8, N'Bake at 350 degrees F (175 degrees C) for 1 hour.', 60)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (52, 9, N'Bring a large pot of lightly salted water to a boil. Add pasta, and cook for 7 to 9 minutes, until al dente.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (53, 9, N'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (54, 9, N'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (55, 9, N'Place the rinsed and patted dry scallops in the pan, and cook briefly on each side until lightly browned and the center is cooked through, about 3 minutes per side. Remove from the heat when scallops are just finished.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (56, 9, N'Meanwhile, in a small saucepan, combine the milk, mascarpone cheese and remaining butter. Cook over medium heat, stirring, until sauce is warm and butter is completely melted and blended in.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (57, 9, N'Stir this sauce into the scallops and vegetables along with the pasta and serve immediately.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (58, 10, N'Combine chicken breasts and chicken broth in a saucepan over medium-high heat. Bring to a boil, cover, and reduce heat to low; simmer for 5 minutes. Turn breasts, cover, and simmer another 5 minutes. Remove from heat and let sit with the cover on for 15 minutes.', 30)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (59, 10, N'Remove chicken breasts from the broth and set aside to cool, reserving the broth in the saucepan. Once the chicken is cool enough to handle, cut into bite-size slices.', 15)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (60, 10, N'Return the chicken broth to medium heat and cook until reduced to 1 cup.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (61, 10, N'Stir garlic, black pepper, and heavy cream into the reduced broth; bring to a simmer and remove from heat.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (62, 10, N'Whisk egg yolks in a bowl until smooth. Beat 1 tablespoon of the warm cream mixture into the eggs until thoroughly incorporated; repeat until about 1/2 cup of the warm cream mixture is used.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (63, 10, N'Whisk the warm cream and egg mixture back into the saucepan with the remaining cream mixture. Cook over medium-low heat, whisking constantly, until the mixture almost comes to a simmer and thickens, about 5 minutes. Season with salt and black pepper to taste.', 6)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (64, 10, N'Bring a large pot of lightly salted water to a boil. Cook fettuccine in boiling water, stirring occasionally, until nearly cooked through, about 7 minutes. Drain.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (65, 10, N'Stir chopped fresh parsley, 1 cup of freshly grated Parmigiano-Reggiano, and cream mixture into the pasta. Remove from heat, cover, and let sit for a few minutes until thick.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (66, 10, N'Fold chicken and 1 cup Parmigiano-Reggiano into the pasta mixture to serve.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (67, 11, N'Preheat the oven to 400 degrees F (200 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (68, 11, N'Wrap beets loosely in aluminum foil and place on a rimmed baking sheet.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (69, 11, N'Roast in the preheated oven until easily pierced with a knife or skewer, 50 to 60 minutes. Unwrap and cool until easily handled, about 10 minutes. Peel beets and cut into chunks.', 80)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (70, 11, N'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.', 10)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (71, 11, N'Refrigerate until beets absorb the flavors, at least 1 hour. Serve cold.', 60)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (72, 12, N'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (73, 12, N'Pour in olive oil very gradually through the feed tube while machine is running, first 1 tablespoon at a time, then gradually increasing the amount. Season with salt and pepper.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (74, 12, N'Stack and bunch the kale leaves together on a cutting board and cut across the stack into skinny slivers.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (75, 12, N'Place the kale, croutons, and Parmesan cheese in the bowl and drizzle with about a 1/4 of the dressing. Toss and taste the salad and add more dressing if desired, then toss again.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (76, 13, N'Preheat oven to 325 degrees F (165 degrees C).', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (77, 13, N'In a small bowl, mix honey, mustard, and lemon juice.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (78, 13, N'Spread the mixture over the salmon steaks.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (79, 13, N'Season with pepper. Arrange in a medium baking dish.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (80, 13, N'Bake 20 minutes in the preheated oven, or until fish easily flakes with a fork.', 20)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (81, 14, N'Cut tips from 6 trimmed asparagus spears, about 1 1/2 inches from the top; reserve for garnish later. Chop the remaining asparagus into chunks.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (82, 14, N'Heat olive oil in a soup pot over medium heat; cook and stir chopped shallot in the hot oil until softened, about 3 minutes.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (83, 14, N'Add chopped asparagus; season with chopped mint, salt, and pepper. Cook until asparagus are slightly tender, about 3 minutes.', 4)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (84, 14, N'Pour chicken stock into asparagus mixture; bring to a boil. Reduce heat and simmer until asparagus are tender, 12 to 15 minutes. Stir in lemon zest.', 15)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (85, 14, N'Blend soup using a hand blender or a food processor until smooth.', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (86, 14, N'Bring a small pot of lightly salted water to a boil; cook asparagus tips in the boiling water until just turning bright green, about 2 minutes. Strain asparagus tips and run under cold water to stop the cooking process.', 7)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (87, 14, N'Garnish soup with asparagus tips and hard-boiled chopped egg.', 12)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (88, 15, N'Preheat oven to 400 degrees F (200 degrees C). Arrange julienned tortilla strips on a baking sheet.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (89, 15, N'Bake in the preheated oven until lightly browned, 3 to 5 minutes.', 5)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (90, 15, N'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.', 8)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (91, 15, N'Prepare skinless and boneless chicken - cut into thin strips', 3)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (92, 15, N'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.', 12)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (93, 15, N'Stir in avocado (peeled, pitted and diced) and chopped cilantro and heat through, 3 to 5 minutes. Adjust seasonings to taste.', 8)
GO
INSERT [dbo].[CookingStage] ([Id], [DishId], [ProcessDescription], [TimeInMinutes]) VALUES (94, 15, N'Ladle soup into bowls and sprinkle with tortilla strips to serve.', 4)
GO
SET IDENTITY_INSERT [dbo].[CookingStage] OFF
GO
SET IDENTITY_INSERT [dbo].[Dish] ON 
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (1, N'Stuffed Mushrooms', 6, 1, N'1.jpg', N'https://www.allrecipes.com/recipe/278271/air-fryer-stuffed-mushrooms/', N'These low-carb mushrooms are easy to make and cook in under 10 minutes in your air fryer. They make the perfect game-day snack, but also impress as a first course when having friends over for an elegant dinner.', 725)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (2, N'Homemade Flour Tortillas', 24, 2, N'2.jpeg', N'https://www.allrecipes.com/recipe/157642/homemade-flour-tortillas/', N'Traditional flour tortillas - homemade and much better than store bought. Do not substitute vegetable oil or shortening for the lard.', 220)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (3, N'Chocolate Puddino', 6, 4, N'3.jpg', N'https://www.allrecipes.com/recipe/283307/chocolate-puddino/', N'Perfect for Valentine''s Day, this rich and delicious chocolate pudding is made with a classic Italian method that they call "budino." The pudding has a glorious texture--firm enough to stay on the spoon and hold its shape, but at the same time, soft, smooth, and silky. It''s a perfect balance between intense chocolate flavor, with just the right amount of sweetness, topped with a soft whipped cream topping that elevates it to a whole new level of amazingness!', 760)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (4, N'The Best Lemon Bars', 36, 4, N'4.jpeg', N'https://www.allrecipes.com/recipe/10294/the-best-lemon-bars/', N'Tart, rich and perfection, all rolled into one! Wow your friends with this simple recipe. Hint: No Substitutions!', 700)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (5, N'Maple-Pear Tarte Tatin', 8, 5, N'5.jpeg', N'https://www.allrecipes.com/recipe/245135/maple-pear-tarte-tatin/', N'Pears poached in a maple caramel sauce then baked with a traditional puff pastry crust, a simple yet elegant dessert. Serve warm with vanilla ice cream and enjoy!', 1530)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (6, N'Make-Ahead Freezer Chicken Parmesan', 4, 7, N'6.jpeg', N'https://www.allrecipes.com/recipe/279629/make-ahead-freezer-chicken-parmesan/', N'My family loves chicken Parm but making it from scratch on a busy school night is next to impossible. The good news is the chicken can be made ahead and frozen along with the right portion of sauce and cheese for a quick weeknight meal. Serve with pasta and Caesar salad.', 870)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (7, N'Broiled Paprika and Lemon-Pepper Chicken Breasts', 2, 7, N'7.jpeg', N'https://www.allrecipes.com/recipe/279909/broiled-paprika-and-lemon-pepper-chicken-breasts/', N'The great blend of spices on these broiled chicken breasts has a wonderful flavor and pairs well with many vegetable side dishes.', 920)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (8, N'Easy Meatloaf', 8, 7, N'8.jpeg', N'https://www.allrecipes.com/recipe/16354/easy-meatloaf/', N'This is a very easy and no fail recipe for meatloaf. It won''t take long to make at all, and it''s quite good!', 1330)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (9, N'Scallops Mascarpone', 6, 8, N'9.jpeg', N'https://www.allrecipes.com/recipe/147305/scallops-mascarpone/', N'A light seafood dishes that pleases the taste buds and the eyes!', 4440)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (10, N'Lighter Chicken Fettuccine Alfredo', 6, 8, N'10.jpeg', N'https://www.allrecipes.com/recipe/219965/lighter-chicken-fettuccine-alfredo/', N'This version of chicken fettuccine alfredo is lightened by substituting some of the heavy cream with chicken broth.', 2470)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (11, N'Roasted Beet Salad', 4, 9, N'11.jpeg', N'https://www.allrecipes.com/recipe/270850/roasted-beet-salad/', N'Roasted beets with balsamic vinegar dressing.', 460)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (12, N'All Kale Caesar', 4, 9, N'12.jpeg', N'https://www.allrecipes.com/recipe/269287/all-kale-caesar/', N'This kale salad recipe is very quick and simple. Pour remaining dressing into a container, cover, and refrigerate up to 2 weeks.', 1300)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (13, N'Easy Bake Fish', 4, 10, N'13.jpeg', N'https://www.allrecipes.com/recipe/45361/easy-bake-fish/', N'Easy recipe for people who spent so much on the fish they couldn''t buy the sauce!', 2170)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (14, N'Asparagus, Lemon, and Mint Soup', 2, 3, N'14.jpeg', N'https://www.allrecipes.com/recipe/232665/asparagus-lemon-and-mint-soup/', N'This soup is easy to make. Asparagus has a strong flavor by itself, so I chose to add a few mint leaves and lemon zest to give it a wonderfully fresh aroma!', 1040)
GO
INSERT [dbo].[Dish] ([Id], [Name], [BaseServingsQuantity], [CategoryId], [Image], [RecipeLink], [Description], [FinalPriceInCents]) VALUES (15, N'Avocado Soup with Chicken and Lime', 4, 3, N'15.jpg', N'https://www.allrecipes.com/recipe/20809/avocado-soup-with-chicken-and-lime/', N'Thin strips of chicken breast are simmered in broth with jalapenos, onion, garlic and lime and then combined with avocado and topped with crisp corn tortilla strips in this spicy soup.', 1900)
GO
SET IDENTITY_INSERT [dbo].[Dish] OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredient] ON 
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (1, N'Button mushrooms', 16, 1, 28)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (2, N'Scallion', 10, 2, 27)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (3, N'Cream cheese', 20, 1, 12)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (4, N'Cheddar cheese', 33, 1, 14)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (5, N'Paprika', 18, 5, 7)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (6, N'Salt', 1, 5, 26)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (7, N'Flour', 25, 3, 25)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (8, N'Baking powder', 2, 5, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (9, N'Lard', 4, 5, 17)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (10, N'Water', 1, 3, 18)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (11, N'Dark chocolate chips', 25, 1, 10)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (12, N'Cayenne pepper', 2, 4, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (13, N'Egg', 10, 2, 8)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (14, N'White sugar', 13, 3, 10)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (15, N'Whole milk', 16, 3, 4)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (16, N'Heavy cream', 72, 3, 19)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (17, N'Vanilla extract', 28, 5, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (18, N'Butter', 12, 7, 18)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (19, N'Dark chocolate', 17, 7, 22)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (20, N'Lemon', 48, 2, 10)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (21, N'Puff pastry', 33, 1, 23)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (22, N'Brown sugar', 1, 7, 12)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (23, N'Ground cinnamon', 7, 5, 25)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (24, N'Ground nutmeg', 4, 4, 23)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (25, N'Maple syrup', 3, 7, 23)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (26, N'Pear', 71, 2, 11)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (27, N'Chicken breast', 324, 6, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (28, N'Bread crumbs', 44, 3, 28)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (29, N'Parmesan cheese', 12, 7, 29)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (30, N'Italian seasoning', 19, 5, 19)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (31, N'Garlic powder', 8, 5, 1)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (32, N'Tomato sauce', 6, 1, 4)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (33, N'Mozzarella cheese', 96, 3, 17)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (34, N'Olive oil', 13, 7, 23)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (35, N'Lemon-pepper seasoning', 11, 7, 26)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (36, N'Garlic', 42, 10, 14)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (37, N'Onion', 78, 2, 21)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (38, N'Beef', 397, 6, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (39, N'Pepper', 1, 4, 29)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (40, N'Prepared mustard', 9, 7, 12)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (41, N'Ketchup', 64, 3, 8)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (42, N'Seashell pasta', 8, 1, 14)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (43, N'Parsley', 3, 7, 20)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (44, N'Asparagus', 298, 9, 9)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (45, N'Onion powder', 9, 5, 11)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (46, N'Scallop', 1498, 6, 6)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (47, N'Mascarpone cheese', 50, 1, 18)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (48, N'Egg yolk', 10, 2, 17)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (49, N'Fettuccine', 340, 6, 2)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (50, N'Parmigiano-Reggiano cheese', 240, 3, 9)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (51, N'Beet', 40, 2, 5)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (52, N'Balsamic vinegar', 13, 7, 15)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (53, N'Lemon juice', 104, 3, 18)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (54, N'Anchovy fillets', 8, 2, 25)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (55, N'Dijon mustard', 3, 5, 1)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (56, N'Kale leaves', 72, 3, 2)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (57, N'Crouton', 120, 3, 13)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (58, N'Honey', 14, 7, 16)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (59, N'Salmon steak', 298, 2, 14)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (60, N'Shallot', 70, 2, 30)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (61, N'Fresh mint', 99, 7, 15)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (62, N'Chicken stock', 56, 3, 27)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (63, N'Lemon zest', 11, 5, 25)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (64, N'Corn tortillas', 6, 2, 8)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (65, N'Jalapeno peppers', 5, 2, 2)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (66, N'Lime juice', 128, 3, 14)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (67, N'Tomato', 50, 2, 24)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (68, N'Avocado', 48, 2, 4)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (69, N'Fresh cilantro', 1584, 3, 30)
GO
INSERT [dbo].[Ingredient] ([Id], [Name], [CostInCents], [UnitId], [AvailableCount]) VALUES (70, N'Cucumber', 70, 2, 20)
GO
SET IDENTITY_INSERT [dbo].[Ingredient] OFF
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (1, 1, 16)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (2, 2, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (4, 3, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (4, 4, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (4, 5, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (4, 6, 0.2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (8, 6, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (8, 7, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (8, 8, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (9, 9, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (10, 10, 1.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (16, 6, 0.2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (16, 11, 8)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (16, 12, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (17, 13, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (18, 14, 0.3)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (18, 15, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (18, 16, 1.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (20, 17, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (20, 18, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (22, 16, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (22, 17, 0.1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (23, 19, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (25, 7, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (25, 14, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (25, 18, 16)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (26, 7, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (26, 13, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (26, 14, 1.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (26, 20, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (30, 21, 17.3)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 18, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 22, 5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 23, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 24, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (31, 25, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (32, 26, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (37, 27, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 13, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 28, 0.33)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 29, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 30, 0.75)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (38, 31, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (41, 32, 8)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (41, 33, 0.75)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (43, 34, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 5, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 6, 3)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 27, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 34, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (44, 35, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (45, 36, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (45, 37, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 13, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 15, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 28, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 37, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (48, 38, 1.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (49, 6, 0.1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (49, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (50, 22, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (50, 40, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (50, 41, 0.33)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (52, 42, 16)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (53, 18, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (53, 34, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (53, 36, 0.2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (53, 43, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 1, 10)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 6, 0.1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 44, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (54, 45, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (55, 46, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (56, 15, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (56, 18, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (56, 47, 8)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (58, 27, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (58, 62, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (61, 16, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (61, 36, 0.7)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (61, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (62, 13, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (63, 6, 0.1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (64, 49, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (65, 43, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (65, 50, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (68, 51, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (70, 6, 0.1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (70, 25, 0.7)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (70, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (70, 52, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (72, 36, 0.3)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (72, 53, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (72, 54, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (72, 55, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (73, 6, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (73, 34, 8)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (73, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (74, 56, 6)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (75, 29, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (75, 57, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (77, 55, 9)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (77, 58, 3)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (77, 63, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (78, 59, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (79, 39, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (81, 44, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (82, 34, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (82, 60, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (83, 6, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (83, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (83, 61, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (84, 62, 2)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (84, 63, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (87, 13, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (88, 64, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (90, 34, 1.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (90, 36, 1.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (90, 37, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (90, 65, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (91, 27, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 6, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 39, 0.5)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 62, 4)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 66, 0.25)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (92, 67, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (93, 68, 1)
GO
INSERT [dbo].[IngredientOfStage] ([CookingStageId], [IngredientId], [Quantity]) VALUES (93, 69, 0.25)
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (1, CAST(N'2025-10-12T21:54:05.000' AS DateTime), 2, CAST(N'2025-10-15T10:50:00.000' AS DateTime), N'2282 Northaven Rd')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (2, CAST(N'2025-10-14T21:50:22.000' AS DateTime), 2, CAST(N'2025-10-16T12:05:00.000' AS DateTime), N'1270  Pickens Way')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (3, CAST(N'2025-10-23T02:20:07.000' AS DateTime), 3, CAST(N'2025-10-25T11:00:00.000' AS DateTime), N'2615  Caynor Circle')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (4, CAST(N'2025-11-02T05:33:54.000' AS DateTime), 4, CAST(N'2025-12-02T07:15:00.000' AS DateTime), N'6031 Pecan Acres Ln')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (5, CAST(N'2025-11-05T01:38:52.000' AS DateTime), 6, CAST(N'2025-12-02T09:00:00.000' AS DateTime), N'9486 Ash Dr')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (6, CAST(N'2025-12-01T01:47:15.000' AS DateTime), 1, CAST(N'2025-12-02T16:45:00.000' AS DateTime), N'4457  Flanigan Oaks Drive')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (7, CAST(N'2025-12-01T20:50:47.000' AS DateTime), 10, CAST(N'2025-12-02T11:20:00.000' AS DateTime), N'3113  George Avenue')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (8, CAST(N'2026-01-02T03:39:04.000' AS DateTime), 7, CAST(N'2026-01-06T20:30:00.000' AS DateTime), N'2145  McDowell Street')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (9, CAST(N'2026-01-15T19:13:08.000' AS DateTime), 8, CAST(N'2026-01-16T19:30:00.000' AS DateTime), N'2385 Taylor St')
GO
INSERT [dbo].[Order] ([Id], [CreatedDT], [ClientId], [AppointedDT], [AppointedAddress]) VALUES (10, CAST(N'2026-01-20T22:32:37.000' AS DateTime), 5, CAST(N'2026-01-21T16:05:00.000' AS DateTime), N'4379  Front Street')
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (1, 2, 96, CAST(N'2025-10-16T06:12:00.000' AS DateTime), CAST(N'2025-10-16T08:01:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (1, 3, 60, CAST(N'2025-10-15T21:56:00.000' AS DateTime), CAST(N'2025-10-16T06:07:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (1, 15, 36, CAST(N'2025-10-16T08:43:00.000' AS DateTime), CAST(N'2025-10-16T10:22:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (2, 1, 24, CAST(N'2025-10-16T07:20:00.000' AS DateTime), CAST(N'2025-10-16T08:34:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (2, 2, 48, CAST(N'2025-10-16T08:56:00.000' AS DateTime), CAST(N'2025-10-16T09:52:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (2, 3, 48, CAST(N'2025-10-15T17:55:00.000' AS DateTime), CAST(N'2025-10-15T23:37:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (2, 15, 36, CAST(N'2025-10-16T09:52:00.000' AS DateTime), CAST(N'2025-10-16T11:11:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (3, 6, 28, CAST(N'2025-10-24T14:27:00.000' AS DateTime), CAST(N'2025-10-24T17:08:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (3, 10, 30, CAST(N'2025-10-25T07:58:00.000' AS DateTime), CAST(N'2025-10-25T09:39:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (3, 14, 6, CAST(N'2025-10-24T17:57:00.000' AS DateTime), CAST(N'2025-10-24T18:46:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (3, 15, 8, CAST(N'2025-10-25T09:45:00.000' AS DateTime), CAST(N'2025-10-25T10:30:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (4, 11, 16, CAST(N'2025-12-01T15:57:00.000' AS DateTime), CAST(N'2025-12-01T19:08:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (4, 12, 28, CAST(N'2025-12-02T06:07:00.000' AS DateTime), CAST(N'2025-12-02T06:53:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (4, 13, 4, CAST(N'2025-12-01T16:26:00.000' AS DateTime), CAST(N'2025-12-01T18:05:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (4, 15, 20, CAST(N'2025-12-01T18:17:00.000' AS DateTime), CAST(N'2025-12-01T20:14:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (5, 7, 2, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (5, 8, 8, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (6, 1, 42, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (6, 5, 32, CAST(N'2025-12-02T07:29:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (6, 15, 20, CAST(N'2025-12-01T17:34:00.000' AS DateTime), CAST(N'2025-12-01T20:35:00.000' AS DateTime))
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (7, 8, 40, CAST(N'2025-12-02T09:36:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (7, 9, 12, CAST(N'2025-12-02T10:23:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (7, 15, 12, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (8, 1, 54, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (8, 3, 6, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (8, 6, 4, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (8, 9, 54, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (9, 2, 72, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (9, 8, 64, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (9, 9, 48, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (9, 10, 60, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (10, 8, 24, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (10, 10, 48, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (10, 13, 40, NULL, NULL)
GO
INSERT [dbo].[OrderedDish] ([OrderId], [DishId], [ServingsNumber], [StartCookingDT], [EndCookingDT]) VALUES (10, 14, 2, NULL, NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (1, N'ounce', N'oz')
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (2, N'piece', N'pcs')
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (3, N'cup', NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (4, N'pinch', NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (5, N'teaspoon', NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (6, N'pound', N'lb')
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (7, N'tablespoon', NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (8, N'package', N'pkg')
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (9, N'bunch', NULL)
GO
INSERT [dbo].[Unit] ([Id], [Name], [ShortName]) VALUES (10, N'bulb', NULL)
GO
ALTER TABLE [dbo].[Ingredient] ADD  CONSTRAINT [DF_Ingredient_AvailableCount]  DEFAULT ((0)) FOR [AvailableCount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDT]  DEFAULT (getdate()) FOR [CreatedDT]
GO
ALTER TABLE [dbo].[CookingStage]  WITH CHECK ADD  CONSTRAINT [FK_CookingStage_Dish1] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[CookingStage] CHECK CONSTRAINT [FK_CookingStage_Dish1]
GO
ALTER TABLE [dbo].[Dish]  WITH CHECK ADD  CONSTRAINT [FK_Dish_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Dish] CHECK CONSTRAINT [FK_Dish_Category]
GO
ALTER TABLE [dbo].[Ingredient]  WITH CHECK ADD  CONSTRAINT [FK_Ingredient_Unit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[Unit] ([Id])
GO
ALTER TABLE [dbo].[Ingredient] CHECK CONSTRAINT [FK_Ingredient_Unit]
GO
ALTER TABLE [dbo].[IngredientOfStage]  WITH CHECK ADD  CONSTRAINT [FK_IngredientOfStage_CookingStage1] FOREIGN KEY([CookingStageId])
REFERENCES [dbo].[CookingStage] ([Id])
GO
ALTER TABLE [dbo].[IngredientOfStage] CHECK CONSTRAINT [FK_IngredientOfStage_CookingStage1]
GO
ALTER TABLE [dbo].[IngredientOfStage]  WITH CHECK ADD  CONSTRAINT [FK_IngredientOfStage_Ingredient] FOREIGN KEY([IngredientId])
REFERENCES [dbo].[Ingredient] ([Id])
GO
ALTER TABLE [dbo].[IngredientOfStage] CHECK CONSTRAINT [FK_IngredientOfStage_Ingredient]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Client]
GO
ALTER TABLE [dbo].[OrderedDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDish_Dish] FOREIGN KEY([DishId])
REFERENCES [dbo].[Dish] ([Id])
GO
ALTER TABLE [dbo].[OrderedDish] CHECK CONSTRAINT [FK_OrderedDish_Dish]
GO
ALTER TABLE [dbo].[OrderedDish]  WITH CHECK ADD  CONSTRAINT [FK_OrderedDish_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderedDish] CHECK CONSTRAINT [FK_OrderedDish_Order]
GO