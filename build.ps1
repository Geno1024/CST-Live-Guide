if ([string]::IsNullOrWhitespace($env:BUILD_COUNT_SERVER))
{
    Write-Output "LOCAL" | Out-File -FilePath build.txt
}
else
{
    Invoke-WebRequest -OutFile build.txt $env:BUILD_COUNT_SERVER/CST-Live-Guide4
}

Remove-Item -Recurse build
New-Item -ItemType Directory build
Get-ChildItem -Directory -Exclude .idea,build | ForEach-Object {
    New-Item -ItemType Directory build/$($_.Name)
}
xelatex -output-directory=build -shell-escape CST-Live-Guide.tex
xelatex -output-directory=build -shell-escape CST-Live-Guide.tex
Copy-Item -Path build/CST-Live-Guide.pdf -Destination CST-Live-Guide.pdf