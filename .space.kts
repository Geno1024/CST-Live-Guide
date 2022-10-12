job("Main") {
    host("build") {
        shellScript {
            location = "./build.sh"
        }
    }
}
