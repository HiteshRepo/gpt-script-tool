#!/bin/bash

# Demo script for repo-command-suggester functionality
# Runs without requiring GPTScript

echo "Repository Command Suggester Demo"
echo "================================="
echo ""

echo "Repository Status Analysis"
echo "=========================="

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Not a git repository"
    exit 1
fi

CURRENT_BRANCH=$(git branch --show-current 2>/dev/null || echo "detached HEAD")
echo "Current branch: $CURRENT_BRANCH"

if [ "$CURRENT_BRANCH" != "detached HEAD" ]; then
    UPSTREAM=$(git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null)
    if [ -n "$UPSTREAM" ]; then
        echo "Tracking: $UPSTREAM"
        
        AHEAD=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "0")
        BEHIND=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "0")
        
        if [ "$AHEAD" -gt 0 ]; then
            echo "Behind remote by $AHEAD commits"
        fi
        if [ "$BEHIND" -gt 0 ]; then
            echo "Ahead of remote by $BEHIND commits"
        fi
        if [ "$AHEAD" -eq 0 ] && [ "$BEHIND" -eq 0 ]; then
            echo "Up to date with remote"
        fi
    else
        echo "No upstream tracking branch"
    fi
fi

STAGED_FILES=$(git diff --cached --name-only | wc -l | tr -d ' ')
UNSTAGED_FILES=$(git diff --name-only | wc -l | tr -d ' ')
UNTRACKED_FILES=$(git ls-files --others --exclude-standard | wc -l | tr -d ' ')

echo "Changes:"
echo "   - Staged files: $STAGED_FILES"
echo "   - Unstaged files: $UNSTAGED_FILES" 
echo "   - Untracked files: $UNTRACKED_FILES"

if [ "$STAGED_FILES" -gt 0 ]; then
    echo "Staged files:"
    git diff --cached --name-only | sed 's/^/   - /'
fi

if [ "$UNSTAGED_FILES" -gt 0 ]; then
    echo "Modified files:"
    git diff --name-only | sed 's/^/   - /'
fi

if [ "$UNTRACKED_FILES" -gt 0 ] && [ "$UNTRACKED_FILES" -le 10 ]; then
    echo "Untracked files:"
    git ls-files --others --exclude-standard | sed 's/^/   - /'
elif [ "$UNTRACKED_FILES" -gt 10 ]; then
    echo "Untracked files: $UNTRACKED_FILES (too many to list)"
fi

echo ""

echo "File Analysis"
echo "============="

ALL_MODIFIED=$(git diff --name-only HEAD 2>/dev/null)

if [ -z "$ALL_MODIFIED" ] && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "No modified files detected"
else
    gpt_count=0
    py_count=0
    js_count=0
    md_count=0
    makefile_count=0
    readme_count=0
    
    for file in $ALL_MODIFIED; do
        if [ -f "$file" ]; then
            ext="${file##*.}"
            case "$ext" in
                "gpt")
                    gpt_count=$((gpt_count + 1))
                    ;;
                "py")
                    py_count=$((py_count + 1))
                    ;;
                "js"|"ts"|"jsx"|"tsx")
                    js_count=$((js_count + 1))
                    ;;
                "md")
                    md_count=$((md_count + 1))
                    ;;
            esac
            
            case "$(basename "$file")" in
                "Makefile")
                    makefile_count=$((makefile_count + 1))
                    ;;
                "README.md")
                    readme_count=$((readme_count + 1))
                    ;;
            esac
        fi
    done
    
    echo "File types modified:"
    [ "$gpt_count" -gt 0 ] && echo "   - GPTScript: $gpt_count files"
    [ "$py_count" -gt 0 ] && echo "   - Python: $py_count files"
    [ "$js_count" -gt 0 ] && echo "   - JavaScript/TypeScript: $js_count files"
    [ "$md_count" -gt 0 ] && echo "   - Markdown: $md_count files"
    [ "$makefile_count" -gt 0 ] && echo "   - Makefile: $makefile_count files"
    [ "$readme_count" -gt 0 ] && echo "   - README: $readme_count files"
fi

echo ""

echo "Suggested Commands"
echo "=================="

STAGED_COUNT=$(git diff --cached --name-only 2>/dev/null | wc -l | tr -d ' ')
UNSTAGED_COUNT=$(git diff --name-only 2>/dev/null | wc -l | tr -d ' ')
UNTRACKED_COUNT=$(git ls-files --others --exclude-standard 2>/dev/null | wc -l | tr -d ' ')
CONFLICT_COUNT=$(git diff --name-only --diff-filter=U 2>/dev/null | wc -l | tr -d ' ')

CURRENT_BRANCH=$(git branch --show-current 2>/dev/null)
AHEAD=0
BEHIND=0
if [ -n "$CURRENT_BRANCH" ] && git rev-parse --abbrev-ref --symbolic-full-name @{u} >/dev/null 2>&1; then
    AHEAD=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "0")
    BEHIND=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "0")
fi

priority=1

if [ "$CONFLICT_COUNT" -gt 0 ]; then
    echo "$priority. git status"
    echo "   → Review and resolve merge conflicts"
    priority=$((priority + 1))
    echo ""
fi

if [ "$UNSTAGED_COUNT" -gt 0 ]; then
    if [ "$UNSTAGED_COUNT" -le 5 ]; then
        echo "$priority. git add [specific files]"
        echo "   → Stage specific modified files:"
        git diff --name-only | sed 's/^/     /'
    else
        echo "$priority. git add ."
        echo "   → Stage all $UNSTAGED_COUNT modified files"
    fi
    priority=$((priority + 1))
    echo ""
fi

if [ "$UNTRACKED_COUNT" -gt 0 ] && [ "$UNTRACKED_COUNT" -le 5 ]; then
    echo "$priority. git add [new files]"
    echo "   → Stage new files:"
    git ls-files --others --exclude-standard | sed 's/^/     /'
    priority=$((priority + 1))
    echo ""
fi

if [ "$STAGED_COUNT" -gt 0 ]; then
    echo "$priority. gptscript tools/github/git-commit.gpt"
    echo "   → Generate and create commit for $STAGED_COUNT staged files"
    priority=$((priority + 1))
    echo ""
fi

if [ "$BEHIND" -gt 0 ]; then
    echo "$priority. git pull"
    echo "   → Pull $BEHIND commits from remote"
    priority=$((priority + 1))
    echo ""
fi

if [ "$AHEAD" -gt 0 ]; then
    echo "$priority. git push"
    echo "   → Push $AHEAD commits to remote"
    priority=$((priority + 1))
    echo ""
fi

MODIFIED_FILES=$(git diff --name-only HEAD 2>/dev/null)

if echo "$MODIFIED_FILES" | grep -q "\.gpt$"; then
    echo "$priority. gptscript [modified-tool].gpt"
    echo "   → Test modified GPTScript tools"
    priority=$((priority + 1))
    echo ""
fi

if echo "$MODIFIED_FILES" | grep -q "Makefile"; then
    echo "$priority. make help"
    echo "   → Review available make targets after Makefile changes"
    priority=$((priority + 1))
    echo ""
fi

if [ "$STAGED_COUNT" -eq 0 ] && [ "$UNSTAGED_COUNT" -eq 0 ] && [ "$UNTRACKED_COUNT" -eq 0 ]; then
    echo "Repository is clean!"
    echo ""
    echo "General suggestions:"
    echo "   - git log --oneline -10  → Review recent commits"
    echo "   - git branch -a         → List all branches"
    echo "   - make help             → See available commands"
fi

echo ""
echo "Tip: Run this tool anytime with 'make suggest-commands'"
echo "    (requires GPTScript to be installed)"
