$ErrorActionPreference = "Stop"

Write-Host "== GPT-5.4 High Repo Verification ==" -ForegroundColor Cyan

function Test-JsonFiles {
    Write-Host "`n[1/5] Validating JSON examples" -ForegroundColor Yellow
    $files = Get-ChildItem -Recurse -File examples\responses\*.json
    foreach ($file in $files) {
        Get-Content -Raw $file.FullName | ConvertFrom-Json | Out-Null
        Write-Host "OK  $($file.FullName)"
    }
}

function Test-JsonlFiles {
    Write-Host "`n[2/5] Validating JSONL eval datasets" -ForegroundColor Yellow
    $files = Get-ChildItem -Recurse -File evals\*.jsonl
    foreach ($file in $files) {
        $lineNumber = 0
        foreach ($line in Get-Content $file.FullName) {
            $lineNumber++
            if ($line.Trim()) {
                try {
                    $line | ConvertFrom-Json | Out-Null
                } catch {
                    throw "Invalid JSONL in $($file.FullName) at line $lineNumber"
                }
            }
        }
        Write-Host "OK  $($file.FullName)"
    }
}

function Test-PythonExamples {
    Write-Host "`n[3/5] Compiling Python agent examples" -ForegroundColor Yellow
    python -m py_compile `
        examples\agents\python\background_polling.py `
        examples\agents\python\local_shell_loop.py `
        examples\agents\python\local_shell_roundtrip.py
    if ($LASTEXITCODE -ne 0) {
        throw "Python compilation failed"
    }
    Write-Host "OK  Python examples compiled"
}

function Test-JavaScriptExamples {
    Write-Host "`n[4/5] Checking JavaScript agent examples" -ForegroundColor Yellow
    node --check examples\agents\javascript\responses_tool_loop.mjs
    if ($LASTEXITCODE -ne 0) {
        throw "JavaScript syntax check failed for responses_tool_loop.mjs"
    }
    node --check examples\agents\javascript\background_polling.mjs
    if ($LASTEXITCODE -ne 0) {
        throw "JavaScript syntax check failed for background_polling.mjs"
    }
    Write-Host "OK  JavaScript examples checked"
}

function Test-OpenAIDocLinks {
    Write-Host "`n[5/5] Checking referenced OpenAI documentation links" -ForegroundColor Yellow
    $files = Get-ChildItem -Recurse -File -Include *.md | Where-Object { $_.FullName -notmatch '\\.git\\' }
    $urls = @()

    foreach ($file in $files) {
        $matches = Select-String -Path $file.FullName -Pattern 'https://[^)\s]+' -AllMatches
        foreach ($match in $matches) {
            foreach ($m in $match.Matches) {
                if ($m.Value -like "https://developers.openai.com/*") {
                    $urls += $m.Value
                }
            }
        }
    }

    $urls = $urls | Sort-Object -Unique

    foreach ($url in $urls) {
        $response = Invoke-WebRequest -Uri $url -Method Get -MaximumRedirection 5 -TimeoutSec 30 -SkipHttpErrorCheck
        if ([int]$response.StatusCode -ne 200) {
            throw "Unexpected status $($response.StatusCode) for $url"
        }
        Write-Host "OK  $url"
    }
}

Test-JsonFiles
Test-JsonlFiles
Test-PythonExamples
Test-JavaScriptExamples
Test-OpenAIDocLinks

Get-ChildItem -Recurse -Directory -Filter __pycache__ | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`nVerification completed successfully." -ForegroundColor Green
