CREATE TABLE users (
    id INT IDENTITY(1,1) PRIMARY KEY,
    fullname NVARCHAR(100) NOT NULL,
    gender VARCHAR(10) CHECK (gender IN ('male', 'female', 'other')),
    birthday DATE,
    phone VARCHAR(20),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    address TEXT,
    role VARCHAR(20) CHECK (role IN ('admin', 'farmer', 'customer')) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);

INSERT INTO users (fullname, gender, birthday, phone, email, password, address, role)
VALUES
('Nguyễn Văn Admin', 'male', '1990-01-01', '0123456789', 'admin@fpt.com', 'admin123', '123 Admin Street', 'admin'),
('Trần Văn Farmer', 'male', '1985-05-15', '0987654321', 'farmer@fpt.com', 'farmer123', '456 Farm Road', 'farmer'),
('Lê Thị Customer', 'female', '1995-12-25', '0112233445', 'customer@fpt.com', 'customer123', '789 Customer Ave', 'customer');
