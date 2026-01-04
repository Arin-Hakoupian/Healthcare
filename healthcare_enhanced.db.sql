BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Appointments" (
	"AppointmentID"	INTEGER,
	"PatientID"	INTEGER,
	"DoctorID"	INTEGER,
	"AppointmentDate"	DATE,
	"Diagnosis"	VARCHAR(255),
	"Status"	VARCHAR(50),
	"FollowupDate"	DATE,
	"Fee"	DECIMAL(13,2),
	PRIMARY KEY("AppointmentID")
	FOREIGN KEY("DoctorID") REFERENCES "Doctors"("DoctorID"),
	FOREIGN KEY("PatientID") REFERENCES "Patients"("PatientID")
);
CREATE TABLE IF NOT EXISTS "Billing" (
	"PaymentID"	INTEGER,
	"AppointmentID"	INTEGER,
	"Amount"	DECIMAL(13,2),
	"PaymentMethod"	VARCHAR(20),
	"PaymentDate"	DATE,
	PRIMARY KEY("PaymentID")
);
CREATE TABLE IF NOT EXISTS "Departments" (
	"DepartmentID"	INTEGER,
	"DepartmentName"	VARCHAR(30),
	PRIMARY KEY("DepartmentID")
);
CREATE TABLE IF NOT EXISTS "Doctors" (
	"DoctorID"	INTEGER,
	"DoctorName"	VARCHAR(30),
	"Specialty"	VARCHAR(30),
	"DepartmentID"	INTEGER,
	"Salary"	DECIMAL(13,2),
	"HireDate"	DATE,
	"City"	VARCHAR(20),
	"ExperienceYears"	INTEGER,
	PRIMARY KEY("DoctorID")
);
CREATE TABLE IF NOT EXISTS "Hospitals" (
	"HospitalID"	INTEGER,
	"HospitalName"	VARCHAR(30),
	"City"	VARCHAR(20),
	PRIMARY KEY("HospitalID")
);
CREATE TABLE IF NOT EXISTS "Patients" (
	"PatientID"	INTEGER,
	"PatientName"	VARCHAR(50),
	"Gender"	Varchar(6),
	"BirthDate"	DATE,
	"City"	VARCHAR(20),
	"Email"	VARCHAR(255),
	"Phone"	VARCHAR(20),
	"BloodType"	VARCHAR(3),
	"InsuranceProvider"	CHAR(9),
	"SignupDate"	DATE,
	"Age"	INTEGER,
	PRIMARY KEY("PatientID")
);
CREATE TABLE IF NOT EXISTS "Prescriptions" (
	"PrescriptionID"	INTEGER,
	"AppointmentID"	INTEGER,
	"MedicationName"	VARCHAR(50),
	"MedicationDosage"	VARCHAR(30),
	"PrescribedDate"	DATE,
	"Duration"	INTEGER,
	PRIMARY KEY("PrescriptionID"),
	FOREIGN KEY("AppointmentID") REFERENCES "Appointments"("AppointmentID")
);
CREATE TABLE IF NOT EXISTS "StaffUsers" (
	"StaffID"	INTEGER,
	"UserName"	VARCHAR(50) UNIQUE,
	"Email"	VARCHAR(255) UNIQUE,
	"isActive"	INTEGER DEFAULT 1,
	PRIMARY KEY("StaffID")
);
CREATE TABLE IF NOT EXISTS "Treatments" (
	"TreatmentID"	INTEGER,
	"AppointmentID"	INTEGER,
	"Treatment"	VARCHAR(50),
	"TreatmentCost"	DECIMAL(13,2),
	"TreatmentDate"	DATE,
	"TreatmentDuration"	INTEGER,
	PRIMARY KEY("TreatmentID"),
	FOREIGN KEY("AppointmentID") REFERENCES "Appointments"("AppointmentID")
);
COMMIT;

