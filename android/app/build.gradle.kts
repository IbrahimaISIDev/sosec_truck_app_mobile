plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.sosec_truck_app_mobile"
    compileSdk = 35
    ndkVersion = "27.0.12077973" // Utilise la version qui fonctionne

    defaultConfig {
        applicationId = "com.example.sosec_truck_app_mobile"
        minSdk = 23
        targetSdk = 35
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlin {
        jvmToolchain(17)
    }

    kotlinOptions {
        jvmTarget = "17"
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation("org.jetbrains.kotlin:kotlin-stdlib:1.8.20")
}