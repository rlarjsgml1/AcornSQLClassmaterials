CREATE TABLE drink_order (
    order_id NUMBER,
    drink_name VARCHAR2(20)
);
 
CREATE TABLE drink_order_option (
    order_id NUMBER,
    option_name VARCHAR2(20)
);
 
 
 -- 주문
INSERT INTO drink_order VALUES (1, '아메리카노');
INSERT INTO drink_order VALUES (2, '라떼');

-- 옵션
INSERT INTO drink_order_option VALUES (1, '샷 추가');
INSERT INTO drink_order_option VALUES (1, '얼음 적게');
INSERT INTO drink_order_option VALUES (1, '시럽 추가');

INSERT INTO drink_order_option VALUES (2, '우유 변경');
INSERT INTO drink_order_option VALUES (2, '휘핑 추가');

COMMIT;