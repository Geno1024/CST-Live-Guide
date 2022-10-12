job("Main") {
    host("build") {
        shellScript {
            content = "./build.sh"
        }
    }
}
