# Repository Command Suggester

A GPTScript tool that analyzes your repository state and suggests relevant commands based on current git status, file changes, and development workflow patterns.

## Purpose

This tool helps with development workflow by:
- Analyzing git repository status (branch, staging area, remote tracking)
- Examining file changes and modifications
- Providing contextual command suggestions
- Integrating with existing tools in your workflow

## Usage

### With GPTScript (Recommended)
```bash
# Run the full GPTScript tool
make suggest-commands

# Or run directly
gptscript tools/repo-analysis/repo-command-suggester.gpt
```

### Demo Mode (No GPTScript Required)
```bash
# Run the demo version
make demo-suggest-commands

# Or run directly
./tools/repo-analysis/demo.sh
```

## What It Analyzes

### Git State Analysis
- Current branch and tracking status
- Staged vs unstaged changes
- Ahead/behind remote status
- Merge conflicts detection
- Stash status

### File System Analysis
- Modified files and their types
- New/deleted files
- File extension patterns for workflow suggestions

### Command Suggestions
- **Git-based**: `git add`, `git commit`, `git push`/`git pull`
- **Workflow-based**: Test commands, linting, build commands
- **Integration**: Uses existing `git-commit.gpt` tool for commits

## Example Output

```
Repository Status Analysis
==========================
Current branch: feature/new-tool
Tracking: origin/feature/new-tool
Ahead of remote by 2 commits
Changes:
   - Staged files: 1
   - Unstaged files: 2
   - Untracked files: 1

File Analysis
=============
File types modified:
   - GPTScript: 1 files
   - Markdown: 1 files
   - Makefile: 1 files

Suggested Commands
==================
1. git add [specific files]
   → Stage specific modified files:
     README.md
     Makefile

2. gptscript tools/github/git-commit.gpt
   → Generate and create commit for 1 staged files

3. gptscript [modified-tool].gpt
   → Test modified GPTScript tools

4. git push
   → Push 2 commits to remote
```

## Key Features

- **Context Aware**: Understands project type and current state
- **Prioritized Suggestions**: Most relevant commands appear first
- **Safety Focused**: Conservative suggestions to avoid destructive operations
- **Tool Integration**: Works with existing GPTScript tools
- **Cross-Platform**: Compatible with different shell environments

## Integration

The tool integrates with your existing workflow:
- Uses `tools/github/git-commit.gpt` for commit messages
- Follows the same Makefile pattern as other tools
- Provides suggestions for testing modified GPTScript tools
- Suggests workflow commands based on file types

## Tips

- Run `make suggest-commands` when you're unsure what to do next
- Most helpful when you have pending changes
- Use the demo mode to test functionality without GPTScript
- Suggestions are prioritized by urgency and safety
