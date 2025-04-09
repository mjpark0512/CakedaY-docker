-- user 테이블 컬럼 추가 스크립트
ALTER TABLE user
  ADD COLUMN user_type VARCHAR(20) NOT NULL,
  ADD COLUMN selected_cakes TEXT;
