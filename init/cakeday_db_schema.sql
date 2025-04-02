
-- 1. 카테고리 테이블
CREATE TABLE category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL
);

-- 2. 회원 테이블
CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    phone_number VARCHAR(11) NOT NULL,
    favorite_area VARCHAR(5) NOT NULL,
    nickname VARCHAR(20) NOT NULL,
    profile_img VARCHAR(255),
    user_name VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 3. 회원권한 테이블
CREATE TABLE user_role (
    user_id INT NOT NULL,
    role ENUM('buyer', 'seller') NOT NULL,
    create_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    update_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- 4. 케이크 옵션 테이블들
CREATE TABLE cake_shape (
    cake_shape_id INT PRIMARY KEY AUTO_INCREMENT,
    cake_shape_name VARCHAR(20) NOT NULL
);

CREATE TABLE cake_size (
    cake_size_id INT PRIMARY KEY AUTO_INCREMENT,
    cake_size_name VARCHAR(20) NOT NULL
);

CREATE TABLE cake_type (
    cake_type_id INT PRIMARY KEY AUTO_INCREMENT,
    cake_type_name VARCHAR(20) NOT NULL
);

CREATE TABLE cake_filling (
    cake_filling_id INT PRIMARY KEY AUTO_INCREMENT,
    cake_filling_name VARCHAR(20) NOT NULL
);

-- 5. 가게 테이블
CREATE TABLE shop (
    shop_id INT PRIMARY KEY AUTO_INCREMENT,
    owner_id INT NOT NULL,
    shop_name VARCHAR(20) NOT NULL,
    shop_number VARCHAR(11) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (owner_id) REFERENCES user(user_id)
);

-- 6. 케이크 테이블
CREATE TABLE cake (
    cake_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT NOT NULL,
    category_id INT NOT NULL,
    cake_name VARCHAR(50) NOT NULL,
    description TEXT,
    cake_img VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES user(user_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

-- 7. 케이크 상세옵션 테이블
CREATE TABLE cake_variants (
    variant_id INT PRIMARY KEY AUTO_INCREMENT,
    cake_id INT NOT NULL,
    cake_shape_id INT NOT NULL,
    cake_type_id INT NOT NULL,
    cake_size_id INT NOT NULL,
    cake_filling_id INT NOT NULL,
    FOREIGN KEY (cake_id) REFERENCES cake(cake_id),
    FOREIGN KEY (cake_shape_id) REFERENCES cake_shape(cake_shape_id),
    FOREIGN KEY (cake_type_id) REFERENCES cake_type(cake_type_id),
    FOREIGN KEY (cake_size_id) REFERENCES cake_size(cake_size_id),
    FOREIGN KEY (cake_filling_id) REFERENCES cake_filling(cake_filling_id)
);

-- 8. 주문 테이블
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT NOT NULL,
    user_id INT NOT NULL,
    pickup_date DATE NOT NULL,
    pickup_time TIME NOT NULL,
    lettering_message TEXT,
    memo TEXT,
    sample_img VARCHAR(255),
    order_state ENUM('예약요청','접수완료','픽업완료','취소') NOT NULL,
    total_price DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (seller_id) REFERENCES user(user_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- 9. 주문 상세 테이블
CREATE TABLE order_detail (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    cake_id INT NOT NULL,
    variant_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (cake_id) REFERENCES cake(cake_id),
    FOREIGN KEY (variant_id) REFERENCES cake_variants(variant_id)
);

-- 10. 리뷰 테이블
CREATE TABLE review (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    cake_id INT NOT NULL,
    shop_id INT,
    rating DOUBLE NOT NULL,
    comment TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (cake_id) REFERENCES cake(cake_id),
    FOREIGN KEY (shop_id) REFERENCES shop(shop_id)
);

-- 11. 찜목록 테이블
CREATE TABLE favorite (
    user_id INT NOT NULL,
    cake_id INT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, cake_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (cake_id) REFERENCES cake(cake_id)
);

-- 12. 추천 시스템 로그
CREATE TABLE recommendation (
    rec_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    cake_id INT NOT NULL,
    algorithm_type ENUM('기본','인기','맞춤형'),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (cake_id) REFERENCES cake(cake_id)
);

-- 13. 결제 테이블
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    owner_id INT NOT NULL,
    user_id INT NOT NULL,
    payment_method ENUM('카카오페이','무통장입금','카드') NOT NULL,
    payment_status ENUM('대기','완료','환불') NOT NULL,
    payment_amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id),
    FOREIGN KEY (owner_id) REFERENCES user(user_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);
