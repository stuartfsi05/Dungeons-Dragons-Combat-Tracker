buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.3.0")
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.7.10")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
    // Force properties for all projects including plugins
    extra["compileSdkVersion"] = 36
    extra["targetSdkVersion"] = 36
    extra["minSdkVersion"] = 23
    extra["flutter.compileSdkVersion"] = 36

    configurations.all {
        resolutionStrategy {
            force("androidx.core:core:1.6.0")
            force("androidx.core:core-ktx:1.6.0")
        }
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    project.evaluationDependsOn(":app")

    // Fix for Isar namespace
    val configureNamespace = {
        if (project.name == "isar_flutter_libs") {
            val android = project.extensions.findByName("android") as? com.android.build.gradle.BaseExtension
            android?.namespace = "dev.isar.isar_flutter_libs"
        }
    }

    if (project.state.executed) {
        configureNamespace()
    } else {
        project.afterEvaluate {
            configureNamespace()
        }
    }

    // Force compileSdk version for all Android libraries to prevent lStar/resource errors
    plugins.withId("com.android.library") {
        val android = extensions.findByType(com.android.build.gradle.LibraryExtension::class.java)
        android?.compileSdk = 36
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
