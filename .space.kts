job("Build") {
    host {
        shellScript("Install TeXLive and Fonts") {
            content = """
                apt update
                apt install texlive-xetex texlive-lang-chinese texlive-bibtex-extra biber texlive-science
            """
        }
        shellScript("Build") {
            location = "./build.sh"
        }
    }
}
