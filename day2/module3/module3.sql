use ecommerce;

drop table orders;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    amount INT NOT NULL,
    status ENUM("Completed","Pending","Cancelled"),
    city VARCHAR(100)
)

INSERT INTO orders VALUES 
(101,1,500,"Completed","Mumbai"),
(102,2,1200,"Pending","Pune"),
(103,1,800,"Completed","Mumbai"),
(104,3,300,"Cancelled","Delhi"),
(105,4,2000,"Completed","Delhi"),
(106,5,700,"Pending","Pune"),
(107,6,1500,"Completed","Mumbai"),
(108,7,400,"Cancelled","Delhi")