allprojects {
    repositories {
        google()
        mavenCentral()
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
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    project.extensions.findByName("android")?.let { androidExt ->
        try {
            val getNamespace = androidExt::class.java.getMethod("getNamespace")
            if (getNamespace.invoke(androidExt) == null) {
                val setNamespace = androidExt::class.java.getMethod("setNamespace", String::class.java)
                setNamespace.invoke(androidExt, project.group.toString())
            }
        } catch (e: Exception) {
            // Ignore if method doesn't exist
        }
    }
}
