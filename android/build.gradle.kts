
extra.set("flutter.compileSdkVersion", 36)
extra.set("flutter.minSdkVersion", 21)
extra.set("flutter.targetSdkVersion", 34)
extra.set("flutter.versionCode", 1)
extra.set("flutter.versionName", "1.0.0")
extra.set("flutter.ndkVersion", "26.3.11579264")

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":StudioProjects:bmi")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
