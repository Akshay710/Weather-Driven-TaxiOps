DROP SCHEMA IF EXISTS green_taxi_dw;
CREATE SCHEMA green_taxi_dw;

DROP TABLE IF EXISTS green_taxi_dw.date_dim;
DROP TABLE IF EXISTS green_taxi_dw.trip_type_dim;
DROP TABLE IF EXISTS green_taxi_dw.passenger_dim;
DROP TABLE IF EXISTS green_taxi_dw.payment_type_dim;
DROP TABLE IF EXISTS green_taxi_dw.weather_dim;
DROP TABLE IF EXISTS green_taxi_dw.rate_code_dim;
DROP TABLE IF EXISTS green_taxi_dw.fact_table;

-- Create date dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.date_dim (
                                                    sk_date INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                                    date DATE,
                                                    year INT, 
                                                    month INT,
                                                    day INT,
                                                    hour INT
);
-- Create trip_type dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.trip_type_dim (
                                                    sk_trip_type INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
                                                    trip_type INT
);
-- Create passenger dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.passenger_dim (
    sk_passenger INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    passenger_count INT
);
-- Create payment dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.payment_type_dim (
    sk_payment_type INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    payment_type INT
);
-- Create weather dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.weather_dim (
    sk_weather INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    weather_recorded_date DATE,
    `hour` INT,
    temp DECIMAL(10, 6), 
    feelslike DECIMAL(10, 6),
    dew DECIMAL(10, 6),
    humidity DECIMAL(10, 6),
    precip DECIMAL(10, 6),
    snow DECIMAL(10, 6),
    windspeed DECIMAL(10, 6), 
    icon VARCHAR(100)
);
-- Create rate code dimension
CREATE TABLE IF NOT EXISTS green_taxi_dw.rate_code_dim (
    sk_rate_code INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rate_code INT
);
-- Create fact table
CREATE TABLE IF NOT EXISTS green_taxi_dw.fact_table (
    sk_date INT,
    sk_trip_type INT,
    sk_passenger INT,
    sk_payment_type INT,
    sk_weather INT,
    sk_rate_code INT,
    trip_distance DECIMAL(10, 6),
    fare_amount DECIMAL(10, 6),
    tip_amount DECIMAL(10, 6),
    extra_amount DECIMAL(10, 6),
    mta_tax DECIMAL(10, 6),
    improvement_surcharge DECIMAL(10, 6),
    tolls_amount DECIMAL(10, 6),
    total_amount DECIMAL(10, 6),
    congestion_surcharge DECIMAL(10, 6),
    number_of_trips INT,
    PRIMARY KEY(sk_date, sk_trip_type, sk_passenger, sk_payment_type, sk_weather, sk_rate_code)
)