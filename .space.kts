job("Build") {
    container("texlive/texlive") {
        shellScript("Build") {
            location = "./build.sh"
        }
    }
}
