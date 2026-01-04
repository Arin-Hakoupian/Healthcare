BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "appointments" (
	"appointment_id"	INTEGER,
	"patient_id"	INTEGER,
	"doctor_id"	INTEGER,
	"appointment_date"	TEXT,
	"diagnosis"	TEXT,
	"status"	TEXT,
	"follow_up_date"	TEXT,
	"fee"	REAL,
	PRIMARY KEY("appointment_id"),
	FOREIGN KEY("doctor_id") REFERENCES "doctors"("doctor_id"),
	FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
);
CREATE TABLE IF NOT EXISTS "billing" (
	"payment_id"	INTEGER,
	"appointment_id"	INTEGER,
	"amount"	REAL,
	"payment_method"	TEXT,
	"payment_date"	TEXT,
	PRIMARY KEY("payment_id")
);
CREATE TABLE IF NOT EXISTS "departments" (
	"department_id"	INTEGER,
	"name"	TEXT,
	PRIMARY KEY("department_id")
);
CREATE TABLE IF NOT EXISTS "doctors" (
	"doctor_id"	INTEGER,
	"name"	TEXT,
	"specialty"	TEXT,
	"department_id"	INTEGER,
	"salary"	REAL,
	"hire_date"	TEXT,
	"city"	TEXT,
	"years_of_experience"	INTEGER,
	PRIMARY KEY("doctor_id")
);
CREATE TABLE IF NOT EXISTS "hospitals" (
	"hospital_id"	INTEGER,
	"name"	TEXT,
	"city"	TEXT,
	PRIMARY KEY("hospital_id")
);
CREATE TABLE IF NOT EXISTS "patients" (
	"patient_id"	INTEGER,
	"name"	TEXT,
	"gender"	TEXT,
	"date_of_birth"	TEXT,
	"city"	TEXT,
	"email"	TEXT,
	"phone"	TEXT,
	"blood_type"	TEXT,
	"insurance_provider"	TEXT,
	"signup_date"	TEXT,
	"age"	INTEGER,
	PRIMARY KEY("patient_id")
);
CREATE TABLE IF NOT EXISTS "prescriptions" (
	"prescription_id"	INTEGER,
	"appointment_id"	INTEGER,
	"medication"	TEXT,
	"dosage"	TEXT,
	"prescribed_date"	TEXT,
	"duration"	INTEGER,
	PRIMARY KEY("prescription_id"),
	FOREIGN KEY("appointment_id") REFERENCES "appointments"("appointment_id")
);
CREATE TABLE IF NOT EXISTS "staff_users" (
	"id"	INTEGER,
	"username"	TEXT UNIQUE,
	"email"	TEXT UNIQUE,
	"is_active"	INTEGER DEFAULT 1,
	PRIMARY KEY("id")
);
CREATE TABLE IF NOT EXISTS "treatments" (
	"treatment_id"	INTEGER,
	"appointment_id"	INTEGER,
	"treatment"	TEXT,
	"cost"	REAL,
	"treatment_date"	TEXT,
	"duration"	INTEGER,
	PRIMARY KEY("treatment_id"),
	FOREIGN KEY("appointment_id") REFERENCES "appointments"("appointment_id")
);
COMMIT;
