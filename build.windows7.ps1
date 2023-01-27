if ($env:BUILD_COUNT_SERVER -eq $nul -or $env:BUILD_COUNT_SERVER.trim() -eq "")
{
    Write-Output "LOCAL" | Out-File -FilePath build.txt
}
else
{
    (New-Object System.Net.WebClient).DownloadFile("$env:BUILD_COUNT_SERVER/CST-Live-Guide4", "build.txt")
}
(detex ./CST-Live-Guide | Measure-Object -Character).Characters | Out-File wordcount.txt -Encoding ascii
Remove-Item -Recurse build
New-Item -ItemType Directory build
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
biber --output-directory=build CST-Live-Guide
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
xelatex -output-directory=build -shell-escape -synctex=1 CST-Live-Guide.tex
Copy-Item -Path build/CST-Live-Guide.pdf -Destination CST-Live-Guide.pdf -Force
