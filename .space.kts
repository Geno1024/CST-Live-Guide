job("Build") {
    container("texlive/texlive") {
        env["BUILD_COUNT_SERVER"] = Secrets("build_count_server")
        env["FILE_REPO_ADDRESS"] = Secrets("file_repo_address")
        shellScript("Build") {
            interpreter = "/bin/bash"
            location = "./build.sh"
        }
        shellScript("Publish") {
            content = """
                SOURCE_PATH=CST-Live-Guide.pdf
                TARGET_PATH=CST-Live-Guide.pdf
                REPO_URL=${'$'}FILE_REPO_ADDRESS
                curl -i -H "Authorization: Bearer ${'$'}JB_SPACE_CLIENT_TOKEN" -F file=@"${'$'}SOURCE_PATH" ${'$'}REPO_URL/${'$'}TARGET_PATH
            """.trimIndent()
        }
    }
}
