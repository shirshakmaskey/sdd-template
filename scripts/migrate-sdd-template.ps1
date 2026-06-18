#!/usr/bin/env pwsh
<#
.SYNOPSIS
    Migrate an existing SDD project to the upgraded template with ECC patterns.

.DESCRIPTION
    Copies new directories and skills from the sdd-template into a target project.
    Only copies files that DON'T exist in the target — never overwrites.
    Manual merges (AGENTS.md, .gitignore, etc.) must be done separately.

.PARAMETER TemplatePath
    Path to the upgraded sdd-template directory.

.PARAMETER TargetPath
    Path to the target project to migrate.

.PARAMETER DryRun
    If set, shows what would be copied without making changes.

.EXAMPLE
    .\migrate-sdd-template.ps1 -TemplatePath "C:\sdd-template" -TargetPath "C:\my-project"
    .\migrate-sdd-template.ps1 -TemplatePath "C:\sdd-template" -TargetPath "C:\my-project" -DryRun
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$TemplatePath,

    [Parameter(Mandatory=$true)]
    [string]$TargetPath,

    [switch]$DryRun
)

$ErrorActionPreference = "Stop"

# ── Validate paths ──
if (-not (Test-Path $TemplatePath)) { throw "Template path not found: $TemplatePath" }
if (-not (Test-Path $TargetPath))   { throw "Target path not found: $TargetPath" }
if (-not (Test-Path "$TargetPath\AGENTS.md")) { throw "Target doesn't look like an SDD project (no AGENTS.md)" }

Write-Host "`n=== SDD Template Migration ===" -ForegroundColor Cyan
Write-Host "Template: $TemplatePath" -ForegroundColor Gray
Write-Host "Target:   $TargetPath" -ForegroundColor Gray
if ($DryRun) { Write-Host "[DRY RUN — no changes will be made]" -ForegroundColor Yellow }

$copied = 0
$skipped = 0

function Copy-SafeFile {
    param([string]$RelativePath)

    $src = Join-Path $TemplatePath $RelativePath
    $dst = Join-Path $TargetPath $RelativePath

    if (-not (Test-Path $src)) {
        Write-Host "  SKIP (not in template): $RelativePath" -ForegroundColor DarkGray
        return
    }

    if (Test-Path $dst) {
        Write-Host "  EXISTS (not overwriting): $RelativePath" -ForegroundColor Yellow
        $script:skipped++
        return
    }

    # Ensure target directory exists
    $dstDir = Split-Path $dst -Parent
    if (-not (Test-Path $dstDir)) {
        if (-not $DryRun) { New-Item -ItemType Directory -Path $dstDir -Force | Out-Null }
        Write-Host "  MKDIR: $(Split-Path $dstDir -Leaf)/" -ForegroundColor Blue
    }

    if ($DryRun) {
        Write-Host "  WOULD COPY: $RelativePath" -ForegroundColor Green
    } else {
        Copy-Item $src $dst
        Write-Host "  COPIED: $RelativePath" -ForegroundColor Green
    }
    $script:copied++
}

# ── Phase 1: New directories (safe to copy entirely) ──
Write-Host "`n--- Phase 1: New directories ---" -ForegroundColor Magenta

$newDirs = @(
    "docs\rules",
    "docs\agents",
    "docs\sops",
    "docs\templates"
)

foreach ($dir in $newDirs) {
    $srcDir = Join-Path $TemplatePath $dir
    if (Test-Path $srcDir) {
        $files = Get-ChildItem $srcDir -File -Recurse
        foreach ($file in $files) {
            $rel = $file.FullName.Substring($TemplatePath.Length + 1)
            Copy-SafeFile $rel
        }
    }
}

# ── Phase 2: New skill files ──
Write-Host "`n--- Phase 2: New skill files ---" -ForegroundColor Magenta

$newSkills = @(
    "docs\skills\SKILL_FORMAT.md",
    "docs\skills\coding-standards.md",
    "docs\skills\api-design.md",
    "docs\skills\backend-patterns.md",
    "docs\skills\frontend-patterns.md",
    "docs\skills\tdd-workflow.md",
    "docs\skills\deep-research.md",
    "docs\skills\database-migration.md",
    "docs\skills\mcp-server-patterns.md",
    "docs\skills\strategic-compact.md",
    "docs\skills\session-handoff.md",
    "docs\skills\verification-loop.md",
    "docs\skills\security-review.md",
    "docs\skills\code-review.md",
    "docs\skills\e2e-testing.md",
    "docs\skills\continuous-learning.md",
    "docs\skills\agent-introspection.md",
    "docs\skills\context-optimization.md",
    "docs\skills\eval-harness.md",
    "docs\skills\market-research.md",
    "docs\skills\competitive-analysis.md",
    "docs\skills\product-capability.md",
    "docs\skills\brand-discovery.md",
    "docs\skills\brand-voice.md",
    "docs\skills\investor-materials.md",
    "docs\skills\content-engine.md",
    "docs\skills\migrate-template.md"
)

foreach ($skill in $newSkills) {
    Copy-SafeFile $skill
}

# ── Phase 3: New workflow files ──
Write-Host "`n--- Phase 3: New workflow files ---" -ForegroundColor Magenta
Copy-SafeFile "docs\workflows\discuss.md"

# ── Phase 4: Guide ──
Write-Host "`n--- Phase 4: Guide ---" -ForegroundColor Magenta
Copy-SafeFile "docs\GUIDE.md"

# ── Phase 5: .sessions directory ──
Write-Host "`n--- Phase 5: Session directory ---" -ForegroundColor Magenta
$sessionsDir = Join-Path $TargetPath ".sessions"
if (-not (Test-Path $sessionsDir)) {
    if (-not $DryRun) {
        New-Item -ItemType Directory -Path $sessionsDir -Force | Out-Null
        Set-Content -Path (Join-Path $sessionsDir ".gitkeep") -Value ""
    }
    Write-Host "  CREATED: .sessions/" -ForegroundColor Green
}

# ── Summary ──
Write-Host "`n=== Summary ===" -ForegroundColor Cyan
Write-Host "  Files copied:  $copied" -ForegroundColor Green
Write-Host "  Files skipped: $skipped (already exist)" -ForegroundColor Yellow

Write-Host "`n=== Manual Steps Required ===" -ForegroundColor Red
Write-Host "  1. MERGE: Add AI Efficiency Protocol + Business Pragmatism sections to AGENTS.md"
Write-Host "  2. MERGE: Update File Reading Priority in AGENTS.md (add rules + agents)"
Write-Host "  3. MERGE: Update docs/ tree in AGENTS.md (add agents, rules, sops, templates)"
Write-Host "  4. MERGE: Expand CLAUDE.md (replace one-liner with full reference)"
Write-Host "  5. MERGE: Add .sessions/, .claude/homunculus/, .claude/session-data/ to .gitignore"
Write-Host "  6. MERGE: Update docs/skills/README.md with new skill categories"
Write-Host "  7. MERGE: Add Data Safety Assessment to plan-feature.md (if missing)"
Write-Host "  8. CUSTOMIZE: Replace {{PROJECT_NAME}} in docs/workflows/discuss.md"
Write-Host ""
Write-Host "  Refer to docs/skills/migrate-template.md for detailed merge instructions." -ForegroundColor Gray
Write-Host ""
