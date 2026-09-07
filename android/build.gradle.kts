// Top-level build file where you can add configuration options common to all sub-projects/modules.

import org.gradle.api.tasks.compile.JavaCompile
import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile
import com.android.build.gradle.BaseExtension

buildscript { // <--- ADDED: This block is for defining build script dependencies
    repositories {
        google()
        mavenCentral()
    }
    dependencies { // <--- ADDED: This dependencies block is specifically for the buildscript
        classpath("com.android.tools.build:gradle:8.1.2") // Your Android Gradle Plugin version
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.8.20") // Your Kotlin version
        classpath("com.google.gms:google-services:4.4.2") // Google Services plugin
    }
}

allprojects { // <--- EXISTING: This block is for defining repositories for all projects
    repositories {
        google()
        mavenCentral()
    }
    // REMOVED: The incorrect 'dependencies' block from here
}

// Configure compileSdk for all Android subprojects (including plugins)
subprojects {
    afterEvaluate {
        if (plugins.hasPlugin("com.android.library") || plugins.hasPlugin("com.android.application")) {
            extensions.configure<com.android.build.gradle.BaseExtension> {
                compileSdkVersion(36)
            }
        }
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

gradle.projectsEvaluated {
    subprojects {
        tasks.withType<KotlinCompile>().configureEach {
            val javaTaskName = name.replace("Kotlin", "JavaWithJavac")
            val javaTask = tasks.findByName(javaTaskName) as? JavaCompile
            if (javaTask != null) {
                compilerOptions.jvmTarget.set(
                    JvmTarget.fromTarget(javaTask.targetCompatibility)
                )
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

