-- CreateTable
CREATE TABLE "students" (
    "id" UUID NOT NULL,
    "name" VARCHAR(60) NOT NULL,
    "email" VARCHAR(60) NOT NULL,
    "password" VARCHAR(60) NOT NULL,
    "age" SMALLINT,
    "token" TEXT,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "assessments" (
    "id" UUID NOT NULL,
    "discipline" VARCHAR(60) NOT NULL,
    "grade" DECIMAL(4,2) NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "id_student" UUID NOT NULL,

    CONSTRAINT "assessments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classes" (
    "id" UUID NOT NULL,
    "program" VARCHAR(60) NOT NULL,
    "edition" VARCHAR(60) NOT NULL,
    "max_students" INTEGER NOT NULL,
    "min_students" INTEGER NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "classes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "enrollments" (
    "id_student" UUID NOT NULL,
    "id_class" UUID NOT NULL,
    "crated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "enrollments_pkey" PRIMARY KEY ("id_student","id_class")
);

-- CreateIndex
CREATE UNIQUE INDEX "students_email_key" ON "students"("email");

-- AddForeignKey
ALTER TABLE "assessments" ADD CONSTRAINT "assessments_id_student_fkey" FOREIGN KEY ("id_student") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_id_student_fkey" FOREIGN KEY ("id_student") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "enrollments" ADD CONSTRAINT "enrollments_id_class_fkey" FOREIGN KEY ("id_class") REFERENCES "classes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
