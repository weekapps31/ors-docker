# نبدأ من صورة رسمية لبايثون + جافا (ORS يحتاج جافا)
FROM openjdk:17-jdk-slim

# إعداد مكان العمل
WORKDIR /app

# ننسخو كل الملفات للمجلد /app
COPY . /app

# تثبيت الأدوات اللازمة
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# تحميل dependencies وبناء المشروع
RUN ./gradlew build -x test

# فتح البورت الافتراضي
EXPOSE 8080

# تشغيل OpenRouteService
CMD ["./gradlew", "bootRun"]
