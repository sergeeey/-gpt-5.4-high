$ErrorActionPreference = "Stop"

Write-Host "== GPT-5.4 High Repo Verification ==" -ForegroundColor Cyan

function Test-JsonFiles {
    Write-Host "`n[1/7] Validating JSON examples" -ForegroundColor Yellow
    $files = Get-ChildItem -Recurse -File examples\responses\*.json
    foreach ($file in $files) {
        Get-Content -Raw $file.FullName | ConvertFrom-Json | Out-Null
        Write-Host "OK  $($file.FullName)"
    }
}

function Test-JsonlFiles {
    Write-Host "`n[2/7] Validating JSONL eval datasets" -ForegroundColor Yellow
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

function Test-RealEvalCoverage {
    Write-Host "`n[3/7] Checking real eval schema and coverage" -ForegroundColor Yellow
    $requiredFields = @("id", "workflow", "input", "expected_outcome", "must_do", "must_not_do", "risk_class", "notes")
    $realFiles = Get-ChildItem -File evals\real\*.jsonl | Where-Object { $_.Name -ne "template.jsonl" }
    $realCaseCount = 0

    foreach ($file in $realFiles) {
        $lineNumber = 0
        foreach ($line in Get-Content $file.FullName) {
            if (-not $line.Trim()) { continue }
            $lineNumber++
            $obj = $line | ConvertFrom-Json
            foreach ($field in $requiredFields) {
                if (-not ($obj.PSObject.Properties.Name -contains $field)) {
                    throw "Missing field '$field' in $($file.FullName)"
                }
            }
            $realCaseCount++
        }
        Write-Host "OK  schema $($file.FullName)"
    }

    if ($realCaseCount -lt 12) {
        throw "Expected at least 12 non-template real eval cases, found $realCaseCount"
    }

    if (-not (Test-Path "evals\\graders\\real-workflows.md")) {
        throw "Missing grader rubric: evals\\graders\\real-workflows.md"
    }

    Write-Host "OK  real eval count = $realCaseCount"
}

function Test-PythonExamples {
    Write-Host "`n[4/7] Compiling Python agent examples" -ForegroundColor Yellow
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
    Write-Host "`n[5/7] Checking JavaScript agent examples" -ForegroundColor Yellow
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
    Write-Host "`n[6/7] Checking referenced OpenAI documentation links" -ForegroundColor Yellow
    $files = Get-ChildItem -Recurse -File -Include *.md | Where-Object { $_.FullName -notmatch '\\.git\\' }
    $urls = @()

    foreach ($file in $files) {
        $matches = Select-String -Path $file.FullName -Pattern 'https://[^)\s]+' -AllMatches
        foreach ($match in $matches) {
            foreach ($m in $match.Matches) {
                $cleanUrl = $m.Value.TrimEnd([char[]]@([char]96, '.', ',', ';', ':', ')', ']'))
                if ($cleanUrl -like "https://developers.openai.com/*") {
                    $urls += $cleanUrl
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

function Test-AssumptionsRegister {
    Write-Host "`n[7/7] Checking assumptions register freshness" -ForegroundColor Yellow
    $path = "docs\\assumptions-register.md"
    if (-not (Test-Path $path)) {
        throw "Missing assumptions register"
    }

    $lines = Get-Content $path | Where-Object { $_ -match '^\| `[^`]+` \|' }
    if (-not $lines) {
        throw "Assumptions register has no entries"
    }

    $today = Get-Date
    foreach ($line in $lines) {
        $parts = $line.Split('|') | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
        if ($parts.Count -lt 5) {
            throw "Malformed assumptions register row: $line"
        }
        $dateText = $parts[3].Trim('`')
        try {
            $parsed = [datetime]$dateText
        } catch {
            throw "Invalid last_verified date in assumptions register: $dateText"
        }
        $age = ($today - $parsed).TotalDays
        if ($age -gt 90) {
            throw "Stale assumption detected ($dateText): $line"
        }
    }

    Write-Host "OK  assumptions register entries are present and fresh"
}

Test-JsonFiles
Test-JsonlFiles
Test-RealEvalCoverage
Test-PythonExamples
Test-JavaScriptExamples
Test-OpenAIDocLinks
Test-AssumptionsRegister

Get-ChildItem -Recurse -Directory -Filter __pycache__ | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`nVerification completed successfully." -ForegroundColor Green
