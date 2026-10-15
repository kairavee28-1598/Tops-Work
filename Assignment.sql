-- Session 1
-- Database is a system used to store and organise data
create database analytics_db ;

-- Session 2
-- select means what data you want
-- from meand where data is stored

-- select * from restaurant

-- select name, rating
-- from zomato_reviews

-- select movue)name as Title, release_year as Year
-- from movies

-- select * from products ;

-- Session 3
-- where means filters rows based on condition

-- select name, rating
-- from restaurants
-- where rating > 4.5 ;

-- select * from movies
-- where release_year > 2020 and genre = "Action" ;

-- select product_id, product_name, price, category
-- from products
-- where category <> "Electronics" and price < 500 ;

-- select * from users
-- where not city = 'Ahmedabad' and followers > 1000;

-- Session 4
-- Wildcards & Patterns
-- Like = used for finding specific text pattern
-- Between = to filter between a range including starting and ending point
-- In = to filter on multiple values. It checks if a value matches

-- select *
-- from restaurant 
-- where name like "Cafe%" ;

-- select product_name, price
-- from products
-- where price between 500 and 1500;

-- select * from users 
-- where city in ("Ahmedabad", "Surat", "Vadodara" )

-- select * from Songs
-- where artist_name LIKE '%ar%';

-- Session 5
-- Distinct = removes duplicate data. It operates on rows and not columns
-- Order by = it sorts the data in form of asc or dec
-- Limit = specific number of rows
-- Offset = removes/skips the no of data after the particular number

-- select distinct payment_method
-- from orders;

-- select distinct city
-- from users
-- order by city asc;


-- select booking_name
-- from bookings
-- order by booking_date desc
-- limit 5 ;

-- SELECT name, sold_count
-- FROM products
-- ORDER BY sold_count DESC
-- LIMIT 10;

-- Aggregrate function
-- SUM, AVG, COUNT, MIN, MAX

-- select order_id, user_id, sum(amount) as total_amount
-- from food_orders ;

-- select playlist_id, user_id, song_id, count(songs)
-- from spotify_playlist ;

-- select review_id, movie_id, round(avg(rating, 1))
-- from bookmyshow_reviews ;

-- select txn_id, user_id, max(amount) as max_amount, min(amount) as min_amount
-- from paytm_transactions ;

-- select order_id, user_id, round(avg(total_price, 2))
-- from myntra_orders 
-- group by order_id, user_id ;

-- Session 7
-- Group by means it groups the rows that have same values and allows aggregration function per group
-- Where v/s Having :
-- where = filter before group by
-- having = filter after group by

-- select user_id, count(*) as total_orders
-- from food_orders
-- group by user_id ;

-- select payment_method, SUM(amount) AS total_amount
-- from transactions
-- group by payment_method;

-- SELECT genre, SUM(box_office_collection) AS total_collection
-- FROM movies
-- GROUP BY genre
-- HAVING SUM(box_office_collection) > 10;

-- select user_id, SUM(duration) AS total_duration
-- from playlist
-- group by user_id
-- having SUM(duration) > 7200;

-- Session 8
-- Constraints : use data for validation
-- Primary key : unique, not null and use only once per table
-- Foreign key : it is a common column between two tables
-- Joins : to join two tables there should be one common column
-- Different types of Joins :-
-- a) Inner join : join join only common values
-- b) left join : to join common values from both tables and left table also
-- c) Right join : to join common values from both tables and right table also
-- d) Outer join : to join every values from both tables
-- e) self join : table join by itself
-- f) cross join : use for matrix table

-- CREATE TABLE Users (
-- user_id INT PRIMARY KEY,
-- username VARCHAR(50),
-- city VARCHAR(50)
-- );

-- CREATE TABLE Orders (
-- order_id INT PRIMARY KEY,
-- user_id INT,
-- product VARCHAR(100),
-- amount DECIMAL(10,2),
-- FOREIGN KEY (user_id) REFERENCES Users(user_id)
-- ); 

-- INSERT INTO Users (user_id, username, city)
-- VALUES
-- (1, 'Rahul', 'Ahmedabad'),
-- (2, 'Priya', 'Surat'),
-- (3, 'Amit', 'Mumbai');

-- INSERT INTO Orders (order_id, user_id, product, amount)
-- VALUES
-- (101, 1, 'Burger', 250),
-- (102, 1, 'Pizza', 500),
-- (103, 2, 'Biryani', 300),
-- (104, 2, 'Pasta', 350),
-- (105, 1, 'Sandwich', 150);

-- SELECT u.username, o.product
-- FROM Users u
-- INNER JOIN Orders o
-- ON u.user_id = o.user_id;

-- SELECT u.username, o.product
-- FROM Users u
-- LEFT JOIN Orders o
-- ON u.user_id = o.user_id;

-- SELECT o.order_id, o.product, u.username
-- FROM Users u
-- RIGHT JOIN Orders o
-- ON u.user_id = o.user_id;

-- Session 9 :
-- CREATE TABLE influencers (
-- influencer_id INT PRIMARY KEY,
-- influencer_name VARCHAR(100),
-- city VARCHAR(50)
-- );

-- CREATE TABLE brands (
-- brand_id INT PRIMARY KEY,
-- brand_name VARCHAR(100),
-- city VARCHAR(50)
-- );

-- INSERT INTO influencers VALUES
-- (1, 'Riya Sharma', 'Ahmedabad'),
-- (2, 'Aman Patel', 'Mumbai'),
-- (3, 'Neha Singh', 'Delhi');

-- INSERT INTO brands VALUES
-- (101, 'Flipkart', 'Ahmedabad'),
-- (102, 'Nike', 'Mumbai'),
-- (103, 'Samsung', 'Bangalore');

-- SELECT 
-- i.influencer_name,
-- b.brand_name
-- FROM influencers i
-- LEFT JOIN brands b
-- ON i.city = b.city
-- UNION
-- SELECT 
-- i.influencer_name,
-- b.brand_name
-- FROM influencers i
-- RIGHT JOIN brands b
-- ON i.city = b.city;

-- SELECT 
-- p.playlist_name AS playlist,
-- parent.playlist_name AS parent_playlist
-- FROM playlists p
-- LEFT JOIN playlists parent
-- ON p.parent_playlist_id = parent.id;

-- CREATE TABLE users (
-- user_id INT PRIMARY KEY,
-- user_name VARCHAR(100)
-- );

-- CREATE TABLE offers (
-- offer_id INT PRIMARY KEY,
-- offer_title VARCHAR(100)
-- );

-- INSERT INTO users VALUES
-- (1, 'Rahul'),
-- (2, 'Priya'),
-- (3, 'Amit');

-- INSERT INTO offers VALUES
-- (101, '20% Off Electronics'),
-- (102, '₹500 Off Fashion'),
-- (103, 'Free Delivery');

-- SELECT 
-- u.user_name,
-- o.offer_title
-- FROM users u
-- CROSS JOIN offers o;

-- SELECT 
-- e.name AS employee_name,
-- m.name AS manager_name
-- FROM employees e
-- LEFT JOIN employees m
-- ON e.manager_id = m.id;

-- SELECT 
-- u1.user_name AS user1,
-- u2.user_name AS user2,
-- u1.city
-- FROM users u1
-- JOIN users u2
-- ON u1.city = u2.city
-- AND u1.user_id < u2.user_id;

-- Session 10
-- SELECT customer_name
-- FROM AppOrders
-- UNION
-- SELECT customer_name
-- FROM InStoreOrders;

-- Session 11
-- SELECT name, rating
-- FROM Restaurants
-- WHERE rating > (
-- SELECT AVG(rating)
-- FROM Restaurants
-- );

-- SELECT 
-- p.name,
-- p.price,
-- (
	-- SELECT AVG(p2.price)
	-- FROM Products p2
	-- WHERE p2.category = p.category
-- ) AS category_avg_price
-- FROM Products p;


-- SELECT 
-- u.username,
-- p.playlist_count
-- FROM Users u
-- JOIN (
-- SELECT 
	-- user_id,
	-- COUNT(*) AS playlist_count
    -- FROM Playlists
    -- GROUP BY user_id
-- ) p
-- ON u.user_id = p.user_id
-- WHERE p.playlist_count > (
-- SELECT AVG(playlist_count)
-- FROM (
        -- SELECT 
		-- user_id,
		-- COUNT(*) AS playlist_count
        -- FROM Playlists
        -- GROUP BY user_id
    -- ) AS playlist_counts
-- );


-- SELECT DISTINCT user_id
-- FROM Orders
-- WHERE total_amount > (
    -- SELECT AVG(total_amount)
    -- FROM Orders
-- );

-- Session 12
-- WITH TopArtists AS (
    -- SELECT artist_id, name, followers
    -- FROM SpotifyArtists
    -- ORDER BY followers DESC
    -- LIMIT 3
-- )
-- SELECT *
-- FROM TopArtists;


-- WITH MonthlyTotals AS (
    -- SELECT 
	-- MONTH(order_date) AS month,
	-- SUM(total_amount) AS total_sales
    -- FROM FlipkartOrders
    -- WHERE YEAR(order_date) = 2023
    -- GROUP BY MONTH(order_date)
-- )
-- SELECT *
-- FROM MonthlyTotals
-- ORDER BY total_sales DESC
-- LIMIT 1;


-- WITH RECURSIVE CalendarDays AS (
    -- SELECT CURDATE() AS day_date
    -- UNION ALL
    -- SELECT DATE_ADD(day_date, INTERVAL 1 DAY)
    -- FROM CalendarDays
    -- WHERE day_date < DATE_ADD(CURDATE(), INTERVAL 6 DAY)
-- )
-- SELECT day_date
-- FROM CalendarDays;


-- WITH CityAverage AS (
    -- SELECT 
	-- city,
	-- AVG(rating) AS avg_rating
    -- FROM ZomatoRestaurants
    -- GROUP BY city
-- )
-- SELECT 
-- z.id,
-- z.name,
-- z.city,
-- z.rating
-- FROM ZomatoRestaurants z
-- JOIN CityAverage c
-- ON z.city = c.city
-- WHERE c.avg_rating > 4.0;


-- Session 13
-- CREATE TABLE Orders (
-- order_id INT PRIMARY KEY,
-- user_id INT,
-- order_amount DECIMAL(10, 2),
-- app_name VARCHAR(50)
-- );

-- INSERT INTO Orders (order_id, user_id, order_amount, app_name)
-- VALUES
-- (1, 101, 500.00, 'Zomato'),
-- (2, 102, 800.00, 'Swiggy'),
-- (3, 101, 300.00, 'Flipkart'),
-- (4, 103, 1200.00, 'Zomato'),
-- (5, 104, 650.00, 'Swiggy'),
-- (6, 102, 400.00, 'Flipkart'),
-- (7, 105, 1500.00, 'Zomato'),
-- (8, 103, 700.00, 'Swiggy'),
-- (9, 101, 900.00, 'Flipkart'),
-- (10, 104, 350.00, 'Zomato');

-- SELECT
-- order_id,
-- user_id,
-- order_amount,
-- app_name,
-- SUM(order_amount) OVER() AS total_order_amount
-- FROM Orders;


-- SELECT
-- order_id,
-- user_id,
-- order_amount,
-- AVG(order_amount) OVER(
	-- PARTITION BY user_id
    00 ) AS user_avg_order_amount
-- FROM Orders;


-- CREATE TABLE Playlist (
-- song_id INT PRIMARY KEY,
-- user_id INT,
-- duration_sec INT
-- );

-- INSERT INTO Playlist (song_id, user_id, duration_sec)
-- VALUES
-- (1, 101, 180),
-- (2, 101, 240),
-- (3, 102, 200),
-- (4, 102, 150),
-- (5, 101, 210),
-- (6, 103, 300),
-- (7, 103, 180);

-- SELECT
-- song_id,
-- user_id,
-- duration_sec,
-- SUM(duration_sec) OVER(
	-- PARTITION BY user_id
    -- ) AS total_duration_sec
-- FROM Playlist;


-- SELECT
-- rating_id,
-- user_id,
-- movie_name,
-- rating,
-- AVG(rating) OVER(
-- PARTITION BY movie_name
-- ) AS movie_avg_rating,
-- rating - AVG(rating) OVER(
-- PARTITION BY movie_name
-- ) AS rating_difference
-- FROM MovieRatings;


-- Session 14
-- SELECT
-- order_id,
-- user_id,
-- order_date,
-- total_amount,
-- ROW_NUMBER() OVER (
	-- PARTITION BY user_id
	-- ORDER BY order_date DESC
-- ) AS row_num
-- FROM Orders;

-- SELECT
-- song_id,
-- artist,
-- streams,
-- RANK() OVER (
	-- PARTITION BY artist
	-- ORDER BY streams DESC
    -- ) AS song_rank
-- FROM Songs;


-- SELECT movie_id, genre, rating,
-- DENSE_RANK() OVER (
	-- PARTITION BY genre
	-- ORDER BY rating DESC
    -- ) AS movie_rank
-- FROM Movies;


-- WITH RankedInfluencers AS (
-- SELECT id, platform, followers,
	-- ROW_NUMBER() OVER (
		-- PARTITION BY platform
		-- ORDER BY followers DESC
	-- ) AS row_num
-- FROM Influencers
-- )
-- SELECT id, platform, followers, row_num
-- FROM RankedInfluencers
-- WHERE row_num <= 3
-- ORDER BY platform, row_num;


-- Session 15
-- SELECT NOW() AS CurrentDateTime;

-- SELECT order_date,
-- YEAR(order_date) AS order_year,
-- MONTH(order_date) AS order_month,
-- DAY(order_date) AS order_day
-- FROM Orders;

-- SELECT delivery_date,
-- DATE_SUB(delivery_date, INTERVAL 2 DAY)
	-- AS expected_pickup_date
-- FROM Deliveries;

-- SELECT user_id, start_date, end_date,
-- DATEDIFF(end_date, start_date) AS subscription_days
-- FROM Subscriptions;

-- SELECT user_id, last_login_date
-- FROM AppLogins
-- WHERE DATEDIFF(NOW(), last_login_date) > 30;


-- Session 16
-- SELECT
-- CONCAT(first_name, ' ', last_name) AS full_name
-- FROM users;

-- SELECT
-- UPPER(song_title) AS uppercase_title
-- FROM playlists;

-- SELECT
-- TRIM(item_code) AS cleaned_item_code
-- FROM food_items;

-- SELECT imdb_id,
-- RIGHT(imdb_id, 7) AS movie_number
-- FROM movies;

-- SELECT sku_code,
-- REPLACE(sku_code, '-', '_') AS updated_sku_code
-- FROM products;


-- Session 17
-- SELECT *,
-- CASE
	-- WHEN total_amount < 300 THEN 'Small'
	-- WHEN total_amount BETWEEN 300 AND 999 THEN 'Medium'
	-- ELSE 'Large'
-- END AS order_category
-- FROM FoodOrders;

-- SELECT *,
-- CASE
	-- WHEN rating >= 8 THEN 'Blockbuster'
	-- WHEN rating >= 5 THEN 'Hit'
	-- ELSE 'Average'
-- END AS popularity
-- FROM Movies;

-- SELECT *,
-- CASE
	-- WHEN price < 500 THEN 'Budget'
	-- WHEN price BETWEEN 500 AND 2000 THEN 'Standard'
	-- ELSE 'Premium'
-- END AS price_category
-- FROM FlipkartProducts;

-- SELECT *,
-- CASE
	-- WHEN duration_sec < 180 THEN 'Short'
	-- WHEN duration_sec BETWEEN 180 AND 300 THEN 'Medium'
	-- ELSE 'Long'
-- END AS duration_label
-- FROM SpotifyTracks;


-- Session 18
-- CREATE VIEW TopRatedRestaurants AS
-- SELECT r.restaurant_name, AVG(rv.rating) AS average_rating,
-- COUNT(rv.review_id) AS total_reviews
-- FROM Restaurants r
-- INNER JOIN Reviews rv
-- ON r.restaurant_id = rv.restaurant_id
-- GROUP BY
-- r.restaurant_id,
-- r.restaurant_name

-- CREATE OR REPLACE VIEW TopRatedRestaurants AS
-- SELECT r.restaurant_name, r.city, AVG(rv.rating) AS average_rating,
-- COUNT(rv.review_id) AS total_reviews
-- FROM Restaurants r
-- INNER JOIN Reviews rv
-- ON r.restaurant_id = rv.restaurant_id
-- GROUP BY
-- r.restaurant_id,
-- r.restaurant_name,
-- r.city
-- HAVING AVG(rv.rating) > 4.0;
-- HAVING AVG(rv.rating) > 4.0;

-- UPDATE TopRatedRestaurants
-- SET average_rating = 5.0
-- WHERE restaurant_name = 'Spice Garden';

-- CREATE VIEW DailyOrderSummary AS
-- SELECT DATE(order_date) AS order_day, COUNT(order_id) AS total_orders,
-- SUM(total_amount) AS total_revenue
-- FROM SwiggyOrders
-- WHERE order_date >= CURDATE() - INTERVAL 29 DAY
-- AND order_date < CURDATE() + INTERVAL 1 DAY
-- GROUP BY DATE(order_date);


-- Session 19
-- SELECT * FROM orders
-- WHERE user_id = 101;

-- SET profiling = 1;
-- SELECT * FROM orders
-- WHERE user_id = 101;
-- SHOW PROFILES;


-- CREATE INDEX idx_user_id
-- ON orders(user_id);

-- SELECT * FROM orders
-- WHERE user_id = 101;


-- EXPLAIN
-- SELECT * FROM orders
-- WHERE user_id = 101;

-- CREATE INDEX idx_category
-- ON products(category);

-- EXPLAIN
-- SELECT *
-- FROM products
-- WHERE category = 'Electronics';


-- Session 20
CREATE DATABASE ipl_project;
-- USE ipl_project;

-- CREATE TABLE ipl_matches (
--  id INT,
--  season INT,
--  match_date DATE,
--  team1 VARCHAR(100),
--  team2 VARCHAR(100),
--  winner VARCHAR(100),
--  venue VARCHAR(200)
-- );

-- SELECT COUNT(*) AS total_matches
-- FROM ipl_matches;
-- SELECT * FROM ipl_matches
-- LIMIT 10;


-- SELECT * FROM ipl_matches
-- WHERE team1 = 'Mumbai Indians'
-- OR team2 = 'Mumbai Indians';

-- SELECT * FROM ipl_matches
-- WHERE 'Mumbai Indians' IN (team1, team2);


-- SELECT team, COUNT(*) AS matches_played
-- FROM (
--  SELECT team1 AS team FROM ipl_matches
--  UNION ALL
--  SELECT team2 AS team FROM ipl_matches
-- ) AS all_teams
-- GROUP BY team
-- ORDER BY matches_played DESC;


-- SELECT winner AS team, COUNT(*) AS total_wins
-- FROM ipl_matches
-- WHERE winner IS NOT NULL
-- AND winner <> ''
-- GROUP BY winner
-- ORDER BY total_wins DESC;


-- Session 23
-- SELECT name,
-- AVG(CAST(rate AS DECIMAL(3,1))) AS average_rating,
-- SUM(votes) AS total_votes
-- FROM restaurants
-- WHERE location LIKE '%Koramangala%'
-- AND rate IS NOT NULL
-- AND rate REGEXP '^[0-5](\\.[0-9])?$'
-- GROUP BY name
-- ORDER BY average_rating DESC, total_votes DESC
-- LIMIT 5;

-- SELECT cuisine,
-- COUNT(DISTINCT restaurant_id) AS restaurant_count
-- FROM restaurant_cuisines
-- WHERE location = 'Indiranagar'
-- GROUP BY cuisine
-- ORDER BY restaurant_count DESC;

-- SELECT
    -- rest_type,
    -- ROUND(
        -- AVG(
            -- CAST(
                -- REPLACE(
                    -- REPLACE(
                        `-- approx_cost(for two people)`,
                       --  ',', ''
                   --  ),
                    -- '₹', ''
                -- ) AS DECIMAL(10,2)
            -- )
        -- ),
       --  2
    -- ) AS average_cost_for_two
-- FROM restaurants
-- WHERE rest_type IS NOT NULL
-- AND `approx_cost(for two people)` IS NOT NULL
-- AND TRIM(`approx_cost(for two people)`) REGEXP '^[₹]?[0-9,]+$'
-- GROUP BY rest_type
-- ORDER BY average_cost_for_two DESC;

-- SELECT name, location,
-- CAST(rate AS DECIMAL(3,1)) AS rating,
-- votes, rest_type, cuisines
-- FROM restaurants
-- WHERE rate REGEXP '^[0-5](\\.[0-9])?$'
-- AND CAST(rate AS DECIMAL(3,1)) < 3.0
-- AND votes > 200
-- ORDER BY votes DESC, rating ASC;


