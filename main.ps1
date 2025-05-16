# Get name of the Git-Tag
$tagName = $env:GITHUB_REF_NAME
Write-Host "Git-Tag: $tagName"

# Get Version from VERSION.md
$markdownVersion = (Get-Content -Path "VERSION.md" | Select-Object -First 1).Trim()
Write-Host "VERSION.md: $markdownVersion"

# Check tag scheme:
if ($tagName -notlike "releases/v*") {
    Write-Error "Git tag does not start with 'releases/v': $tagName"
    exit 1
}

if ($tagName -notmatch "^releases/v$markdownVersion$") {
    Write-Error "Git tag does not match the expected format 'releases/v$markdownVersion$': $tagName"
    exit 1
}