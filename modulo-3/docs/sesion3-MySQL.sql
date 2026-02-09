CREATE DATABASE  IF NOT EXISTS `nyamnyam_session2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `nyamnyam_session2`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: nyamnyam_session2
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `dbo_category`
--

DROP TABLE IF EXISTS `dbo_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_category` (
  `Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_category`
--

LOCK TABLES `dbo_category` WRITE;
/*!40000 ALTER TABLE `dbo_category` DISABLE KEYS */;
INSERT INTO `dbo_category` VALUES (1,'Snacks'),(2,'Bread'),(3,'Soups'),(4,'Desserts'),(5,'Fruites'),(6,'Drinks'),(7,'Meat'),(8,'Pasta'),(9,'Salads'),(10,'Seafood');
/*!40000 ALTER TABLE `dbo_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_client`
--

DROP TABLE IF EXISTS `dbo_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_client` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_client`
--

LOCK TABLES `dbo_client` WRITE;
/*!40000 ALTER TABLE `dbo_client` DISABLE KEYS */;
INSERT INTO `dbo_client` VALUES (1,'Bruce Montmery','(326)-176-7483','bruce.montmery@example.com'),(2,'Tonya Howard','(550)-156-5343','tonya.howard@example.com'),(3,'Meghan West','(971)-581-4179','meghan.west@example.com'),(4,'Rafael nzales','(782)-987-6958','rafael.nzales@example.com'),(5,'Diana Medina','(672)-322-6008','diana.medina@example.com'),(6,'Kristen Simmmons','(567)-316-1242','kristen.simmmons@example.com'),(7,'Terry Baker','(893)-940-6526','terry.baker@example.com'),(8,'Stephen Snyder','(131)-218-3882','stephen.snyder@example.com'),(9,'Kurt Arnold','(747)-145-9400','kurt.arnold@example.com'),(10,'Aiden Wallace','(122)-049-0745','aiden.wallace@example.com');
/*!40000 ALTER TABLE `dbo_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_cookingstage`
--

DROP TABLE IF EXISTS `dbo_cookingstage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_cookingstage` (
  `Id` int(11) NOT NULL,
  `DishId` int(11) NOT NULL,
  `ProcessDescription` varchar(1000) NOT NULL,
  `TimeInMinutes` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_CookingStage_Dish1` (`DishId`),
  CONSTRAINT `FK_CookingStage_Dish1` FOREIGN KEY (`DishId`) REFERENCES `dbo_dish` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_cookingstage`
--

LOCK TABLES `dbo_cookingstage` WRITE;
/*!40000 ALTER TABLE `dbo_cookingstage` DISABLE KEYS */;
INSERT INTO `dbo_cookingstage` VALUES (1,1,'Using a damp cloth, gently clean mushrooms. Remove stems and discard.',5),(2,1,'Mince scallions and separate white and green parts.',2),(3,1,'Preheat an air fryer to 360 degrees F (182 degrees C).',3),(4,1,'Combine cream cheese, Cheddar cheese, the white parts from the scallions, paprika, and salt in a small bowl. Stuff filling into the mushrooms, pressing it in to fill the cavity with the back of a small spoon.',10),(5,1,'Spray the air fryer basket with cooking spray and set mushrooms inside. Depending on the size of your air fryer, you may have to do 2 batches.',2),(6,1,'Cook mushrooms until filling is lightly browned, about 8 minutes. Repeat with remaining mushrooms.',8),(7,1,'Sprinkle mushrooms with scallion greens and let cool for 5 minutes before serving.',5),(8,2,'Whisk the flour, salt, and baking powder together in a mixing bowl. ',5),(9,2,'Mix in the lard with your fingers until the flour resembles cornmeal.',3),(10,2,'Add the water and mix until the dough comes together; place on a lightly floured surface and knead a few minutes until smooth and elastic.',10),(11,2,'Divide the dough into 24 equal pieces and roll each piece into a ball.',12),(12,2,'Preheat a large skillet over medium-high heat.',4),(13,2,'Use a well-floured rolling pin to roll a dough ball into a thin, round tortilla.',24),(14,2,'Place into the hot skillet, and cook until bubbly and lden; flip and continue cooking until lden on the other side.',10),(15,2,'Place the cooked tortilla in a tortilla warmer; continue rolling and cooking the remaining dough.',2),(16,3,'Combine chocolate chips, salt, and cayenne in a heat-proof measuring cup; set aside.',3),(17,3,'Separate eggs by cracking one egg into your hand over a bowl. Open your fingers slightly and gently jiggle your hand until the egg white falls into the bowl below. Transfer the yolk to a skillet. Repeat with remaining eggs. Reserve egg whites for another use.',5),(18,3,'Add sugar, milk, and cream to egg yolks. Whisk thoroughly, breaking egg yolks first, until well combined.',7),(19,3,'Place skillet on the stove over medium or medium-low heat. Cook, stirring constantly with a silicone spoon, until very hot and thick enough to coat the back of the spoon, about 5 minutes. An instant-read thermometer should read at least 175 degrees F (79 degrees C). Remove from the heat.',6),(20,3,'Set a fine sieve over the bowl of reserved chocolate. Strain the custard sauce into the chocolate and let sit for 2 minutes. Whisk until chocolate has melted and custard sauce is smooth and shiny, about 2 minutes. Add vanilla and butter; stir until butter has melted, about 1 minute.',8),(21,3,'Pour warm custard sauce into 6 serving glasses. Tilt each glass and rotate it around so the warm chocolate coats another 1/2 inch of the glass. Cover with plastic and place in the refrigerator until completely chilled, at least 3 to 4 hours.',240),(22,3,'Combine cream and vanilla extract for topping in a metal bowl and whisk until thickened; make sure no peaks form. Spoon cream into the glasses, then tilt and twirl to coat the sides a bit.',5),(23,3,'Garnish with shaved chocolate and serve.',3),(24,4,'Preheat oven to 350 degrees F (175 degrees C).',3),(25,4,'In a medium bowl, blend together softened butter, 2 cups flour and 1/2 cup sugar. Press into the bottom of an ungreased 9x13 inch pan.',5),(26,4,'Bake for 15 to 20 minutes in the preheated oven, or until firm and lden. In another bowl, whisk together the remaining 1 1/2 cups sugar and 1/4 cup flour. Whisk in the eggs and lemon juice. Pour over the baked crust.',22),(27,4,'Bake for an additional 20 minutes in the preheated oven. The bars will firm up as they cool. For a festive tray, make another pan using limes instead of lemons and adding a drop of green food coloring to give a very pale green.',20),(28,4,'After both pans have cooled, cut into uniform 2 inch squares and arrange in a checker board fashion.',5),(29,5,'Preheat oven to 375 degrees F (190 degrees C).',3),(30,5,'Roll puff pastry out on a lightly floured surface to 1/4-inch thickness; place in the refrigerator.',4),(31,5,'Melt butter in a 9-inch cast iron skillet over medium heat; stir in brown sugar, cinnamon, and nutmeg and cook and stir until sugar dissolves, about 5 minutes. Stir maple syrup into brown sugar mixture; cook, stirring, until mixture begins to bubble. Remove skillet from heat.',6),(32,5,'Pears need to be peeled, cored, and halved, or more as needed. Place one pear half, cut side up, into the center of skillet. Cut remaining pear halves in half again; arrange pear quarters around the center pear, cut sides up.',4),(33,5,'Place skillet over medium-low heat; cook pears, basting with syrup mixture, until they begin to soften, about 5 minutes. Remove skillet from heat.',6),(34,5,'Remove puff pastry from refrigerator; place pastry over pears, tucking edges of pastry around pears inside skillet.',2),(35,5,'Bake in the preheated oven until pastry is puffed and lden, about 20 minutes; allow to cool for 5 minutes. Place a serving plate over skillet; invert to remove tart (skillet will still be hot). Serve warm.',25),(36,6,'Preheat the oven to 375 degrees F (190 degrees C). Grease a baking sheet.',3),(37,6,'Pound skinless, boneless chicken breasts to 1/2-inch thickness or less.',5),(38,6,'Place beaten egg in a bowl. Combine bread crumbs, grated Parmesan cheese, Italian seasoning, and garlic powder in another bowl.',7),(39,6,'Dip each chicken breast in egg, then roll in bread crumb mixture to coat evenly. Place on the prepared baking sheet.',3),(40,6,'Bake in the preheated oven for 10 minutes. Turn and continue to cook until chicken is no longer pink in the center and juices run clear, about 10 minutes more. Let cool, 20 to 30 minutes.',40),(41,6,'Freeze in a 1-gallon resealable bag with smaller bags of tomato sauce and shredded mozzarella cheese.',5),(42,6,'To serve: Thaw in the refrigerator overnight. Reheat chicken at 375 degrees F (190 degrees C) until heated through and crispy, 15 to 20 minutes. Top chicken with tomato sauce, sprinkle with mozzarella cheese, and bake until cheese is melted, an additional 3 minutes.',30),(43,7,'Set an oven rack about 6 inches from the heat source and preheat the oven\'s broiler. Grease a broiler pan with 1/2 tablespoon olive oil.',2),(44,7,'Rinse chicken breasts and pat dry. Brush with remaining olive oil until coated. Sprinkle each piece evenly on both sides with paprika, lemon-pepper, and salt.',5),(45,7,'Place on the prepared broiler pan, sprinkle garlic over top, and sprinkle onions around the base of the chicken, with several smaller pieces on top.',3),(46,7,'Cook under the preheated broiler for 5 minutes. Flip and continue to cook, checking often, until no longer pink in the center and the juices run clear, 5 to 10 more minutes. An instant-read thermometer inserted into the center should read at least 165 degrees F (74 degrees C).',20),(47,8,'Preheat oven to 350 degrees F (175 degrees C).',3),(48,8,'In a large bowl, combine the ground beef, egg, onion, milk and bread OR cracker crumbs.',7),(49,8,'Season with salt and pepper to taste and place in a lightly greased 9x5-inch loaf pan, or form into a loaf and place in a lightly greased 9x13-inch baking dbo_dish.',4),(50,8,'In a separate small bowl, combine the brown sugar, mustard and ketchup. Mix well and pour over the meatloaf.',5),(51,8,'Bake at 350 degrees F (175 degrees C) for 1 hour.',60),(52,9,'Bring a large pot of lightly salted water to a boil. Add pasta, and cook for 7 to 9 minutes, until al dente.',10),(53,9,'Melt 6 tablespoons of butter with the olive oil in a large skillet over medium heat. Mix in the chopped fresh parsley and garlic and cook for a couple of minutes until fragrant.',4),(54,9,'Add the sliced fresh mushrooms and asparagus (trimmed and cut into 1 inch pieces) and season with salt, pepper and onion powder; cook, stirring occasionally until asparagus is tender, about 5 minutes depending on the thickness.',7),(55,9,'Place the rinsed and patted dry scallops in the pan, and cook briefly on each side until lightly browned and the center is cooked through, about 3 minutes per side. Remove from the heat when scallops are just finished.',5),(56,9,'Meanwhile, in a small saucepan, combine the milk, mascarpone cheese and remaining butter. Cook over medium heat, stirring, until sauce is warm and butter is completely melted and blended in.',3),(57,9,'Stir this sauce into the scallops and vegetables along with the pasta and serve immediately.',4),(58,10,'Combine chicken breasts and chicken broth in a saucepan over medium-high heat. Bring to a boil, cover, and reduce heat to low; simmer for 5 minutes. Turn breasts, cover, and simmer another 5 minutes. Remove from heat and let sit with the cover on for 15 minutes.',30),(59,10,'Remove chicken breasts from the broth and set aside to cool, reserving the broth in the saucepan. Once the chicken is cool enough to handle, cut into bite-size slices.',15),(60,10,'Return the chicken broth to medium heat and cook until reduced to 1 cup.',10),(61,10,'Stir garlic, black pepper, and heavy cream into the reduced broth; bring to a simmer and remove from heat.',7),(62,10,'Whisk egg yolks in a bowl until smooth. Beat 1 tablespoon of the warm cream mixture into the eggs until thoroughly incorporated; repeat until about 1/2 cup of the warm cream mixture is used.',5),(63,10,'Whisk the warm cream and egg mixture back into the saucepan with the remaining cream mixture. Cook over medium-low heat, whisking constantly, until the mixture almost comes to a simmer and thickens, about 5 minutes. Season with salt and black pepper to taste.',6),(64,10,'Bring a large pot of lightly salted water to a boil. Cook fettuccine in boiling water, stirring occasionally, until nearly cooked through, about 7 minutes. Drain.',10),(65,10,'Stir chopped fresh parsley, 1 cup of freshly grated Parmigiano-Reggiano, and cream mixture into the pasta. Remove from heat, cover, and let sit for a few minutes until thick.',5),(66,10,'Fold chicken and 1 cup Parmigiano-Reggiano into the pasta mixture to serve.',3),(67,11,'Preheat the oven to 400 degrees F (200 degrees C).',3),(68,11,'Wrap beets loosely in aluminum foil and place on a rimmed baking sheet.',5),(69,11,'Roast in the preheated oven until easily pierced with a knife or skewer, 50 to 60 minutes. Unwrap and cool until easily handled, about 10 minutes. Peel beets and cut into chunks.',80),(70,11,'Mix vinegar and maple syrup together; season with salt and pepper. Pour over beets.',10),(71,11,'Refrigerate until beets absorb the flavors, at least 1 hour. Serve cold.',60),(72,12,'Combine lemon juice, anchovies, garlic, and mustard in a blender or food processor fitted with a steel blade. Process until thoroughly combined.',5),(73,12,'Pour in olive oil very gradually through the feed tube while machine is running, first 1 tablespoon at a time, then gradually increasing the amount. Season with salt and pepper.',3),(74,12,'Stack and bunch the kale leaves together on a cutting board and cut across the stack into skinny slivers.',4),(75,12,'Place the kale, croutons, and Parmesan cheese in the bowl and drizzle with about a 1/4 of the dressing. Toss and taste the salad and add more dressing if desired, then toss again.',3),(76,13,'Preheat oven to 325 degrees F (165 degrees C).',3),(77,13,'In a small bowl, mix honey, mustard, and lemon juice.',5),(78,13,'Spread the mixture over the salmon steaks.',3),(79,13,'Season with pepper. Arrange in a medium baking dbo_dish.',4),(80,13,'Bake 20 minutes in the preheated oven, or until fish easily flakes with a fork.',20),(81,14,'Cut tips from 6 trimmed asparagus spears, about 1 1/2 inches from the top; reserve for garnish later. Chop the remaining asparagus into chunks.',5),(82,14,'Heat olive oil in a soup pot over medium heat; cook and stir chopped shallot in the hot oil until softened, about 3 minutes.',4),(83,14,'Add chopped asparagus; season with chopped mint, salt, and pepper. Cook until asparagus are slightly tender, about 3 minutes.',4),(84,14,'Pour chicken stock into asparagus mixture; bring to a boil. Reduce heat and simmer until asparagus are tender, 12 to 15 minutes. Stir in lemon zest.',15),(85,14,'Blend soup using a hand blender or a food processor until smooth.',3),(86,14,'Bring a small pot of lightly salted water to a boil; cook asparagus tips in the boiling water until just turning bright green, about 2 minutes. Strain asparagus tips and run under cold water to stop the cooking process.',7),(87,14,'Garnish soup with asparagus tips and hard-boiled chopped egg.',12),(88,15,'Preheat oven to 400 degrees F (200 degrees C). Arrange julienned tortilla strips on a baking sheet.',5),(89,15,'Bake in the preheated oven until lightly browned, 3 to 5 minutes.',5),(90,15,'Heat oil in a large saucepan over medium heat. Cook sliced onion, garlic, and jalapenos in oil until lightly browned, 4 to 5 minutes.',8),(91,15,'Prepare skinless and boneless chicken - cut into thin strips',3),(92,15,'Stir in chicken, chicken broth, lime juice, tomato (seeded and diced), salt and pepper. Gently simmer until chicken is no longer pink, about 10 minutes.',12),(93,15,'Stir in avocado (peeled, pitted and diced) and chopped cilantro and heat through, 3 to 5 minutes. Adjust seasonings to taste.',8),(94,15,'Ladle soup into bowls and sprinkle with tortilla strips to serve.',4);
/*!40000 ALTER TABLE `dbo_cookingstage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_dish`
--

DROP TABLE IF EXISTS `dbo_dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_dish` (
  `Id` int(11) NOT NULL,
  `NameDish` varchar(200) NOT NULL,
  `BaseServingsQuantity` int(11) NOT NULL,
  `CategoryId` int(11) NOT NULL,
  `Image` varchar(50) DEFAULT NULL,
  `RecipeLink` varchar(200) DEFAULT NULL,
  `Description` varchar(0) DEFAULT NULL,
  `FinalPriceInCents` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Dish_Category` (`CategoryId`),
  CONSTRAINT `FK_Dish_Category` FOREIGN KEY (`CategoryId`) REFERENCES `dbo_category` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_dish`
--

LOCK TABLES `dbo_dish` WRITE;
/*!40000 ALTER TABLE `dbo_dish` DISABLE KEYS */;
INSERT INTO `dbo_dish` VALUES (1,'Stuffed Mushrooms',6,1,'1.jpg','https://www.allrecipes.com/recipe/278271/air-fryer-stuffed-mushrooms/','',725),(2,'Homemade Flour Tortillas',24,2,'2.jpeg','https://www.allrecipes.com/recipe/157642/homemade-flour-tortillas/','',220),(3,'Chocolate Puddino',6,4,'3.jpg','https://www.allrecipes.com/recipe/283307/chocolate-puddino/','',760),(4,'The Best Lemon Bars',36,4,'4.jpeg','https://www.allrecipes.com/recipe/10294/the-best-lemon-bars/','',700),(5,'Maple-Pear Tarte Tatin',8,5,'5.jpeg','https://www.allrecipes.com/recipe/245135/maple-pear-tarte-tatin/','',1530),(6,'Make-Ahead Freezer Chicken Parmesan',4,7,'6.jpeg','https://www.allrecipes.com/recipe/279629/make-ahead-freezer-chicken-parmesan/','',870),(7,'Broiled Paprika and Lemon-Pepper Chicken Breasts',2,7,'7.jpeg','https://www.allrecipes.com/recipe/279909/broiled-paprika-and-lemon-pepper-chicken-breasts/','',920),(8,'Easy Meatloaf',8,7,'8.jpeg','https://www.allrecipes.com/recipe/16354/easy-meatloaf/','',1330),(9,'Scallops Mascarpone',6,8,'9.jpeg','https://www.allrecipes.com/recipe/147305/scallops-mascarpone/','',4440),(10,'Lighter Chicken Fettuccine Alfredo',6,8,'10.jpeg','https://www.allrecipes.com/recipe/219965/lighter-chicken-fettuccine-alfredo/','',2470),(11,'Roasted Beet Salad',4,9,'11.jpeg','https://www.allrecipes.com/recipe/270850/roasted-beet-salad/','',460),(12,'All Kale Caesar',4,9,'12.jpeg','https://www.allrecipes.com/recipe/269287/all-kale-caesar/','',1300),(13,'Easy Bake Fish',4,10,'13.jpeg','https://www.allrecipes.com/recipe/45361/easy-bake-fish/','',2170),(14,'Asparagus, Lemon, and Mint Soup',2,3,'14.jpeg','https://www.allrecipes.com/recipe/232665/asparagus-lemon-and-mint-soup/','',1040),(15,'Avocado Soup with Chicken and Lime',4,3,'15.jpg','https://www.allrecipes.com/recipe/20809/avocado-soup-with-chicken-and-lime/','',1900);
/*!40000 ALTER TABLE `dbo_dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_ingredient`
--

DROP TABLE IF EXISTS `dbo_ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_ingredient` (
  `Id` int(11) NOT NULL,
  `NameIngredient` varchar(100) NOT NULL,
  `CostInCents` int(11) NOT NULL,
  `UnitId` int(11) NOT NULL,
  `AvailableCount` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`Id`),
  KEY `FK_Ingredient_Unit` (`UnitId`),
  CONSTRAINT `FK_Ingredient_Unit` FOREIGN KEY (`UnitId`) REFERENCES `dbo_unit` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_ingredient`
--

LOCK TABLES `dbo_ingredient` WRITE;
/*!40000 ALTER TABLE `dbo_ingredient` DISABLE KEYS */;
INSERT INTO `dbo_ingredient` VALUES (1,'Button mushrooms',16,1,28),(2,'Scallion',10,2,27),(3,'Cream cheese',20,1,12),(4,'Cheddar cheese',33,1,14),(5,'Paprika',18,5,7),(6,'Salt',1,5,26),(7,'Flour',25,3,25),(8,'Baking powder',2,5,24),(9,'Lard',4,5,17),(10,'Water',1,3,18),(11,'Dark chocolate chips',25,1,10),(12,'Cayenne pepper',2,4,24),(13,'Egg',10,2,8),(14,'White sugar',13,3,10),(15,'Whole milk',16,3,4),(16,'Heavy cream',72,3,19),(17,'Vanilla extract',28,5,24),(18,'Butter',12,7,18),(19,'Dark chocolate',17,7,22),(20,'Lemon',48,2,10),(21,'Puff pastry',33,1,23),(22,'Brown sugar',1,7,12),(23,'Ground cinnamon',7,5,25),(24,'Ground nutmeg',4,4,23),(25,'Maple syrup',3,7,23),(26,'Pear',71,2,11),(27,'Chicken breast',324,6,24),(28,'Bread crumbs',44,3,28),(29,'Parmesan cheese',12,7,29),(30,'Italian seasoning',19,5,19),(31,'Garlic powder',8,5,1),(32,'Tomato sauce',6,1,4),(33,'Mozzarella cheese',96,3,17),(34,'Olive oil',13,7,23),(35,'Lemon-pepper seasoning',11,7,26),(36,'Garlic',42,10,14),(37,'Onion',78,2,21),(38,'Beef',397,6,24),(39,'Pepper',1,4,29),(40,'Prepared mustard',9,7,12),(41,'Ketchup',64,3,8),(42,'Seashell pasta',8,1,14),(43,'Parsley',3,7,20),(44,'Asparagus',298,9,9),(45,'Onion powder',9,5,11),(46,'Scallop',1498,6,6),(47,'Mascarpone cheese',50,1,18),(48,'Egg yolk',10,2,17),(49,'Fettuccine',340,6,2),(50,'Parmigiano-Reggiano cheese',240,3,9),(51,'Beet',40,2,5),(52,'Balsamic vinegar',13,7,15),(53,'Lemon juice',104,3,18),(54,'Anchovy fillets',8,2,25),(55,'Dijon mustard',3,5,1),(56,'Kale leaves',72,3,2),(57,'Crouton',120,3,13),(58,'Honey',14,7,16),(59,'Salmon steak',298,2,14),(60,'Shallot',70,2,30),(61,'Fresh mint',99,7,15),(62,'Chicken stock',56,3,27),(63,'Lemon zest',11,5,25),(64,'Corn tortillas',6,2,8),(65,'Jalapeno peppers',5,2,2),(66,'Lime juice',128,3,14),(67,'Tomato',50,2,24),(68,'Avocado',48,2,4),(69,'Fresh cilantro',1584,3,30),(70,'Cucumber',70,2,20);
/*!40000 ALTER TABLE `dbo_ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_ingredientofstage`
--

DROP TABLE IF EXISTS `dbo_ingredientofstage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_ingredientofstage` (
  `CookingStageId` int(11) NOT NULL,
  `IngredientId` int(11) NOT NULL,
  `Quantity` double NOT NULL,
  PRIMARY KEY (`CookingStageId`,`IngredientId`),
  KEY `FK_IngredientOfStage_Ingredient` (`IngredientId`),
  CONSTRAINT `FK_IngredientOfStage_CookingStage1` FOREIGN KEY (`CookingStageId`) REFERENCES `dbo_cookingstage` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_IngredientOfStage_Ingredient` FOREIGN KEY (`IngredientId`) REFERENCES `dbo_ingredient` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_ingredientofstage`
--

LOCK TABLES `dbo_ingredientofstage` WRITE;
/*!40000 ALTER TABLE `dbo_ingredientofstage` DISABLE KEYS */;
INSERT INTO `dbo_ingredientofstage` VALUES (1,1,16),(2,2,2),(4,3,4),(4,4,2),(4,5,0.25),(4,6,0.2),(8,6,1),(8,7,4),(8,8,2),(9,9,6),(10,10,1.5),(16,6,0.2),(16,11,8),(16,12,1),(17,13,6),(18,14,0.3),(18,15,1),(18,16,1.25),(20,17,0.25),(20,18,1),(22,16,0.25),(22,17,0.1),(23,19,2),(25,7,2),(25,14,0.5),(25,18,16),(26,7,0.25),(26,13,4),(26,14,1.5),(26,20,2),(30,21,17.3),(31,18,2),(31,22,5),(31,23,0.25),(31,24,1),(31,25,4),(32,26,4),(37,27,1),(38,13,1),(38,28,0.33),(38,29,2),(38,30,0.75),(38,31,0.5),(41,32,8),(41,33,0.75),(43,34,0.5),(44,5,6),(44,6,3),(44,27,1),(44,34,2),(44,35,1),(45,36,0.5),(45,37,0.5),(48,13,1),(48,15,1),(48,28,1),(48,37,1),(48,38,1.5),(49,6,0.1),(49,39,0.5),(50,22,2),(50,40,2),(50,41,0.33),(52,42,16),(53,18,6),(53,34,1),(53,36,0.2),(53,43,1),(54,1,10),(54,6,0.1),(54,39,0.5),(54,44,1),(54,45,0.5),(55,46,1),(56,15,0.25),(56,18,2),(56,47,8),(58,27,1),(58,62,2),(61,16,2),(61,36,0.7),(61,39,0.5),(62,13,2),(63,6,0.1),(64,49,1),(65,43,1),(65,50,2),(68,51,6),(70,6,0.1),(70,25,0.7),(70,39,0.5),(70,52,2),(72,36,0.3),(72,53,0.5),(72,54,2),(72,55,0.5),(73,6,0.25),(73,34,8),(73,39,0.5),(74,56,6),(75,29,2),(75,57,1),(77,55,9),(77,58,3),(77,63,1),(78,59,4),(79,39,4),(81,44,1),(82,34,1),(82,60,1),(83,6,0.25),(83,39,0.5),(83,61,1),(84,62,2),(84,63,1),(87,13,1),(88,64,4),(90,34,1.5),(90,36,1.5),(90,37,1),(90,65,4),(91,27,0.5),(92,6,0.25),(92,39,0.5),(92,62,4),(92,66,0.25),(92,67,1),(93,68,1),(93,69,0.25);
/*!40000 ALTER TABLE `dbo_ingredientofstage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_order`
--

DROP TABLE IF EXISTS `dbo_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_order` (
  `Id` int(11) NOT NULL,
  `CreatedDT` timestamp NOT NULL DEFAULT current_timestamp(),
  `ClientId` int(11) NOT NULL,
  `AppointedDT` datetime NOT NULL,
  `AppointedAddress` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Order_Client` (`ClientId`),
  CONSTRAINT `FK_Order_Client` FOREIGN KEY (`ClientId`) REFERENCES `dbo_client` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_order`
--

LOCK TABLES `dbo_order` WRITE;
/*!40000 ALTER TABLE `dbo_order` DISABLE KEYS */;
INSERT INTO `dbo_order` VALUES (1,'2025-10-13 02:54:05',2,'2025-10-15 10:50:00','2282 Northaven Rd'),(2,'2025-10-15 02:50:22',2,'2025-10-16 12:05:00','1270  Pickens Way'),(3,'2025-10-23 07:20:07',3,'2025-10-25 11:00:00','2615  Caynor Circle'),(4,'2025-11-02 10:33:54',4,'2025-12-02 07:15:00','6031 Pecan Acres Ln'),(5,'2025-11-05 06:38:52',6,'2025-12-02 09:00:00','9486 Ash Dr'),(6,'2025-12-01 06:47:15',1,'2025-12-02 16:45:00','4457  Flanigan Oaks Drive'),(7,'2025-12-02 01:50:47',10,'2025-12-02 11:20:00','3113  George Avenue'),(8,'2026-01-02 08:39:04',7,'2026-01-06 20:30:00','2145  McDowell Street'),(9,'2026-01-16 00:13:08',8,'2026-01-16 19:30:00','2385 Taylor St'),(10,'2026-01-21 03:32:37',5,'2026-01-21 16:05:00','4379  Front Street');
/*!40000 ALTER TABLE `dbo_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_ordereddish`
--

DROP TABLE IF EXISTS `dbo_ordereddish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_ordereddish` (
  `OrderId` int(11) NOT NULL,
  `DishId` int(11) NOT NULL,
  `ServingsNumber` int(11) DEFAULT NULL,
  `StartCookingDT` datetime DEFAULT NULL,
  `EndCookingDT` datetime DEFAULT NULL,
  PRIMARY KEY (`OrderId`,`DishId`),
  KEY `FK_OrderedDish_Dish` (`DishId`),
  CONSTRAINT `FK_OrderedDish_Dish` FOREIGN KEY (`DishId`) REFERENCES `dbo_dish` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_OrderedDish_Order` FOREIGN KEY (`OrderId`) REFERENCES `dbo_order` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_ordereddish`
--

LOCK TABLES `dbo_ordereddish` WRITE;
/*!40000 ALTER TABLE `dbo_ordereddish` DISABLE KEYS */;
INSERT INTO `dbo_ordereddish` VALUES (1,2,96,'2025-10-16 06:12:00','2025-10-16 08:01:00'),(1,3,60,'2025-10-15 21:56:00','2025-10-16 06:07:00'),(1,15,36,'2025-10-16 08:43:00','2025-10-16 10:22:00'),(2,1,24,'2025-10-16 07:20:00','2025-10-16 08:34:00'),(2,2,48,'2025-10-16 08:56:00','2025-10-16 09:52:00'),(2,3,48,'2025-10-15 17:55:00','2025-10-15 23:37:00'),(2,15,36,'2025-10-16 09:52:00','2025-10-16 11:11:00'),(3,6,28,'2025-10-24 14:27:00','2025-10-24 17:08:00'),(3,10,30,'2025-10-25 07:58:00','2025-10-25 09:39:00'),(3,14,6,'2025-10-24 17:57:00','2025-10-24 18:46:00'),(3,15,8,'2025-10-25 09:45:00','2025-10-25 10:30:00'),(4,11,16,'2025-12-01 15:57:00','2025-12-01 19:08:00'),(4,12,28,'2025-12-02 06:07:00','2025-12-02 06:53:00'),(4,13,4,'2025-12-01 16:26:00','2025-12-01 18:05:00'),(4,15,20,'2025-12-01 18:17:00','2025-12-01 20:14:00'),(5,7,2,NULL,NULL),(5,8,8,NULL,NULL),(6,1,42,NULL,NULL),(6,5,32,'2025-12-02 07:29:00',NULL),(6,15,20,'2025-12-01 17:34:00','2025-12-01 20:35:00'),(7,8,40,'2025-12-02 09:36:00',NULL),(7,9,12,'2025-12-02 10:23:00',NULL),(7,15,12,NULL,NULL),(8,1,54,NULL,NULL),(8,3,6,NULL,NULL),(8,6,4,NULL,NULL),(8,9,54,NULL,NULL),(9,2,72,NULL,NULL),(9,8,64,NULL,NULL),(9,9,48,NULL,NULL),(9,10,60,NULL,NULL),(10,8,24,NULL,NULL),(10,10,48,NULL,NULL),(10,13,40,NULL,NULL),(10,14,2,NULL,NULL);
/*!40000 ALTER TABLE `dbo_ordereddish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbo_unit`
--

DROP TABLE IF EXISTS `dbo_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dbo_unit` (
  `Id` int(11) NOT NULL,
  `NameUnit` varchar(50) NOT NULL,
  `ShortName` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbo_unit`
--

LOCK TABLES `dbo_unit` WRITE;
/*!40000 ALTER TABLE `dbo_unit` DISABLE KEYS */;
INSERT INTO `dbo_unit` VALUES (1,'ounce','oz'),(2,'piece','pcs'),(3,'cup',NULL),(4,'pinch',NULL),(5,'teaspoon',NULL),(6,'pound','lb'),(7,'tablespoon',NULL),(8,'package','pkg'),(9,'bunch',NULL),(10,'bulb',NULL);
/*!40000 ALTER TABLE `dbo_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-23 11:58:18
